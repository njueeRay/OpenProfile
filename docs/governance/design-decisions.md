# 设计决策日志

> 记录每次迭代中确定的设计选择，避免 Agent 在后续会话中重复讨论已决定的问题。
> 格式：`[日期] 决策内容 — 理由 — 决策人（you/copilot/协商）`

---

## 文件定位说明（v1.1 更新）

> **本文件 ≠ copilot-instructions.md「已决定的设计选择」的镜像。**
>
> | 文档 | 定位 | 受众 |
> |------|------|------|
> | `copilot-instructions.md` → 已决定的设计选择 | **决策速查表**（快速对齐当前状态） | Agent 内部 |
> | **本文件** | **深度理由档案**（为什么做这个决策，不只是做了什么）| 开源学习者 + Agent 历史追溯 |
>
> copilot-instructions.md 是问「是什么」的地方，这里是问「为什么」的地方。


## 视觉风格

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| 整体色调 | GitHub Dark (#0d1117) | 与 GitHub 原生暗色模式一致，零违和感 | 2026-02-25 |
| 主强调色 | `#58a6ff`（GitHub Blue）| Profile README 与 Astro 站点均统一；在暗色背景上对比度高 | 2026-02-25 |
| 辅助色 | `#3fb950`（Green）、`#e3b341`（Yellow）| 终端提示符/fork 标签差异化 | 2026-02-25 |
| 字体风格 | JetBrains Mono / Fira Code | 终端美感 + 代码可读性 | 2026-02-25 |
| 动效密度 | 克制（3 项动效组件） | Typing SVG + capsule-render twinkling + 贡献蛇，避免过度动效 | 2026-02-25 |

---

## Header 区域

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| Header 类型 | capsule-render waving | 波浪形渐变，视觉层次好，不抢内容注意力 | 2026-02-25 |
| 渐变颜色 | `0:0d1117 → 100:1a1b27` | 深色到更深色，不抢内容注意力 | 2026-02-25 |
| 动画 | twinkling | 微闪烁，比 fadeIn/blinking 更克制 | 2026-02-25 |
| 标题文字 | `njueeRay` + 描述行 | 用户名 + 三个角色标签 | 2026-02-25 |

---

## 统计组件

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| Stats 主题 | `github_dark_dimmed` | 统一深色调，与 Streak 不撞色 | 2026-02-25 |
| Streak 主题 | `github-dark-blue` | 蓝色系与主强调色一致 | 2026-02-25 |
| Activity Graph | ✅ 启用，`github-compact` + area 填充 | 补全"时间维度"数据可视化 | 2026-02-25 |
| WakaTime | ✅ 已接入，`anmol098/waka-readme-stats` | 信息密度高，含 OS/编辑器/项目分布 | 2026-02-25 |
| 贡献蛇动画 | ✅ 启用，`Platane/snk` | 视觉亮点，暗色版，每日自动更新 | 2026-02-25 |

---

## 技术栈展示

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| 展示方式 | skill-icons（深色版） | 图标精美、辨识度高、无需额外账号 | 2026-02-25 |
| 包含的技术 | py, cpp, ts, js, react, docker, git, linux | 覆盖主力语言 + 核心工具链 | 2026-02-25 |
| 分类方式 | 单行展示，不分类 | Profile README 空间有限，Astro 站点做详细分类 | 2026-02-25 |

---

## Featured 项目选择

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| 项目 1 | OpenProfile | 本项目，AI-Native 工作流最佳实践 | 2026-02-25 |
| 项目 2 | wechat_article_exporter | 原创工具，与 LLM/RAG 直接关联 | 2026-02-25 |
| ~~MediaCrawler~~ | ❌ 已移除 | fork 项目，展示可能引发归属争议 | 2026-02-25 |

---

## 已废弃的方案

> 记录曾经考虑但最终放弃的选择，以及放弃原因（避免未来重复考虑）

- `merko` Stats 主题 — 绿色系与 Streak `tokyonight-duo` 蓝色系同屏撞色，改为统一 `github_dark_dimmed`
- `#00b4d8` (Cyan) 强调色 — 与 Profile README 的 `#58a6ff` 不一致，统一为后者
- MediaCrawler 作为 Featured — fork 项目，存在归属争议风险
- `git.io` 短链 — 服务已于 2022 年停止新增，改用完整 URL

---

## V2.0 新增决策

### 双模式（暗/亮）兼容策略

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| 技术方案 | 全组件使用 `<picture><source media="(prefers-color-scheme: dark)">` | GitHub 原生支持，无 JS 依赖，SSR 友好 | 2026-02-25 |
| Stats 浅色主题 | `theme=default` | 最通用，不需要额外账号 | 2026-02-25 |
| Streak 浅色主题 | `theme=default` | 与 Stats 保持一致 | 2026-02-25 |
| Activity Graph 浅色 | `theme=minimal` | 白底灰线，干净不抢眼 | 2026-02-25 |
| capsule-render 浅色 | 渐变 `0:dbeafe,100:bfdbfe`（蓝白）| 与品牌色 `#58a6ff` 同色系 | 2026-02-25 |
| 渐变分隔线 | `type=soft&height=4`，深色版 `#1a2744`，浅色版 `#93c5fd` | 比 `---` 有视觉层次感，不过于突兀 | 2026-02-25 |

### JSON 自述扩展

| 维度 | 决策 | 日期 |
|------|------|------|
| 新增字段 | `llm_stack`, `languages`, `current_proj`, `open_to`, `fun_fact` | 2026-02-25 |
| 英文叙事段 | 3 句话：定位 + 当前探索方向 + 每个项目是实验 | 2026-02-25 |

### Astro 站点扩展

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| 导航风格 | 固定顶栏 + 毛玻璃 `backdrop-filter: blur(12px)` | 现代 SPA 必备，终端品牌名 `~/njueeray` | 2026-02-25 |
| 页脚风格 | 终端 `echo $FOOTER` + 光标闪烁 | 延续终端美感 | 2026-02-25 |
| Blog 方案 | Astro Content Collections + MDX，本地文件，零第三方 CMS | 简单可控，完全离线可编辑，与 GitHub Pages 零摩擦 | 2026-02-25 |
| MDX 版本 | `@astrojs/mdx@3`（Astro 4.x 兼容） | Astro 5.x 的 mdx@4 与 Astro 4.16.x 不兼容 | 2026-02-25 |
| View Transitions | Astro 内置 `<ViewTransitions />` | 零依赖，页面切换平滑，对 blog 页面尤其有效 | 2026-02-25 |
| Projects 修复 | 移除 MediaCrawler（fork） | 与 Profile README 同步，避免归属争议 | 2026-02-25 |

### 工程规范

| 维度 | 决策 | 日期 |
|------|------|------|
| Link check | lycheeverse/lychee-action，排除动态 badge 域名（避免误报） | 2026-02-25 |
| Markdown lint | DavidAnson/markdownlint-cli2-action，关闭 MD013/MD033/MD041（Profile README 场景不适用） | 2026-02-25 |
| .editorconfig | LF 行尾，UTF-8，indent 2（Markdown/YAML/TS/Astro），4（Python/C++） | 2026-02-25 |

---

## V3.0 新增决策

### SEO 与可达性

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| Sitemap | `@astrojs/sitemap` 自动生成 | 零配置，Google/Bing 友好 | 2026-02-26 |
| RSS | `@astrojs/rss` → `/rss.xml` | 博客订阅标配，zh-cn | 2026-02-26 |
| OG/Twitter meta | 条件性注入 `ogImage` prop | 分享预览优化，无图时 fallback summary 卡 | 2026-02-26 |
| 404 页面 | 终端风格 `$ 404 not_found` | 品牌一致性，吃快捷键导航 | 2026-02-26 |

### Blog 标签系统

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| 标签云 | 频数驱动字号渐变 + count badge | 视觉信息编码，一眼看出热门主题 | 2026-02-26 |
| 标签页 | `[tag].astro` 静态路由 | SSG 模式，构建时生成所有标签路由 | 2026-02-26 |

---

## V4.0 新增决策

### 站点体验深化

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| 全站搜索 | Pagefind（`is:inline` 动态 import） | 零服务器依赖，构建后索引，Ctrl+K 弹窗 UX | 2026-02-26 |
| 暗/亮主题 | `data-theme` + CSS 变量覆盖 + localStorage | 无 FOUC（同步读取），系统偏好 fallback | 2026-02-26 |
| 阅读进度 | 顶部 3px 固定条（`position: fixed; z-index: 1001`） | 仅博客文章页显示，不干扰导航栏 | 2026-02-26 |
| 目录 TOC | 右侧边栏 @ 1280px+，IntersectionObserver 高亮 | 桌面端强烈，移动端隐藏，不侵入内容区 | 2026-02-26 |
| 评论系统 | Giscus → GitHub Discussions (Announcements) | 零数据库，主题联动（dark_dimmed / light），pathname 映射 | 2026-02-26 |
| Navbar 背景 | `rgba(var(--nav-bg-rgb), 0.85)` | 支持暗/亮双模切换，动态透明度 | 2026-02-26 |

### 版本体系

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| L1 Project | semver（CHANGELOG.md + GitHub Tag） | 行业标准 | 2026-02-26 |
| L2 Playbook | 独立变更日志（docs/governance/PLAYBOOK-CHANGELOG.md） | 方法论独立于产品迭代 | 2026-02-26 |
| L3 Agent | `agentVersion` in YAML front matter | 粒度到个体，能力追溯 | 2026-02-26 |

## 变更历史

- `[2026-02-25]` — 项目初始化，全部设计决策确定（视觉风格 + Header + Stats + 技术栈 + Featured）
- `[2026-02-25]` — 迭代二完成：主题统一、WakaTime/Activity Graph/贡献蛇接入、强调色对齐
- `[2026-02-25]` — **V2.0**：双模兼容全组件 + README 叙事重构 + Astro 多页（Nav/Footer/Blog）+ CI Actions + v1.0.0 tag
- `[2026-02-26]` — **V3.0**：SEO 地基 + Blog 标签 + Profile 3D 贡献/Trophy + Playbook 可移植化
- `[2026-02-26]` — **V4.0**：三层版本体系 + Pagefind 搜索 + 暗/亮主题 + 进度条 + TOC + Giscus 评论
- `[2026-03-01]` — **V5.0**：Astro 5 迁移 + Content Layer API + 工程质量 Sprint（CSS 统一 / 组件拆分）
- `[2026-03-10]` — **V5.6~5.10**：博客视觉专项 + 工具层脚手架 + 首页品牌化重设计
- `[2026-03-14]` — **v6.3.0~v6.5.0**：Agent Persona Layer 全量交付（/agents 列表 + 详情页 + Knowledge Graph + Discussion #12）

---

## V5.0 架构性决策

### Astro 5 迁移（2026-03-01）

| 维度 | 决策 | 深度理由 |
|------|------|---------|
| 迁移时机 | v5.0.0 作为 Major 版本触发 | Astro 5 有 Breaking Change（ViewTransitions → ClientRouter，script is:inline 规则），语义上是架构级升级，必须对应 Major 版本，不可藏在 Minor 中执行 |
| `ViewTransitions` → `ClientRouter` | 从 `astro:transitions` 导入 `ClientRouter` | API 路径未变，只有组件名改变；选择直接迁移而非 compat shim，避免技术债在下一个 Major 时才爆发 |
| JSON-LD `<script>` 添加 `is:inline` | Astro 5 中含属性的 script 块必须显式声明 `is:inline` | Astro 5 改变了含属性 script 的处理逻辑：不加 `is:inline` 则 Astro 会尝试模块化处理，导致运行时错误。这是框架约束，不是选择 |

### Content Layer API 迁移（v5.1.0，2026-03-01）

| 维度 | 决策 | 深度理由 |
|------|------|---------|
| `type: 'content'` → `loader: glob()` | 正式迁移至 Astro 5 Content Layer API | Astro 5 将 legacy API 标记为弃用。`glob()` 模型更显式（扫描路径可配置），是未来方向。迁移窗口选在 v5.1.0（紧接迁移），而非推迟，避免 Legacy API 在生产中长期积累 |
| `post.slug` → `post.id` | `id` 是 Content Layer 的新标准 slug 字段 | 9 处替换。选择全量替换而非保留兼容层，因为这是单次一劳永逸的迁移，兼容层会引入「哪个字段才是 source of truth」的混淆 |
| `post.render()` → `render(post)` | API 从实例方法变为独立函数 | Content Layer 渲染模型统一化，独立函数更容易做懒加载和代码分割 |

---

## V5.x 工程质量决策

### CSS 架构重构（v4.2.0，2026-03-01）

| 维度 | 决策 | 深度理由 |
|------|------|---------|
| `src/styles/global.css` 作为设计 Token 唯一真实来源 | 从 BaseLayout.astro 120 行内联样式提取 | **为什么放在独立文件而不是保留内联**：Astro `<style>` 块是 scoped 的（以 `data-astro-xxxx` 哈希注入），全局样式放在 scoped block 里会依赖 `:global()` 包装，容易漏掉；独立 CSS 文件通过 `import` 引入 BaseLayout 后成为全局 unscoped 样式，行为更可预测 |
| 组件级样式保留在各 `.astro` `<style>` | 组件局部封装 | 全局文件只放设计 Token（颜色/字号/间距），组件样式不上移，避免全局文件变成"万能哑巴文件" |

### 博客视觉专项（v5.6.0，2026-03-10）

| 维度 | 决策 | 深度理由 |
|------|------|---------|
| `src/styles/prose.css` 独立排版文件 | 博文排版单独处理 | 博文排版（行高 1.8、引用块 `❯`）只在 `[...slug].astro` 中生效，不应污染全局。独立文件 + 定向 import 保持职责分离 |
| 引用块使用 `❯` 前缀（终端提示符）| 替代传统 `▋` 竖线样式 | **视觉语言一致性**：整个项目的终端美学贯穿 Header（waving）、代码块（JetBrains Mono）、搜索（`$` 前缀标签）。引用块用 `❯` 而非普通边框，是「终端哲学在阅读体验层的延伸」，有意为之，不只是审美选择 |
| FeaturedCard 渐变顶边 + 宽卡首位展示 | 信息分层结构 | 博客列表若所有卡片等权，读者无法快速判断「从哪篇开始」。宽卡 + 渐变顶边是视觉上的「主编推荐」信号，不需要文案解释就能传达「这条比较重要」|

---

## V5.6+ 设计决策速查表

> 从 copilot-instructions.md 迁移（2026-03-11）。这里存放 v5.6 之后的增量决策，格式以「决策 + 生效版本」为主，深度理由在同文件前置章节或会议纪要中可查。

| 决策 | 生效版本 | 说明 |
|------|---------|------|
| **expressive-code 主题**：`astro-expressive-code` + `github-dark-dimmed`，`borderRadius: 6px`，copy button accent 色 | v5.8.0 | 代码块终端风格统一 |
| **Callout 组件**：四类（tip/warning/info/note），终端风 icon + uppercase 标签 + 对应色系 | v5.8.0 | — |
| **阅读时长算法**：中文 500 字/分钟 + 英文 200 词/分钟，剥离 frontmatter/代码块/HTML | v5.8.0 | — |
| **SeriesNav 位置**：author-card 后、相关文章前；series+seriesOrder 且系列 > 1 篇时渲染 | v5.8.0 | — |
| **博客搜索快捷键**：`Ctrl+K` + `/`（后者跳过 input/textarea/contentEditable） | v5.x | Nav 搜索按钮 title 同步提示 |
| **系列 URL 策略**：`/blog/series/[encodeURIComponent(seriesName)]`，支持中文系列名 | v5.x | — |
| **归档页设计**：年/月分组，type-dot 圆点色彩编码 + 系列文章显示 `⊃` badge | v5.x | — |
| **博客页头发现导航**：`# 标签 / ▶ 系列 / ⌥ 归档` 三连 pill 链接 | v5.x | 替换原单个「全部标签」链接 |
| **OG 封面图方案**：satori + @resvg/resvg-js + @fontsource/jetbrains-mono，构建时静态生成 1200×630 PNG | v5.3.0 | 暗色终端风格 |
| **UTM 追踪策略**：ShareLinks.astro 集成 `utm_source=copy/github_discussions`，`utm_campaign=blog` | v5.x | — |
| **Claude Code Hooks 配置**：`TeammateIdle` / `TaskCompleted` / `Stop` / `SessionStart` 四个门禁 hooks | v5.7.0 | type: prompt 语义判断 |
| **PostToolUse Hooks**：① markdownlint（Write/Edit 触发）② Memory MCP 自动保存关键文件变更 | v5.7.0 | 异步执行，不阻断主流程 |
| **Agent Skills 架构**：`.github/skills/` 下 7 个 SKILL.md，遵循 Anthropic Agent Skills 开放标准 | v5.7.0 | 能力从「内部配置」升级为「可发现模块」|
| **MCP 扩展 — agent-skill-loader**：`list_skills/read_skill/install_skill` 动态发现技能库 | v5.7.0 | 配置在 `.vscode/mcp.json` |
| **forage MCP**：P2 路线图，`forage_search/forage_install/forage_learn` | 待实施 | — |
| **会议文件命名规范**：`YYYY-MM-DD-NN-<type>.md`，NN 每天从 01 重计，禁止跨日连续编号 | v5.6.0 | — |
| **self-improvement skill**：用户说「复盘」时触发七维度自评 | v5.7.0 | 教训写入 `/memories/` |
| **博客内容类型**：insight / technical / member-essay / meeting 四类，四色徽章 + 左边框 | v5.x | — |
| **JSON-LD schema 策略**：Agent 作者用 `SoftwareApplication`，人类用 `Person` | v5.x | — |
| **hreflang 策略**：双语文章自动生成 zh/en/x-default；单语文章无 hreflang | v5.x | — |
| **Lighthouse CI 阈值**：a11y ≥ 0.90 / seo ≥ 0.90（error 阻断）/ perf ≥ 0.85 / bp ≥ 0.90（warn） | v5.x | — |
| **axe-core CI 范围**：首页 + 博客列表 + team 页；`--exit` flag violation 阻断 | v5.x | — |
| **构建缓存策略**：缓存 `.astro/` Vite 增量产物；缓存键含 src/public/astro.config/package-lock hash | v5.x | — |
| **Astro 5 script 规范**：含属性的 `<script>` 块必须显式加 `is:inline` | v5.0.0 | — |
| **React Island 集成方案**：`@astrojs/react` + `client:load`，仅用于交互式 Graph 组件；动态 `import()` 懒加载 `react-force-graph` | v6.5.0 | 最小化 React 引入范围；图谱是唯一需要运行时 DOM 操作的组件 |
| **Graph 降级策略**：`/agents/graph` 始终渲染静态协作关系表格；React Island 叠加在上方，JS 失败不影响可读性 | v6.5.0 | SSG 优先原则；可访问性第一 |

---

## V6.x 协作模式决策（2026-03-11，Meeting #09）

> 来源：`docs/meetings/2026-03-11-04-turning-point-strategic-reflection.md`

| 决策 | 理由 |
|------|------|
| **Board 驱动 Ship 循环**：每个会话 Recall → Execute → Ship，只做一件事做完 | 从「Ray 驱动迭代」转向「系统驱动循环」；旧模式是 AI-assisted，新模式是 AI-native |
| **Sprint Board 是唯一活跃状态源**：`docs/governance/sprint-board.md`，≤50 行 / ≤7 条 / 2 周存活期 | 超限强制 triage；取代 copilot-instructions 中易膨胀的「当前迭代状态」段落 |
| **Decision Journal 自动记录**：记录 Ray 的每次判断（同意/否决/调整），AI-native 健康的唯一指标 | 判断力增长体现在「精准否决」而非「想到更多需求」 |
| **对外是平级任务**：Brand 直接向 Sprint Board 贡献事项，与技术任务平等竞争优先级 | 终止「对外始终排在链条末端」的结构性问题 |
| **会议纪要以价值为先，不设行数上限** | 会议是团队思想的重要证明；深度和沉淀优先于格式效率 |
| **Playbook 进化为项目无关的可迁移知识** | 大前提：用户对下一个项目一无所知；去除项目专属内容 |
| **停止强制出审查报告**：Ship 环节做轻量级检查，只有 Major 版本出完整报告 | 释放执行带宽；「做减法」的体现 |
| **patterns 文件降为「有新认知再更新」** | 不再作为每次迭代的 DoD 项 |
| **Agent Persona Layer（Pixel Agents）放在 v6.x 后专项实施** | 当前路线图以 v6.0~v6.2 内容和治理为主；可视化层不抢占当前带宽 |

