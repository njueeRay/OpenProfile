# 会议纪要：团队演进机制研究会

**日期：** 2026-03-10  
**序号：** 01  
**类型：** 专项研究会（技术决策型）  
**主持：** Brain  
**参会：** Brain · PM · Dev · Researcher · Code Reviewer · Profile Designer · Brand  
**触发条件：** 用户指令——调研 GitHub 上 Agent 演进最佳实践（特别是 EvoMap），核查能力自省是否落地，搭建演进机制  
**核心输入：** Researcher 调研报告 `docs/research/agent-team-evolution-2026.md`

---

## Brain 开场：三个议题

今天的会议有三个议题，按顺序处理：

1. **外部调研同步**：Researcher 带来了 EvoMap/evolver 和多 Agent 协作模式的调研，所有人听一遍，形成共同认知
2. **内部核查**：Brain 核查 2026-03-01 能力自省的内容有没有真正落入各自的 patterns 文件
3. **机制搭建**：基于调研结论，立即落地演进机制

---

## Part 1：调研同步（Researcher 汇报）

### 关键发现：我们已经是 GEP 架构

**Researcher：** 我发现了一件很有趣的事：EvoMap/evolver 的 GEP（Genome Evolution Protocol）核心架构和我们的 L2 知识体系几乎是同构的。

GEP 的三层结构：
- **Genes** 原子进化模式 → 我们的 P-XX-NNN 模式条目
- **Capsules** 元模式束 → 我们**没有**（缺口）
- **EvolutionEvents** 进化事件审计链 → 我们的会议纪要（**但没有与 patterns 更新挂钩**，缺口）

这意味着我们不用从头建立演进体系，只需要补填三个缺口：
1. **能力局限声明**（每个 patterns 文件都没有）
2. **Capsule 元模式**（暂无对应物）
3. **演进事件链接**（meeting notes 没有显式指向 patterns 更新）

**EvoMap/evolver 最重要的安全设计启示**：
- 进化不是自动执行代码修改，而是生成「协议约束的演进提示」
- 类比我们：patterns 文件更新不是 Agent 自己随时改，而是经过「演进触发条件」验证后，由明确角色（Dev/PM/Brain）写入

**五种主流协作模式对比**（来自 awesome-agent-evolution）：
- 角色分工型（CrewAI/MetaGPT）→ **我们的模型** ✅
- 进化工作流型（AFlow/EvoAgentX）→ 部分实现，需加强
- 群体涌现型（OpenAI Swarm）→ 不适合我们
- 记忆中枢型（Mem0/memU）→ 需强化
- A2A 协议型（Google A2A）→ 轻量已有（co-authorship 约定）

**Brain：** 好。这给了我们清晰的路线图。进入 Part 2。

---

## Part 2：能力自省落地核查

### Brain 核查结论

我逐一检查了所有现有 patterns 文件（brain/pm/dev/researcher/code-reviewer）：

```
brain-patterns.md     → 3 条 L2 ✅，能力局限声明 ❌
pm-patterns.md        → 2 条 L2 ✅，能力局限声明 ❌  
dev-patterns.md       → 3 条 L2 ✅，能力局限声明 ❌
researcher-patterns.md → 1 条 L2 ✅，能力局限声明 ❌
code-reviewer-patterns.md → 1 条 L2 ✅，能力局限声明 ❌
profile-designer-patterns.md → ❌ 文件不存在
brand-patterns.md     → ❌ 文件不存在
```

**结论：** 2026-03-01 会议中所有 Agent 的能力自省内容**没有一条**被落实到对应 patterns 文件中。这是我（Brain）的遗漏——我在 P1 行动项里标注了「所有 Agent 下一次成长会前更新 patterns」，但这是一个不够明确的承诺。

**纠正：** 本次会议结束后，Dev 立即补全所有文件。

---

## Part 3：演进机制设计讨论

### PM：关于频率和触发条件

**PM：** 我支持「每次 Sprint 结束前，PM 检视本轮会议纪要，筛选 L1 升 L2」的机制（P-PM-001 已有）。

但我建议增加一条：**能力局限声明的更新时机**应该和「成长会」解耦——不应该仅在每次大型成长会才更新，而是：
- 每当某个局限在实际工作中真实触碰到时，当事 Agent 可以在 patterns 文件中更新「触碰记录」字段
- 这样局限声明就是活的，而不是静态快照

**Brain：** 好建议。Dev 记录到实现细节里。

### Dev：关于 Capsule 概念

**Dev：** 我看了 GEP 的 Capsule 设计——它是多个 Gene 的复合包，当一组 Gene 总是配合使用时才值得提炼为 Capsule。

