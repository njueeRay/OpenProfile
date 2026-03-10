# 团队复盘会议 #003 — AI 协作范式深化与核心资产沉淀

**日期：** 2026-02-25
**参与者：** brain（新设）· profile-designer · dev · researcher · code-reviewer · pm（新设）
**会议模式：** 全体复盘会议（并行发言 → 由 Brain 综合）
**状态：** ✅ 决策已形成，已执行配置更新

---

## 一、三轮协作深化感受

经历 v1.0、v2.0 两轮迭代，团队初步形成了以 Profile README 为核心产品、以 Astro 站点为长期平台的双轨格局。团队普遍感受到：

- 每轮迭代后，Agent 对用户意图的理解更准确
- 技术决策的可追溯性有所提升，但仍依赖临时备注
- 角色分工模糊造成部分重复劳动

---

## 二、各角色复盘发言

### Brain（新设）
当前团队缺乏战略协调中枢，各 Agent 直接面向用户会产生信息噪音。提案：Brain 作为唯一汇报窗口，负责会议主持、任务分派、跨角色协调。

### PM（新设）
缺少明确的 Sprint 节奏和版本发布 SOP，导致"随时提交"没有质量门控。提案：PM 负责维护 CHANGELOG、Sprint 规划、DoD 执行。

### Dev
当前职责被 content-writer 名称限制，实际上需要覆盖 Python/TypeScript/YAML/Shell/Markdown 全栈实现。提案：泛化为全栈 dev 角色。

### Code Reviewer
之前仅覆盖 Markdown，实际需要对所有产出物（代码/配置/文档）做质量门禁。提案：泛化为全语言七维度审查。

### Researcher
调研工作缺乏标准输出格式，结论分散。建议每份报告固定包含"决策建议优先级"。

### Profile Designer
视觉决策缺乏记录，导致风格不一致。需要将已决策的设计选择沉淀到 copilot-instructions。

---

## 三、用户观点 & 团队回应

用户补充四条核心观点：

1. **AI-native 是能力单位**：个人独立能力 × AI 执行力 = 共生体，这是这个团队的世界观
2. **Playbook 是外化认知**：Agent 规范 = 对"好的工作"的判断力的编码化
3. **健康标准**：用户判断力有没有随 AI 能力增强同步成长？
4. **开源价值**：本项目本身就是"如何用 AI Agent 协作"的最佳实践示范

团队回应：将以上内容写入 copilot-instructions 哲学锚点区块，作为所有 Agent 的决策底层。

---

## 四、决策

### 决策 A — 角色体系重构
- **内容：** 新增 brain / pm，重命名 content-writer → dev，泛化 code-reviewer
- **执行：** 创建 `.github/agents/brain.agent.md` 和 `pm.agent.md`，更新 dev 和 code-reviewer agent 文件

### 决策 B — Commit 规范
- **内容：** 所有 Copilot Agent 协作完成的提交附加 Co-authored-by
- **执行：** 三个仓库配置 `.gitmessage` 模板，`commit.template` 指向该文件

### 决策 C — Session Continuity
- **内容：** copilot-instructions 作为跨会话记忆载体，每轮迭代后 Brain 必须更新
- **执行：** 写入 Agent 权限与工作机制区块

### 决策 D — Pre-flight Checklist
- **内容：** 每次提交前运行 DoD checklist，全部 ✅ 后才算迭代完成
- **执行：** 写入 copilot-instructions DoD Checklist 区块

### 决策 E — 核心资产清单
- **内容：** 明确哪些文件是"核心资产"（不可随意删改）
- **执行：** 在 copilot-instructions 文件结构说明中标注 ★ 重要文件

---

## 五、执行行动项

| 序号 | 行动项 | 负责人 | 目标时间 |
|------|--------|--------|----------|
| 1 | 创建 brain.agent.md | Brain | 本会话 |
| 2 | 创建 pm.agent.md | PM | 本会话 |
| 3 | 更新 dev.agent.md（泛化为全栈） | Dev | 本会话 |
| 4 | 更新 code-reviewer.agent.md（七维度） | Code Reviewer | 本会话 |
| 5 | 配置 .gitmessage 模板（三仓库） | Dev | 本会话 |
| 6 | 更新 copilot-instructions（哲学锚点 + DoD） | Brain | 本会话 |
| 7 | 沉淀已决策设计选择到 copilot-instructions | Brain | 本会话 |

---

## 六、立即行动项

- [ ] Brain 起草 copilot-instructions 哲学锚点区块
- [ ] Brain 创建 brain.agent.md
- [ ] PM 创建 pm.agent.md
- [ ] Dev 更新 dev.agent.md
- [ ] Code Reviewer 更新 code-reviewer.agent.md
- [ ] Dev 配置 .gitmessage 模板
- [ ] Brain 更新 copilot-instructions 「已决定的设计选择」

---

*会议纪要由 Brain 整理，PM 校对，2026-02-25*
