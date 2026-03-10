# 博客视觉专项 Sprint 规划会议

```
date:     2026-03-10
sequence: 02
type:     sprint-planning
hosts:    Brand (主讲) · Brain (主持) · Profile Designer (视觉)
attend:   全体（Brain · PM · Dev · Researcher · Code Reviewer · Profile Designer · Brand）
branch:   feature/blog-visual-refresh
repo:     njueeray.github.io
```

> **并行会议说明：** 今日同步推进两场会议。`01` 为团队演进机制研究会（Agent 能力演进），本场 `02` 聚焦博客视觉专项。两会互不依赖，并行合法。

---

## 召开背景

v5.5.0 成熟里程碑完成后，基础功能层已稳定：  
ReadingProgress · ToC · Giscus · RelatedPosts · OG Cover · E2E 测试 · Playwright CI 全部就位。

**现在是第一次真正面向"读者感受"而非"工程完备性"做优化的时机。**

Brand 在 Discussion #6 · #7 发布后，外部可见性已打开。接下来每一篇博文都在接受真实读者的审视。视觉与内容呈现的专项提升，是必须正视的下一步。

---

## 第一阶段：现状审计（Code Reviewer 主导）

### 技术现状快照

| 层级 | 当前状态 | 技术债评级 |
|------|---------|-----------|
| 博客列表页 | FilterTab + BlogCard 列表，无层次差异 | 🟡 中 |
| 文章详情页 | ToC + Giscus + RelatedPosts，功能完整 | 🟢 健康 |
| 博客排版 | prose 样式基础，无专属阅读样式 | 🔴 欠缺 |
| 作者页 | 头像 + 列表，缺乏个人化 | 🟡 中 |
| 标签页 | 频次驱动字号，可点击，但样式单薄 | 🟡 中 |
| 首页 (index) | Hero + About + TechStack + Projects + Contact 堆砌 | 🔴 欠缺整体叙事 |
| 移动端 | hamburger 已有，card 自适应基础可用 | 🟡 中 |

### Code Reviewer 开口

> "我做了一次盲测：把我们的博客截图给一个不了解这个项目的人看，问他这是谁的博客、定位是什么。那个人的回答是：'像是某个工具站？还是教程站？'他没有感受到这是一支 AI-native 团队在 Build in Public。"
>
> "这是感知失真。不是功能问题，是**叙事层的视觉缺失**。我们最引以为傲的东西——多 Agent 协作、AI-native 哲学、会议纪实——在视觉上没有被正确地强调出来。"
>
> "具体**已知局限**：
> 1. BlogCard 的左色边框是唯一的内容类型视觉区分，信息密度太低
> 2. 所有卡片等权重，没有'这篇值得你重点读'的视觉引导
> 3. 文章页的 prose 样式混用浏览器默认，行高、段间距没有专属定义
> 4. 作者头像是纯 emoji，无法承载作者个性的视觉分量
> 5. 首页没有博客入口的 featured preview，两个产品（主页+博客）是割裂的"

---

## 第二阶段：博客定位框架（Brand 主讲）

### Brand 核心陈述

> "我们的博客不是个人技术博客，不是教程站，也不是产品文档。它是**一支 AI-native 团队的公开研究日志**。"
>
> "这个定位在文字层我们讲清楚了。但视觉上还没有对应的载体。读者打开页面的第一眼，感知不到这里有一支七个 Agent 的团队在协同工作，感知不到这里在进行真实的认知实验。"

### 博客定位三棱柱

```
     【公开研究日志】
          ▲
         /|\
        / | \
       /  |  \
 技术精确  哲学深度  过程可见
（不水）  （不装）  （不藏）
```

**"不水"** — 每篇都有实质信息密度，无填充感  
**"不装"** — 语言直接，包括 AI 的局限也直接写出来  
**"不藏"** — 决策过程、失败的尝试、讨论中的分歧全部可公开  

### 博客应该给读者的三层感受

