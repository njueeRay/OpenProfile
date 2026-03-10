# 全体会议 #06 — 资产全量审计 + 自由发言深度讨论

**日期：** 2026-03-10（接续 #05 当日第四场）  
**主持：** Brain  
**参会：** Brain · PM · Dev · Researcher · Code Reviewer · Profile Designer · Brand · Ray（用户）  
**触发：** 用户明确要求：「全面扫描团队能力和核心资产，梳理成清单，然后召开扩展讨论，任何有利于团队进化和效率提高的都说出来」  
**前置工作：** 已完成资产全量目录扫描 + 关键文件内容读取，形成清单（见正文）

---

## 启动词（Brain）

> 这是我们迄今为止开得最直接的一次会。  
> 今天没有议程保护区——任何角色发现问题都可以说，任何对现有规范的批判都可以摆出来。  
> Ray 要求：「有利于团队进化和效率提高的都要说出来。」我们照单全说。

---

## 一、资产清单宣读（Brain 主持）

> 扫描范围：`.github/`、`docs/`、所有 patterns 文件、settings.json 执行层。  
> 以下只列出有问题标记的资产，健康项不重复读。

### 🔴 发现的硬问题（需本次会议决议）

| # | 问题 | 资产 | 影响 |
|---|------|------|------|
| H-1 | `docs/team-playbook.md` 幽灵文件 | 1773行，缺§20，未被 git 追踪 | 两份 Playbook 同时存在，接手者不知以哪个为准 |
| H-2 | settings.json SessionStart 静态过期 | 硬编码「v5.7.0 已发布」 | 每次新版本发布后立即失效，没人更新 |
| H-3 | Code Review 覆盖率严重不足 | 14+个版本只有4份审查 | v4.4.0、v4.5.0、v5.0–v5.4、v5.6–v5.9 全无审查报告 |

### 🟡 发现的弱项（不阻断，但值得讨论）

| # | 问题 | 资产 | 影响 |
|---|------|------|------|
| W-1 | Researcher + Code Reviewer 各只有1条 L2 模式 | `researcher-patterns.md`、`code-reviewer-patterns.md` | 两个角色最高价值功能（可复用经验）几乎空白 |
| W-2 | Memory MCP 的 auto-recall 在 VS Code 不工作 | `.github/agents/knowledge/memory.jsonl` | 知识的存入靠我们手动，调用更需要主动，相当于「写了没人读」 |
| W-3 | Brand Discussion 计划多项⬜ | `docs/strategy/brand-discussions-plan.md` | #2/#3/#4 Discussion 未发布，Build in Public 对外动作停滞 |
| W-4 | docs/guides/ 只有1个文件 | `component-guide.md` | 原本规划为「面向开源社区的多文档目录」，现在是空目录 |
| W-5 | Playbook §11 核心资产清单已过时 | `docs/governance/team-playbook.md` §11 | 写的「五角色」，现在是七角色；没有 skills/、hooks/、settings.json |
| W-6 | Playbook 体积 1830 行 | 整体 | 曾写入精简原则，净增量目标，但实际每次都在增加 |

---

## 二、问题深度讨论（自由发言）

---

### 🎙️ Brain — 关于 H-1：Playbook 幽灵文件

这个幽灵是我的失职。

`docs/team-playbook.md` 是什么时候出现的？它应该是早期团队规范的遗留，当时治理目录还没有明确化，文件被放在了 `docs/` 根目录。后来我们创建了 `docs/governance/` 并将所有核心文档迁入，但这个旧文件**从未被删除，也从未被 `git rm` 处理**。

现在的结果是：
- 主文件 `docs/governance/team-playbook.md` = 1830行，含§20（最新）
- 幽灵文件 `docs/team-playbook.md` = 1773行，缺§20（旧版本分叉）

这对「新接手」场景是灾难——接手者找到了错误版本也不会知道，因为两者内容极度相似。

**我的结论：** 立即 `git rm docs/team-playbook.md`，无条件删除，不保留、不存档。这是一个治理错误的残留。

