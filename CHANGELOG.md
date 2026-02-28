# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

---

## [4.5.0] — 2026-03-01

> **SEO & 性能 Sprint — JSON-LD / hreflang / Lighthouse CI / axe-core CI / Astro 5 调研**
> 六项任务交付：S-1 JSON-LD · S-2 hreflang · S-3 Lighthouse CI · S-4 axe-core CI · S-5 构建缓存 · S-6 Astro 5 报告

### Added

- **S-1 JSON-LD 结构化数据（P1）**
  - `BaseLayout.astro` — 添加 `jsonLd` prop，支持传入单个或数组 JSON-LD 对象
    自动注入 `<script type="application/ld+json">` 到 `<head>`
  - `index.astro` — 注入 `Person` + `WebSite` schema（含 `sameAs` GitHub URL、`knowsAbout` 技能数组）
  - `[...slug].astro` — 注入 `BlogPosting` schema（`headline` / `datePublished` / `dateModified` / `author` / `keywords`）
    Agent 作者使用 `SoftwareApplication` 类型，人类作者使用 `Person` 类型
- **S-2 hreflang 双语标签（P2）**
  - `BaseLayout.astro` — 添加 `hreflangLinks` prop，渲染 `<link rel="alternate" hreflang>` 标签
  - `[...slug].astro` — 双语文章（`bilingual: true`）自动生成 `zh` / `en` / `x-default` 三条 hreflang
- **S-3 Lighthouse CI（P1）**
  - `.github/workflows/lighthouse-ci.yml` — `treosh/lighthouse-ci-action@v12`
    最低分数阈值：accessibility ≥ 0.90（error）、seo ≥ 0.90（error）、performance ≥ 0.85（warn）
  - `.lighthouserc.json` — Lighthouse CI 配置文件（`staticDistDir` 模式，无需启动服务器）
  - 产物上传至 `temporary-public-storage`，PR 内可直接查看报告链接
- **S-4 axe-core CI（P2）**
  - `.github/workflows/accessibility.yml` — 构建后启动 `serve` 静态服务，`@axe-core/cli` 扫描首页、博客列表、team 页
  - `--exit` flag：发现 violation 时 CI 失败
- **S-5 构建缓存优化（P2）**
  - `deploy.yml` — 新增 `actions/cache@v4` 缓存 `.astro/` 增量构建目录
  - `lighthouse-ci.yml` / `accessibility.yml` — 同步添加 `.astro` 缓存步骤
  - 缓存键：`astro-${{ hashFiles('src/**','public/**','astro.config.mjs','package-lock.json') }}`
  - 预期效果：增量部署构建时间减少 ~40%
- **S-6 Astro 5 迁移可行性报告（P1）**
  - `docs/research/astro-v5-feasibility-2026.md` — Researcher 完整报告
    结论：✅ 迁移可行，工作量约半天，建议纳入 v5.0.0
    核心依赖兼容性矩阵 + 迁移路径 + 风险评估

---

## [4.4.0] — 2026-03-01

> **体验精修 Sprint — a11y / 博客微交互 / Hero 打字动画 / 团队动态墙**
> 四项功能任务全部交付：U-1 博客卡片微交互 · U-2 Hero 增强 · U-3 a11y 基础（P1）· U-4 团队动态墙

### Added

- **U-3 a11y 基础（P1）**
  - `BaseLayout.astro` — 顶部添加 `skip-to-content` 跳转链接（键盘/屏幕阅读器友好）
  - `BaseLayout.astro` — `<slot />` 包裹 `<main id="main-content" tabindex="-1">` 语义化主内容区域
  - `Nav.astro` — `<nav>` 元素添加 `aria-label="Main navigation"`
  - `Nav.astro` — 搜索按钮添加 `aria-label="搜索 (Ctrl+K)"`
  - `global.css` — `.skip-link` 样式（隐藏态 + 聚焦时浮现在 nav 下方）
  - `global.css` — `:focus-visible` 全局 2px accent 边框 + `:focus:not(:focus-visible)` 去除鼠标点击轮廓
