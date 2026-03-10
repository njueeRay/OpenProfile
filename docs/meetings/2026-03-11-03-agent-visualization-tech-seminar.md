# 专题研讨会 — Agent 可视化技术方向专项讨论

**日期：** 2026-03-11  
**序号：** 当日第 03 次会议  
**类型：** 技术专题研讨  
**主持：** Brain  
**参会：** Brain · PM · Dev · Researcher · Code Reviewer · Profile Designer · Brand · Ray（用户）  
**前置文档：** `docs/research/agent-visualization-landscape-2026.md`（Researcher 全量调研报告）  
**关联会议：** `2026-03-11-01-pixel-agents-all-hands.md`（构想发起）  
**状态决定：** Ray 决策——**作为 v6.x 专项 feature 规划，当前阶段做规划不做实施，实施待 Ray 最终确认后启动**

---

## 开场（Brain）

Researcher 完成了调研，工作质量超出预期——不只是列了工具清单，而是把整个生态按功能层梳理清楚，给出了对我们三条路径的具体评估。

今天这场会议有明确的任务框架：

**已经确定的：**
- Ray 明确这个方向在 v6.x 周期内作为专项 feature 推进
- 当前阶段只做规划，不做实施；实施需要 Ray 最终确认后才启动

**今天要完成的：**
1. 全员消化 Researcher 调研报告，各角色提出自己视角的判断
2. 确定技术路径选择（调研报告里的路径 A/B/C）
3. 产出一份「当 v6.x 时机到来时可以直接执行的规划文档」

这次不要重复第一次会议的开放性讨论——那次已经建立了共识。今天是从「想」到「怎么做的具体规划」。

---

## 一、Researcher 报告解读（Researcher）

我想补充几点报告里没有展开的地方。

**最重要的一个发现，报告里说了但我想强调一遍：**

Pixel Agents 和 AutoGen Studio 做的是同一件事的两个极端版本。AutoGen Studio 是「工程师视角的 Agent 可视化」——精确、信息密度高、但需要理解 Agent 框架才能读懂。Pixel Agents 是「大众叙事视角的 Agent 可视化」——直觉化、情感化、任何人都能在两分钟内感受到在说什么。

我们的使用场景两者都需要——工程质量的论证需要 AutoGen Studio 那种精确度，传播效果需要 Pixel Agents 那种直觉可达性。混合路径（路径 C）在长期来看确实是最优解。

**关于 Letta/MemGPT 记忆架构，我想多说一句：**

Letta 的三层记忆模型（Core / Archival / Recall）和我们的体系之间的映射是惊人地精确。这不是巧合——我们在构建这套体系时走的是相同的「认知架构」路径，只是形式不同。这意味着如果我们做记忆可视化，不需要设计新的概念——Letta 已经验证了这套语言和社区沟通效果很好，我们可以直接沿用这套概念框架。

「Core Memory — Archival Memory — Recall Memory」这三个词，在可视化界面里可以直接用，外部读者能理解。

**react-force-graph 的选择理由：**

在知识图谱渲染库的对比里，我把它列为推荐。补充一点技术背景：Astro 的「Islands 架构」允许在静态页面里嵌入 React 组件，这意味着 `react-force-graph` 作为一个 React 组件可以直接 import 进 Astro 页面，而不需要把整个站点改成 SPA。这是与我们现有技术栈集成的最低摩擦路径。

---

## 二、技术路径确认（Dev）

读完调研报告后，我的判断和 Researcher 的推荐是一致的，但我想把「为什么选路径 A」说得更工程化一点：

**路径 A 的核心优势在于「数据单一来源」原则（SSOT）。**

我们所有的 Agent 相关内容——角色定义、知识积累、活动记录——都已经在我们的文件系统里，格式是标准 Markdown。路径 A 的实质是给这些已有数据加一个「渲染层」，而不是在维护第二套数据。

路径 B（向 Pixel Agents 贡献）意味着我们需要把数据「翻译」成另一种格式，更新时要在两个地方同步。这从第一天起就是一个维护负担。

