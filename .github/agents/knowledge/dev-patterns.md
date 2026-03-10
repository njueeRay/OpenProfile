# Dev · L2 验证模式

> 位置：`.github/agents/knowledge/dev-patterns.md`
> 层级：L2（验证有效，可复用）
> 维护人：Dev

---

### P-DV-001：Git Worktree 在 Windows 下的操作细节

**场景：** Windows + VS Code 环境下使用 git worktree
**模式：**

```powershell
# 创建（从 main 分支新建）
git worktree add -b feature/<name> ..\<dir> main

# 清理（标准流程）
git worktree remove ..\<dir>      # 目录未被占用时
git worktree prune                 # 目录被 VS Code 锁定时，先 prune 注册表
# 然后手动删文件夹，或关闭 VS Code 窗口后 remove

# 远程分支清理
git push origin --delete feature/<name>
```

**验证：** OpenProfile feature/readme-update，2026-02-27
**注意：** `git worktree remove --force` 在 Windows 仍会抛 Permission Denied，`prune` 是更可靠的替代
**来源：** 2026-02-27 worktree 首次跑通

---

### P-DV-002：Co-authorship 三仓库配置方式

**场景：** 需要为多个仓库统一配置 co-author 提交模板
**模式：**

```powershell
# 为每个仓库配置（不用 --global，避免影响其他项目）
git -C "<repo-path>" config commit.template ".gitmessage"
# .gitmessage 内容：
# Co-authored-by: GitHub Copilot <copilot@github.com>
```

**验证：** OpenProfile + njueeRay-profile + njueeray.github.io，2026-02-26
**注意：** `git commit -m` 不会读取模板，需手动追加；只有 `git commit`（无 `-m`）会弹出编辑器
**来源：** 2026-02-26 worktree 设置会话

---

### P-DV-003：GitHub API 调用中的 UTF-8 编码陷阱（REST + GraphQL 通用）

**场景：** 使用 PowerShell 5.1 通过任意 GitHub API（REST / GraphQL）发送含中文的 body

**根因：** PowerShell 5.1 的 `Invoke-RestMethod -Body <string>` 使用系统默认代码页（Windows-1252 / GBK）将字符串序列化为字节；中文字符无法在 Windows-1252 中表示，会变成 `?`。

**修复模式（必须执行）：**

```powershell
# ✅ 正确：显式转为 UTF-8 字节数组传给 -Body
$json  = $payload | ConvertTo-Json -Depth 5 -Compress
$bytes = [System.Text.Encoding]::UTF8.GetBytes($json)
Invoke-RestMethod -Uri $url -Method POST -Headers $h -Body $bytes

# ❌ 错误：直接传字符串，中文变 ?
Invoke-RestMethod -Uri $url -Method POST -Headers $h -Body $json
```

**PS5.1 脚本文件本身含中文时的额外陷阱：**

PS5.1 读取无 BOM 的 UTF-8 `.ps1` 文件时，同样按系统编码解析 → 脚本内的中文字符串在进入内存前就已损坏，`GetBytes(UTF8)` 也救不回来。

**规避方法：将中文内容存入独立 .txt 文件，脚本用显式 UTF-8 读取：**

```powershell
# 内容文件（_body.txt）由工具或编辑器创建，保证 UTF-8
$body = [System.IO.File]::ReadAllText("$base\_body.txt", [System.Text.Encoding]::UTF8)
# 脚本本身只包含 ASCII，避免 PS5.1 读取编码问题
```

**验证：**
- v4.0.0 Release body 修复，2026-02-26（REST PATCH）
- Discussion #8 正文修复，2026-03-10（GraphQL updateDiscussion）

**注意：** 每次发布含中文内容到 GitHub API，必须走 UTF-8 bytes 路径
**来源：** 2026-02-26 Release encoding 修复 + 2026-03-10 Discussion encoding 修复

---

### P-DV-004：Astro 博客 frontmatter 扩展的正确方式

**场景：** 需要给 Astro content collection 增加新字段（如 `author`）
**模式：**

1. 先修改 `src/content/config.ts`，在 schema 中添加字段（可选：`z.string().optional()`）
2. 再修改现有文档，不强制要求旧文章必须填写（optional 兼容）
3. 在组件中用 `entry.data.author ?? 'njueeray'` 做 fallback
4. 新增 content collection（如 `authors`）时需同步在 `config.ts` 注册

**验证：** 规划中，Phase A
**注意：** Astro 类型检查严格，schema 不匹配会导致 build 失败
**来源：** 2026-02-27 Agent 博客栏目设计讨论

---

### P-DV-005：GitHub GraphQL API 发布 Discussion 的标准 SOP

**场景：** 在 PowerShell 中通过 GraphQL API 创建或更新 GitHub Discussion（gh CLI 无法使用时）

