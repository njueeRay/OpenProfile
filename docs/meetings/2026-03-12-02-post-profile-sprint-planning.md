# 全体会议 #12 — Profile 美化交付复盘 × 下一个 Sprint 方向

**日期：** 2026-03-12  
**序号：** 当日第 02 次会议  
**类型：** 交付复盘 × Sprint 规划  
**主持：** Brain  
**参会：** Brain · PM · Dev · Researcher · Code Reviewer · Profile Designer · Brand · Ray（用户）  
**触发：** 用户原话——「开会讨论后续」  
**背景：** 本日 v-profile-1.0 → v-profile-3.0 全部交付完毕：pixel 头像条（dark/light SVG）、AI Team 区块、How I Build 区块、Blog Posts 同步、Featured Projects 三栏。Sprint Board 活跃项当前 = 0，v7.5.0 是最后一个版本。现在需要讨论下一个方向。

---

## 开场（Brain）

> 今天下午我们完成了对外形象的一次重大补课：GitHub Profile README 从 v-profile-1.0 更新到 v-profile-3.0，像素头像墙、AI 团队入口、工作哲学区块全部上线并推送到 `njueeRay/njueeRay`。
>
> 这意味着我们现在有一个一致的对外形象：  
> - **njueeRay/njueeRay**（GitHub Profile）：访客的第一眼，现在包含 AI Team 入口和 How I Build 区块  
> - **njueeray.github.io**（网站）：深度探索入口，v7.4.0 完整，/agents + /how-we-work 可访问  
> - **OpenProfile**（知识仓库）：CHANGELOG + 会议记录 + Sprint Board
>
> 下一个问题是：**Sprint Board 是空的，下一步做什么？**
>
> 我把这个会议分成三部分：
> 1. **刚才交付了什么 / 遗留了什么**（5 分钟）
> 2. **Backlog 和方向盘点**（10 分钟）
> 3. **下一个 Sprint 提案**（Ray 拍板）

---

## 第一部分：刚才交付了什么 / 遗留了什么

### 📋 本次 Profile 美化交付清单

| 步骤 | 内容 | 状态 |
|------|------|------|
| v-profile-1.0 | JSON bio `current_proj` 补全 `njueeray.github.io`；Featured Projects 扩至 3 列；Blog Posts 同步至 2026-03-11；Connect 区块加入 `/agents` 入口 | ✅ |
| v-profile-2.0 | `## 🤖 My AI Team` 区块：7 Agent 像素头像条 SVG（dark/light）+ 3 个 badge 按钮（Meet Team / Live Office / Knowledge Graph）| ✅ |
| v-profile-3.0 | `## 🛠️ How I Build` 区块：Recall / Execute / Ship 工作方式表格 + `/how-we-work` badge | ✅ |
| 资产 | `assets/agent-pixel-badge-dark.svg`（396×81px）+ `light.svg` 生成并提交 | ✅ |

### ⚠️ 遗留问题（本次未处理）

| 问题 | 严重程度 | 说明 |
|------|---------|------|
| RSS Action 日期格式异常 | 中 | 上次 Action 运行产生了 `2026-00-11` 格式的日期（月份为 00），本次 rebase 时保留了我们的正确版本，但 Action 本身未修复，下次运行可能再次覆盖 |
| `team-knowledge-graph.svg` 是否最新 | 低 | 静态资产，最后一次确认生成时间不明；第一次会议将其标记为 P2 风险 |
| `assets/profile-3d-contrib/` 3D 图 | 低 | 未确认是否自动更新，GitHub Action 状态未检查 |

---

## 第二部分：Backlog 与方向盘点

### 🎙️ PM（Sprint 状态）

当前 Sprint Board 状态：**21 个条目全部 ✅，活跃项 = 0**。这是自团队成立以来第一次完全清空。

**已有 Backlog（2 项）：**

| 条目 | 背景 | 优先级判断 |
|------|------|-----------|
| `forage-mcp` 接入 | MCP（Model Context Protocol）服务接入，可以为 Agent 提供更强的工具调用能力；已被记录但从未开始 | 中：技术实验性强，收益需要更明确 |
| `.github/skills/` 贡献至社区 | 将 OpenProfile 的 SKILL.md 体系贡献给 GitHub Copilot 社区；属于开源增长策略的一部分 | 中：影响力大，但需要社区运营精力 |

**开源策略阶段状态（来自 `open-source-strategy.md`）：**

| 阶段 | 描述 | 当前状态 |
|------|------|---------|
| Phase 1 — Credibility | 建立可信度：releases、文档、CI、showcase | ✅ 完成 |
| Phase 2 — Discoverability | 可被发现：SEO、Blog、GitHub topics、Star 数 | 🔶 尚未开始 |
| Phase 3 — Community | 社区参与：Discussions Q&A、made-with gallery、contribution tracks | 🔷 尚未开始 |
| Phase 4 — Ecosystem | 生态：CLI scaffold、多平台、Agent 模式库 | 🔹 愿景 |

