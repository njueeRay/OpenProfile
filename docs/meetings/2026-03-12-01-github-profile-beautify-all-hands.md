# 全体会议 #11 — GitHub Profile 美化复盘 × 下一步方向

**日期：** 2026-03-12  
**序号：** 当日第 01 次会议  
**类型：** 复盘 × 设计讨论 × 行动规划  
**主持：** Brain  
**参会：** Brain · PM · Dev · Researcher · Code Reviewer · Profile Designer · Brand · Ray（用户）  
**触发：** 用户原话——「现在决定进行一步美化我们的GitHub profile，召开全体会议，复盘当前状态，讨论下一步方向」  
**背景：** njueeray.github.io 已完成 v7.4.0（AI-native 工作流指南、L3 知识层、Pixel Avatar 系统、站内可发现性强化），但 GitHub Profile README 最后一次实质更新停留在更早的版本，两者之间存在明显的「展示差」。

---

## 开场（Brain）

> 今天的会议主题集中。我们的个人主页（njueeray.github.io）已经有了 Pixel Avatar、知识图谱、办公室动画、AI-native 工作流指南。这些内容是我们团队这段时间最有价值的产出。
>
> 但如果你今天去访问 github.com/njueeRay，你看到的是一个 2026-02-27 之前写好的 Profile README。那个页面上，甚至找不到一句关于 Agent Persona Layer 的描述，Blog Posts 最新条目还是两周前的。
>
> **这不是「还没更新」的小问题，这是对外形象和实际产出之间的结构性断层。**
>
> 每一个第一次访问我们 GitHub 的人，第一眼看到的是那个 README。那是我们在整个 GitHub 生态的「第一张名片」。如果它和我们真实的工作状态脱节两周，我们在用一张旧名片接待新朋友。
>
> 今天的会议分两轮：第一轮复盘——Profile 现在有什么、缺什么；第二轮讨论——我们要在这张名片上做什么改变，以及怎么做。

---

## 第一轮：现状复盘

### 📋 Profile 当前内容清单（Brain 主持盘点）

| 区块 | 当前状态 | 问题标记 |
|------|---------|---------|
| 🎨 Header（Capsule Render 波浪 + 打字机动效）| ✅ 完整，亮/暗双模式 | 无 |
| 👤 JSON 自述 + 叙事段 | ✅ 完整，字段丰富 | `current_proj` 只有 `OpenProfile` + `wechat_article_exporter`，缺 `njueeray.github.io` |
| 🛠️ Tech Stack（skillicons 图标墙）| ✅ 完整，20 个图标 | 无 |
| 📊 GitHub Stats + Streak | ✅ 完整，亮/暗双模式 | 无 |
| 📈 Activity Graph | ✅ 完整 | 无 |
| ⏱️ WakaTime（折叠）| ✅ 有数据，自动更新 | 最后更新 2026-02-28，数据略旧 |
| 🐍 Contribution Snake | ✅ 完整，亮/暗双模式 | 无 |
| 🏆 Achievements（徽章墙）| ✅ 有项目星标 + CI 状态徽章 | 缺 njueeray.github.io 的显性引用 |
| 🌏 3D Contribution Graph（折叠）| ✅ 有 SVG，亮/暗 | 是否自动更新？需确认 |
| 🧠 Team Knowledge Graph（折叠）| ⚠️ 静态 SVG，路径 `assets/team-knowledge-graph.svg` | SVG 资产是否存在并为最新版本？ |
| 🚀 Featured Projects | ⚠️ 只有 2 个项目（OpenProfile + wechat_article_exporter）| 缺 njueeray.github.io 作为核心展示项目 |
| 📝 Blog Posts（自动同步）| ⚠️ 最新 5 条全部来自 2026-02-27 | 2026-03-10、2026-03-11 的新博文没有自动更新进来 |
| 🤝 Connect | ✅ 有 Portfolio、GitHub、OpenProfile、RSS 四个入口 | 缺「Meet the AI Team」→ `/agents` 的直接跳转 |
| Footer | ✅ Capsule Render + 访客计数 | 无 |

**总评：结构健全，但内容层有四处明显断层。**

---

### 🎙️ Profile Designer

我来说视觉层。

先说好的部分：整体视觉风格统一，亮色 / 暗色双模式覆盖完整，Section 之间有渐变分隔线，不显得割裂。这是早期就做对的决策，现在还算耐看。

但我有两个观察，一个是「内容缺失」，一个是「视觉层级失衡」。

