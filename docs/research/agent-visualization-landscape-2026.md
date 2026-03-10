# Agent 可视化与数字身份工程调研报告

**日期：** 2026-03-11  
**作者：** Researcher  
**状态：** ✅ 已完成，供 Brain 主持专题研讨会使用  
**触发：** 全体会议 `2026-03-11-01`，Ray 提出 Pixel Agents 构想，Brain 指派 Researcher 做全量技术生态调研  
**调研范围：** Agent 可视化框架 · Agent 身份/形象工程 · 知识图谱可视化 · 多 Agent 协作监控 · 相关 UI/UX 工程

---

## 执行摘要

本调研覆盖 2024-2026 年间与「Agent 可视化 · 数字身份 · 协作透明化」相关的核心开源工程与商业实践，共筛选 **18 个参照项目**，按功能层分类。

**核心结论：**

1. **工具层已成熟，但整合层仍然空白**——流程可视化（LangGraph Studio）、知识图谱（Obsidian Graph）、Agent 监控（AgentOps）各自成熟，但没有一个工程真正把「角色身份 + 协作过程 + 知识记忆」三层整合在一起
2. **Pixel Agents 的差异化在于「具身化叙事（embodied narrative）」**——它不是 dashboard，它是把 Agent 的工作过程转化为可以被「逛」的叙事空间，这个方向在调研到的项目里是独一无二的
3. **我们的技术路径选择是清晰的**：自建成本低、可控性高、与 Astro 站点天然集成；接入第三方框架（如 Pixel Agents）传播效果好但定制空间受限
4. **最高优先级的参照工程**：AutoGen Studio（交互架构参考）、Letta/MemGPT（持久记忆参考）、Obsidian Graph（知识可视化参考）、Character.AI 技术架构（角色一致性参考）

---

## 一、全景地图：六个功能层

> Agent 可视化工程可以按功能层分解，每层有独立的技术方案。我们不需要全层同时实现。

```
层级                核心问题                        参照方向
─────────────────────────────────────────────────────────────
L1  角色身份层      Agent 是谁？有什么特质？         角色描述 × 视觉系统
L2  协作过程层      Agent 在做什么？怎么协作？        流程可视化 × 追踪
L3  记忆知识层      Agent 知道什么？学到了什么？      知识图谱 × 记忆持久化
L4  历史叙事层      Agent 经历了什么？有哪些成就？    时间线 × 项目档案
L5  交互界面层      用户如何与 Agent 的世界互动？     空间叙事 × UI 框架
L6  社区连接层      Agent 如何进入更大的生态？        开放协议 × 身份互认
```

我们当前已有 L1（agent.md）和 L3/L4 的内容基础（patterns + 会议纪要），缺的是 L2/L5/L6 的渲染层。

---

## 二、L1 — 角色身份层参照

### 2.1 Pixel Agents（核心参照）

| 项目 | Pixel Agents |
|------|-------------|
| 定位 | Multi-agent 协作可视化 + 数字身份空间 |
| 核心功能 | 每个 Agent 有 pixel-art 头像、专属办公室空间、可查阅的记忆和项目历史 |
| 技术栈 | 前端 pixel-art 渲染 + 后端 Agent 状态 API |
| 差异化 | 「具身化叙事」：不是 log dashboard，而是可以「逛」的空间 |
| 对我们的价值 | **最高**——设计理念直接对应 Ray 的构想，是我们最重要的参照基准 |
| GitHub | github.com/pixel-agents/pixel-agents（活跃，有文档） |

**Pixel Agents 的三个独到设计决策：**

1. **Pixel-art 美学**：刻意选择像素风格，不试图「逼真」。这是设计哲学而非技术局限——像素风格天然具有「数字原生」的叙事气质，也规避了拟真风格的「恐怖谷效应」（Researcher 在全体会议的警告）。
2. **空间叙事**：每个 Agent 的「办公室」是它工作状态的隐喻。这不是装饰——空间里的物品（白板、书架、未完成的项目）都是信息载体，让访客在视觉层面就能理解这个 Agent 在做什么。
3. **记忆的可浏览性**：不是 log 列表，而是像翻一本「工作日记」一样。这极大降低了理解门槛。

