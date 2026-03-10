# Agent 团队协作模式与演进机制调研报告

**日期：** 2026-03-10  
**作者：** Researcher  
**状态：** ✅ 已完成，供 Brain 主持研究会使用  
**关键发现：** GEP 协议（EvoMap/evolver）与我们团队 L2 模式体系高度同构，存在直接映射关系

---

## 执行摘要

本报告调研了 GitHub 上 Agent 团队协作与演进的最新实践，重点分析 EvoMap/evolver（GEP 协议，1.4k ⭐）和 EvoMap/awesome-agent-evolution 策展库，结合团队当前能力状态，提出三阶段演进路线图。

**核心结论：**
1. 我们的 L2 模式体系（`knowledge/<agent>-patterns.md`）在结构上已经是 GEP 协议中「Gene」概念的有效实现
2. 当前缺失的是：能力局限的显性化记录、自动信号提取、Capsule 元模式、演进事件审计链
3. 立即可行的补充：每个 patterns 文件增加 `## 能力局限声明` 小节，建立轻量化演进事件日志

---

## 一、EvoMap/evolver 核心架构分析

### 1.1 GEP 协议（Genome Evolution Protocol）

> "Evolution is not optional. Adapt or die."  
> — EvoMap/evolver README

**项目基本信息：**
- GitHub: [EvoMap/evolver](https://github.com/EvoMap/evolver)
- Stars: 1.4k ⭐，v1.28.0 发布于昨日，活跃度极高（79 次 Release）
- 定位：协议约束的 AI Agent 自进化引擎，不是"黑盒自动修改代码"，而是生成协议化的演进提示词

**GEP 三层结构：**

```
genes.json       ← 原子进化单元（可复用的能力模式）
capsules.json    ← 元进化包（多个 Gene 组合成高阶能力束）
events.jsonl     ← 进化事件审计链（每次进化的不可变记录）
```

**运行机制：**
1. 扫描运行历史（日志、错误模式）→ 提取信号
2. 匹配现有 Genes/Capsules → 选择最优进化方向
3. 生成协议约束的演进提示词（不直接执行，而是引导 Agent 安全演进）
4. 记录 EvolutionEvent，形成可审计的进化轨迹

**策略预设（直接可借鉴）：**
- `balanced` — 均衡修复与创新
- `innovate` — 最大化新特性
- `harden` — 专注稳定性
- `repair-only` — 紧急修复模式

**安全设计原则：**
- 不自动执行代码修改，只输出"协议约束的指导提示"
- Gene 的 `validation` 命令有白名单限制（只允许 node/npm/npx 前缀）
- A2A 外部 Gene 引入需要显式 `--validated` 确认，防止恶意资产注入

### 1.2 与我们的 L2 知识体系对照

| GEP 概念 | 我们的对应物 | 完成度 | 缺口 |
|---------|------------|--------|------|
| **Gene**（可复用进化模式）| `knowledge/<agent>-patterns.md` 中的 P-XX-XXX 模式 | ✅ 已有结构 | 缺少适应度/使用频次字段 |
| **Capsule**（元模式束）| ❌ 无对应概念 | 0% | 需要定义 |
| **EvolutionEvent**（进化审计链）| 会议纪要 `docs/meetings/` | ⚠️ 部分覆盖 | 没有与 patterns 更新挂钩 |
| **Signal**（历史信号提取）| ❌ 无自动提取 | 0% | Brain 主观触发 |
| **Strategy Preset**（演进策略）| Sprint 主题（质量/体验/传播）| ⚠️ 有概念 | 未正式命名 |
| **能力局限声明** | ❌ 未记录在 patterns 中 | 0% | **最高优先级缺口** |

---

## 二、主流 Multi-Agent 协作模式分类

来源：EvoMap/awesome-agent-evolution，结合我们的实际情况分析

### 模式 A：角色分工型（Role-Based）

**代表：** MetaGPT（64.8k ⭐）、CrewAI（45.3k ⭐）  
**核心：** 每个 Agent 有固定角色，按软件工程流程分工（PM → Dev → QA）  
**我们的实现：** ✅ 完全采用——7 个明确角色，权限分级，职责不重叠  
**优势：** 边界清晰，审计容易，上手直接  
**局限：** 角色边界可能抑制跨角色创新；无内建演进机制

### 模式 B：进化工作流型（Evolutionary Workflow）

**代表：** EvoAgentX（1.2k ⭐）、AFlow（1.5k ⭐）  
**核心：** 工作流结构本身可以进化——不只是 Agent 能力提升，连协作拓扑都在演变  
**我们的实现：** ⚠️ 部分——Playbook 在手动演进，但无自动机制  
**优势：** 系统级自我优化，适应复杂长期任务  
**启示：** Sprint 主题驱动的工作流调整 = 手动版进化工作流

### 模式 C：群体涌现型（Swarm/Emergent）

**代表：** OpenAI Swarm（21.1k ⭐）  
**核心：** 轻量、去中心，任务在 Agent 之间动态分配，涌现协作  
**我们的实现：** ❌ 不采用——有中心协调（Brain）  
**评估：** 不适合我们的场景（需要可审计、可复现的工作流）

### 模式 D：记忆中枢型（Memory-Driven）

**代表：** Mem0（25k ⭐）、memU（12.6k ⭐）  
**核心：** 持久化记忆是协作连续性的基础，Agent 记住跨会话的决策和偏好  
**我们的实现：** ⚠️ 基础版——`copilot-instructions.md` + `knowledge/*.md` + `memory.jsonl`  
**缺口：** `memory.jsonl` 当前是 seed 文件，尚未建立自动写入和查询机制  
**优先级：** P1（Memory MCP 已接入，需要完善使用规范）

### 模式 E：A2A 协议型（Agent-to-Agent Protocol）

**代表：** Google A2A（981 ⭐）、Python A2A  
**核心：** 标准化的 Agent 间消息格式，实现跨系统互操作  
**我们的实现：** ❌ 无正式 A2A  
**评估：** 当前团队规模不需要，但 co-authorship 约定是轻量版 A2A（标记每次交互的参与方）

---

## 三、我们团队的当前能力状态诊断

### 3.1 各 Agent 能力局限清单（来源：2026-03-01 能力自省）

| Agent | 核心局限 | 当前缺口 |
|-------|---------|---------|
| Brain | 「快速满足」惯性；无法感知用户情绪 | 主动意图对齐机制未固化 |
| PM | 「内循环」，对外部世界盲目 | 外部信号反馈机制未建立 |
| Dev | 无跨会话记忆；patterns 维护惰性 | 每次新学未自动提炼 |
| Researcher | 调研→行动链接弱；报告堆积但转化率低 | 每份报告缺「决策建议优先级」段落 |
| Code Reviewer | 只能看代码，无法感知真实使用体验 | 审查盲区未显性标注 |
| Profile Designer | 静态知识，无实时审美趋势感知 | 与 Researcher 联动机制未建立 |
| Brand | 单向发布，无真实受众反馈闭环 | 月度读者反馈帖机制未启动 |

### 3.2 能力版本现状

| Agent | patterns 文件 | 当前 L2 数量 | 含局限声明 |
|-------|-------------|------------|----------|
| Brain | brain-patterns.md | 3（P-BR-001/002/003）| ❌ |
| PM | pm-patterns.md | 2（P-PM-001/002）| ❌ |
| Dev | dev-patterns.md | 3（P-DV-001/002/003）| ❌ |
| Researcher | researcher-patterns.md | 1（P-RS-001）| ❌ |
| Code Reviewer | code-reviewer-patterns.md | 1（P-CR-001）| ❌ |
| Profile Designer | ❌ 文件不存在 | 0 | ❌ |
| Brand | ❌ 文件不存在 | 0 | ❌ |

**关键发现：** 全部 5 个现有 patterns 文件都缺少能力局限声明，即 GEP 中的「已知弱基因」记录。

---

## 四、演进机制设计方案

### 4.1 核心原则（对标 GEP）

1. **进化是协议约束的** — 不是随意修改，是遵循明确信号的结构化更新
2. **进化轨迹是可审计的** — 每次更新都有来源（会议/事件/用户反馈）
3. **局限是第一类公民** — 已知缺点不能隐藏，必须显性记录
4. **小步快跑** — L2 模式不求完美，先记录，再精炼

### 4.2 三级演进结构（适配 GEP 概念）

```
Level 1：Genes（原子模式）
  ↳ 位置：knowledge/<agent>-patterns.md
  ↳ 格式：P-XX-NNN 编号 + 场景 + 模式 + 验证记录
  ↳ 来源：每次 Sprint 结束 / 每次会话结束提炼
  ↳ 当前数量：10 条，跨 5 个文件
  
Level 2：Capsules（元模式束）——NEW
  ↳ 位置：knowledge/capsules.md（待创建）
  ↳ 格式：CAP-NNN + 场景 + 关联 Genes + 组合效果
  ↳ 来源：当多个 Genes 总是配合使用，且组合产生 1+1>2 效果时
  ↳ 示例候选：「重大 Sprint 启动包」= P-BR-001 + P-PM-002 + P-DV-001

Level 3：Evolution Events（演进事件链）——FORMALIZE
  ↳ 位置：knowledge/evolution-events.jsonl
  ↳ 格式：{date, trigger, agent, type, patternId, description}
  ↳ 来源：每次 patterns 文件新增/修改时写入一行
  ↳ 目的：使演进可审计，防止「不知道为什么改了」
```

### 4.3 能力局限声明规范

每个 `knowledge/<agent>-patterns.md` 文件末尾增加标准化小节：

```markdown
---

## 已知能力局限（Known Limitations）

> 本小节记录此 Agent 的结构性局限——非缺陷，而是边界。
> 更新于：YYYY-MM-DD（本次成长会）

| 局限类型 | 描述 | 规避策略 | 成长方向 |
|---------|------|---------|---------|
| 记忆局限 | 无跨会话持久记忆 | 依赖 knowledge/memory.jsonl | Memory MCP 深度集成 |
| ... | ... | ... | ... |
```

### 4.4 演进触发机制（Strategy Presets 适配版）

| 触发条件 | 对应 GEP 策略 | 我们的执行 |
|---------|-------------|----------|
| CI 连续失败 / 生产故障 | `repair-only` | Brain 启动紧急响应会 |
| 新 Major 版本前 | `harden` | Code Reviewer 强化审查 |
| 功能探索期（新 Sprint 启动）| `innovate` | Brain 主持技术决策会 |
| 正常迭代 | `balanced` | 标准 Sprint 流程 |
| 距上次成长会 > 30 天 | 特殊：`evolve-team` | Brain 自动触发成长会 |

---

## 五、参考生态概览

### 5.1 记忆系统（Memory Layer）

| 项目 | Stars | 核心特点 | 与我们的相关性 |
|------|-------|---------|-------------|
| Mem0 | 25k | 生产级、可扩展长期记忆 | 架构参考 |
| memU | 12.6k | 24/7 主动 Agent 跨平台记忆 | 功能目标参考 |
| A-MEM | 1.5k | 自组织记忆，自主管理记忆/遗忘 | 我们的 memory.jsonl 演进方向 |
| mcp-memory-service | 1.4k | MCP + 知识图谱 + 自主整合 | 当前 Memory MCP 参考 |

### 5.2 自进化框架

| 项目 | Stars | 核心特点 | 启示 |
|------|-------|---------|------|
| EvoMap/evolver | 1.4k | GEP 协议，安全约束进化 | 直接参考（本报告核心） |
| EvoAgentX | 1.2k | 工作流自动演进 | 长期路线图参考 |
| Darwin Godel Machine | 800 | Agent 重写自身代码 | 理论参考（非实用） |

### 5.3 前沿研究

| 论文 | 会议 | 核心贡献 |
|------|------|---------|
| Self-Evolving Multi-Agent Collaboration Networks | ICLR'25 | 多 Agent 系统的协作模式自进化 |
| AFlow: Automating Agentic Workflow Generation | ICLR'25 | 工作流自动设计 |
| Automated Design of Agentic Systems (ADAS) | ICLR'25 | 元学习：Agent 系统自动设计 |
| Promptbreeder: Self-Referential Self-Improvement | ICML'24 | Prompt 自我递归进化 |

---

## 六、决策建议优先级（供 Brain 决策使用）

### P1 — 立即执行（本次会话）

1. **为所有 5 个现有 patterns 文件增加「已知能力局限」小节**
   - 成本：低（每个文件追加 ~10 行）
   - 价值：高（消除最关键的认知盲区）
   - 执行：Dev 完成

2. **为 Profile Designer 和 Brand 创建 patterns 文件**
   - 成本：低
   - 价值：中（补全团队能力地图）
   - 执行：Dev 完成

3. **创建 `knowledge/evolution-events.jsonl`（演进事件链）**
   - 成本：极低（空文件 + 格式规范）
   - 价值：高（使过去的演进可被追溯）
   - 执行：Dev 完成，回填历史关键节点

### P2 — 本次 Sprint 内（v5.6.0 前）

4. **创建 `knowledge/capsules.md`（元模式束）**
   - 成本：中（需要提炼现有 Genes 的组合模式）
   - 价值：中
   - 执行：PM + Brain 协作

5. **Playbook 新增演进机制章节（§19）**
   - 内容：三级演进结构规范 + 触发机制 + 策略预设
   - 执行：Brain 起草

6. **Memory MCP 的 `memory.jsonl` 写入规范**
   - 当前：只有 seed 文件，无写入触发机制
   - 需要定义：什么情况写入、写入格式、谁有权限写
   - 执行：Dev + Brain

### P3 — 路线图中

7. **视觉版本感知机制**（Profile Designer × Researcher 联动）
8. **Brand 月度读者反馈帖**（Discussion 触发机制）
9. **自动信号提取**（从会议纪要/CHANGELOG 自动识别演进信号）

---

## 七、结语：从「会运转」到「会学习」

Brain 在 2026-03-01 团队成长会上问了一个问题：

> **「我们构建了一个可以运转的协作系统。下一个我们能构建的，是一个可以学习的协作系统吗？」**

这份报告的答案是：**可以，而且代价很低**。

EvoMap/evolver 已经证明了：Agent 演进不需要复杂的强化学习或代码自重写，只需要：
1. 把成功模式显性化为 Genes
2. 把局限标记为「弱基因」，不隐藏
3. 使每次演进留下可审计的事件记录
4. 让信号（会议纪要、错误日志、用户反馈）自动流向演进决策

这四条，我们团队都可以在不改变基础架构的情况下实现，从今天开始。

---

*调研员：Researcher*  
*会议主持：Brain*  
*报告版本：v1.0，2026-03-10*  
*Co-authored-by: GitHub Copilot <copilot@github.com>*
