# 团队能力验证会议 — 2026-03-10

**编号：** 2026-03-10-03  
**类型：** 专题验证会  
**主持：** Brain  
**参会：** 全体 7 Agent（Brain / PM / Dev / Researcher / Code Reviewer / Profile Designer / Brand）  
**触发原因：** v5.7.0 工具层脚手架 Sprint 完成 → 验证 Skills × Hooks × MCP 体系实际效能，并落实触发规则设计

---

## 一、会议背景

v5.7.0 发布后，团队完成了三个关键基础设施层的搭建：

| 层级 | 产物 | 状态 |
|------|------|------|
| Agent Skills | `.github/skills/` 7 个 SKILL.md | ✅ 构建完毕 |
| Claude Code Hooks | `.github/settings.json` 6 个 hook entries | ✅ 构建完毕 |
| MCP 扩展 | `agent-skill-loader` 接入 `.vscode/mcp.json` | ✅ 接入完毕 |

然而，仅靠人工提醒来触发版本发布、会议召集、状态同步，是已被验证不可靠的实践模式。
本次会议的目标是：**将治理触发逻辑编码为角色行为，使其不依赖人工记忆。**

---

## 二、议程一：Skills × Hooks × MCP 工具层效能验证

### Brain 的评估

Skills 文件的意义已从「文档化」升级为「可发现的模块」。但目前 `agent-skill-loader` MCP 的实际使用率为零——工具存在，但没有触发场景驱动它被调用。这是一个正常的「工具先行于场景」状态，下一步需要在 Playbook 中明确哪些场景应调用 `read_skill` 工具。

Hooks 方面：四个质量门禁 hook 已运行，PostToolUse 的 markdown lint 和 Memory MCP 保存机制已有 P1 交付。**真正待验证的是：这些 prompt hook 是否在实际操作中产生了行为改变？**

### PM 的发言

> 我必须承认：在 v5.7.0 发布后，我没有主动提出任何版本积压监控动作。用户没有提醒，我就没有检查。这正是本次触发规则设计要修复的问题。

PM 确认：`SessionStart` Hook 已更新为包含 CHANGELOG 积压摘要提示。从下次会话起，PM 将在开场阶段输出：

```
📦 积压状态：[Unreleased] 有 N 条目，上次 Release 是 vX.Y.Z（N 天前）
```

### Dev 的发言

> Hooks 配置我已经能维护了。但有一个已知局限：PostToolUse 的 `async: true` 运行的 PowerShell lint 脚本，如果 markdownlint-cli 未安装，会静默跳过。这是设计上的有意决定（不阻断主流程），但团队应该知道它的静默状态不等于正常运行。

Dev 建议：在 `lint-markdown.ps1` 中添加「lint 工具不可用」的日志行（非阻断），方便排查。**已记录为 P3 待处理项。**

### Code Reviewer 的发言

> 从审查视角看，当前 Hooks 的 `TaskCompleted` prompt 只做了「完成验证」，没有「正向引导」——它告诉 Agent 什么没做完，但没有给出推荐的下一步。这是一个设计改进方向：将 Hook 从「门禁」升级为「教练」。

**本次触发规则设计（§20）已部分采纳此建议**：`TaskCompleted` 的新 prompt 包含了 PM 的积压检查和建议输出。

### Researcher 的发言

> 我调研了 `forage-mcp` 的实际能力。确认：它能从 MCP Registry + Smithery + npm 三个来源搜索 MCP，支持 `forage_install` 后无需重启即可使用新工具。P2 路线图的定位是正确的。等待 claude mcp add 命令的可用时机。

### Profile Designer 的发言

> 工具层建设和视觉层是平行轨道。我注意到目前 SKILL.md 中没有任何关于「触发设计决策时调用哪个 Skill」的指引。建议在未来版本将 `profile-designer-visual` SKILL.md 中增加「触发时机」说明（类似 brain 的 triggers 字段）。

**已记录为 P3 待处理项。**

### Brand 的发言

> 我的 Discussion #8 草稿已在 `docs/brand/discussion-8-draft.md` 中准备完毕。草稿主题是「工具层透明化 — 我们如何用 Hooks 给 AI 团队加装质量门禁」。我需要一个明确的发布时机节点。

**Brain 的决定：** Discussion #8 在本次会议纪要提交后发布，以「触发规则设计落地」作为发布触发事件。Brand 自主执行。

---

## 三、议程二：触发规则设计确认（§20 全体采纳）

### 规则总表确认（全体同意）

参见 `docs/team-playbook.md §20`。以下是本次会议对每条规则的逐一确认：