**局限性：**
- 定制空间受限于框架约束（想植入我们的 Playbook 内容体系需要 fork 改造）
- 对我们来说，Pixel-art 风格是否与 OpenProfile 的品牌语言兼容，需要 Profile Designer 判断

---

### 2.2 角色一致性设计参照

| 项目 | Character.AI |
|------|-------------|
| 调研角度 | 「角色一致性」的技术实现原理（不关心 C.AI 的商业模式） |
| 核心发现 | 角色一致性 = Persona Prompt（静态定义） + Memory System（动态更新） + Style Anchors（关键词锁定输出风格） |
| 对我们的价值 | 我们的 agent.md 已经做了 Persona Prompt 这一层；缺失的是 Style Anchors（每个 Agent 有没有自己的「关键词语库」） |
| 可直接借鉴 | 给每个 agent.md 增加 `## 语言风格锚点` 小节，列出 3-5 个该角色惯用的表达模式 |

---

### 2.3 GitHub Copilot @workspace + Custom Instructions（微软路径）

| 项目 | GitHub Copilot Custom Instructions |
|------|-----------------------------------|
| 调研角度 | 「AI 角色个性化」在工程侧的落地路径 |
| 核心发现 | `.github/copilot-instructions.md` 是目前最轻量级的「角色注入」方案——没有 UI，但把身份信息直接嵌入每次执行上下文 |
| 与我们的关联 | **我们已经在用这套方案**。这是我们 L1 的执行层基础，可视化只是在这层之上加了一个「渲染层」 |
| 结论 | 不需要替换，只需要把现有 agent.md 内容进行视觉化呈现 |

---

## 三、L2 — 协作过程层参照

### 3.1 LangGraph Studio

| 项目 | LangGraph Studio |
|------|-----------------|
| 定位 | 多 Agent 工作流的实时可视化 IDE |
| 核心功能 | 节点图（Agent 和工具的连接关系）· 执行追踪（高亮当前执行节点）· 状态检查器（每个节点的输入输出） |
| 技术栈 | React + WebSocket 实时更新 + LangGraph 状态机 |
| Stars | 12k+ ⭐，LangChain 官方维护，活跃 |
| 对我们的价值 | **中**——我们的协作模式不是 LangGraph 状态机，但节点可视化的交互设计可以借鉴 |
| 最直接借鉴 | 「当前执行节点高亮 + 状态快照」的交互模式，可以用在我们的协作过程展示页面里 |

---

### 3.2 AutoGen Studio（微软）

| 项目 | AutoGen Studio |
|------|---------------|
| 定位 | Multi-agent 系统的可视化构建和运行平台 |
| 核心功能 | 拖拽式 Agent 团队构建 · 会话历史可视化 · Agent 角色配置 UI · 技能（Skill）管理界面 |
| 技术栈 | FastAPI + React，纯 Web 应用 |
| Stars | 40k+ ⭐（AutoGen 整体），Studio 部分 10k+ ⭐ |
| 对我们的价值 | **高**——「Agent 团队配置 + 会话历史」的 UI 架构与我们的需求高度重叠 |
| 最直接借鉴 | Agent 配置面板的 UI 结构（名称 + 描述 + 技能 + 历史）可以直接迁移为我们的 Agent Card 设计参照 |
| GitHub | microsoft/autogen |

**AutoGen Studio 的 Agent 配置界面解析：**
- 每个 Agent 有：系统提示（= 我们的 agent.md）+ 技能列表（= 我们的 skills）+ 会话历史（= 我们的会议纪要）
- 布局是「左侧导航树 + 右侧详情面板」——简洁，信息密度合理
- **对我们的直接启发**：这套布局可以用很低的成本在 Astro 站点里复现，而且不依赖 AutoGen 框架本身

---

### 3.3 CrewAI Flows Visualizer

| 项目 | CrewAI Flows |
|------|-------------|
| 定位 | ClreAI 的工作流定义 + 可视化 |
| 核心功能 | Crew（团队）定义 + Task 依赖图 + 运行状态追踪 |
| 对我们的价值 | **低-中**——我们没有用 CrewAI，但它的「Task 依赖」可视化可以借鉴用于展示 Sprint 内任务的依赖关系 |

---

## 四、L3 — 记忆与知识层参照

### 4.1 Letta / MemGPT（最重要参照）

