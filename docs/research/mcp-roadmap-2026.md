# MCP 引入路线图调研报告

> **文件说明：** 本报告响应团队成长会（2026-03-01-03）决议——系统评估 MCP（Model Context Protocol）对当前 AI-native 工作流的价值，并给出引入优先级建议。  
> **作者：** Researcher  
> **日期：** 2026-03-10  
> **状态：** 初稿，待 Brain + Dev 审阅

---

## 执行摘要

MCP 是 Anthropic 提出的开放协议，让 AI 助手能够安全地调用外部工具和数据源。VS Code + GitHub Copilot 已原生支持 `.vscode/mcp.json` 配置方式，工作区内已有基础配置。

**结论（三行版）：**
- 引入 MCP 的基础设施成本**极低**（工作区已有 `.vscode/mcp.json`）
- 对我们团队最高价值的三个切入点是：记忆 → 浏览器验证 → 社交发布
- **建议立即行动**：引入 Memory MCP 解决 Agent 跨会话记忆问题（P1）；其余两项纳入 v5.7 路线图（P2/P3）

---

## 当前状态评估

### 工作区 MCP 配置现状

```json
// .vscode/mcp.json（已存在）
// 具体内容需 Dev 核查，但结构上已可注册 MCP servers
```

MCP 的工作方式：每个 MCP server 是一个独立进程，通过 stdio 或 HTTP 与 Copilot 通信，暴露 `tools`（可调用的操作）和 `resources`（可读取的上下文）。

---

## 三个优先级切入点

### 切入点 1：Memory MCP（P1 — 立即引入）

**解决的问题：** Dev 在能力自省中指出的「没有记忆」困境——每次会话从零开始，用户的偏好无法跨会话保留。

**推荐方案：** `@modelcontextprotocol/server-memory`（Anthropic 官方，MIT 协议）

```bash
npx -y @modelcontextprotocol/server-memory
```

**能力：**
- 实体-关系知识图谱存储（本地 JSON 文件）
- 支持 `create_entities`、`add_observations`、`search_nodes` 等操作
- 与 `njueeray-kg/` worktree（Phase K）目标高度重合

**接入方案：**

```json
// .vscode/mcp.json 追加
{
  "servers": {
    "memory": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    }
  }
}
```

**数据存储建议：** 使用 `OpenProfile/.github/agents/knowledge/` 目录作为持久化位置，通过 `MEMORY_FILE_PATH` 环境变量指定。这样知识库和仓库一起 git 管理。

**使用场景：**
- 用户表达偏好后，Agent 调用 `add_observations` 记录
- 会话开始时，Agent 调用 `search_nodes("user preferences")` 恢复上下文
- Dev 会话结束时，调用 Memory MCP 存储本次新学而不是靠手动更新文件

**风险：** 低。本地文件存储，无网络依赖，无隐私风险。

---

### 切入点 2：Playwright MCP（P2 — v5.7 引入）

**解决的问题：** Code Reviewer 在自省中指出「只能看代码，看不到真实使用」——Agent 无法自主验证线上效果。

**推荐方案：** `@playwright/mcp`（微软官方，MIT 协议）

**能力：**
- 浏览器截图、点击、表单填写、URL 导航
- 无头模式或有头模式均支持
- 可在 CI 外直接由 Agent 触发

**使用场景（按价值排序）：**

| 场景 | 当前解决方案 | MCP 替代方案 | 价值 |
|------|------------|------------|------|
| Profile README 视觉验证 | 手动截图发给用户看 | Agent 自主截图附在报告里 | 高 |
| Discussion 发布后验证 | 用户手动确认 | Agent 访问 URL 截图确认 | 中 |
| 新博文渲染验证 | Dev 本地 `npm run build` | Agent 访问 preview 链接 | 中 |

**接入方案：**