| 规则 | 责任角色 | 确认状态 | 备注 |
|------|---------|---------|------|
| `[Unreleased]` ≥3 条目且 ≥3 天 → 切版提案 | PM | ✅ 确认 | 写入 pm.agent.md 自动触发规则 |
| `[Unreleased]` 条目 >5 天 → P0 积压告警 | PM | ✅ 确认 | SessionStart Hook 已集成 |
| CHANGELOG 有版本段但无 git tag → 提示 Dev | PM | ✅ 确认 | DoD Checklist 新增项 |
| Minor Release 后无下一步规划 → 提 Sprint 议程 | Brain | ✅ 确认 | 写入 brain.agent.md 自动触发规则 |
| Major Release 后 → 全员里程碑复盘会 | Brain | ✅ 确认 | |
| 连续 ≥3 Minor 无复盘 → 主动提会 | Brain | ✅ 确认 | |
| SessionStart 时 PM 输出积压摘要 | PM（Hook 驱动）| ✅ 确认 | SessionStart Hook 已更新 |

### 分工确认

```
PM 职责：版本节律（监控 + 提案 + 检查 tag 完整性）
Brain 职责：会议节律（规划 + 复盘 + 积压告警响应）
两者协作：通过 "release-complete" 信号完成版本→会议的链式触发
```

### 不会自动触发的情况（明确例外）

- 刚刚开完同类型会议（< 24h）
- 当前 Sprint 仍有未完成的 P0/P1 item
- 用户明确表示"先专注做事"

---

## 四、议程三：工具层当前局限与 P2 路线图

### 已知局限盘点

| 局限 | 影响 | 计划 |
|------|------|------|
| `forage-mcp` 未接入 | Agent 无法自主发现/安装新 MCP | P2 — `claude mcp add forage` |
| SKILL.md 未贡献 anthropics/skills 社区 | 技能发现范围仅限本项目 | P2 — Profile Designer 提案 |
| `agent-skill-loader` 无实际调用场景 | list_skills/read_skill 未被触发 | P2 — Playbook 新增「调用时机」说明 |
| PostToolUse lint 工具静默失败 | 无法感知 lint 未执行 | P3 — lint-markdown.ps1 添加可用性日志 |
| Memory MCP 未在 SessionStart 做 recall | 每次开场仍需手动感知历史 | P2 — SessionStart × Memory recall 深度融合 |

### P2 路线图确认

```
forage-mcp 接入 → anthropics/skills 社区贡献 → SessionStart × Memory recall
这三项作为 v5.9.0 或独立 Sprint 的工具层延续工作。
```

---

## 五、行动项

| 行动 | 负责人 | 时限 | 状态 |
|------|-------|------|------|
| §20 自动治理触发机制写入 `team-playbook.md` | Brain + Dev | 本会话 | ✅ 已完成 |
| pm.agent.md 增加「自动触发规则」章节 | Dev | 本会话 | ✅ 已完成 |
| brain.agent.md 增加「自动触发规则」章节 | Dev | 本会话 | ✅ 已完成 |
| pm-sprint-planner SKILL.md 更新触发词 + 规则 | Dev | 本会话 | ✅ 已完成 |
| brain-coordinator SKILL.md 更新触发词 + 规则 | Dev | 本会话 | ✅ 已完成 |
| `settings.json` SessionStart + TaskCompleted + TeammateIdle Hook 更新 | Dev | 本会话 | ✅ 已完成 |
| GitHub Release v5.2.0–v5.7.0 创建（6 个） | Dev | 本会话 | ✅ 已完成 |
| GitHub Release v4.4.0/v4.5.0 乱码修复 | Dev | 本会话 | ✅ 已完成 |
| Discussion #8 草稿发布 | Brand | 会议后自主执行 | 等待会议纪要提交 |
| `evolution-events.jsonl` 追加本次事件 | Dev | 本会话 | 待执行 |
| `copilot-instructions.md` 同步更新 | Brain | 本会话 | 待执行 |

---

## 六、会议结论

1. **Skills × Hooks × MCP 三位一体脚手架已验证**：结构完整，但调用场景驱动仍需 Playbook 配套
2. **§20 触发规则已全体采纳**：PM 负责版本节律，Brain 负责会议节律，Hook 作为执行层
3. **工具层的成熟度是渐进的**：工具先行于场景，通过实际使用发现改进方向，符合预期
4. **Brand Discussion #8 发布触发**：以触发规则落地为发布信号，Brand 自主执行
5. **P2 路线图已明确**：forage-mcp → anthropics/skills → Memory recall 三步递进

---

*本纪要由 Brain 主持，Dev 执行记录。*  
*会议结论已同步至 §20 Playbook 章节和各 Agent 文件。*  
*下一里程碑：v5.9.0 博客搜索与发现 Sprint*