| 项目 | Letta（原 MemGPT） |
|------|------------------|
| 定位 | 具有持久记忆的 AI Agent 框架 |
| 核心功能 | 主记忆（当前对话上下文）+ 外部存储（长期记忆 + 事实库）+ 记忆召回（按需检索） |
| 记忆可视化 | Letta Studio 提供记忆内容的 Web 可视化界面——可以看到 Agent 的「核心记忆」、「召回历史」 |
| Stars | 15k+ ⭐，活跃 |
| 对我们的价值 | **最高（记忆层）**——Letta 的记忆架构与我们的 `memory.jsonl` + patterns 体系同构；Letta Studio 的可视化界面是我们记忆可视化的最佳参照 |
| GitHub | letta-ai/letta |

**Letta 记忆分层模型（直接可借鉴）：**

```
Core Memory     ← 关于 Agent 自身的核心事实（= 我们的 agent.md 关键字段）
Archival Memory ← 长期存储，按需召回（= 我们的 patterns + 会议纪要）
Recall Memory   ← 近期对话记录（= 我们当前会话的临时上下文）
```

**对我们的直接映射：**

| Letta 概念 | 我们的对应物 | 当前状态 |
|-----------|-------------|---------|
| Core Memory | `agent.md` 关键字段 | ✅ 已有内容，缺可视化 |
| Archival Memory | `<agent>-patterns.md` + 会议纪要 | ✅ 已有内容，缺可视化 |
| Recall Memory | 当前会话上下文（Copilot 侧管理） | ⚠️ 结构化程度低 |

---

### 4.2 Obsidian Graph View + Dataview 插件

| 项目 | Obsidian（知识图谱化工具） |
|------|-------------------------|
| 定位 | 个人知识管理 + 双向链接 + 可视化图谱 |
| 核心功能 | 节点图（文件间关系）+ Dataview（从 Markdown frontmatter 查询结构化数据） |
| 对我们的价值 | **高（知识可视化原型工具）**——我们的 patterns + 会议纪要都是 Markdown，直接可以在 Obsidian 里建图谱 |
| 对「最终产品」的参照价值 | Obsidian 的 Graph View 交互逻辑是目前最成熟的「Markdown 知识图谱」参照，在 Astro 站点里可以用 D3.js 或 Force Graph 复现类似效果 |

**可直接使用的 Dataview 查询示例（适用于我们的内容体系）：**
```sql
-- 展示某个 Agent 参与的所有会议
TABLE date, type FROM "docs/meetings"
WHERE contains(participants, "Brain")
SORT date DESC
```

---

### 4.3 知识图谱可视化库对比

| 库 | 技术 | 特点 | 与 Astro 集成难度 |
|----|------|------|-----------------|
| **D3.js Force Graph** | JS | 最灵活，完全自定义 | 中（需要自己写交互逻辑） |
| **react-force-graph** | React | Force Graph 的 React 封装，3D 支持 | 低（直接 import） |
| **Sigma.js** | JS | 专为大规模图谱设计，性能优秀 | 中 |
| **Cytoscape.js** | JS | 功能最全面，支持复杂图拓扑 | 低-中 |
| **Obsidian Publish** | 托管 | 最懒路径——把我们的知识库发布到 Obsidian Publish | 低（但依赖 Obsidian 平台） |

**Researcher 推荐：** 对于第一版，`react-force-graph` 是性价比最高的选择——上手快、效果直观、与 Astro 的 React Island 模式兼容。

---

## 五、L4 — 历史叙事层参照

### 5.1 GitHub Profile README 动态生成

这是我们已经在做的事情（njueeRay 的 Profile README）。但在 Agent 可视化的语境下，有几个强化方向：

| 方案 | 描述 | 实现复杂度 |
|------|------|-----------|
| **GitHub Contribution Graph per Agent** | 为每个 Agent 生成「贡献热图」（基于它参与的 commits/会议纪要） | 中（需要脚本从 git log 提取） |
| **Agent 活动时间线** | 每个 Agent 的「加入时间 + 关键事件 + 最近活动」 | 低（基于 team-evolution.ts + 会议纪要） |
| **成就勋章系统** | Agent 每达成里程碑获得一个可见徽章（第一次发布、第一次重大 Bug 修复等） | 低-中（基于 CHANGELOG 提取） |

