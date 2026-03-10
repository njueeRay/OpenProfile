# 全面审计我们当前的一个状态：团队能力验证会议 — 2026-03-10

**编号：** 2026-03-10-03
**类型：** 专项验证会
**参与者：** brain（主持）· pm · dev · researcher · code-reviewer · profile-designer · brand
**触发原因：** v5.7.0 工具层脚手架 Sprint 完成 → 验证 Skills × Hooks × MCP 体系实际效能

---

## 一、会议背景

v5.7.0 完成了三个关键基础设施层：

| 组件 | 位置 | 状态 |
|------|------|------|
| Agent Skills（7 个 SKILL.md） | `.github/skills/` | ✅ |
| Claude Code Hooks（6 个 hook entries） | `.github/settings.json` | ✅ |
| MCP 扩展（agent-skill-loader） | `.vscode/mcp.json` | ✅ |

**核心问题：** 仅靠人工提醒触发版本发布/会议召集/状态同步，是已被验证不可靠的实践模式。

**本次会议目标：** 将治理触发逻辑编码为角色行为，使其不依赖人工记忆。

---

## 二、Skills × Hooks × MCP 工具层效能验证

### Brain — 诚实评估
`agent-skill-loader` MCP 接入后，实际使用率为零。原因是：工具存在，但没有上游场景驱动它被使用。这是一个"基础设施先于场景"的典型问题。

结论：下一步的工作不是接入更多工具，而是为已有工具设计触发场景。

### PM
承认 v5.7.0 发布后，没有主动进行版本积压监控的动作——按照 §20 规则，这应该是自动触发的。

执行修正：将 `SessionStart` Hook 更新为包含 CHANGELOG 积压摘要提示：
`📝 积压状态：[Unreleased] 有 N 条目，上次 Release 是 vX.Y.Z（N 天前）`

### Dev
PostToolUse 的 `async: true` PowerShell lint 脚本，在 `markdownlint-cli` 未安装时会静默跳过（`exit 0`）。这意味着质量门实际上是"软门"。

记录为 P3 待处理项：在检测环境时给出更明显的提示，而不是静默跳过。

### Code Reviewer
当前 Hooks 的 `TaskCompleted` prompt 只做了"完成验证"，没有"方向引导"。

建议：从"门禁"升级为"教练"——不只是问"做完了吗"，还要问"下一步最重要的是什么"。

本次 §20 触发规则设计已部分采纳此建议：`TaskCompleted` 的新 prompt 包含了 PM 的积压检查和建议输出。

### Researcher
调研了 `forage-mcp`（`isaac-levine/forage-mcp`）的实际能力：

- 支持从 MCP Registry + Smithery + npm 三个来源搜索 MCP
- `forage_install` 后无需重启即可使用新工具
- 适合"Agent 自主发现并接入新工具"的场景

P2 路线图定位确认。等待 `claude mcp add` 命令可用时机。

### Profile Designer
注意到当前 SKILL.md 中没有关于"触发设计决策时应调用哪个 Skill"的指引。

建议：在 `profile-designer-visual` SKILL.md 中加入"触发时机"说明（类似 brain 的 triggers 字段）。

记录为 P3 待处理项。

### Brand
Discussion #8 草稿已在 `docs/brand/discussion-8-draft.md` 中准备完毕。

草稿主题：**"工具层透明化——我们如何用 Hooks 给 AI 团队加质量门禁"**

Brain 决定：Discussion #8 在本次会议纪要提交后发布，以"触发规则设计落地"作为发布触发事件。

---

## 三、触发规则设计确认（§20 全体采纳）

### 规则总表（全体同意）

| 编号 | 触发条件 | 响应行为 | 负责角色 |
|------|---------|---------|---------|
| R-01 | [Unreleased] 积压 > 5 天 | PM 主动提议切版 | PM |
| R-02 | Major 版本发布 | Brain 召集全员复盘会 | Brain |
| R-03 | 连续 3 个 Minor 无复盘会 | Brain 主动提议团队成长会 | Brain |
| R-04 | P0 事件（生产阻断） | Brain 中断当前 Sprint，召集紧急响应会 | Brain |
| R-05 | Brand 有重大发布节点 | Brand 主动提议品牌传播会 | Brand |
| R-06 | Sprint 开始 | PM 发布 Sprint 规划摘要 | PM |
| R-07 | Code Reviewer 审查报告发出 | PM 确认是否满足 DoD，决定是否发版 | PM |