我的判断：**Phase 2 的启动时机已经成熟**。v7 系列内容完整，已有两篇对外 Discussion，Pixel Avatar 系统和 /how-we-work 页面都是有力的传播素材。下一步重点应该是让这些内容被更多人发现。

---

### 🎙️ Researcher（内容与知识方向）

我来评估「内容层」的现状和下一步。

**当前知识资产盘点：**

- 24 条 `agent-knowledge.ts` 知识条目（已上 `njueeray.github.io`，可在 `/agents/[id]` 页面查看）
- 9 篇 Blog 文章（最新：2026-03-11，覆盖 AI 认知视角、Pixel Avatar 系统、How I Build 文章）
- 8 个 GitHub Discussions（OpenProfile repo，v1 到 v7 三部曲的公开传播记录）

**下一步知识方向的三个候选维度：**

1. **深化内容**：继续写 Blog + Discussion，聚焦 AI-native 工作框架的实践细节；目标是让「OpenProfile 工作流」成为可搜索、可引用的内容资产
2. **拓宽场景**：探索 `forage-mcp` 等新型工具接入，并将实践过程写成博文——「边做边写」是目前效果最好的内容产出方式
3. **社区问答**：Phase 3 的 Q&A 讨论分类，如果开放了，Researcher 负责整理常见问题并形成 FAQ

我的建议：**下一个 Sprint 优先「深化内容」**，而不是立刻跳到工程性任务。我们在 v7 系列中积累了大量未被充分叙述的认知，这些内容再不写出来就会逐渐淡化。

---

### 🎙️ Brand（传播与社区）

我要强调一个具体的、时效性强的机会：

刚上线的 Profile 改动——特别是「7 Agent 像素头像条」——是一个**天然的传播时机**。这是少有的情况：一个 GitHub Profile 的视觉更新本身就是有内容的（不只是「今天更新了 README」）。

**建议发布 Discussion #9**：标题方向——「我在 GitHub Profile 里放了一张 AI 团队的像素头像墙——这是怎么做到的」，讲清楚：像素头像系统的来源（v7.1.0 PixelAvatarCanvas），SVG 离线生成脚本，以及「Profile 和网站双端同源资产」的设计决策。

这不只是展示，这是「把 OpenProfile 的工作方式变成可复制模板」的最好案例。这个 Discussion 写完，顺手就可以把 `gen-pixel-badge.py` 的关键片段贴上去——给想仿制的人一个起点。

---

### 🎙️ Dev（技术债与新功能）

两个技术层面的反馈：

**一、RSS Action 日期 bug（应该修复）**

在今天的 rebase 冲突中，我发现 GitHub 的 Blog Posts RSS Action（由 `gautamkrishnar/blog-post-workflow` 触发）写入了格式异常的日期（`2026-00-11`）。这说明该 Action 没有使用 ISO 标准日期格式，或者有版本问题。

如果不修复，下次 Action 运行时它会再次覆盖我们手动写好的 Blog Posts 区块，并带来脏数据。这是一个低优先级但**应该修复**的技术债。

修复路径：检查 `njueeRay-profile/.github/workflows/*.yml`，看 Blog Posts Action 的触发条件和格式配置。

**二、`forage-mcp` 接入（探索性，不急）**

MCP 是一个值得实验的方向，但「接入」本身不是一个有明确交付物的 Sprint 条目。建议先把它分解成：「调研 forage-mcp API + 写内部分析报告」，而不是直接开工集成。

---

### 🎙️ Code Reviewer（质量与风险）

我要标记三个遗留风险，供 Ray 决策时参考：

1. **RSS Action 重复覆盖风险**：Dev 说的是真实风险。每次 Action 运行都会覆盖 Blog Posts 区块。如果不修复 Action 配置，我们每次手动更新的版本都是临时的。这是一个「每次都要人工干预才能保持正确」的状态，不可持续。

2. **`assets/team-knowledge-graph.svg` 是静态文件**：如果后续知识图谱内容变化（比如新增了知识条目），这张 SVG 不会自动更新。需要明确「谁负责更新这个资产」以及「触发更新的条件是什么」。

3. **Blog Posts 条目选择无标准**：目前我们手动选择了 5 篇文章放进 Profile，但这个选择标准没有被文档化。如果下次再更新，选择标准取决于记忆，容易不一致。建议在某处（`copilot-instructions.md` 或 Profile 文档）记录这 5 条「精选文章」的选取逻辑。

---

### 🎙️ Profile Designer（视觉后续）

我来说视觉层的后续机会：

**短期（1-2 次 Sprint 内可完成）：**

- 像素头像条目前大小是 blockSize=5（即每个像素 5×5px），整体 40×40px 每个 agent。在 GitHub 的 Markdown 渲染下，图片默认宽度较大，看起来比较合适。但如果将来需要调整（例如适配移动端），`gen-pixel-badge.py` 脚本提供了一个修改入口——这是优于「手动作图」的地方。
- Team Knowledge Graph SVG 刷新：如果我们决定在 v8 系列做内容扩充，这个资产应该一并更新，否则它会越来越「旧」。