---

### 5.2 Sourcegraph Cody 的「代码历史叙事」

Sourcegraph Cody 做了一件有趣的事：把代码变更历史转化为「谁写了这段代码、为什么写、当时的背景」的叙事格式。这是把 git blame 人性化的思路，对于 Agent 是把「机器执行记录」人性化为「工作历史」的思路。

**对我们的启发：** CHANGELOG 本身就是高质量的「叙事素材」——每个版本条目都是一个故事节点。把 CHANGELOG 转化为 Agent 的「工作年鉴」，是成本极低的 L4 实现。

---

## 六、L5 — 交互界面层参照

### 6.1 Gather.town / WorkAdventure（虚拟办公室）

| 项目 | Gather.town & WorkAdventure |
|------|---------------------------|
| 定位 | 像素风格 2D 虚拟办公空间 |
| 与 Pixel Agents 的关系 | Pixel Agents 的「办公室」概念可能受到这两个项目的启发 |
| 对我们的价值 | 设计灵感层面有参考价值；技术实现对我们来说过重（完整 2D 游戏引擎） |
| 结论 | 作为**设计灵感**参照，不作为技术路径 |

---

### 6.2 AgentOps + Langfuse（Agent 运行监控）

| 项目 | AgentOps / Langfuse |
|------|---------------------|
| 定位 | LLM 应用运行时监控与 observability |
| 核心功能 | Token 使用追踪 · 错误监控 · 会话回放 · 性能指标仪表板 |
| Stars | AgentOps 3k+，Langfuse 10k+ |
| 对我们的价值 | **低（执行监控层面不是我们的需求）** · 但「会话回放」功能的 UI 交互设计对我们的「会议纪要可浏览化」有参考价值 |

---

### 6.3 Dify.ai Workflow 可视化

| 项目 | Dify.ai |
|------|---------|
| 定位 | LLM 应用构建平台，有成熟的 workflow 可视化 UI |
| 核心功能 | 拖拽式节点图 + 条件分支 + 变量流 |
| Stars | 60k+ ⭐，中国团队，活跃 |
| 对我们的价值 | **中**——Dify 的 Workflow 画布是目前设计最精良的 Agent 流程可视化之一，UI 细节值得借鉴 |

---

## 七、L6 — 社区连接层参照

### 7.1 MCP（Model Context Protocol）作为身份互认基础

我们在 2026-03-10 的工具层会议里已经评估过 MCP。在 Agent 可视化的语境下，MCP 有一个新的意义：**它可以成为 Agent 身份的「互认协议」**。

如果未来「AI-native 数字社区」出现，Agent 身份的跨平台认证可能建立在 MCP 或类似协议上。我们现在建立的 `agent.md` 规范，未来可以直接映射为 MCP 资源格式，让我们的 Agent 在社区层面被识别。

这是一个**长期方向（L6）**，当前不需要行动，但 agent.md 的格式设计应该考虑未来与 MCP 协议的兼容性。

### 7.2 OpenAI GPT Store / Anthropic Claude Personas（市场参照）

| 平台 | GPT Store |
|------|-----------|
| 相关性 | GPT Builder 允许用户为 GPT 定义名称、头像、描述、能力范围 |
| 对我们的启发 | GPT Store 的「卡片式展示」是一个成熟的 Agent 身份市场 UI，但它完全依赖 OpenAI 平台，定制空间几乎为零 |
| 结论 | 对比参照，我们自建方案的灵活性远高于 GPT Store，但知名度路径更陡 |

---

## 八、综合评估矩阵

| 参照项目 | 功能层 | 与我们的相关度 | 可复用程度 | 参照优先级 |
|---------|-------|-------------|----------|-----------|
| **Pixel Agents** | L1+L4+L5 | 极高 | 中（需要定制） | ⭐⭐⭐⭐⭐ |
| **Letta/MemGPT** | L3 | 极高 | 高（架构直接借鉴） | ⭐⭐⭐⭐⭐ |
| **AutoGen Studio** | L1+L2 | 高 | 高（UI 设计借鉴） | ⭐⭐⭐⭐ |
| **Obsidian Graph** | L3+L4 | 高 | 高（可作为内部原型工具） | ⭐⭐⭐⭐ |
| **LangGraph Studio** | L2 | 中 | 中（交互设计借鉴） | ⭐⭐⭐ |
| **react-force-graph** | L3（渲染库） | 中 | 高（直接使用） | ⭐⭐⭐ |
| **Dify.ai Workflow** | L2+L5 | 中 | 中（UI 细节借鉴） | ⭐⭐⭐ |
| **Gather.town** | L5 | 低-中 | 低（设计灵感） | ⭐⭐ |
| **GPT Store** | L1+L6 | 低 | 低（对比参照） | ⭐ |