- **U-1 博客卡片微交互**
  - `BlogCard.astro` — contentType 图标包裹 `<span class="type-icon">`，CSS `@keyframes breathe` 呼吸动画（2.8s）
  - `BlogCard.astro` — hover 升级：`box-shadow 0 8px 30px rgba(88,166,255,0.1)` + `will-change: transform`
  - `BlogCard.astro` — `<script>` 添加 3D 透视倾斜效果（`perspective(700px) rotateX/Y` 鼠标追踪）
  - 全部动效遵守 `prefers-reduced-motion`
- **U-2 首页 Hero 增强**
  - `Hero.astro` — CSS `@keyframes term-reveal` 逐行打字机揭示动画（opacity + X 偏移）
  - `Hero.astro` — `<script>` 按行数自动计算 `animation-delay`（0.3s 起步，每行 0.2s 间隔）
  - Hero CTA 按钮延迟跟随末行动画后出现
  - 遵守 `prefers-reduced-motion`
- **U-4 团队动态墙**
  - `team.astro` — 新增「团队动态」section（`#activity`），展示全站最新 12 篇博文活动流
  - Git log 风格终端布局：作者 emoji + displayName + `published` + 文章标题链接 + 日期
  - 数据来自 `getCollection('blog')` + `teamMembers` 本地映射，无外部 API 依赖
  - `typeIconMap` 为 contentType 匹配用途图标（💡/⚡/✍️/📝）

---

## [4.3.0] — 2026-03-01

### Added

- **GitHub Discussions 社区上线** — Announcements / Team Insights / AI-native Journey 三个自定义分类 + 3 篇首发帖
- **4 个 Good First Issues** 创建（#1-#4）：组件指南翻译、设计决策更新、Agent 速查卡、组件健康监控
- **README 着陆页增强** — Preview 区块、Star History 图表、Contributors 头像列表、双 CI badge（markdown-lint + link-check）、Roadmap 扩展至 v4.5.0
- **`docs/release-sop.md`** — 版本发布标准操作流程（从代码冻结到 Release 的完整步骤）
- **`docs/brand-release-template.md`** — Brand 版本发布博文模板（WHY > WHAT 叙事原则）
- `profile-designer-first-post.mdx` (member-essay) — Profile Designer 首发博文
- `ai-native-person-summit-2026-02-26.mdx` (meeting) — AI-native Person 思想峰会纪实
- `free-brainstorm-2026-02-26.mdx` (meeting) — v4.0.0 发布后全员自由交流会
- `team-evolution-design-2026-02-27.mdx` (meeting) — /team 页面 Git Graph 设计会

### Fixed

- **CI markdown-lint 全面修复**：282 errors → 0 errors
  - 新增 `.markdownlint-cli2.jsonc` 使用原生 `ignores` 机制（替代不工作的 `.markdownlintignore`）
  - 禁用与项目紧凑文档风格冲突的 4 条规则：MD022/MD028/MD031/MD032
  - 修复 11 处 MD034 裸 URL（`component-guide.md` + `bug_report.md`）
  - Workflow 触发条件扩展到 `.jsonc` 配置文件变更
- **BlogCard 嵌套 `<a>` 修复**（W-01）— 改用 stretched-link 模式，消除非法嵌套 HTML
- **汉堡菜单焦点管理**（W-02）— 添加 Escape 关闭 + Tab 焦点循环 + 开启时自动聚焦

---

## [4.2.0] — 2026-03-01

> **工程质量 Sprint — CSS 统一 / 组件拆分 / 响应式 / CI 修复**
> code-reviewer: `APPROVED WITH NOTES`（36/40，见 `docs/reviews/v4.2.0-review.md`）

### Added

- `src/styles/global.css` — 全局 CSS 变量 + 设计令牌 + 基础重置（从 BaseLayout 提取）
- `src/data/content-types.ts` — 博客内容类型共享配置（typeConfig / ContentType 类型导出）
- `src/components/BlogCard.astro` — 博客列表卡片组件（含 type-badge、author-chip、tags）
- `src/components/FilterTabs.astro` — 博客筛选标签栏组件（含 is:inline 客户端过滤逻辑）
- `tsconfig.json` 新增 `@styles/*` 路径别名