**已知固定 IDs（njueeray.github.io 仓库）：**
- `repoId = R_kgDORYROOA`
- Tech Deep-dives categoryId = `DIC_kwDORYROOM4C3ai-`

**标准流程：**

```powershell
# 0. 获取 OAuth token（一次性，来自 git credential fill）
$token = "gho_..."

$h = @{ Authorization = "bearer $token"; "Content-Type" = "application/json" }

# 1. 查询 Discussion node ID（用于 update）
$q = '{"query":"query{repository(owner:\"njueeRay\",name:\"njueeray.github.io\"){discussion(number:N){id}}}"}'
$r = Invoke-RestMethod -Uri "https://api.github.com/graphql" -Method POST `
     -Headers $h -Body ([System.Text.Encoding]::UTF8.GetBytes($q))
$nodeId = $r.data.repository.discussion.id   # D_kwDORYROOM4A...

# 2. 读取中文内容（必须从独立文件读，避免 PS5.1 脚本文件编码问题）
$title = [System.IO.File]::ReadAllText("path\_title.txt", [System.Text.Encoding]::UTF8).Trim()
$body  = [System.IO.File]::ReadAllText("path\_body.txt",  [System.Text.Encoding]::UTF8)

# 3. 构建 mutation payload → UTF-8 bytes → POST
$payload = [ordered]@{
    query = 'mutation($id:ID!,$title:String!,$body:String!){updateDiscussion(input:{discussionId:$id,title:$title,body:$body}){discussion{url title}}}'
    variables = [ordered]@{ id = $nodeId; title = $title; body = $body }
}
$bytes = [System.Text.Encoding]::UTF8.GetBytes(($payload | ConvertTo-Json -Depth 5 -Compress))
$result = Invoke-RestMethod -Uri "https://api.github.com/graphql" -Method POST -Headers $h -Body $bytes
```

**createDiscussion mutation（新建）：**

```graphql
mutation($repoId:ID!,$catId:ID!,$title:String!,$body:String!){
  createDiscussion(input:{repositoryId:$repoId,categoryId:$catId,title:$title,body:$body}){
    discussion{url number}
  }
}
```

**验证：** Discussion #8 创建 + 修复，2026-03-10
**注意：** 绝对不要在终端直接输入含大量中文的 here-string，会触发 PSReadLine 缓冲区溢出崩溃（`ArgumentOutOfRangeException: top = -26`）
**来源：** 2026-03-10 Discussion #8 发布会话

---

### P-DV-006：git credential fill — 获取存储的 OAuth token

**场景：** 以下情况需要手动提取 OAuth token：
1. `gh auth login --web` 在 VS Code 终端失败（无 TTY，无法打开浏览器）
2. `gh auth login --with-token` 报 "missing required scope 'read:org'"
3. 需要在脚本中直接调用 GitHub REST/GraphQL API
4. 任何需要 GitHub OAuth token 的自动化场景，且 token 已通过 git 存储

**命令：**

```powershell
# 从 Windows 凭据存储中提取 GitHub OAuth token
$cred = "protocol=https`nhost=github.com`n" | git credential fill
# 解析 password 字段（gho_* OAuth token）
$token = ($cred | Where-Object { $_ -match "^password=" }) -replace "^password=",""
```

**返回字段：**
- `username` = GitHub 用户 ID（数字）
- `password` = `gho_*` OAuth token（与 git push 时使用的同一 token）

**注意：**
- token 的 scope 取决于当时授权时的范围，不一定有全部 API 权限
- 如果缺少 `admin:org` 或其他特殊 scope，GraphQL 查询特定类型数据会报 403
- **不要将 token 写入版本控制**（脚本文件执行完毕后删除）

**验证：** 2026-03-10 Discussion #8 发布会话
**来源：** gh CLI 无 TTY 登录失败后的替代方案

---

## 已知能力局限（Known Limitations）

> 本小节记录 Dev 的结构性局限——非缺陷，而是边界。
> 来源：2026-03-01 团队成长会能力自省环节
> 上次更新：2026-03-10

| 局限类型 | 描述 | 规避策略 | 成长方向 |
|---------|------|---------|---------|
| 无跨会话记忆 | 每次会话从零开始；上次的决策、错误、偏好不会自动延续 | 依赖 `copilot-instructions.md` + `knowledge/dev-patterns.md` + `memory.jsonl` | Memory MCP 深度集成；`memory.jsonl` 写入规范化 |
| patterns 维护惰性 | `dev-patterns.md` 维护主动性不足，容易被压 | Playbook §2.2 Step 4：每次会话结束时主动提炼新条（已写入流程约束） | 建立每次会话结束的 patterns 提炼习惯 |
| 用户偏好感知弱 | 对话中获取的用户偏好没有固化入口，下次会话就丢失 | `.github/USER.md` 作为用户偏好锚点；对话中遇到明确偏好时立即写入 | 建立偏好路由机制 |
