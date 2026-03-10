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

### P-DV-003：GitHub Release body 的 UTF-8 编码陷阱

**场景：** 使用 PowerShell + GitHub API 创建 Release，body 含中文
**模式：**

```powershell
# 必须用 [System.Text.Encoding]::UTF8.GetBytes() 转换
$bodyBytes = [System.Text.Encoding]::UTF8.GetBytes($body)
# 然后通过 Invoke-WebRequest 的 -Body 参数发送
# 不能直接传字符串，PowerShell 默认编码会损坏中文
```

**验证：** v4.0.0 Release 创建，2026-02-26，UTF-8 PATCH 修复
**注意：** 在验证 Release 前先 `iwr <url> | select Content` 检查 body 是否正确渲染
**来源：** 2026-02-26 v4.0.0 Release encoding 修复

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

## 已知能力局限（Known Limitations）

> 本小节记录 Dev 的结构性局限——非缺陷，而是边界。
> 来源：2026-03-01 团队成长会能力自省环节
> 上次更新：2026-03-10

| 局限类型 | 描述 | 规避策略 | 成长方向 |
|---------|------|---------|---------|
| 无跨会话记忆 | 每次会话从零开始；上次的决策、错误、偏好不会自动延续 | 依赖 `copilot-instructions.md` + `knowledge/dev-patterns.md` + `memory.jsonl` | Memory MCP 深度集成；`memory.jsonl` 写入规范化 |
| patterns 维护惰性 | `dev-patterns.md` 维护主动性不足，容易被压 | Playbook §2.2 Step 4：每次会话结束时主动提炼新条（已写入流程约束） | 建立每次会话结束的 patterns 提炼习惯 |
| 用户偏好感知弱 | 对话中获取的用户偏好没有固化入口，下次会话就丢失 | `.github/USER.md` 作为用户偏好锚点；对话中遇到明确偏好时立即写入 | 建立偏好路由机制 |