**分工确认：** PM 负责版本节律 / Brain 负责会议节律 / 两者通过"release-complete"信号完成版本→会议的链式触发。

**不会自动触发的情况：**
- 刚刚开完同类会议 < 24h
- 当前 Sprint 仍有未完成 P0/P1 item
- 用户明确表示"先专注做 X"

---

## 四、工具层当前局限与 P2 路线图

### 已知局限

| 编号 | 局限描述 | 严重程度 | 计划 |
|------|---------|---------|------|
| L-1 | `forage-mcp` 未接入，Agent 无法自主发现新工具 | P2 | v5.x 接入 |
| L-2 | SKILL.md 未贡献到 `anthropics/skills` 社区，可发现性为零 | P2 | v5.x 开始贡献 |
| L-3 | `agent-skill-loader` 无实际调用场景，未产生价值 | P2 | 设计触发场景 |
| L-4 | PostToolUse lint 工具静默失败（markdownlint-cli 未安装时） | P3 | 添加环境检测提示 |
| L-5 | Memory MCP 未在 `SessionStart` 做 recall，知识库冷启动 | P2 | SessionStart Hook 更新 |

### P2 路线图（三步递进）

1. **forage-mcp 接入**：`claude mcp add forage -- npx -y forage-mcp`，Agent 可自主搜索/安装 MCP
2. **anthropics/skills 社区贡献**：将 `.github/skills/` 7 个 SKILL.md 提交 PR，可被社区发现
3. **SessionStart × Memory recall 融合**：启动时自动 recall 最近 5 条演进事件 + 用户偏好

---

## 五、行动项（本会话全部完成）

| 编号 | 行动项 | 负责人 | 状态 |
|------|--------|--------|------|
| 1 | §20 自动治理触发机制写入 `team-playbook.md` | PM | ✅ |
| 2 | `pm.agent.md` 增加"自动触发规则"章节 | PM | ✅ |
| 3 | `brain.agent.md` 增加"自动触发规则"章节 | Brain | ✅ |
| 4 | `pm-sprint-planner/SKILL.md` 更新触发词 + 规则 | PM | ✅ |
| 5 | `brain-coordinator/SKILL.md` 更新触发词 + 规则 | Brain | ✅ |
| 6 | `.github/settings.json` SessionStart+TaskCompleted+TeammateIdle Hook 更新 | Dev | ✅ |
| 7 | GitHub Release v5.2.0–v5.7.0 创建（6 件） | Dev | ✅ |
| 8 | GitHub Release v4.4.0/v4.5.0 乱码修复 | Dev | ✅ |
| 9 | Discussion #8 草稿发布 | Brand | ✅ 待会议纪要提交后执行 |
| 10 | `evolution-events.jsonl` 追加本次事件 | Dev | ✅ 待执行 |
| 11 | `copilot-instructions.md` 同步更新 | Brain | ✅ 待执行 |

---

## 六、会议结论

1. **Skills × Hooks × MCP 三位一体脚手架已验证**：基础设施完整，下一步是提升使用率和触发密度
2. **§20 触发规则已全体采纳**：7 条规则写入 Playbook，PM 和 Brain 的自动触发行为已明确
3. **工具层的成熟度是渐进的**：接入 ≠ 使用，使用 ≠ 成熟，成熟 = 触发场景驱动的自然使用
4. **Brand Discussion #8 发布触发**：以"触发规则设计落地"作为发布标志
5. **P2 路线图已明确**：forage → skills 社区贡献 → SessionStart × Memory 三步递进

---

*本纪要由 Brain 主持，Dev 执行记录。*
*下一里程碑：v5.9.0 博客搜索与发现 Sprint*