### Changed

- `BaseLayout.astro`：移除 120 行内联 CSS，改为 `import '../styles/global.css'`；移除未使用的 ThemeToggle import
- `blog/index.astro`：从 346 行重构至 ~90 行（提取 BlogCard + FilterTabs + 共享配置后）
- `Nav.astro`：新增移动端 hamburger 菜单（≤768px 折叠导航），替换原有仅缩字号的 480px 断点
- `FilterTabs.astro`：移动端 ≤480px 水平滚动（`overflow-x: auto` + `flex-wrap: nowrap`）
- 全局 CSS 变量新增：`--color-purple`, `--color-orange`, `--color-pink`, `--color-red`, `--space-*` 尺度、`--max-w`, `--max-w-wide`, `--nav-h`, `--radius-*`
- 组件中硬编码色值替换为 CSS 变量引用（如 `#bc8cff` → `var(--color-purple)`）

### Fixed

- `.markdownlint.jsonc`：禁用 MD036/MD040/MD060（与项目风格冲突的规则）
- `.github/workflows/link-check.yml`：排除 modelcontextprotocol.io（404）
- `PLAYBOOK-CHANGELOG.md`/`team-playbook.md`/`build-in-public-channels-2026.md`：修复 MD022/MD032/MD034/MD012 格式问题

---

## [4.1.0] — 2026-02-28

> **团队品牌化 + 内容架构 + AI-native 认知体系**  
> **Playbook 版本**：Playbook v2.1（见 PLAYBOOK-CHANGELOG.md）  
> code-reviewer: `APPROVED`（回顾性审查，见 `docs/reviews/v4.1.0-review.md`）

### Added

#### 团队扩展
- `.github/agents/brand.agent.md` — Brand Agent 正式加入团队（品牌运营 + Build in Public + 内容发布策略）
- `.github/agents/knowledge/` — §14 L2 知识库正式落地（brain / pm / dev / researcher / code-reviewer 各一份 patterns.md + README 索引）

#### 博客内容生态（njueeray.github.io）
- 多作者系统：7 个 author YAML + `/blog/authors/[agent]` 页面路由
- 12 篇博文发布：7 篇 Agent 首发 + 2 篇会议纪实 + Brand 观察报告 + AI-native 范式双语长文 + 技术教程
- `LangToggle.astro` — 中英文双语切换组件（localStorage 持久化，ViewTransitions 兼容）
- `content/config.ts` — Blog schema 新增 `bilingual: boolean` + `contentType` 枚举字段

#### 博客内容架构
- `contentType` 四类分类体系：insight（思想笔记）/ technical（技术实录）/ member-essay（成员随笔）/ meeting（会议纪实）
- `blog/index.astro` Filter Tab — 前端筛选 + URL hash 深链接 + 内容类型彩色徽章 + 左边框颜色区分
- `team.astro` 成员卡片升级 — 展示每位成员最新博文标题（getCollection 映射）

#### 团队进化可视化
- `/team` 页面 — Git Graph 风格垂直时间线（15 个里程碑 + 5 色节点 + 滚动渐显动画）
- `src/data/team-evolution.ts` — 数据驱动：新事件只需追加数组
- `src/components/GitTimeline.astro` — 504 行完整组件（Playbook 档案 + 成员 Grid）
- Nav 新增 "team" 导航链接