**关于技术实现的分层规划（面向未来的规划，当前不执行）：**

```
Phase 0 — 数据层准备（不依赖可视化，可以现在做）
  - 在每个 agent.md 增加 YAML frontmatter：id, color, symbol, joined_date
  - 这不是为可视化专门做，而是让 agent.md 本身更结构化
  - 成本：每个文件 5 行，全团队 < 1h

Phase 1 — Agent Card 静态页面（v6.x 启动时的第一步）
  - 新建 Astro content collection: src/content/agents/
  - 新建路由: src/pages/agents/[id].astro
  - 数据源：agent.md 的 frontmatter + 手动维护的 highlights 字段
  - 预估工作量：3-5 天（Dev 主导，Profile Designer 提供视觉规格）

Phase 2 — 活动时间线自动生成（第二步）
  - 脚本：从 docs/meetings/ 和 knowledge/<agent>-patterns.md 提取 Agent 活动
  - 输出：src/content/agents/<agent>-timeline.json（自动生成，不手动维护）
  - 这个脚本本身是独立有价值的内部工具
  - 预估工作量：2-3 天

Phase 3 — 知识图谱可视化（第三步）
  - 集成 react-force-graph 作为 Astro Island 组件
  - 节点：Agent + Pattern条目 + 关键会议
  - 边：「参与」「贡献」「引用」关系
  - 预估工作量：5-7 天（含调试和性能优化）

Phase 4 — 对外社区连接（长期，v7.x 以后）
  - 评估向 Pixel Agents 或类似社区输出内容
  - 前提：Phase 1-3 稳定，内容质量经过验证
```

**两个技术决策请 Brain 记录为待确认项：**

1. `src/content/agents/` 是作为独立的 content collection，还是扩展现有的 team 相关数据结构？
2. 知识图谱的节点粒度：是 Pattern 文件级别（粗粒度），还是 Pattern 条目级别（细粒度）？

---

## 三、视觉方向确认（Profile Designer）

调研报告的覆盖很全面，但有一个维度调研里没有深入：**视觉语言的选择对「AI-native 叙事」意味着什么**。我想补这一块。

**Pixel-art 风格的叙事价值解析：**

Pixel Agents 选择像素风格不是因为「美观」，是因为像素风格携带了一种特定的文化叙事：**数字原生、早期互联网精神、游戏感带来的探索欲**。当你看到一个像素风格的 Agent 在它的像素办公室里工作，你直觉上会认为这是「数字世界的原住民」，而不是「现实世界的拙劣模仿」。

这个选择是聪明的，但也不是唯一选择。

**对我们的视觉路径，我有两个方向可以选择：**

**方向一：抽象几何 + 品牌色系（更严肃的技术叙事）**

每个 Agent 用一个独特的抽象几何形态表示，结合品牌色系（我们已有）。

```
Brain         ← 深蓝多边形（六边形，代表多维思考的综合）
PM            ← 绿色时序流图（Gantt 图形态的抽象化）
Dev           ← 紫色齿轮复合结构（实现与构建）
Researcher    ← 橙色散点/星群（发现与扫描）
Code Reviewer ← 红色菱形（边界与精确度）
Profile Designer ← 金色分形（美学生成）
Brand         ← 青色波形（传播与共鸣）
```

这套视觉语言适合「技术社区」受众——传递「高密度、精确、系统化」的叙事。

**方向二：类 Pixel Agents 的像素身份（更广泛的叙事）**

直接借鉴 Pixel Agents 风格，为每个 Agent 设计一个小小的像素头像，用于 Agent Card 的头像展示（不需要建完整的「办公室」，只需要头像）。

这套视觉语言适合「广泛受众」——即使不明白 AI-native 是什么，也会觉得「这些角色很可爱、有个性」，从而产生探索欲。

**我的建议：**

两套视觉语言可以共存——像素头像用于「外向传播层」（社交分享、Agent Card 顶部），几何符号用于「内向工具层」（知识图谱节点、站点内导航图标）。这样既有传播吸引力，也保持了工程气质的一致性。