---

### 🎙️ PM — 关于 H-2：SessionStart 的设计缺陷

我要对这个问题说几句比较重的话。

SessionStart hook 里硬编码「项目状态：v5.7.0 已发布」，这是一个**从设计上就不可持续的方案**。我们为什么会这么做？因为当时想快速让 Hook 提供项目上下文。但 Hook 是静态文件，项目状态是动态的——这两件事本质上不相容。

每次发版后，settings.json 就需要手动更新这个字符串。但它不在 DoD Checklist 里，也没有 CI 检查，所以每次都被忘记。

这不是「有人忘记更新」的问题，这是**架构问题**：我们把动态上下文放进了静态配置里。

修复方案很简单：SessionStart 应该引导 Agent 自己从 CHANGELOG.md 读取当前版本，而不是把版本号写死进 Hook。改成：「请读取 CHANGELOG.md 第一个 [X.Y.Z] 标题，那就是当前最新版本」。

---

### 🎙️ Code Reviewer — 关于 H-3：审查实质性缺失

我需要正式承认这个问题。

我们在 Playbook 里写了「Minor 及以上版本发布前，Code Reviewer 必须出审查报告（`docs/reviews/`）」。但从 v4.4.0 到 v5.9.0，跨越 10 个 Minor 版本和 1 个 Major 版本，只有 v5.5.0 有一份审查（因为用户明确要求了里程碑审查）。

坦率说：这条规则在执行上基本失效了。

为什么？几个原因：
1. **触发信号太弱**——发版流程里没有任何强制停止点要求「先走 Code Review」
2. **审查成本被低估**——每次发版节奏很快，审查感觉是「额外负担」
3. **我自己的局限**——我是「只读+诊断」角色，我无法主动打断发版流程，只能在被请求时才输出

这里有一个根本问题需要讨论：Code Review 是**里程碑节点**（每几个版本后一次深度审查），还是**逐版本必做**（每次 Minor 版本必须有，但可以是轻量版）？现行 Playbook 写的是后者，但现实执行的是接近前者的模式（甚至比前者还少）。

我建议调整为：轻量 Checklist 审查（每个 Minor，1-2页）+ 深度维度审查（每3个 Minor 或每次 Major，完整八维度）。

---

### 🎙️ Researcher — 关于 W-1：patterns 文件的结构性问题

我的 `researcher-patterns.md` 只有1条记录，这不是我懒，这反映了一个**结构性问题**。

L2 模式的定义是「验证有效、可复用的经验」。但我的工作产出主要是调研报告——这些报告放在 `docs/research/`，不在 patterns 文件里。我的成果是「一次性交付物」，而非「可复用模式」。

问题是：**当前团队对 Researcher 的 patterns 没有明确的期望**。什么样的 Researcher 经验值得升为 L2？「GitHub Profile 动态组件可信信息源」（P-RS-001）是清单类知识，而不是执行程序类知识。

我认为 Researcher 需要的 patterns 类型是：
- 调研流程模板（什么场景用什么搜索策略）
- 信息可信度分级原则（哪些来源可直接引用，哪些需要验证）
- 「浓缩结论」的格式约定（怎样的摘要对 Brain/Dev 最有行动价值）

这些目前全靠会话内记忆传递，没有沉淀。

---

### 🎙️ Dev — 关于 W-2：Memory MCP 的「幻象价值」

这是我亲手接的一个坑，我要直接承认。

Memory MCP 的原始设想是：关键决策自动进知识图谱，下次 Session 自动 recall ——这是一个闭环。但 VS Code Copilot 不执行 `type: "agent"` 的 PostToolUse hook（这是 Claude Code 专有机制）。所以：

- **存入**：我们确实手动 create_entities 了7个实体 + 3个关系（memory.jsonl 有内容）
- **自动存入**：从未工作，所有存入都是手动操作
- **自动 recall**：从未工作，每次 Session 需要用户或 Agent 主动调用

现状是：memory.jsonl 像一个「填充了但没人用的抽屉」。