#### 文档与规划
- `docs/meetings/2026-02-28-v5-roadmap-planning.md` — V5 路线图全体规划会议（增量版本哲学 + v4.1→v4.5 路线图）
- `docs/meetings/2026-02-28-blog-team-page-design-session.md` — Blog 内容架构设计会
- `docs/meetings/2026-02-28-profile-fixes-and-action-items.md` — 工作会话纪要
- `docs/meetings/2026-02-27-brand-welcome-all-hands.md` — Brand 欢迎全员会议纪要
- `docs/meetings/2026-02-27-all-hands-strategic.md` — 全体战略会议纪要
- `docs/meetings/2026-02-26-free-brainstorm.md` — 团队自由思想交流会
- `docs/meetings/2026-02-26-ai-native-person-summit.md` — AI-native 范式深度峰会
- `docs/meetings/2026-02-26-playbook-reread-alignment.md` — Playbook 重读对齐会
- `docs/research/build-in-public-channels-2026.md` — Build in Public 渠道选型调研
- `docs/brand-content-checklist.md` — 博文八维度内容审查清单
- `docs/brand-discussions-plan.md` — GitHub Discussions 首批发布计划
- `docs/reviews/v4.1.0-review.md` — v4.1.0 回顾性审查报告

### Changed
- `.github/copilot-instructions.md` — 同步 Brand Agent、知识库、V5 路线图、版本规划表、团队进化记录、Worktree 规范
- `README.md` — 全面更新至 v4.0.0+ 状态（Agent 路径修正 + 功能亮点补充 + Roadmap 同步）
- `BaseLayout.astro` — `data-lang` 属性驱动双语 CSS 显示控制

### Fixed
- `njueeray.github.io` ThemeToggle — 修复 `astro:after-swap` 重复监听器（`window._themeListenerBound` 防重）
- `njueeray.github.io` ThemeToggle — 首次访问默认深色模式（不再跟随系统偏好）
- `.github/workflows/link-check.yml` — 新增 wakatime / shields.io / hooj0.github.io / 占位符排除规则
- `njueeRay/njueeRay` README — capsule-render fontSize 70→60，descAlignY 55→63（文字遮挡修复）
- `njueeRay/njueeRay` README — Tech Stack 扩展至 20 图标，`perline=10` 双行布局
- `njueeRay/njueeRay` README — Trophy 改为 `<picture>` 元素（dark/light 分离主题）
- `njueeRay/njueeRay` README — 3D Contribution Graph 增加 light 模式 SVG（green-animate）
- `njueeRay/njueeRay` README — Featured pin cards `cache_seconds=86400`
- GitHub Release v4.0.0 body 修复（UTF-8 PATCH）

### Playbook 升级 (v2.0 → v2.1)
- `team-playbook.md` §0 — AI-native 哲学立场章节
- `team-playbook.md` §3.3 — 认知清晰度原理补充
- `team-playbook.md` §6 — 七维度→八维度（新增 AI-native 健康度）
- `team-playbook.md` §15.3/15.4 — Release UTF-8 编码规范修复
- 6 个 Agent 文件新增 `## AI-native 工作哲学` 声明
- `copilot-instructions.md` 新增 `## 哲学锚点 — AI-native person`

---

## [4.0.0] — 2026-02-26

> **三层版本体系独立化（Playbook v2.0）+ Astro 站点体验深化**  
> **Playbook 版本**：Playbook v2.0（见 PLAYBOOK-CHANGELOG.md）  
> code-reviewer: `APPROVED`

### Added

#### Phase V — 版本体系独立化（Playbook v2.0）
- `PLAYBOOK-CHANGELOG.md` — 独立 L2 Playbook 变更日志，解耦项目版本
- 三层版本体系规范（L1 Project / L2 Playbook / L3 Agent）写入 `team-playbook.md` §18
- 6 个 Agent 文件全部新增 `agentVersion: v1.0` 元数据
- `copilot-instructions.md` 新增版本总览表 + 团队能力快照卡
- `team-playbook.md` §13.3 招募决策树 + §17.3 冷启动阶段 3 能力评估 + 附录 C Agent 快照卡格式

#### Phase W — Astro 站点体验深化（njueeray.github.io）
- **W-1 Pagefind 全站搜索** — `Search.astro` 搜索弹窗 + Ctrl+K 快捷键 + Nav 搜索按钮
- **W-2 暗色/亮色主题切换** — `ThemeToggle.astro` + localStorage 持久化 + 系统偏好跟随 + `:root[data-theme="light"]` CSS 变量
- **W-3 阅读进度条** — `ReadingProgress.astro`，博客文章顶部 3px 强调色进度条
- **W-4 博客目录 TOC** — `TableOfContents.astro`，右侧边栏 + IntersectionObserver 高亮 + 平滑滚动
- **W-5 Giscus 评论系统** — `Giscus.astro`，绑定 njueeray.github.io GitHub Discussions (Announcements)，支持主题联动；GitHub Discussions 已启用，Repo ID 已配置

