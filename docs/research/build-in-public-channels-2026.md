# Research Brief：AI-native 团队的 Build in Public 渠道选型（2026 现状）

**作者：** Researcher  
**日期：** 2026-02-28  
**状态：** 已完成，供 Brand 渠道策略决策参考  
**触发来源：** Brand 欢迎全员会议行动项 #1

---

## 执行摘要

本 Brief 覆盖三个核心渠道，得出结论如下：

| 渠道 | 可行性 | 建议策略 |
|------|--------|---------|
| GitHub Discussions | ✅ 立即可用，零额外成本 | **主渠道**，优先跑通 |
| X (Twitter) | ⚠️ API 成本高，手动可行 | 精选内容手动发布，不做自动化 |
| Bluesky | ✅ 免费 API，开发者友好 | 次选自动化渠道，等渠道成熟 |
| MCP 内容发布 | 🔬 早期但有潜力 | 调研跟踪，6 个月内评估是否接入 |

**核心建议：以 GitHub Discussions 为锚点渠道，配合博客内容二次分发，暂不依赖社交媒体 API 自动化。**

---

## 1. X (Twitter/X) — API 现状评估

### 1.1 API 政策变化时间线

| 时间 | 变更内容 |
|------|---------|
| 2023-02 | 免费层 API 关闭（约 50 万开发者受影响） |
| 2023-03 | 推出付费 Basic ($100/月) 和 Pro ($5000/月) 层 |
| 2023-08 | 进一步限制：免费层仅保留 v2 Write-only（用于登录验证），Read API 完全下架 |
| 2024-Q2 | API 订阅调整：Basic $200/月，每月 100 条推文写入 |

### 1.2 2026 现状

- **免费层**：仅能通过 OAuth 登录，无内容发布能力
- **Basic 层（~$200/月）**：可发布 100 条/月，无 Read 权限（无法读取回复/数据）
- **Pro 层（$5000+/月）**：完整 API，对个人开发者不现实

### 1.3 结论

对于 njueeRay 团队（个人项目规模），X API 自动化**不具成本效益**。

**建议策略：**

- 不接入 X API 自动化
- 重要内容（如 Playbook 开源里程碑、团队进化时间线发布）可**手动发布**
- 关注受众：Ray 个人账号发布，Brand 提供清单和文案草稿

---

## 2. Bluesky — 替代渠道评估

### 2.1 API 现状

Bluesky 基于 AT Protocol，API 完全开放：

- **免费 API**，无使用量限制（截至 2026-02）
- 支持完整的内容创建、读取、回复操作
- 开发者文档完善：`https://docs.bsky.app/`

### 2.2 用户规模（2026-02 数据）

- 注册用户：~3500 万（2024-11 峰值后略有波动）
- 开发者/技术社区比例相对较高（迁移自 Twitter 的技术类用户）
- 中文内容社区仍偏小

### 2.3 MCP Server 可用性

已有 `bluesky-mcp` 等第三方 MCP Server，可通过自然语言指令发布内容。

**建议策略：**

- 作为 X 的**备选自动化渠道**
- 先以 GitHub Discussions 为主，等团队工作流稳定后接入
- 技术可行，Ray 需要注册账号

---

## 3. GitHub Discussions — 主渠道深度评估

### 3.1 对 njueeRay 团队的核心优势

| 维度 | 评估 |
|------|------|
| 受众匹配度 | ✅ 极高——开发者是目标受众 |
| API 可用性 | ✅ 完整 GitHub API + GraphQL，Giscus 已接入 |
| 已有基础设施 | ✅ Giscus 绑定 njueeray.github.io Discussions（Announcements 分类已启用） |
| 零额外成本 | ✅ 免费 |
| SEO 效果 | ⚠️ 有限（GitHub Discussions 不被充分索引） |
| 社区互动 | ✅ 回复/reaction/订阅机制完整 |

### 3.2 建议的 Discussions 分类架构