**内容缺失**：在 Featured Projects 区块，我们的 AI Agent 个人主页——njueeray.github.io——没有出现。这是当前最有视觉表达力的项目，但路过的人根本不知道它存在。一个人看完整个 Profile，如果不点击 Connect 区块的 Portfolio 链接，他不会主动发现这个网站。

**视觉层级失衡**：目前最抢眼的内容是 Stats 和 Snake，这两样东西是「数据展示」，而不是「Who I am」。我认为应该在 JSON bio 区块之后、Stats 之前，插入一个轻量的 AI 团队展示模块——用简洁的方式告诉访客：「我不是一个人在工作，这是我的 AI 协作团队。」同时把 `/agents` 页面的入口放在这里。

具体形态可以参考 v7.1.0 的像素头像系统——但 GitHub README 不支持 Canvas，所以这里只能用 SVG 或者 img 标签。我建议生成一张「7 个 Agent 横排像素头像条」的静态 SVG，直接插入 Profile。

---

### 🎙️ Brand

我来说传播层。

Profile README 是 GitHub 上的「首页」。它的受众有三类：招聘方、开源社区普通访客、以及会深入看项目的技术同行。

当前 README 对三类受众的吸引力存在不均：
- **招聘方**：JSON bio 字段丰富，Tech Stack 清晰，这部分很好。
- **开源社区访客**：Blog Posts 区块自动同步，但数据已过时，最新的 Agent 相关文章没有出现，这部分失效了。
- **技术同行**：Team Knowledge Graph（折叠）和 Featured Projects 是吸引这群人的入口，但 njueeray.github.io 缺席，是最大的漏洞。

我要特别强调 Blog Posts 的问题。这个区块用的是 RSS 自动同步机制（GitHub Action），但从 2026-02-27 之后就没有更新过了。如果这个 Action 挂了，或者触发条件没有满足，我们的对外内容窗口实际上已经关闭了两周。这不是「还没写新文章」的问题，是「文章写了但没到访客面前」的问题。

**要立即检查的问题**：Blog Posts 的 GitHub Action 是否在正常运行？

---

### 🎙️ Dev

我来说工程层。

Profile README 背后有几个自动化依赖，我来做个快速审查：

1. **WakaTime Stats（`readme-wakatime` action）** — 最后更新 2026-02-28，正常情况应该每天更新。这个 Action 每天 UTC 时间自动运行，如果停了可能是 WakaTime Token 过期或 repo 权限问题。

2. **Contribution Snake（`snk` action）** — 依赖 GitHub Actions 输出 SVG 到 `output/` 分支，需要确认 `output` 分支存在且最近有推送记录。

3. **Blog Posts 自动同步** — README 里有 `<!-- BLOG-POSTS:START -->` 和 `<!-- BLOG-POSTS:END -->` 注释标记，这是 `gautamkrishnar/blog-post-workflow` action 的格式。需要检查 `.github/workflows/` 下是否有对应的 workflow 文件以及最近执行状态。

4. **3D Contribution Graph** — 通过 `yoshi389111/github-profile-3d-contrib` action 生成，输出到 `profile-3d-contrib/` 目录，已有文件。需要确认 action 是否定期运行。

**工程层行动建议**：触发一次手动 workflow dispatch，让四个 Action 全部重新运行，清除所有潜在的「Action 积压」状态。

---

### 🎙️ Researcher

我来说信息架构层。

GitHub Profile 的信息层级，如果用访客的视角来看，大致是这样的：

```
第一屏：Who am I（Header + JSON bio）
第二屏：What can I do（Tech Stack + Stats）
第三屏：What have I done（Activity, Snake, Featured Projects, Blog）
第四屏：How to find me（Connect + Footer）
```

目前的结构问题不在单个区块，而在「**第三屏缺少最重要的一个维度：How I work**」。

访客可以看到我用了什么技术，有多少 commit，做了哪些项目。但他们看不到「这个人是以什么方式工作的」——而这正是 AI-native 工作流的核心价值所在。

一个简单的修复方向：在 Featured Projects 之后，增加一个轻量的「How I Build」区块，核心内容是：
- 一行描述（AI-native 工作流，7 个 Agent 协作）
- 指向 `njueeray.github.io/how-we-work` 的入口
- 指向 `/agents` 团队页面的入口

这个区块不需要很重，200px 宽的一个横幅就够了。但它填补了信息架构上最大的空白——**Why this profile is different from others**。

---

### 🎙️ Code Reviewer

我做技术质量层的快速审查，直接列 issue。

**P0 — 可能已失效**