我检查了我们现有的 10 条 Gene（L2 模式），目前明显的组合是：
- **Sprint 启动包**：P-BR-001（Worktree 分配）+ P-PM-002（DoD 前置）+ P-DV-001（Windows worktree 操作）→ 每次开新专项时都会一起用
- **版本发布包**：P-PM-001（知识沉淀触发）+ P-CR-001（质量检查顺序）→ 每次 Minor 发布前

但 Capsule 的价值要在 Gene 数量更多时才显著。目前建议创建文件但内容留空，等 Gene 积累到 20+ 时再正式填写。

**Brain：** 同意。先建文件，不强求内容，避免过早优化。

### Code Reviewer：关于演进事件链

**Code Reviewer：** 我想提一个实操建议。

GEP 的 `events.jsonl` 格式是：每次进化写一行 JSON 记录。我们可以做一个更轻量的版本——不需要 JSON schema，直接用 JSONL（每行一个对象）：

```jsonl
{"date":"2026-03-10","trigger":"team-evolution-research","agent":"all","type":"add-limitation","description":"所有 patterns 文件增加能力局限声明小节"}
{"date":"2026-03-10","trigger":"team-evolution-research","agent":"dev","type":"new-gene","patternId":"P-DV-004","description":"memory.jsonl 写入规范模式"}
```

这样以后任何人想回看「我们的演进轨迹」，只要看这个文件就够了，不用翻遍所有 meeting notes。

**Brain：** 很好。这就是我们版本的 Gene Validation Audit Trail。Dev 执行。

### Researcher：关于自动信号提取

**Researcher：** GEP 里有一个我很感兴趣但我们短期做不到的东西：从运行日志自动提取演进信号。

对我们来说，最接近「日志」的是：
- CHANGELOG.md（每次版本的 Fix/Change 记录）
- docs/meetings/（每次会议的问题和决策）
- knowledge/evolution-events.jsonl（一旦建立）

一个低成本的「手动信号提取」机制：**PM 在每次 Minor 发布后，检视 CHANGELOG 的 `Fixed` 项，判断是否有 Repair-Only 信号积累**——如果连续 3 次 Minor 里 Fixed > Added，触发 `harden` 策略（即强化质量 Sprint）。

**Brain：** 这个我加到 Playbook 演进机制章节里。

### Brand：关于演进的对外可见性

**Brand：** 从传播角度，团队能力演进本身是一个很好的 Build in Public 内容来源。

每次成长会后，我们不只是更新 patterns 文件，还可以发一篇 Discussion 帖子：「这个月我们学到了什么」——帖子不需要很长，但让外部读者看到一支 AI 团队在真实学习和改进，这比任何功能发布都更有吸引力。

我建议把「成长会后发布一篇 Discussions 演进纪录」写入 Brand 的流程。

**Brain：** ✅ 加入行动项。

---

## Brain 收尾：立即行动项

本次研究会议达成共识，以下立即执行：

### P1 — 本次会话完成

| # | 行动 | 执行 | 位置 |
|---|------|------|------|
| 1 | 5 个现有 patterns 文件增加「能力局限声明」小节 | Dev | knowledge/ |
| 2 | 新建 profile-designer-patterns.md | Dev | knowledge/ |
| 3 | 新建 brand-patterns.md | Dev | knowledge/ |
| 4 | 新建 evolution-events.jsonl（含历史回填）| Dev | knowledge/ |
| 5 | Playbook 新增 §19 演进机制章节 | Brain | team-playbook.md |
| 6 | 更新 copilot-instructions.md 迭代状态 | Brain | copilot-instructions.md |

### P2 — v5.6.0 前

| # | 行动 | 执行 | 位置 |
|---|------|------|------|
| 7 | 新建 capsules.md（框架，内容待 Gene 积累）| Dev | knowledge/ |
| 8 | memory.jsonl 写入规范（何时写、谁写、格式）| Dev + Brain | knowledge/README.md |
| 9 | PM 版本信号提取机制（CHANGELOG Fixed > Added 规则）| PM | Playbook |
| 10 | Brand：成长会后 Discussions 演进纪录流程 | Brand | brand/content-matrix.md |

---

## 附：演进机制一句话总结

> **「我们的 L2 知识体系 = GEP Gene 库。  
> 缺失的是：局限是否可见，演进是否可追溯，信号是否能流动。  
> 现在，这三点都要补上。」**

——Brain，2026-03-10

---

*会议纪要由 Brain 整理，Researcher 提供调研基础，Dev 执行记录*  
*Co-authored-by: GitHub Copilot <copilot@github.com>*