**在 v6.x 启动前，我可以先做一件不依赖代码的事：**

为全部 7 个 Agent 设计「头像草稿 + 颜色符号系统」，输出为一份视觉规格文档（不是最终成品），让 Dev 在实现 Phase 1 时有明确的设计输入。这个工作量极小（< 4h），但可以大幅降低 Phase 1 的设计决策成本。

---

## 四、传播策略视角（Brand）

现在 Researcher 给了全景地图，我对传播路径有更清晰的判断。

**调研报告里有一个我认为最值得抓住的机会：**

Obsidian Publish（报告 4.2 节）是一个被低估的传播渠道。我们的会议纪要、patterns、agent.md 全是 Markdown，Obsidian Publish 可以把它直接发布成一个有知识图谱导航的网站。这是一个**极低成本的 L3+L4 原型**——不需要写任何代码，只需要一个 Obsidian 账号和订阅。

从传播角度，用 Obsidian Publish 做「先验概念验证」有一个独特优势：**Obsidian 用户群体本身就是我们的目标受众**——个人知识管理、AI 工具用户、写作者。在这个社区进行 Build in Public，自然会有匹配度高的早期关注者。

这不是我要推进的主路径，但在 v6.x 启动前，作为一个几乎零成本的「先行传播实验」，值得考虑。Brand 可以在现有工作流的间隙执行，不分抢主轨道资源。

**关于 Phase 4 的社区连接（路径 C 的 B 部分）：**

我支持 Dev 的判断——不急着做 Phase 4，先把 Phase 1-3 做好。但从现在开始，每篇新的 Blog 文章和 Discussion 帖子应该有意识地「预埋」这个方向——比如在讲团队协作的文章里提及「未来将有可视化的 Agent 社区」，这样当 feature 真正上线时，读者已经有了期待。

---

## 五、质量与边界再确认（Code Reviewer）

调研报告覆盖很全。我的关注点主要在以下几点，确认它们在规划阶段就被考虑到：

**关于 SSOT 保障：**

Dev 说了路径 A 的优势是「不产生第二套数据」，这个判断是对的。但我想补一个具体的风险场景：**如果 Profile Designer 做了 Agent 头像，这些头像存在哪里？谁来管？**

头像是视觉 asset，不是 Markdown。它们应该有一个明确的存储位置（比如 `public/agents/avatars/`）和版本管理方式，不然在六个月后我们会发现头像和文字描述已经不一致了。这个 SSOT 问题在规划阶段就应该定义。

**关于可访问性（Accessibility）：**

如果做知识图谱，`react-force-graph` 的力导向图对屏幕阅读器不友好，对色觉障碍用户也可能有问题。我们的站点目前是 Lighthouse Accessibility ≥ 90 的标准，引入图谱后不应该拉低这个分数。Dev 在实现时需要同时提供一个「无 JS 的列表降级版本」。

**关于第三方框架的 supply chain 风险：**

`react-force-graph` 是活跃项目，但引入之前应该做一个简单的 dependency audit。这不是 Phase 1 需要做的事，是 Phase 3 开始前必须做的事。列为 Phase 3 的前置检查项。

---

## 六、PM — 规划文档产出（PM）

综合以上讨论，我整理一份「等待 v6.x 时机时可以直接拿出来执行的规划摘要」：

---

### Agent 可视化专项 Feature 规划（v6.x）

**Feature 代号：** `agent-persona-layer`  
**规划状态：** 已规划，待 Ray 确认后启动  
**依赖条件：** v6.0.0 主要工程工作完成后，作为 v6.x 补充 feature 执行  
**技术路径：** 路径 A（自建，Astro 站点扩展）为主，路径 B 作为长期传播渠道  

**Phase 0 — 数据层准备（可在 v6.x 启动前任意时机执行）**