| 编号 | 问题 | 影响 |
|------|------|------|
| CR-01 | Blog Posts RSS Action 状态未知，内容停留 2026-02-27 | 对外内容窗口关闭 |
| CR-02 | `assets/team-knowledge-graph.svg` 是否为最新版本未知 | 可能展示过期的知识图谱 |

**P1 — 内容缺失**

| 编号 | 问题 | 影响 |
|------|------|------|
| CR-03 | Featured Projects 缺 `njueeray.github.io` | 最核心项目不可见 |
| CR-04 | JSON bio 的 `current_proj` 字段过时 | 自述不准确 |
| CR-05 | Connect 区块无 `/agents` 入口 | AI 团队不可发现 |

**P2 — 优化建议**

| 编号 | 问题 | 影响 |
|------|------|------|
| CR-06 | WakaTime Action 可能停滞 | 数据陈旧 |
| CR-07 | 3D Graph 更新状态未知 | 展示可能过时 |
| CR-08 | 无 Agent 团队视觉模块 | Profile Persona Layer 缺席 |

---

### 🎙️ PM

我来做优先级排序。

根据大家的分析，问题可以分为三类：

**类别 A：可立即执行（修复型，< 30 分钟）**
- 检查并触发 Blog Posts RSS Action（CR-01）
- 更新 JSON bio 的 `current_proj` 字段（CR-04）
- Featured Projects 新增 njueeray.github.io（CR-03）
- Connect 区块新增 `/agents` 跳转（CR-05）

**类别 B：需要资产生成（创作型，需规划）**
- 生成 7 个 Agent 像素头像横幅 SVG（CR-08 + Profile Designer 提案）
- 更新 `team-knowledge-graph.svg`（CR-02）
- 增加「How I Build」区块（Researcher 提案）

**类别 C：需要调查（诊断型，先调查再行动）**
- WakaTime Action 状态（CR-06）
- 3D Graph Action 状态（CR-07）

**执行建议**：今天先把 A 类全部做完（4项，全部是文字修改），B 类策划后分版本实现，C 类调查后决定是否操作。

---

## 第二轮：下一步方向提案

### 🎙️ Profile Designer — Pixel Badge Strip

**提案名：** Agent 像素徽章横幅

具体形态：一行 400×56px 的 SVG 横幅，横排 7 个 Agent 的像素头像（32×32），每个下方有 Agent 名字缩写，整体背景为深色终端风格，双模式自适应（`<picture>` 标签包裹）。

这个 SVG 可以用 Node.js 脚本从 `pixel-avatars.ts` 的网格数据生成——这意味着它和网站的 Pixel Avatar 系统是同一套数据源，不存在「维护两份像素数据」的问题。生成脚本放在 `njueeRay-profile/scripts/` 目录下，随时可重新生成。

摆放位置：JSON bio 区块之后，Tech Stack 之前。第一屏的末尾，用「AI 协作团队存在」这件事来结束对 Who I am 的描述。

---

### 🎙️ Researcher — How I Build Section

**提案名：** 「How I Build」区块（轻量版 /how-we-work 入口）

不需要把整个工作流文档搬进 README。只需要一个有视觉吸引力的横幅图：
- 左侧：终端风格的三行文字（`$ recall → execute → ship`）
- 右侧：7 个 Agent 角色缩写排列
- 底部：链接到 `njueeray.github.io/how-we-work`

这个横幅可以是纯 HTML（README 支持 `<div>` + `<a>`），也可以是 SVG。位置在 Featured Projects 之后。

---

### 🎙️ Brand — Blog Posts 修复 + 内容对齐

**提案名：** 内容管道恢复 + 精选文章替代方案

两步走：
1. **立即**：检查 RSS Action，如果失效就手动更新 Blog Posts 区块为最新 5 篇（包括 2026-03-10 的三篇和 2026-03-11 的会议博文）
2. **中期**：把「Blog Posts」自动同步改为「Featured Posts」人工精选——选出 3~5 篇最能体现 AI-native 工作方式的文章固定展示，不依赖可能失效的 Action

理由：自动同步机制虽然方便，但 RSS Action 是外部依赖，一旦失效就产生「内容窗口关闭」的问题。精选模式虽然需要手动更新，但每次更新都是有意识的传播决策，不是被动等待。

---

### 🎙️ Dev — Workflow 自动化诊断

**提案名：** Actions 状态报告 + 按需恢复

建议：先访问 `github.com/njueeRay/njueeRay/actions`，查看四个 Action 的最近运行时间和状态（成功/失败/未运行）。根据状态决定：
- 如果是失效（failed），修复触发条件或 Token
- 如果是长期未运行，触发手动 dispatch