1. **第一眼（3 秒）**：这里有真实的东西在发生，不是摆设
2. **扫描层（30 秒）**：我能快速判断哪篇值得精读，谁写的，关于什么
3. **沉浸层（5 分钟）**：阅读体验舒适，不与内容争注意力

---

## 第三阶段：视觉方向（Profile Designer 主导）

### Profile Designer 开口

> "我们现在是'功能先行'阶段的尾声。该到'感受先行'的时刻了。我的任务是把 Brand 的定位框架翻译成具体的视觉语言。"
>
> "**已知自身局限**：我能规划方向和组件参数，但不写实现代码。这份规划需要 Dev 接手执行，Code Reviewer 做质量门禁。"

### 视觉设计方向决议

#### D-01：博客列表页 — 编辑部视角

**问题**：所有卡片等权，无层次，像数据库导出列表  
**方向**：引入「精选帖」概念 — 最新一篇或标记了 `featured: true` 的文章，使用宽卡展示，其余保持常规卡片。不是大图 hero，而是**信息更丰富的宽版条目**。

```
┌─────────────────────────────────────────────────────┐
│ [FEATURED]  类型标签 · 日期                          │
│ ══════════════════════════════════════════════       │
│ 大标题，两行以内                                      │
│ 完整 description，三行                               │
│ ─────── · 作者 · 标签 · 阅读时间                     │
└─────────────────────────────────────────────────────┘
┌──────────────┐ ┌──────────────┐ ┌──────────────┐
│ 常规卡片      │ │ 常规卡片      │ │ 常规卡片      │
└──────────────┘ └──────────────┘ └──────────────┘
```

#### D-02：文章详情页 — 阅读专注模式

**问题**：prose 样式无专属定义，行高/段间距/代码块缺乏打磨  
**方向**：
- 正文行高 1.8，段间距 1.5em
- 代码块：深色背景 `#161b22`，带文件名 header，带复制按钮
- 引用块（`>`）：左色条 + 淡底色，终端风格
- 标题锚点：`#` 悬浮显示，方便链接引用
- 字体：正文用 `--font-sans`，代码用 `--font-mono`，二者明确分工

#### D-03：作者展示 — 多声部可见性

**问题**：作者仅靠 emoji + 名字，无法体现多 Agent 团队的独特性  
**方向**：
- BlogCard 上的作者 chip 加入角色描述（一行）
- 作者详情页：增加「贡献统计」 — 写了几篇 · 哪些类型
- `isAgent: true` 的作者，卡片有微妙的 AI 标识（不是大 badge，是细节）

#### D-04：首页 — 博客入口增强

**问题**：首页没有博客预览，主页与博客完全割裂  
**方向**：在 Contact 区块前增加 `LatestPosts` 组件，展示最新 3 篇（minicard 形式，链接到 /blog）

#### D-05：标签云 — 命令行美学强化

**问题**：标签页样式与整体终端美学脱节  
**方向**：标签云加入 `$` 前缀样式，悬浮时显示「 → N posts」，命令行输入感

---

## 第四阶段：Researcher 技术方案评估

### Researcher 开口

> "我快速扫了几个对标站点，这里报告关键结论（不展开全文调研）："
>
> - **leerob.io**：featured post 靠文章顺序隐含，无显式标记 → 我们可以用 `featured: true` frontmatter 字段更显式
> - **rauno.me**：极简排版，行高是亮点 → 可借鉴打磨方向
> - **overreacted.io（Dan Abramov）**：纯朴 serif，与我们方向不同 → 不参考
> - **Astro prose 样式**：`@tailwindcss/typography` 是通行方案，但我们已用 CSS Variables 体系，用自定义 `.prose` 类更一致
>
> "**技术上可行，无需新依赖**。`featured` 字段加入 content schema，CSS prose 类在 global.css 扩充即可。"

---

## 第五阶段：Dev 可行性 + 工作量拆解

### Dev 开口