### Docs
- `docs/meetings/2026-02-26-v4-planning.md` — V4.0 全体规划会议纪要（三层版本体系决议 + Phase V/W/P 执行计划）
- `docs/design-decisions.md` — 补录 V3.0 SEO/标签决策 + V4.0 站点增强 + 版本体系设计决策

---

## [3.0.0] — 2026-02-26

> **SEO 地基 + Blog 标签系统 + Profile 新组件 + Playbook 可移植化**
> code-reviewer: `APPROVED`

### Added

#### V3.0 Phase X — Astro 站点 SEO 地基
- `njueeray.github.io` 安装 `@astrojs/sitemap@3.2.1` → `sitemap-index.xml` 自动生成
- `njueeray.github.io` 安装 `@astrojs/rss` → `src/pages/rss.xml.ts`，可订阅 Feed（语言 `zh-cn`）
- `BaseLayout.astro` 新增 `ogImage` prop（可选），条件性注入 canonical / OG / Twitter Card meta tags
- 首页 `index.astro` 补充独立 description；Footer 添加 RSS SVG 图标入口
- `src/pages/404.astro` 自定义终端风格 404 页面（含 ← Home / Blog 快捷按钮）

#### V3.0 Phase Y — Blog 标签系统
- `src/pages/blog/tags/index.astro` 标签云页面（频次驱动字号渐变，count badge）
- `src/pages/blog/tags/[tag].astro` 标签过滤页面（7 条静态路由自动生成）
- `blog/index.astro` 文章卡片结构重构：tag 从父级 `<a>` 内迁出，变为独立 `<a>` 链接
- `[slug].astro` 文章页 tag pill 全部改为可点击链接 + 「全部标签 →」入口

#### V3.0 Phase Z — Profile README 新组件
- `njueeRay-profile` `.github/workflows/3d-contrib.yml` — 每日 UTC 18:00 自动更新 3D 贡献图 SVG（推送到 `output` 分支）
- `njueeRay-profile` README 新增 `## 🏆 Achievements` 区块 — github-profile-trophy（darkhub, 1×6）
- `njueeRay-profile` README 插入 3D 贡献图 `<details>` 折叠区块（night-rainbow 主题 SVG）
- `njueeRay-profile` README Connect 区添加 Blog RSS Feed 订阅 badge

#### Playbook 深化 — team-playbook.md
- 新增 §12 新团队接手协议（四阶段流程：静默阅读 → 对齐会议 → 状态报告 → 团队适配）
- 新增 §13 团队自主进化（Brain 作为架构师，自主招募/改造/停用 Agent）
- 新增 §4.5 Emoji Commit 倡议（15 种映射表）
- 新增 §5.4 团队自主版本决策权（PM 发版信号 + Brain 提案格式）
- 新增 §14 Agent 经验沉淀机制（L1/L2/L3 三层知识体系）
- 新增 §15 GitHub API 操作规范（跨平台 Token 提取，PowerShell + Bash）
- 新增 §16 开源项目品牌化规范
- 新增 §17 Playbook 定制指南（零上下文冷启动协议）
- 附录 B 扩充 3 条新反模式
- `docs/meetings/2026-02-26-v3-release-review.md` V3.0 发布前终审会议纪要
- `.github/copilot-instructions.md` 新增 Brain 自主权限 + 团队进化记录区块