这不是大工程，20 分钟内可以完成诊断，发现问题后再决定是否需要 Dev 介入修复。

---

## 第三轮：Brain 综合 + 执行规划

### 🎙️ Brain

把各方意见整合后，我对「GitHub Profile 美化」的判断如下。

**GitHub Profile 的定位要清楚：** 它不是网站，不需要做很多交互功能。它的核心价值是**「在 30 秒内让陌生访客理解：这是谁，在做什么，为什么值得关注」**。我们目前的 Profile 有好的骨架，但在「为什么值得关注」这个维度上，展示效果与我们真实工作状态相去甚远。

**方向裁决：**

不需要完全重写 Profile。需要的是**三类精准手术**：

1. **内容同步**（立即执行）：Blog Posts + JSON bio + Featured Projects + Connect → 把「最新现实」同步进来
2. **结构补充**（本次迭代）：增加 Agent 存在感——像素头像横幅条 + How I Build 入口
3. **自动化修复**（基础保障）：检查所有 Action 状态，确保不再出现内容过时的问题

**执行顺序（v-profile-1.0 ～ v-profile-3.0）：**

```
v-profile-1.0  内容同步（A 类修复，纯文本编辑）
  - JSON bio current_proj 更新
  - Featured Projects 新增 njueeray.github.io
  - Connect 区块新增 /agents 入口
  - Blog Posts 手动同步 / Action 状态检查

v-profile-2.0  Agent 存在层
  - 生成 Pixel Badge Strip SVG（从 pixel-avatars 数据）
  - 插入 JSON bio 之后

v-profile-3.0  工作流叙事层
  - 「How I Build」区块 + /how-we-work 入口
  - 插入 Featured Projects 之后
```

这三步可以在同一次会话里连续完成，也可以分三次。关键是：**每步都有独立的 DoD，每步都可以单独 commit + push。**

---

## 最后一轮：Ray 的判断

### 🎙️ Ray（用户）

> 今天就按照三个步骤全部完成吧，一直完成到 v-profile-3.0。

---

## 会议决议

> **记录者：** Brain  
> **状态：** 待 Ray 确认

### 📋 待 Ray 决策的问题

| # | 问题 | 选项 A | 选项 B | 选项 C |
|---|------|--------|--------|--------|
| Q1 | 今天先做哪一步？ | ✅ 立即执行 v-profile-1.0（内容同步，纯修改，15 分钟） | 🎨 直接跳到 v-profile-2.0（Agent 像素横幅，需生成 SVG） | 📐 先诊断 Actions 状态再决定 |
| Q2 | Blog Posts 策略？ | 🔄 修复 RSS Action，保持自动同步 | ✍️ 改为「精选文章」人工维护 | 🔍 先查 Action 状态再决定 |
| Q3 | Agent 像素横幅的规格？ | 📏 简洁版：7 头像 + 名字 + 链接到 /agents | 🎭 丰富版：7 头像 + 名字 + 角色描述 + 多行 | — |

### ✅ 已共识（无需 Ray 再决策）

- Profile 需要更新：内容同步是最低优先级、最高确定性的执行
- Agent 存在感缺失，需要补充入口（具体形态待 Q3 确认）
- 「How I Build」方向正确，具体实现在 v-profile-1.0 完成后再规划

---

## 附录：当前 njueeRay-profile 文件树

```
njueeRay-profile/
├── README.md             ← 本次主要编辑目标
├── assets/
│   └── team-knowledge-graph.svg   ← ⚠️ 需确认是否为最新版本
└── profile-3d-contrib/
    ├── profile-night-rainbow.svg
    └── profile-green-animate.svg
```

## 附录：与网站版本的「展示差」清单

| 网站已完成 | Profile 是否反映 | 优先级 |
|-----------|----------------|--------|
| v7.1.0 Pixel Avatar System | ❌ 无 | P1 |
| v7.2.0 L3 知识层 | ❌ 无 | P2 |
| v7.3.0 /how-we-work 指南 | ❌ 无 | P1 |
| v7.4.0 站内导航强化 | ❌ 无 | P3 |
| v6.x Agent 身份页面（/agents） | ❌ Connect 无入口 | P1 |
| v6.5.0 知识图谱（/agents/graph）| ⚠️ SVG 静态版本存在，但未更新 | P2 |
| 2026-03-10/11 新博文（6+ 篇）| ❌ Blog Posts 停留在 2026-02-27 | P0 |