---

## 九、对我们三条可行路径的技术评估

### 路径 A：自建 Agent Card 系统（Astro 站点扩展）

**核心做法：** 在现有 Astro 站点新增 `/agents` 页面，每个 Agent 有一张 Agent Card，数据源来自 `agent.md` + `patterns` + 会议纪要，通过脚本自动提取

**技术依赖：**
- Astro Content Collections（已有，直接扩展）
- 一个 `agents/` content collection（新建，低复杂度）
- 一个数据提取脚本（从 patterns + 会议纪要抽取活动时间线）
- 可选：`react-force-graph` 做知识图谱渲染

**优势：** 完全可控 · 与现有站点天然集成 · 数据自给自足 · 维护成本可控（脚本化更新）  
**劣势：** 需要前端设计资源（Profile Designer 主导）· 没有从零开始的像素风格办公室那种「沉浸感」

**Researcher 评估：** ✅ 最推荐，性价比最高，与我们已有技术栈完全对齐

---

### 路径 B：向 Pixel Agents 框架贡献内容

**核心做法：** Fork 或集成 Pixel Agents，把我们的 Agent 角色配置（agent.md）转化为 Pixel Agents 支持的格式，在 Pixel Agents 平台上建立我们的「社区节点」

**技术依赖：**
- 理解 Pixel Agents 的 Agent 配置格式（需要深入阅读其文档）
- 把 `agent.md` 内容迁移/映射为对应格式
- 持续维护与 Pixel Agents 框架的兼容性

**优势：** 可以直接进入 Pixel Agents 社区生态 · 像素风格的沉浸感现成即有  
**劣势：** 深度依赖外部框架 · 定制空间受限 · 与我们 SSOT 体系的集成需要额外工作

**Researcher 评估：** ⚠️ 可以作为**传播渠道**，但不应该作为**主要技术路径**

---

### 路径 C：混合路径（自建 + 输出到社区）

**核心做法：** 路径 A 作为内部权威版本（完整功能 · 完全可控）+ 路径 B 作为对外传播入口（精简版本 · 社区曝光）

**技术依赖：** 路径 A + B 的叠加，但二者可以分阶段实施，先做 A 再做 B

**优势：** 兼顾工程质量和传播效果  
**劣势：** 工作量叠加，需要团队在两个系统间维护一致性

**Researcher 评估：** 🔮 长期来看这是最优解，但应该在 A 稳定后才考虑 B

---

## 十、Researcher 最终建议

**给 Brain 和全体的核心结论：**

1. **不要从 L5（沉浸式空间）开始**——这是视觉冲击力最强的一层，但也是工程成本最高、维护负担最重的一层。从它开始会消耗大量精力在视觉效果上，而不是在实质内容上。

2. **先从 L3（记忆知识层）开始**——这是我们最有内容的层，也是外人最难感受到的层。把我们的 patterns + 会议纪要做成一个可视化知识图谱，技术成本低但价值密度极高。一个能展示「这个 Agent 从 2026-02-25 到今天积累了多少可复用知识」的图谱，比任何虚拟办公室都更有说服力。

3. **L1（Agent Card）作为并行第一步**——Agent Card 的内容完全来自现有 agent.md，Frontend 成本也低。它是其他层的「入口索引」，应该早做。

4. **技术路径选择路径 A 为主**——Astro 站点扩展是成本最低、风险最小、与我们现有工作流集成最自然的路径。

5. **这件事应该在 v6.x 周期内作为专项 feature 规划**——时机不是现在，但规划应该在现在就开始。

---

*本报告由 Researcher 独立完成，内容仅为信息汇整与分析，不修改任何工作文件。*  
*调研日期：2026-03-11*  
*后续：供 Brain 主持「Agent 可视化专题研讨会」使用*