### Changed
- **Playbook 项目无关化重构（Breaking）：**
  - 清除全部 OpenProfile 特定引用（§1.4/§4.3/§4.4/§7/§11）
  - §4.3 Scope 改为通用 + 项目特定由 Brain 定制
  - §4.5 Emoji 表去重，含义列引用 §4.2
  - §9.2 docs/ 子文件夹名改为推荐示例
  - §9.5 首次 commit 模板改为通用
  - §15.2 补充 macOS/Linux Bash 等效命令
  - §15.4 精简，核心步骤引用 §5.2
  - §16 品牌化视觉语言改为由 Brain 根据项目定位决定
  - §16.5 "Built with Copilot" badge 由必选改为可选
  - 尾部修订记录精简为版本号 + 日期，历史修订迁入 CHANGELOG
- Playbook 版本标识更新
- `copilot-instructions.md` 迭代状态更新

### Fixed
- `OG/Twitter meta tags`：`og:image` 改为条件性输出，移除不存在的 `/og-default.png` 默认值（避免全站 OG 图片 404）
- `3d-contrib.yml`：workflow 推送目标从 `main` 修正为 `output` 分支，与 README 中的 SVG URL 路径保持一致

---

## [2.0.0] — 2026-02-25

### Added
- Profile README 区块顺序重组（V2.0 新顺序：叙事节奏驱动）
- Profile README `<picture>` 双模兼容（暗/亮）：Header / Footer / Stats / Streak / Activity Graph / Skill Icons / Featured / 贡献蛇
- Profile README JSON 自述扩展至 12 字段 + 英文叙事段
- Profile README Typing SVG 文案改为个人身份标签（5 行）
- Profile README WakaTime 改为 `<details>` 折叠区块，附 fallback 说明
- Profile README 新增 🤝 Connect with Me 区块（Portfolio + GitHub + OpenProfile badge）
- Profile README 新增页面浏览计数器（komarev.com）
- Profile README 新增三处 capsule-render 渐变分隔线
- Astro 站点新增固定导航栏（Nav.astro，毛玻璃效果）
- Astro 站点新增页脚（Footer.astro，终端 echo 风格）
- Astro 站点接入 ViewTransitions（页面切换动画）
- Astro 站点新增 Blog 系统（Content Collections + @astrojs/mdx@3 + 2 篇首发文章）
- GitHub Actions：link-check.yml（lychee 链接可达性检查）
- GitHub Actions：markdown-lint.yml（DavidAnson/markdownlint-cli2-action）
- `.editorconfig` 统一编辑器缩进规范
- `.markdownlint.jsonc` Markdown 格式规范配置
- `.gitattributes` 强制 LF 行尾（防 Windows CRLF 污染）
- Agent 团队 V2.0 重构：新增 `brain`（战略协调）+ `pm`（项目管理）角色
- Agent 团队 V2.0 重构：`content-writer` → `dev`（全栈通用实现）
- Agent 团队 V2.0 重构：`qa-reviewer` → `code-reviewer`（七维度质量门禁）
- 新增 `docs/team-playbook.md`（可跨项目复用的团队方法论手册）
- 新增 `docs/meetings/2026-02-25-retrospective.md`（复盘会议 #003 纪要）

### Changed
- Astro 站点 Projects 区块：移除 MediaCrawler，替换为 wechat_article_exporter
- `copilot-instructions.md` Agent 团队表格同步为 V2.0 五角色架构
- `docs/agent-workflow.md` 更新为 Brain/PM/Dev/Researcher/CodeReviewer 拓扑
- CHANGELOG `[Unreleased]` 拆分：重命名为 `[1.0.0]`，启用版本对比链接

---

## [1.0.0] — 2026-02-25

### Added
- 初始化项目目录结构
- 创建 `.github/copilot-instructions.md` 主指令文件
- 创建 `.github/agents/` 专项 Agent 团队（profile-designer、dev、researcher、code-reviewer）
- 创建 `.vscode/` 工具集和 MCP 配置
- 创建 `docs/design-decisions.md` 设计决策日志
- 添加开源工程规范文件（CONTRIBUTING.md、CHANGELOG.md、LICENSE）
- 添加 GitHub Issue 模板和 PR 模板
- 推送 `njueeRay/OpenProfile` 仓库（AI-Native 工作流开源模板）
- 推送 `njueeRay/njueeray.github.io` 仓库（Astro 4.x 个人简历站点）
- 添加 `docs/meetings/2026-02-25-kickoff.md` 启动会议纪要
- Profile README 接入 WakaTime（anmol098/waka-readme-stats）
- Profile README 接入 Contribution Snake（Platane/snk）
- Profile README 接入 Activity Graph（github-readme-activity-graph）
- Astro 站点 About 区块填入 LLM Engineer 叙事文案
- Astro 站点 Projects 区块填入 3 个真实项目数据