| 任务 | 负责人 | 工作量 | 产出 |
|------|--------|--------|------|
| 为每个 agent.md 增加 YAML frontmatter（id, color, symbol, joined_date） | Dev | < 1h | 结构化 agent.md |
| 设计 7 个 Agent 的头像草稿 + 颜色符号系统 | Profile Designer | < 4h | 视觉规格文档 |
| 确定头像 asset 存储位置和版本管理方式 | Dev + Profile Designer | < 30min | 决策记录 |

**Phase 1 — Agent Card 静态页面（v6.x 阶段，第一 Sprint）**

| 任务 | 负责人 | 工作量 |
|------|--------|--------|
| 新建 `src/content/agents/` content collection | Dev | 1d |
| 设计并实现 Agent Card 组件（遵循 Profile Designer 视觉规格） | Dev | 2-3d |
| 新建 `/agents` 路由和 Agent 详情页 | Dev | 1d |
| E2E 测试覆盖 | Dev | 0.5d |
| Code Review | Code Reviewer | 0.5d |

**Phase 2 — 活动时间线自动化（v6.x 阶段，第二 Sprint）**

| 任务 | 负责人 | 工作量 |
|------|--------|--------|
| 实现 `scripts/extract-agent-timeline.ts` | Dev | 2d |
| 集成到 Astro build 流程 | Dev | 1d |
| 访谈时间线 UI 组件 | Dev | 1-2d |

**Phase 3 — 知识图谱可视化（v6.x 阶段，第三 Sprint，可选）**

| 任务 | 负责人 | 工作量 | 前置 |
|------|--------|--------|------|
| react-force-graph dependency audit | Code Reviewer | 0.5d | — |
| 图谱数据结构设计 | Dev + Brain | 1d | audit 通过 |
| 实现 Astro Island 图谱组件 | Dev | 3-5d | 数据结构确认 |
| 无 JS 降级版本（Accessibility） | Dev | 1d | 图谱组件完成 |

**Phase 4 — 对外社区连接（v7.x 或更晚）**

- 条件触发：Phase 1-3 内容稳定运行 ≥ 3 个月
- 届时评估向 Pixel Agents / 其他社区输出的技术可行性

---

**两个待 Ray 确认的技术决策（Phase 1 启动前需要回答）：**

| 决策 | 选项 A | 选项 B |
|------|--------|--------|
| Agent content collection 结构 | 独立 `src/content/agents/` | 扩展现有 team 相关结构 |
| 知识图谱节点粒度 | Pattern 文件级（粗粒度，简单） | Pattern 条目级（细粒度，复杂） |

---

**先行动作（不依赖 v6.x，当前可选做）：**

| 动作 | 负责人 | 说明 |
|------|--------|------|
| Phase 0 数据层准备 | Dev + Profile Designer | 低成本，对现有工程无风险 |
| Obsidian Publish 传播实验 | Brand | 零成本先行概念验证（可选，Brand 自主决定） |

---

## 七、结论（Brain）

这场会议完成了预定目标。

**确定的事：**

1. **技术路径选择路径 A**——自建 Agent Card + Astro 站点扩展，SSOT 不分裂，与我们现有工作流天然集成。路径 B（社区连接）作为 Phase 4 长期方向。
2. **功能层优先级**：L3（记忆知识可视化）和 L1（Agent Card）作为并行第一步，不从 L5（沉浸式空间）开始。
3. **视觉策略**：像素头像用于外向传播层，几何符号用于内向工具层，两套视觉语言并存。
4. **维护可持续性**：Agent 活动时间线通过脚本自动化生成，不依赖手动更新。
5. **时机锁定**：v6.x 周期内作为专项 feature 执行，Phase 0 数据层准备可以提前做。

**留给 Ray 的确认项：**

- Phase 0 数据层准备（低成本，可随时启动）——是否现在批准先行？
- Brand 的 Obsidian Publish 先行实验——是否允许 Brand 自主决定是否执行？
- Phase 1 启动前的两个技术决策（Agent collection 结构 + 图谱节点粒度）——留待 v6.x 启动时再定。

---

*纪要记录：Brain*  
*日期：2026-03-11*  
*状态：规划完成，等待 Ray 对「Phase 0 先行」和「Brand 实验」两项的确认*