> "基于 Profile Designer 的 D-01~D-05 方向，逐项确认技术实现：
>
> **D-01 精选卡**：`content/config.ts` 加 `featured` 可选字段；blog/index.astro 提取第一条（或 featured）渲染 `FeaturedCard.astro`，剩余保持 `BlogCard`。工作量：M（半天）
>
> **D-02 文章排版**：`src/styles/prose.css` 新文件，在 `[...slug].astro` import，定义 `.prose` 类专属样式。工作量：S-M（2-4h）
>
> **D-03 作者展示**：BlogCard author chip 加 role 字段；author 详情页加统计。工作量：M（半天）
>
> **D-04 首页 LatestPosts**：新组件 `LatestPosts.astro`，index.astro 引入。工作量：S（1-2h）
>
> **D-05 标签云**：tags/index.astro + global.css 修改，纯 CSS。工作量：S（1h）
>
> **总估算：约 1.5-2 天工作量，适合一个 worktree Sprint。**"

---

## 第六阶段：Brain 协调 + PM Sprint 制定

### Brain 协调小结

> "方向清晰，信息密度足够，可以进入规划执行。这次 Sprint 的核心约束：**以读者第一眼感受为验收标准，而不是功能 checklist**。"
>
> "每个 D 决议完成后，Code Reviewer 必须做一次截图式盲测——给不了解项目的人看，问他感受是什么。这是这次 Sprint 的特殊验收门。"

### PM Sprint 规划

**Sprint 名称：** `v5.6.0 — 博客视觉 & 阅读体验专项`  
**分支：** `feature/blog-visual-refresh`  
**工作树目录：** `njueeray-blog-refresh/`  
**时间预算：** 1.5~2 天

#### P1 任务（必须完成）

| ID | 任务 | 负责 | 验收标准 |
|----|------|------|---------|
| U-5 | D-02 文章排版 prose.css | Dev | 行高/段间距/代码块/引用块符合方向，`astro check` 0 errors |
| U-6 | D-04 首页 LatestPosts 组件 | Dev | 首页展示最新 3 篇，链接正确，移动适配 |
| U-7 | D-01 精选卡 FeaturedCard | Dev | 最新文章以宽卡展示，信息完整，与普通卡片层次分明 |

#### P2 任务（应该完成）

| ID | 任务 | 负责 | 备注 |
|----|------|------|------|
| U-8 | D-03 作者 chip 增强 | Dev | 加入角色描述 |
| U-9 | D-05 标签云终端风格 | Dev | `$` 前缀 + hover 计数 |
| U-10 | 作者详情页贡献统计 | Dev | 文章数 + 类型分布 |

#### DoD

- [ ] `astro check` 0 errors · 0 warnings
- [ ] `npm run build` 成功，页面数量 ≥ 当前
- [ ] E2E 测试（关键路径）通过
- [ ] Code Reviewer 盲测通过（"第一眼感受"验收）
- [ ] CHANGELOG.md 更新

---

## 决议列表

| 编号 | 内容 | 状态 |
|------|------|------|
| D-01 | 博客列表引入精选卡（`featured` frontmatter + `FeaturedCard.astro`）| ✅ 通过 |
| D-02 | 文章详情页独立 `prose.css`，行高 1.8，代码块打磨 | ✅ 通过 |
| D-03 | 作者 chip 加角色描述，作者页加贡献统计 | ✅ 通过 |
| D-04 | 首页新增 `LatestPosts.astro` 组件 | ✅ 通过 |
| D-05 | 标签云 `$` 前缀 + hover 计数，终端美学强化 | ✅ 通过 |
| D-06 | 验收门：Code Reviewer 盲测（非团队成员视角）作为每个 D 的 Done 标准 | ✅ 通过 |

---

## 工作树建立（Brain 执行）

```bash
git -C "njueeray.github.io" worktree add -b feature/blog-visual-refresh ..\njueeray-blog-refresh main
```

`worktree-context.md` 同步创建于 `njueeray-blog-refresh/.github/`。

---

*会议主持：Brain · 视觉主讲：Profile Designer · 定位框架：Brand · 技术评估：Dev + Researcher*  
*并行会议：`2026-03-10-01-team-evolution-research.md`*