### Changed
- Profile README Stats/Streak 主题统一为 `github_dark_dimmed` / `github-dark-blue`（解决撞色问题）
- Profile README Featured：MediaCrawler → wechat_article_exporter
- Astro 站点强调色统一为 `#58a6ff`（与 Profile README 品牌一致）
- Hero 组件优化：添加技术栈标签、zsh 风格提示符、GitHub 图标按钮
- Projects 组件：fork 标签使用黄色差异化样式

### Fixed
- Astro 版本从 5.x 降级至 4.16.18（解决 `ohash@^2.0.11` 依赖缺失问题）
- OpenProfile git 根目录修复（从父目录移动到独立仓库）
- Profile README git.io 短链修复 → 直接使用完整 URL

### Docs
- 全量同步 6 份过时文档（design-decisions、meeting minutes、agent-workflow、component-guide、README、CONTRIBUTING）
- copilot-instructions.md 设计选择同步至实际状态
- CHANGELOG 版本规划表修正

---

## 版本规划

| 版本 | 目标 | 状态 |
|------|------|------|
| v0.1.0 | 项目初始化：目录结构 + Agent 配置 | ✅ 完成 |
| v0.2.0 | 首版 README：基础信息 + Stats 组件 | ✅ 完成 |
| v0.3.0 | 视觉升级：Header 动画 + 技术栈图标 | ✅ 完成 |
| v0.4.0 | 动态数据：WakaTime + Activity Graph + 贡献蛇 | ✅ 完成 |
| v1.0.0 | 迭代一完成：全组件上线 + 文档同步 + 开源发布 | ✅ 完成 |
| **v2.0.0** | **叙事重构 + 浅色兼容 + Astro 多页 + CI + Agent 团队重构** | ✅ 完成 |
| **v3.0.0** | **SEO 地基 + Blog 标签系统 + Profile 新组件 + Playbook 可移植化** | ✅ 完成 |
| **v4.0.0** | **三层版本体系独立化 + Astro 站点体验深化** | ✅ 完成 |
| **v4.1.0** | **团队品牌化 + 内容架构** | ✅ 完成 |
| v4.2.0 | 工程质量 Sprint — CSS 统一 / 组件拆分 / 响应式 | ✅ 完成 |
| v4.3.0 | 社区首发 Sprint — Discussions / README 着陆页 / Good First Issues | ✅ 完成 |
| v4.4.0 | 体验精修 Sprint — 微交互 / 首页增强 / a11y / 团队动态墙 | ⬜ 规划中 |
| v4.5.0 | SEO & 性能 Sprint — JSON-LD / Lighthouse CI / Astro 5 调研 | ⬜ 规划中 |
| **v5.0.0** | **架构性升级 — Astro 5 迁移（门槛触发）** | ⬜ 远期 |

---

[Unreleased]: https://github.com/njueeRay/OpenProfile/compare/v4.3.0...HEAD
[4.3.0]: https://github.com/njueeRay/OpenProfile/compare/v4.2.0...v4.3.0
[4.2.0]: https://github.com/njueeRay/OpenProfile/compare/v4.1.0...v4.2.0
[4.1.0]: https://github.com/njueeRay/OpenProfile/compare/v4.0.0...v4.1.0
[4.0.0]: https://github.com/njueeRay/OpenProfile/compare/v3.0.0...v4.0.0
[3.0.0]: https://github.com/njueeRay/OpenProfile/compare/v2.0.0...v3.0.0
[2.0.0]: https://github.com/njueeRay/OpenProfile/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/njueeRay/OpenProfile/releases/tag/v1.0.0