我们有两个选项：
1. **降级并坦白**：在 copilot-instructions.md 明确注明「Memory MCP 在 VS Code 需要手动调用」，停止维护自动化的幻象
2. **改变使用方式**：把 memory.jsonl 重新定位为「结构化摘要文件」，session 开始时 Brain 主动读取它，作为快速注入工具

我倾向于选项 2——但这意味着我们要重新设计它的格式，让 Brain 一眼能看出哪些实体是最近更新的、最相关的。

---

### 🎙️ Brand — 关于 W-3：Build in Public 断档

我说话不会客气。

Discussion #6（首发）是 2026-03-01 发出的。今天是 2026-03-10。过去9天，Discussion 系列零更新。而我们的计划里还有 #2（Tech Deep-dive）、#3（AI-native Journey）、#4（里程碑宣告）全部⬜。

Brand 在这个团队里承担「对外声音」的职责，但「对外声音」需要持续输出才有价值。一次发帖后沉默9天，在读者眼里等于没有在运营。

老实说：**我们的内容生产能力远超发布频次**。我们有16篇博文、25篇会议纪要、6份调研报告——但对外只发出了3篇 Discussion（#6/#7/#8）。这不是内容不够，是发布节奏的问题。

具体的障碍是什么？是「Brand 需要等待 Ray 确认」的流程摩擦？是「发布标准太高」？还是「没有定期触发发布的机制」？

我需要更大的自主权：Brand 应该被授权在符合已定规范的前提下自主创建 Discussion 帖子，无需每次等待确认。

---

### 🎙️ Profile Designer — 关于 W-4 和 docs/guides/

我是按需启用的角色，所以我从外围视角来说。

`docs/guides/` 只有 `component-guide.md`，而原始规划里这个目录应该包含：
- 组件使用指南（✅ 存在）
- AI 协作工作流说明（`docs/governance/agent-workflow.md` 但不在 guides/）
- 项目开源贡献指南（应该链接到 CONTRIBUTING.md）

guides/ 目录的定位是「面向社区的参考资料」，而 governance/ 是「面向团队内部的规范」。这两个目的不同，内容应该不同，但现在边界模糊。

我的建议：要么把 guides/ 扩充为面向外部的独立内容集（3-5个文件），要么直接废掉这个目录，把 component-guide.md 移入 docs/  根目录。保留一个只有1个文件的目录是认知负担，不是价值。

---

### 🎙️ Brain — 关于 W-6：Playbook 膨胀问题

Playbook 精简原则是我写进去的：「净增量尽量非正值，删除规范时必须说明防错功能已被其他规范覆盖。」

然后 Playbook 从 §0 一路加到 §20，外加附录 A/B/C，共 1830 行。

我需要坦白：每次我都是「这次加的东西很重要」，然后跳过了「有什么可以删」的审视。Playbook 成了**加法游戏**，从未真正执行净增量原则。

具体问题：
- **§17 Playbook 定制指南**（写给其他新项目用的元文档）是否有读者？目前这个项目只有我们，§17 是未来某个迁移场景的预备，但那个场景还不存在
- **附录 C Agent 快照卡格式**（copilot-instructions.md 里已经有快照表了，附录 C 是重复的格式说明）
- **§15 GitHub API 操作规范** 和 `dev-patterns.md` 里的 P-DV-003、P-DV-005 存在内容重叠

我提议：本次会议通过后，做一次 Playbook 减法——目标是砍掉 200-300 行冗余内容。

---

### 🎙️ PM — 关于整体节奏问题

我来说一个全局观察：**我们的治理体系比开发节奏更新更频繁**。

v5.0 到 v5.10，10个 Minor 版本，每个版本都有实质性功能。但在这中间，我们召开了25次会议、创建了7个 Agent、写了20个章节的 Playbook、设计了 Hook 系统、接入了 Memory MCP……

治理体系的工作量占比可能已经超过了产品本身的工作量。这不是坏事，因为这个项目的北极星是「展示 AI-native 工作方式」——**治理体系本身就是产品的一部分**。