```
📢 Announcements      ← 重要里程碑（由 Brain/Brand 发布，仅管理员可发）
💬 Team Insights      ← Agent 博文精选和思考分享（任何人可回复）
🔧 Tech Deep-dives    ← 技术细节讨论（Dev/Researcher 发起）
🌱 AI-native Journey  ← 关于 AI-native 实践的深度话题
❓ Q&A               ← 社区 Q&A（对外受众提问）
```

### 3.3 可自动化的内容

通过 GitHub Actions 或 Brain/Brand 手动操作，以下内容适合发布至 Discussions：

- 博文发布通知（链接 + 一段摘要）
- Sprint 完成里程碑（引用 CHANGELOG 对应区块）
- 知识图谱/团队进化时间线更新
- Playbook 重要版本发布

### 3.4 内容发布工作流（推荐）

```
博客新文章 → Brand 审核 → 在 Team Insights 发布 Announcement
                ↓
         核心内容 → Researcher 提炼出 "3 个关键洞察" 格式
                ↓  
         Brain 审核措辞 → 发布 GitHub Discussion
```

---

## 4. MCP 内容发布能力评估

### 4.1 现有 MCP Servers（2026-02 调研）

| MCP Server | 支持平台 | 能力 | 成熟度 |
|------------|---------|------|--------|
| `github-mcp` (官方) | GitHub | Issues, PRs, Discussions 读写 | ✅ 稳定 |
| `bluesky-mcp` (第三方) | Bluesky | 发布帖子、读取 feeds | 🟡 早期 |
| `twitter-mcp` | X | 发推（需 API Key） | 🔴 依赖付费 API |
| `notion-mcp` (官方) | Notion | 页面/数据库读写 | ✅ 稳定 |

### 4.2 当前工作流接入建议

**立即可用：`github-mcp`**

- GitHub Discussions 发布可通过 Brain/Brand Agent 的自然语言指令完成
- 无需额外 API 购买，已在 njueeRay 工作流中激活

**6 个月内跟踪：`bluesky-mcp`**

- 等 AT Protocol 生态更稳定后评估接入
- 预计 2026-Q3 可作为轻量自动化渠道

---

## 5. 渠道选型总结与 Brand 行动建议

### 5.1 渠道优先级矩阵

```
高可行性
     │
     │    GitHub Discussions ●          Bluesky (未来) ●
     │
     │
低成本├────────────────────────────────────────────────── 高成本
     │
     │         X (手动) ●
     │                              X API (自动) ●
     │                                    (不建议)
低可行性
```

### 5.2 Brand 的近期行动路径

| 时间 | 行动 |
|------|------|
| **本周** | 在 GitHub Discussions 创建分类架构（参考 3.2 节） |
| **本周** | 发布第一条 Announcement：知识图谱 + 团队进化时间线「首发时刻」 |
| **2 周内** | 整理现有 11 篇博文，产出「二次发布优先级清单」 |
| **1 个月内** | 确认 Ray 是否要建立 X/Bluesky 账号同步渠道 |
| **3 个月内** | 评估 GitHub Discussions 互动数据，决定是否扩展渠道 |

### 5.3 给 Brand 的调研结论一句话版本

> **现在就行动的最佳渠道是 GitHub Discussions。X API 不值得投入。Bluesky 作为备选方向保持关注。MCP 接入 GitHub 讨论区技术上已就绪。**

---

## 附录：参考来源

- X API Pricing: <https://developer.x.com/en/products/twitter-api>
- Bluesky AT Protocol: <https://docs.bsky.app/>
- GitHub Discussions API: <https://docs.github.com/en/graphql/reference/objects#discussion>
- MCP Server Registry: <https://modelcontextprotocol.io/servers>

---

*本报告由 Researcher 完成，供 Brand 渠道策略决策参考。有效期 3 个月（2026-02 ~ 2026-05），之后 X/Bluesky API 政策可能有变化。*
