# 全体规划会 — Playbook v2.2 升级预研讨论

**日期：** 2026-03-01
**序号：** 当日第 01 次会议
**参与者：** brain · pm · dev · researcher · code-reviewer · profile-designer · brand
**会议类型：** Playbook 专项升级会
**背景：** Ray 整理积累的 Playbook 改进想法，形成 v2.2 升级决策

---

## 一、Brain 开场 — 六件核心议题

1. **文档治理表扩列**：`§2.3` SSOT 表格缺少"维护责任人"和"过期判断标准"列
2. **优先级四级系统**：P0-P3 定义，含 Sprint 处理规则
3. **Sprint 轻量定义更新**：周期约束、硬限制、中途修改原则
4. **Git Worktree 工作规范**：并行开发的操作规范写入 Playbook
5. **会议命名序列号化**：`YYYY-MM-DD-NN-<type>.md` 格式，便于同一天多次会议区分
6. **copilot-instructions 迁移协议**：Fixed 区块 vs Replaceable 区块的显式界定

**Playbook 精简原则**：内容不超过 20 节，每次升级必须同步删除冗余内容。这条原则不可妥协。

---

## 二、全员发言

### PM — 文档治理 + 命名序列号化
**D-01 提案**：`§8.2` 会议命名改为 `YYYY-MM-DD-NN-<type>.md`，文件头加 `序号：当日第NN次会议`。

今天就是第 01 次，以后同天开多次会议时可以区分。现在的命名没有序号，如果同一天开两个主题截然不同的会议，很难区分哪个是"第一个"。

**D-02 提案**：`§2.3` SSOT 表格扩列，加入"维护责任人"和"过期判断标准"。

### Dev — Sprint 和 Priority 工程化
**D-03 提案**：引入 P0-P3 四级优先级。

- P0：生产阻断，立即修复，中断当前 Sprint
- P1：当前 Sprint 必须完成，max 3 个 P1
- P2：尽力完成，可以跨 Sprint
- P3：有空再说，不进 Sprint backlog

**D-04 提案**：Sprint 轻量定义。周期：1-3 天。硬约束：max 3 个 P1。中途修改：只有发现 P0 时才中断，其他新需求等下个 Sprint。

### Code Reviewer — DoD 实质意义
DoD 不只是一张清单，是"质量意图"的物化形式。建议每个 Sprint 开始时，PM 先写 DoD，再写任务列表。顺序很重要：先想"做完是什么样子"，再想"做什么"。

### Researcher — Git Worktree 是否进 Playbook
**D-05 提案**：Git Worktree 并行工作规范写入新 `§3.4`。

Worktree 是个非常具体的 Git 操作，不应该只靠口头约定。需要规范：
1. 如何创建（`git worktree add -b feature/<name>`）
2. Worktree 的生命周期（创建 → 任务 → 汇报 → 合并 → 清理）
3. 汇报模板（"feature/<name> 任务完成，变更摘要：[…]，请执行合并流程"）
4. 禁止跨 Worktree checkout

### Profile Designer — copilot-instructions 迁移边界
**D-06 提案**：`§13.2` 扩展，明确 copilot-instructions 的哪些部分是"Fixed（项目通用）"哪些是"Replaceable（项目特定）"。

Fixed 区块：哲学锚点、Agent 权限机制、Co-authorship 约定、DoD Checklist
Replaceable 区块：个人信息、已决定的设计选择、当前迭代状态、文件结构说明

这对于把这个模板迁移到其他项目非常关键。

### Brand — 开源调性
这些规范是"严肃的工程文档"，但外部读者第一眼看到的可能是枯燥。建议在 Playbook 开头加一句定位说明：这是一个正在被 AI 团队实际使用的活文档，不是理想状态的目标文档。

"活文档"这个定位本身就是 Build in Public 的一部分。

---

## 三、决策（Brain 汇总）

**Playbook v2.2 升级六件事：**

| 编号 | 内容 | 位置 | 操作 |
|------|------|------|------|
| D-01 | 会议命名改为 `YYYY-MM-DD-NN-<type>.md`，文件头加序号字段 | `§8.2` | 修改 |
| D-02 | 文档治理表扩列：加入"维护责任人"和"过期判断标准"列 | `§2.3` | 修改 |
| D-03 | 四级优先级定义（P0-P3），含 Sprint 处理规则 | `§3` 前新增小节 | 新增 |
| D-04 | Sprint 轻量定义（周期、硬约束、中途修改原则） | `§3` | 修改 |
| D-05 | Git Worktree 并行工作规范（操作流程 + 生命周期 + 汇报模板） | 新 `§3.4` | 新增 |
| D-06 | copilot-instructions 迁移协议（Fixed vs Replaceable 区块界定表） | `§13.2` 扩展 | 修改 |

**附加：** Playbook 精简原则正式写入 `§0`（之前是口头约定，需要明文化）。

---

## 四、行动项

| 行动项 | 负责人 | 完成时间 |
|--------|--------|---------|
| 执行 D-01 至 D-06 升级 | PM + Dev | 本会话 |
| 更新 pm.agent.md / brain.agent.md 版本号 → v1.1 | PM / Brain | 本会话 |
| 更新 PLAYBOOK-CHANGELOG.md 记录 v2.2 | PM | 本会话 |
| Brain 同步 copilot-instructions 中的 Playbook 版本号 | Brain | 本会话 |

---

*本会议为当日第 01 次会议，亦是 Playbook v2.2 升级的正式启动会。*

*会议纪要由 Brain 整理，PM 校对，2026-03-01*