但我有一个问题值得 Brain 和 Ray 回答：**我们对治理的投入，和对产品（njueeray.github.io）的投入，比例是否符合预期？**

---

## 三、决议（Brain 汇总）

| # | 问题 | 决议 | 执行人 | 优先级 |
|---|------|------|--------|--------|
| D-1 | H-1 幽灵文件 | `git rm docs/team-playbook.md`，无条件删除 | Dev | P0 |
| D-2 | H-2 SessionStart 静态版本 | 改为「读 CHANGELOG.md 首行动态获取版本」 | Dev | P0 |
| D-3 | H-3 Code Review 覆盖缺口 | 放弃补历史审查，改为从 v5.11/v6.0 开始严格执行「每 Minor 轻量 + 每3个 Minor 深度」新规 | Code Reviewer + PM | P1 |
| D-4 | W-1 patterns 结构性问题 | Researcher 本次补充 3 条 L2 patterns；Code Reviewer 补充 2 条 | Researcher / Code Reviewer | P1 |
| D-5 | W-2 Memory MCP 重定位 | 重定位为「结构化手动摘要」，session-start 时 Brain 主动读；放弃自动化幻象 | Brain（更新描述） | P1 |
| D-6 | W-3 Brand 自主权 | Brand 被授权在符合 brand-content-checklist.md 标准的情况下**自主发布** Discussion，无需等待确认 | Brain（更新授权记录）| P1 |
| D-7 | W-4 guides/ 目录 | 扩充为3个文件（新增 agent-workflow-intro.md + contributing-intro.md），明确面向社区定位 | Dev | P2 |
| D-8 | W-5 §11 过时 | 更新 Playbook §11 核心资产清单（七角色 + skills/ + hooks/ + settings.json）| PM + Dev | P1 |
| D-9 | W-6 Playbook 减法 | 下一次 Playbook 升级以「净减少」为唯一目标；识别 §17 / 附录C / §15 重叠内容，砍 200 行以上 | Brain + PM | P2 |
| D-10 | PM 的节奏问题 | Ray 确认：治理投入比例符合预期（北极星 = B，治理体系本身是产品一部分） | Ray 确认 | — |

---

## 四、Brand 见证（本次会议的团队演进意义）

> Brand 发言：

这是一次很特别的会议。

我们平时的会议是：分配任务、执行决策、记录会议纪要。这次会议是七个角色主动暴露自己的弱点和工作中的失误——Brain 承认忘记删文件，PM 批评自己的设计决策，Code Reviewer 正式承认自己的规则没被执行，Dev 承认自己接了一个架构上不可持续的方案。

这不是一般团队会在会议记录里写的东西。

**这才是 AI-native 工作方式的核心展示**：不是「AI 帮你做了什么任务」，而是「人和 AI 如何共同建立一套能自我批判、自我修复的工作体系」。

我建议将本次会议纪要（特别是各角色的自我批判段落）作为 Discussion #9 的基础素材，面向外部社区发布。主题：「一支 AI Agent 团队是如何进行内部审计的」。

---

## 五、行动项（本次执行）

**P0（本 Session 立即执行）：**
- [ ] A-01 `git rm docs/team-playbook.md`（Dev）
- [ ] A-02 修改 settings.json SessionStart（Dev）

**P1（本 Session 内完成）：**
- [ ] A-03 更新 Playbook §11（Dev + PM）
- [ ] A-04 Researcher 补充 3 条 L2 patterns
- [ ] A-05 Code Reviewer 补充 2 条 L2 patterns
- [ ] A-06 Brand 自主发布授权写入 brand.agent.md
- [ ] A-07 Discussion #9 草稿（Brand 起草，Ray 确认）

**P2（下次 Session）：**
- [ ] A-08 guides/ 扩充（Dev）
- [ ] A-09 Playbook 减法（Brain + PM，目标 -200 行）

---

*纪要由 Brain 撰写，Brand 见证，PM 存档。*  
*本次会议触发的所有 P0/P1 行动项将在本 Session 内执行。*