```json
// .vscode/mcp.json 追加
{
  "servers": {
    "playwright": {
      "type": "stdio",
      "command": "npx",
      "args": ["@playwright/mcp@latest"]
    }
  }
}
```

**风险：** 中。需要 Playwright 浏览器已安装（工作区已有 Playwright，但 MCP 模式可能需要单独安装浏览器）。建议 Dev 在引入前验证。

---

### 切入点 3：社交媒体发布 MCP（P3 — v6.x 规划）

**解决的问题：** Brand 在自省和战略会中表达的愿景——「在飞书提需求 → Agent 自动生成内容 → 发预览链接 → 批准 → 自动发布」。

**候选方案：**

| 平台 | MCP 方案 | 成熟度 | 用户操作需求 |
|------|---------|--------|------------|
| GitHub Discussions | 已通过 GraphQL API 实现（无需 MCP）| ✅ 生产可用 | 无 |
| 小红书 | 无官方 MCP，需自建或第三方 | ⚠️ 实验阶段 | 需账号/Cookie 授权 |
| X（Twitter）| 官方 API 成本高（$100/月），不建议 | ❌ 不推荐 | — |
| Bluesky | `@atproto/mcp`（社区），免费 API | 🔄 可行 | 需账号授权 |
| 微信公众号 | 无可靠 MCP，API 审查严格 | ❌ 不推荐短期 | — |

**暂时结论：** 社交发布 MCP 成熟度不足，优先通过 GitHub Discussions API（已验证）覆盖核心需求；小红书和 Bluesky 在 v6.x 阶段评估可行性时再立项。

---

## 补充：clawhub / skill 体系评估

用户在团队成长会中提到了 clawhub skills。调研发现：

**clawhub** 是一个 MCP 工具市场（类 npm），提供打包好的 skill（如「发小红书」「查天气」），核心价值是跳过 API 集成细节。

**评估结论：**
- 对 Memory / Playwright 这类成熟 MCP，直接用官方包更可靠，无需经过 clawhub
- 对社交平台发布类（小红书、抖音），clawhub 的封装可以节省 Agent 开发时间，值得在 v6.x 时评估
- **当前行动建议：** 暂时观察，不主动引入；待 P1/P2 MCP 验证后再评估 clawhub 的必要性

---

## 决策建议优先级

> 本报告三级建议（按团队成长会约定，调研报告必须明确标注）

**应该立即做（P1）：**
- [ ] Dev 将 Memory MCP 接入 `.vscode/mcp.json`，测试跨会话知识存储  
- [ ] Brain 制定 Memory MCP 的使用规范（何时写入、写什么、粒度如何）
- [ ] PM 在 v5.6.0 Sprint 规划中纳入「Memory MCP 试运行」story

**值得跟踪（P2）：**
- [ ] `@playwright/mcp` 稳定性在 v5.7 之前持续关注（跟踪 GitHub releases）
- [ ] Code Reviewer 评估 Playwright MCP 对审查报告的增强价值
- [ ] Brand 评估 Bluesky `@atproto/mcp` 的可用性（低优先级）

**可以暂时放弃（不做）：**
- [ ] X/Twitter MCP — API 成本不合理  
- [ ] 微信公众号 MCP — API 限制太多
- [ ] clawhub 引入 — 目标 MCP 官方包已够用，额外依赖不值得

---

## 参考资料

- [Model Context Protocol 官方文档](https://modelcontextprotocol.io)
- [@modelcontextprotocol/server-memory GitHub](https://github.com/modelcontextprotocol/servers/tree/main/src/memory)
- [@playwright/mcp GitHub](https://github.com/microsoft/playwright-mcp)
- [VS Code MCP 配置文档](https://code.visualstudio.com/docs/copilot/model-context-protocol)

---

*Researcher 起草 · 2026-03-10 · 团队成长会（2026-03-01-03）行动项产出*  
*待 Brain 审阅优先级后转交 Dev 执行 P1 部分*