**中期（值得讨论）：**

- **GitHub Profile `README.md` 是否需要版本控制机制**？当前是靠 CHANGELOG + 会议记录追踪，但没有明确的「Profile version」标签。如果未来改动更频繁，可以考虑在 `README.md` 的 footer 里加一个 `<!-- v-profile-3.0 -->` 注释，方便追踪当前版本。

---

## 第三部分：下一个 Sprint 提案

### 🎙️ Brain（综合提案）

整合各方意见，我提出以下三个 Sprint 方向供 Ray 选择：

---

**方向 A：Phase 2 Discoverability 启动**
> 主题：让更多人发现我们的工作

| 事项 | Owner | 估计版本号 |
|------|-------|-----------|
| OpenProfile repo 添加 GitHub topics（`github-copilot`, `ai-native`, `github-profile`, `developer-tools`）| PM | v6.1.0 |
| Discussion #9：像素头像墙技术 + Profile 同源资产设计 | Brand + Profile Designer | v6.2.0 |
| njueeray.github.io SEO 基础：`@astrojs/sitemap` + `@astrojs/rss` → `/rss.xml` | Dev | v6.3.0 |
| Blog 文章：「如何用 Copilot Agent 维护 GitHub Profile」（面向社区的教程向文章）| Researcher | v6.4.0 |

评：这是技术投入最低但传播杠杆最高的方向。SEO 和 topics 是一次性操作，Discussion 是立竿见影的内容发布。

---

**方向 B：技术债清偿 + 稳定性**
> 主题：把已有的东西做扎实

| 事项 | Owner | 估计版本号 |
|------|-------|-----------|
| 调查并修复 RSS Action 日期格式 bug（检查 `.github/workflows/`）| Dev + CR | v6.1.0 |
| 重新生成 `team-knowledge-graph.svg`（确保与当前知识数据同步）| Profile Designer | v6.2.0 |
| Blog Posts 选取标准文档化 + 固化到 `copilot-instructions.md` | PM | v6.2.0 |
| `forage-mcp` 调研报告（内部，不对外发布）| Researcher | v6.3.0 |

评：这是防御性的方向——修复潜在的脏数据问题，防止下次手动修复时遇到同样的障碍。

---

**方向 C：内容深化（Blog + 知识层）**
> 主题：把 AI-native 工作框架写清楚

| 事项 | Owner | 估计版本号 |
|------|-------|-----------|
| 博文：「用 Recall → Execute → Ship 工作的 30 天回顾」（基于 Sprint Board 真实数据）| Brain + Researcher | v6.1.0 |
| 博文：「7 个 AI Agent 的角色设计——为什么这样分工」（Agent Persona 深度解析）| Brand | v6.2.0 |
| Discussion #9：上述博文的 Community 版本 | Brand | v6.3.0 |
| 知识条目扩充：从 24 条扩充到 30 条（新增 PM + Brand 知识条目）| Researcher | v6.4.0 |

评：这是攻击性的方向——用高质量内容驱动发现，每篇文章都能成为独立的传播节点。

---

### 🗳️ Ray 的决策区

> **请 Ray 在下方选择下一个 Sprint 方向（或提出混合方案）：**

| 选择 | 主题 |
|------|------|
| 方向 A | Phase 2 Discoverability 启动（SEO + topics + Discussion） |
| 方向 B | 技术债清偿（RSS bug 修复 + 知识图谱刷新 + 文档化）|
| 方向 C | 内容深化（博文 + 知识层扩充）|
| 混合 | 例如：B 的 RSS 修复 + A 的 Discussion #9 |

**Ray 的决定：**

> **「A 和 B 可以一起推进」**  
> A（Discoverability）+ B（技术债）并行，共 7 个活跃项，Sprint Board 已更新。

---

## 行动项清单（PM 整理）

| # | 事项 | 来源 | Owner | 目标版本 |
|---|------|------|-------|--------|
| 22 | 修复 RSS Action 日期格式 bug（检查 `.github/workflows/`）| B | Dev + CR | v6.1.0 |
| 23 | OpenProfile repo 添加 GitHub topics | A | PM | v6.1.0 |
| 24 | Discussion #9：像素头像墙技术 + Profile 同源资产设计 | A | Brand + PD | v6.2.0 |
| 25 | Blog Posts 选取标准文档化 + `team-knowledge-graph.svg` 刷新 | B | PM + PD | v6.2.0 |
| 26 | njueeray.github.io SEO 基础：sitemap + `/rss.xml` | A | Dev | v6.3.0 |
| 27 | forage-mcp 调研报告（内部）| B | Researcher | v6.4.0 |
| 28 | Blog 文章：「用 Copilot Agent 维护 GitHub Profile」| A | Researcher | v6.4.0 |

---

*会议记录人：Brain*  
*下次行动：Sprint Board 更新（Ray 决策后）*
