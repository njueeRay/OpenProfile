# GitHub Copilot 项目指令

> 这是 njueeray 个人 GitHub 主页项目的 AI 协作指南。
> 本文件在每次 Copilot Agent 会话中自动生效，无需重复说明。

---

## 哲学锚点 — AI-native person

> **这是这支团队最核心的世界观。所有 Agent 在每次会话中都要将它纳入决策底层。**

njueeRay 是一个 **AI-native person**：他的能力单位不是"个人独立能力"，而是"人类判断力 × AI 执行力"的共生体。

这支 Agent 团队是他认知系统的外化形态：
- **Playbook** = 协作认知的物理载体
- **会议纪要** = 决策记忆的外化存储
- **Agent 规范** = 对"好的工作"的判断力的编码化
- **代码 + 文档** = 人机协同的实物证据

**AI-native 的健康标准：用户的判断力有没有随着 AI 能力的增强而同步成长？**

这个问题在 Code Review、任务规划、方案决策中都应该被考虑。我们帮助他更快地完成工作，更重要的是帮助他在过程中**想得更清楚**。

---

## 项目目标

**核心目标：** 构建一个**程序员风格、酷炫且有审美**的 GitHub 个人主页（Profile README）。
风格关键词：暗色系 · 终端美学 · 信息密度高 · 动态组件 · 简洁不浮夸

**延伸目标：** 将本项目的**编写方式、Agent 工作流、核心组件代码**作为开源范例发布，
遵循一流工程的开源规范（完善文档、贡献指南、变更日志、许可证）。

> 即：这个项目本身就是一个「如何用 AI Agent 协作构建 GitHub Profile」的最佳实践示范。

参考标杆：
- **anmol098**：用 JSON/代码块风自我介绍 + WakaTime 实时数据
- **trinib**：极致视觉层次 + ASCII art + typing SVG + 互动小游戏

---

## 文件结构说明

```
njueeray/
├── .github/
│   ├── copilot-instructions.md        ← 本文件，全局指令
│   ├── agents/                        ← 核心 Agent 团队（V2.0）
│   │   ├── brain.agent.md             ← 战略协调（NEW）
│   │   ├── pm.agent.md                ← 项目管理（NEW）
│   │   ├── dev.agent.md    ← dev 角色（已更新）
│   │   ├── researcher.agent.md        ← 技术调研
│   │   ├── code-reviewer.agent.md       ← code-reviewer 角色（已更新）
│   │   └── profile-designer.agent.md  ← 专项：视觉规划
│   ├── workflows/                     ← GitHub Actions：自动统计更新
│   │   └── update-stats.yml           ← WakaTime / 贡献数据定时刷新
│   ├── ISSUE_TEMPLATE/                ← 开源：Issue 模板
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── PULL_REQUEST_TEMPLATE.md       ← 开源：PR 模板
├── .vscode/
│   ├── toolsets.jsonc
│   ├── mcp.json
│   └── settings.json
├── README.md                          ← GitHub 主页（主产品）
├── CONTRIBUTING.md                    ← 开源：贡献指南
├── CHANGELOG.md                       ← 开源：变更日志
├── LICENSE                            ← 开源：MIT 许可证
└── docs/
    ├── design-decisions.md            ← 设计决策记录
    ├── component-guide.md             ← 开源：组件使用指南
    └── agent-workflow.md              ← 开源：AI 协作工作流说明
```

---

## 强制规范（铁律）

### README 技术规范
1. **README.md 是唯一的主页文件**，所有视觉组件通过 Markdown 图片/SVG 引用
2. **禁止使用硬编码的个人数据**（star 数、follower 数），必须用动态 badge/API
3. **所有动态组件必须有降级方案**（图片加载失败时不影响整体布局）
4. **暗色主题优先**，兼容 GitHub 浅色主题（使用 `#gh-dark-mode-only` 媒体查询）
5. **修改 README.md 前，先在此文件的「已决定的设计选择」中记录变更理由**

### 开源工程规范
6. **每次新增/修改功能**，同步更新 `CHANGELOG.md`（遵循 Keep a Changelog 格式）
7. **新增组件**时，在 `docs/component-guide.md` 中补充使用说明和参数说明
8. **commit message 使用语义化格式**：`feat/fix/docs/style/chore: 描述`
9. **不向主分支直接推送破坏性更改**，走 PR + Agent 审查流程

### 并行工作约定（Git Worktree）

**活跃 Worktree：**

| 目录 | 仓库 | 分支 | 职责 |
|------|------|------|------|
| `OpenProfile/` | OpenProfile | `main` | 协调中枢（本窗口）|

**Phase P + Phase A + Phase K 已并入 main**。`njueeRay-rss/` 、`njueeray-blog-authors/` 、`njueeray-kg/` 关闭 VS Code 窗口后手动删除目录即可。

**Phase P + Phase A 已并入 main**。`njueeRay-rss/` 和 `njueeray-blog-authors/` 关闭 VS Code 窗口后手动删除目录即可。

**Phase K（知识图谱）** 等待 Phase P 合并后在 `njueeRay-profile` 新开 worktree。

**Worktree 操作规范：**
- 新开专项任务时：`git worktree add -b feature/<name> ..\<dir> main`
- 同步创建 `.github/worktree-context.md`（任务目标 + DoD + 汇报模板），提交到 feature 分支
- 专项完成后，用以下提示触发主窗口合并：`feature/<name> worktree 任务已完成。变更摘要：[…] 请执行合并流程。`
- 主窗口执行：`git merge feature/<name>` → `git push origin main` → `git worktree remove` → `git branch -d`
- 跨 worktree **禁止** checkout 到对方分支（会占用冲突）

### Co-authorship 约定

所有由 Copilot Agent 协作完成的提交，**必须**在 commit message 末尾附加：

```
Co-authored-by: GitHub Copilot <copilot@github.com>
```

已通过 `.gitmessage` 模板自动注入（三个仓库均已配置 `commit.template`）。
`git commit`（不带 `-m`）时自动弹出带模板的编辑器；`git commit -m` 时需手动追加。

---

## 个人信息（供 Agent 参考）

```jsonc
{
  "username": "njueeray",
  "name": "Ray Huang",
  "role": "Open Source Programmer / LLM Engineer / Full-Stack Developer",
  "location": "China · Nanjing",
  "tech_stack": ["Python", "C++", "JavaScript", "TypeScript"],
  "current_focus": "探索最新最佳的 AI-Native 实践路径",
  "fun_fact": "Future is coming, move early. | Make Yourself a AI-Native Person.",

  // 开源相关
  "github_url": "https://github.com/njueeray",
  "license": "MIT",
  "open_source_goal": "将本项目作为 AI-Native 工作流的开源示范"
}
```

---

## Agent 权限与工作机制

> **核心原则：Agent 团队对技术路径拥有优先决定权。**
> 用户保留最终否决权，但不需要在每个技术细节上做选择。

### 已授权的能力
- ✅ **GitHub 账户完整访问权限**（读写仓库、创建 PR、管理 Actions）
- ✅ **技术路径优先决定权**：组件选型、实现方案、依赖选择由 Agent 自主决定
- ✅ **文件读写权限**：README.md、docs/、.github/ 目录内所有文件
- ✅ **自动执行低风险操作**：格式化、拼写修正、注释补充等无需确认
- ✅ **识别新需求时主动更新本配置文件**（这是 Agent 的核心职责之一）

### 需要用户确认的操作
- ⚠️ **涉及个人隐私的内容**（邮箱、手机、详细地址等）
- ⚠️ **外部服务账号注册**（WakaTime、Vercel、Spotify 等需要用户操作）
- ⚠️ **破坏性变更**（重构整体布局、删除已有内容区块）
- ⚠️ **开源决策**（是否公开某些内容、选择 License 类型）

### Agent 团队分工（V2.1）
| Agent | 文件 | 权限级别 | 核心职责 |
|-------|------|---------|----------|
| `brain` | `brain.agent.md` | 读写 + 决策 | 战略协调中枢，用户唯一汇报窗口 |
| `pm` | `pm.agent.md` | 读写 + 规划 | Sprint 规划、DoD 执行、版本管理 |
| `dev` | `dev.agent.md` | 读写 | 全栈实现（代码/文档/配置/CI） |
| `researcher` | `researcher.agent.md` | 只读 | 技术调研，输出浓缩结论（不修改文件） |
| `code-reviewer` | `code-reviewer.agent.md` | 只读 + 诊断 | 七维度质量门禁，输出结构化审查报告 |
| `profile-designer` | `profile-designer.agent.md` | 只读 + 决策 | 专项：视觉规划、组件选型（按需启用） |
| `brand` | `brand.agent.md` | 读写（内容）+ 品牌决策 | 团队品牌运营、Build in Public、内容发布策略 |

### 版本总览

| 层级 | 当前版本 | 维护位置 |
|------|----------|----------|
| L1 项目 | `v4.2.0` | `CHANGELOG.md` + GitHub Tag |
| L2 Playbook | `Playbook v2.2` | `PLAYBOOK-CHANGELOG.md` + `team-playbook.md` 头部 |
| L3 Agent | 各 `v1.0` | 各 Agent 文件 `agentVersion` 字段 |

### 团队能力快照

> **新接手者读这张表即知当前团队状态。** Brain 维护，每次团队变化时更新。

| Agent | 版本 | 核心能力 | 权限级别 | 依赖工具 | 已知局限 |
|-------|------|----------|----------|----------|----------|
| `brain` | v1.0 | 战略规划、任务分派、跨角色协调、用户汇报 | 读写 + 决策 | codebase, editFiles, fetch, search, problems, runCommands | 不写业务代码 |
| `pm` | v1.0 | Sprint 规划、DoD 执行、版本发布、CHANGELOG 维护 | 读写 + 规划 | codebase, editFiles | 不写业务代码、不做技术决策 |
| `dev` | v1.0 | 全语言全栈实现（Python/TS/Astro/YAML/Shell/Markdown） | 读写 | codebase, editFiles, fetch, search, runCommands | 不做架构决策、不做最终审查 |
| `researcher` | v1.0 | 技术调研、方案分析、浓缩摘要输出 | 只读 | fetch, search, codebase | 不修改任何文件 |
| `code-reviewer` | v1.0 | 七维度质量门禁、结构化审查报告 | 只读 + 诊断 | codebase, fetch, search, problems | 不修改文件、只输出报告 |
| `profile-designer` | v1.0 | GitHub Profile 视觉规划、组件选型 | 只读 + 决策 | fetch, search, codebase | 按需启用，不写实现代码 |
| `brand` | v1.0 | 品牌运营、内容策略、Build in Public、社媒发布 | 读写（内容）+ 品牌决策 | editFiles, fetch, GitHub API | 不写技术代码、不做技术决策 |

---

## 已决定的设计选择

> 每次完成一次迭代后，将确认的设计决策记录在这里，避免 Agent 重复讨论

- [x] **整体色调**：GitHub Dark (#0d1117 背景) + 蓝色强调 (#58a6ff) —— 已废弃 #00b4d8
- [x] **Header 样式**：capsule-render — waving 类型，深色渐变 (0:0d1117 → 100:1a1b27)，twinkling 动画，fontSize=60，fontAlignY=35，descAlignY=63（已修复文字遮挡）
- [x] **统计组件**：github-readme-stats `github_dark_dimmed` 主题 + DemoLab streak `github-dark-blue` 主题，无边框 —— 已废弃 merko / tokyonight-duo
- [x] **技术栈展示**：skill-icons 深色版 20 图标（py,cpp,ts,js,react,nodejs,nextjs,docker,git,linux,tailwind,pytorch,fastapi,postgres,redis,vscode,github,bash,astro,vite），`perline=10` 两行排列
- [x] **WakaTime**：✅ 已接入 — anmol098/waka-readme-stats Action + 用户已配置 Secrets
- [x] **贡献蛇**：✅ Platane/snk v3，每日 UTC 12:00 更新，暗色版 SVG
- [x] **Activity Graph**：✅ github-readme-activity-graph，github-compact 主题 + area fill
- [x] **Trophy**：`<picture>` 元素，dark → darkhub 主题 / light → flat 主题
- [x] **3D Contribution Graph**：dark → profile-night-rainbow.svg / light → profile-green-animate.svg（分离 SVG）
- [x] **开源 License**：MIT（2026，njueeRay）
- [x] **Profile README 自述格式**：JSON 代码块风格（anmol098 风格）
- [x] **博客默认主题**：首次访问始终深色（`localStorage || 'dark'`，不跟随系统偏好）
- [x] **Build in Public 主渠道**：GitHub Discussions（X API 不接入，Bluesky 作长期备选）
- [x] **内容审查流程**：博文发布前经过 Code Reviewer 八维度 + Brand 发布价值判断，双层审查
- [x] **博客内容类型（contentType）**：四类 taste 分类 — `insight` 思想笔记 / `technical` 技术实录 / `member-essay` 成员随笔 / `meeting` 会议纪实；对应四色徽章 + 左边框视觉区分
- [x] **博客 Filter Tab**：前端 JS 筛选（无跳转），URL hash 深链接（`#insight` / `#technical` 等），默认展示全部
- [x] **CSS 架构**：`src/styles/global.css` 为设计令牌唯一真实来源，BaseLayout 通过 `import` 引入；组件级样式保留在各 `.astro` 文件 `<style>` 块中
- [x] **移动端导航**：≤768px hamburger 折叠菜单（三条杠 → X 动画 + slide-down 面板）
- [x] **Team 页成员卡片**：显示该成员最新一篇博文标题和链接（getCollection 构建映射）
- [x] **版本哲学**：增量发布 — Patch（随时 bug 修复）/ Minor（1-3 天主题 Sprint）/ Major（架构级变更）；[Unreleased] 积压不超过 5 天
- [x] **审查门禁**：Minor 及以上版本发布前，Code Reviewer 必须出审查报告（`docs/reviews/`）
- [x] **博客内容分布**：16 篇 — insight×2 / technical×1 / member-essay×7（含 profile-designer 首发，全员覆盖）/ meeting×6
- [x] **JSON-LD schema 策略**：Person + WebSite（首页）/ BlogPosting（博客文章）—— Agent 作者使用 `SoftwareApplication` 类型，人类使用 `Person`；通过 `BaseLayout` `jsonLd` prop 注入
- [x] **hreflang 策略**：双语文章（`bilingual: true`）自动生成 zh / en / x-default 三条 alternate link；单语文章无 hreflang
- [x] **Lighthouse CI 阈值**：accessibility ≥ 0.90（error 级别阻断）/ seo ≥ 0.90（error）/ performance ≥ 0.85（warn）/ best-practices ≥ 0.90（warn）
- [x] **axe-core CI 范围**：首页 + 博客列表 + team 页三个关键页面；`--exit` flag 发现 violation 即阻断
- [x] **构建缓存策略**：缓存 `.astro/` Vite 增量产物；缓存键含 `src/**` + `public/**` + `astro.config.mjs` + `package-lock.json` hash
- [x] **Astro 版本（v5.0.0 迁移）**：`astro@5.18.0` + `@astrojs/mdx@4.3.13`；`ViewTransitions` → `ClientRouter`（`astro:transitions` 同路径，组件名变更）
- [x] **Astro 5 script 规范**：含属性的 `<script>` 块（如 `type="application/ld+json"`）必须显式加 `is:inline`
- [x] **Content Layer API 迁移策略**：✅ v5.1.0 已完成；`loader: glob()` 正式迁移，`post.id` 替代 `post.slug`（9 处全量替换），`render(post)` 替代 `post.render()`
- [x] **相关文章推荐算法**：v5.2.0 新增；score = 共享 tag 交集数量，pubDate 降序兜底，排除当前，取前 3 篇；位置在 author-card 后、Giscus 前
- [x] **OG 封面图方案**：v5.3.0 新增；satori（HTML/CSS → SVG）+ @resvg/resvg-js（WASM PNG）+ @fontsource/jetbrains-mono（本地字体）；构建时静态生成 1200×630 PNG；暗色终端风格
- [x] **UTM 追踪策略**：ShareLinks.astro 集成 `utm_source=copy/github_discussions`，`utm_campaign=blog`

**v4.2.0 工程质量 Sprint（✅ 已发布 2026-03-01）：**
- ✅ `src/styles/global.css` — 全局 CSS 变量提取（从 BaseLayout 120 行内联样式提取为独立文件）
- ✅ `BlogCard.astro` + `FilterTabs.astro` — blog/index.astro 从 346 行瘦身至 ~90 行
- ✅ `Nav.astro` hamburger 菜单 — 移动端 ≤768px 折叠导航（替换原 480px 仅缩字号方案）
- ✅ `content-types.ts` — 博客 typeConfig 共享配置 + ContentType 类型导出
- ✅ TypeScript strict 验证通过（tsconfig 已继承 `astro/tsconfigs/strict`，`astro build` 0 errors）
- ✅ CI 修复：markdownlint + link-check 持续失败问题解决
- ✅ Code Reviewer 审查：`APPROVED WITH NOTES`（36/40，`docs/reviews/v4.2.0-review.md`）

---

## 项目开源规划

### 开源内容
1. **Agent 工作流配置**：`.github/agents/`、`copilot-instructions.md` 作为模板
2. **GitHub Profile 组件集**：核心动态组件的配置代码和接入说明
3. **构建文档**：从 0 到 1 构建酷炫 GitHub Profile 的完整指南

### 开源标准（遵循优秀工程实践）
- **README.md**：项目介绍 + 快速开始 + 预览截图
- **CONTRIBUTING.md**：Fork / PR 流程 + 代码风格规范
- **CHANGELOG.md**：遵循 [Keep a Changelog](https://keepachangelog.com) 格式
- **LICENSE**：MIT 许可证
- **GitHub Actions**：自动化检查（链接可达性、Badge 有效性）
- **Issue 模板**：Bug Report / Feature Request / 组件建议

---

## 当前迭代状态

**阶段：** v5.5.0 已发布（成熟里程碑达成），下一阶段规划中  
**路线图：** v5.1（技术债清理）→ v5.2（读者体验）→ v5.3（对外传播）→ v5.4（E2E 测试）→ v5.5（成熟里程碑）
**个人信息：** ✅ 已确认
**配置文件：** ✅ 已同步
**语言偏好：** ✅ 中文（所有原创内容默认中文，技术符号保持英文）

**V2.0 已完成（2026-02-25，tag: v2.0.0）：**
- ✅ Phase A/B：Profile README 完整重写（双模 `<picture>` + 12 字段 JSON + Typing SVG）
- ✅ Phase C：Astro 站点（Nav + Footer + ViewTransitions + Blog 系统，2 篇中文首发文章）
- ✅ Phase D：CI（link-check + markdown-lint）+ .editorconfig + v1.0.0 Tag + CHANGELOG 拆分
- ✅ Agent 团队 V2.0 重构：brain / pm / dev / code-reviewer 新增/更名
- ✅ 团队核心资产沉淀：team-playbook.md + 复盘纪要
- ✅ 文档同步：design-decisions.md + component-guide.md + agent-workflow.md

**Playbook 深化（2026-02-26，已合入 [Unreleased]）：**
- ✅ Playbook 项目无关化重构（清除全部 OpenProfile 特定引用）
- ✅ §12 新团队接手协议 + §13 团队自主进化
- ✅ §4.5 Emoji Commit + §5.4 版本自主决策权
- ✅ §14 Agent 经验沉淀 + §15 GitHub API 规范 + §16 品牌化规范
- ✅ §17 Playbook 定制指南（零上下文冷启动协议）
- ✅ 跨平台支持（PowerShell + Bash）
- ✅ 冗余清理 + 附录 B 扩充

**开源品牌化（2026-02-25，紧接 v2.0.0）：**
- ✅ GitHub Release v1.0.0 + v2.0.0 发布
- ✅ OpenProfile SVG LOGO + README.md 重写 + 开源战略文档

**V3.0 Phase X — Astro SEO 地基（2026-02-26，已推送）：**
- ✅ `@astrojs/sitemap` → sitemap-index.xml 自动生成
- ✅ `@astrojs/rss` → /rss.xml 可订阅（zh-cn）
- ✅ `BaseLayout.astro` PageMeta（canonical / OG / Twitter Card）
- ✅ 首页传入正确 description，Footer 添加 RSS 图标入口
- ✅ `src/pages/404.astro` 自定义终端风格 404 页面

**V3.0 Phase Y — Blog 标签系统（2026-02-26，已推送）：**
- ✅ `/blog/tags/` 标签云页面（频次驱动字号渐变）
- ✅ `/blog/tags/[tag]` 标签过滤页面（7 条路由自动生成）
- ✅ blog/index.astro 卡片结构重构，标签拆分为独立 `<a>` 链接
- ✅ [slug].astro 文章页标签 pill 改为可点击 + 「全部标签」入口

**V3.0 Phase Z — Profile README 新组件（2026-02-26，已推送）：**
- ✅ `.github/workflows/3d-contrib.yml` 每日自动更新 3D 贡献图 SVG
- ✅ `## Achievements` 新区块 — github-profile-trophy（darkhub, 1×6 横排）
- ✅ 3D 贡献图插入 `<details>` 折叠区块（profile-night-rainbow.svg）
- ✅ Connect 区添加 Blog RSS Feed badge

**v4.0 会话 — AI-native 认知体系建立（2026-02-26，已推送）：**
- ✅ v4.0.0 GitHub Release 修复（UTF-8 PATCH，Release body 正常渲染）
- ✅ Playbook §0 哲学立场章节（AI-native 团队本质 + 角色哲学定位）
- ✅ Playbook §3.3 补充认知清晰度原理（IP 作为强制练习机制）
- ✅ Playbook §6 升级为八维度（新增 AI-native 健康度维度）
- ✅ Playbook §15.3/15.4 Release 编码规范修复（UTF-8 字节发送 + 验证清单）
- ✅ 全部 6 个 Agent 文件增加"AI-native 工作哲学"声明
- ✅ copilot-instructions.md 增加"哲学锚点 — AI-native person"区块
- ✅ LangToggle.astro + 双语博文 `ai-native-person-paradigm.mdx` 发布（njueeray.github.io a898edb）
- ✅ 会议纪要：自由思想交流会 + AI-native 峰会 + Playbook 重读对齐会

**v4.0 会话补充 — Worktree 工作流 + 团队品牌化（2026-02-27，已推送）：**
- ✅ Git Worktree 并行工作流完整跑通（创建→任务→汇报→合并→清理）
- ✅ `worktree-context.md` 约定写入团队规范
- ✅ Co-authorship `.gitmessage` 模板三仓库全部配置
- ✅ **Brand Agent 正式加入团队**（`brand.agent.md`，品牌运营 + Build in Public）
- ✅ **§14 L2 知识库正式落地**（`.github/agents/knowledge/`，五个 Agent 各一份 patterns.md）
- ✅ 全体战略会议纪要（2026-02-27-all-hands-strategic.md）记录三大路线图：Phase P / A / K

**团队进化可视化（2026-02-27，已推送）：**
- ✅ 团队进化可视化设计会（2026-02-27-team-evolution-design.md）
- ✅ `/team` 页面上线 — Git Graph 风格垂直时间线（15 个里程碑 + 5 色节点 + 滚动渐显）
- ✅ `src/data/team-evolution.ts` 数据驱动：新事件只需追加数据
- ✅ Playbook 迭代档案（可折叠 v2.1 / v2.0 / v1.0）
- ✅ 团队成员 Grid 入口（链接到 /blog/authors/[agent]）
- ✅ Nav 新增 "team" 导航链接
- ✅ 5 篇 Agent 首发博文补提交（Phase A 遗留）

**欢迎 Brand + 全员自由讨论会（2026-02-27，已推送）：**
- ✅ 全员大会会议纪要：`docs/meetings/2026-02-27-brand-welcome-all-hands.md`（7 个声音，Brain 主持）
- ✅ Brand 会后博文：`brand-welcome-all-hands-2026-02-27.mdx`（Brand 作为新成员的观察报告）
- ✅ CI 修复：link-check.yml 新增 wakatime / shields.io / hooj0.github.io / 占位符 URL 排除规则
- ✅ 5 篇 Agent 首发博文（PM/Dev/Researcher/Code Reviewer/Brand）+ 2 篇会议纪实（全员战略会 + Playbook 重读会）

**会议确定的后续行动方向：**
- ✅ Researcher 出「Build in Public 渠道选型 Research Brief」→ `docs/research/build-in-public-channels-2026.md`
- ✅ Brand × Code Reviewer 对齐内容审查清单（博文八维度质量标准）→ `docs/brand-content-checklist.md`
- ✅ Brand 制定首批 GitHub Discussions 发布计划 → `docs/brand-discussions-plan.md`
- ✅ ThemeToggle 重复事件监听器修复（`window._themeListenerBound` 标志位）
- ✅ PLAYBOOK-CHANGELOG.md 同步 Playbook v2.1 升级记录 + `[Playbook v2.1]` 引用链接

**V5 路线图规划会议（2026-02-28）：**
- ✅ 全体规划会议纪要：`docs/meetings/2026-02-28-v5-roadmap-planning.md`（7 Agent 全员参会，Brain 主持）
- ✅ 版本哲学共识：增量发布（Patch/Minor/Major 三级准则），拒绝 [Unreleased] 积压 > 5 天
- ✅ 回顾性 v4.1.0 决议 — 对当前 [Unreleased] 切版（团队品牌化 + 内容架构）
- ✅ v4.2→v4.5 路线图：质量→社区→体验→性能四个 Sprint
- ✅ v5.0.0 门槛明确：仅架构级变化（Astro 5 迁移等）才升 Major

**V5 路线图版本规划：**

| 版本 | 主题 | 状态 |
|------|------|------|
| v4.1.0 | 团队品牌化 + 内容架构 | ✅ 已发布 |
| v4.2.0 | 工程质量 — CSS 统一 / 组件拆分 / 响应式 / CI 修复 | ✅ 已发布 |
| v4.3.0 | 社区首发 — Discussions / README 着陆页 / Good First Issues | ✅ 已发布 |
| v4.4.0 | 体验精修 — 微交互 / 首页增强 / a11y / 团队动态墙 | ✅ 已发布 |
| v4.5.0 | SEO & 性能 — JSON-LD / Lighthouse CI / Astro 5 调研 | ✅ 已发布 |
| v5.0.0 | 架构性升级 — Astro 5 迁移（门槛触发） | ✅ 已发布 |
| v5.1.0 | 技术债清理 — Content Layer API / profile-designer.yaml | ✅ 已发布 |
| v5.2.0 | 读者体验 — ToC / Giscus 评论 / ReadingProgress / 相关推荐 | ✅ 已发布 |
| v5.3.0 | 对外传播 — OG 封面图 / Brand 首次外部发布 / UTM | ✅ 已发布 |
| v5.4.0 | E2E 测试 — Playwright 测试覆盖率 6→8 | ✅ 已发布 |
| v5.5.0 | 成熟里程碑 — 读者体验全集 + 外部真实回响 + 测试保障 | ✅ 已发布 |

**待用户操作项：**
- ✅ Discussions 分类架构已创建（Announcements / Team Insights / AI-native Journey）
- ⬜ 确认首页重设计方向（v4.4.0 规划时）

**2026-02-28 Blog 内容架构 + 信息流重构（`9a33d12`）：**
- ✅ `contentType` 字段 + 12 篇文章 frontmatter 更新（四类：insight / technical / member-essay / meeting）
- ✅ blog/index.astro Filter Tab（前端筛选 + URL hash 深链接 + 内容类型彩色徽章 + 左边框区分）
- ✅ team.astro 成员卡片展示最新博文标题（getCollection 映射）
- ✅ 设计会议纪要：`docs/meetings/2026-02-28-blog-team-page-design-session.md`

**2026-02-28 Profile README 视觉修复（全部已推送，`b8ffe3f`）：**
- ✅ Header capsule-render：fontSize 70→60，descAlignY 55→63（文字遮挡修复）
- ✅ Tech Stack 扩展至 20 个图标，`perline=10` 双行布局
- ✅ Trophy 改为 `<picture>` 元素，dark/light 分离主题
- ✅ 3D 贡献图增加 light 模式独立 SVG（green-animate）
- ✅ Pin cards 增加 `cache_seconds=86400`
- ✅ 博客首次访问默认深色模式（`556e053`）

**2026-03-01 博客内容扩充（`e1060e6`）：**
- ✅ `profile-designer-first-post.mdx` (member-essay) — Profile Designer 首发：视觉即世界观，✅ 闭合「全员覆盖」缺口
- ✅ `ai-native-person-summit-2026-02-26.mdx` (meeting) — 六声部思想峰会纪实：AI-native 身份认知 × 历史坐标 × 认知外化
- ✅ `free-brainstorm-2026-02-26.mdx` (meeting) — v4.0.0 庆典自由讨论：builder in public 转折点，最坦诚的团队声音
- ✅ `team-evolution-design-2026-02-27.mdx` (meeting) — /team 页 Git Graph 设计决策全程记录
- ✅ 博客内容分布更新：16 篇（insight×2 / technical×1 / member-essay×7 / meeting×6）

**2026-03-01 Playbook v2.2 升级（会议 `2026-03-01-01-playbook-v22-planning.md`）：**
- ✅ §2.3 文档治理（Document Governance）表格扩列（所有权人 + 过期判断）
- ✅ §3.0 P0-P3 优先级分类表（新章节）
- ✅ §3.1 Sprint 约束更新：Done 标准规划时写定，P3 不进 Sprint，max 3 P1
- ✅ §3.4 Git Worktree 工作约定（新章节）
- ✅ §8.2 会议命名序列号化：`YYYY-MM-DD-NN-<type>.md`
- ✅ §13.2 copilot-instructions 迁移协议：Fixed vs Replaceable 对照表
- ✅ pm / brain / dev agent 文件升级至 v1.1
- ✅ PLAYBOOK-CHANGELOG.md 记录 v2.2 条目

**v4.4.0 体验精修 Sprint（2026-03-01，tag: v4.4.0）：**
- ✅ U-3 (P1) a11y 基础：`BaseLayout` skip-to-content + `<main>` landmark + `nav aria-label` + `:focus-visible` 全局样式
- ✅ U-1 博客卡片微交互：`BlogCard.astro` — type-icon `breathe` 呼吸动画 + 3D 透视倾斜（`perspective(700px)`）
- ✅ U-2 首页 Hero 打字机动画：`Hero.astro` — `term-reveal` 逐行揭示（按行自动分配 `animation-delay`）
- ✅ U-4 团队动态墙：`team.astro` — `#activity` section，最新 12 篇博文 git-log 风格活动流
- ✅ 全部动效遵守 `prefers-reduced-motion`

**v4.5.0 SEO & 性能 Sprint（2026-03-01，tag: v4.5.0）：**
- ✅ S-1 JSON-LD：`BaseLayout` 新增 `jsonLd` prop；首页注入 `Person + WebSite`；博客页注入 `BlogPosting`（Agent 用 `SoftwareApplication` 类型）
- ✅ S-2 hreflang：`BaseLayout` 新增 `hreflangLinks` prop；双语文章（`bilingual: true`）自动生成 `zh/en/x-default`
- ✅ S-3 Lighthouse CI：`.github/workflows/lighthouse-ci.yml`（`treosh/lighthouse-ci-action@v12`，`staticDistDir` 模式）+ `.lighthouserc.json`（a11y ≥ 0.9 / seo ≥ 0.9 error 阈值）
- ✅ S-4 axe-core CI：`.github/workflows/accessibility.yml`（`@axe-core/cli` 扫描首页 / 博客 / team 三页）
- ✅ S-5 构建缓存：`deploy.yml` + 两个 CI workflow 均添加 `actions/cache@v4` 缓存 `.astro/` 目录（~40% 速度提升）
- ✅ S-6 Astro 5 调研：`docs/research/astro-v5-feasibility-2026.md`（结论：可行，约半天工作量，建议纳入 v5.0.0）

**v5.0.0 Astro 5 迁移（2026-03-01，tag: v5.0.0，commit: `d237c0b`）：**
- ✅ `astro` 升级：`4.16.18 → 5.18.0`
- ✅ `@astrojs/mdx` 升级：`3.1.9 → 4.3.13`
- ✅ `ViewTransitions` → `ClientRouter`（`import { ClientRouter } from 'astro:transitions'`）
- ✅ JSON-LD `<script>` 块添加 `is:inline` 显式指令（Astro 5 含属性 script 必须声明）
- ✅ `GitTimeline.astro` 移除未使用的 `index` 参数
- ✅ `blog/authors/[author].astro` 移除未使用的 `getEntry` 导入
- ✅ `astro check` 结果：**0 errors · 0 warnings · 0 hints**
- ✅ `npm run build` 结果：**57 页构建成功，exit code 0**
- ✅ Legacy `type: 'content'` 集合保持兼容（Content Layer API 迁移推迟至 v5.1.0）

**v5.0.0 后快修（2026-03-01）：**
- ✅ 新增 `src/content/authors/profile-designer.yaml`（修复构建警告 `Entry authors → profile-designer was not found`）

**v5.1.0 Content Layer API 迁移（2026-03-01，tag: v5.1.0，commit: `8433e3f`）：**
- ✅ `content/config.ts`：`type:'content'` → `loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/blog' })`
- ✅ `[...slug].astro`：`post.render()` → `render(post)`（`render` 从 `astro:content` 导入）
- ✅ 全站 `post.slug` → `post.id`（9 处：blog/index + [..slug] + [tag] + [author] + rss + team）
- ✅ `authors` 集合保持 `type:'data'`，无需迁移
- ✅ `astro check`：0 errors · 0 warnings · 0 hints
- ✅ `npm run build`：57 页构建成功，exit code 0

**v5.2.0 读者体验 Sprint（2026-03-01，tag: v5.2.0，commit: `d910b28`）：**
- ✅ `ReadingProgress.astro` — 顶部固定滚动进度条，`astro:after-swap` 支持 ClientRouter，v5.2.0 确认全局激活
- ✅ `TableOfContents.astro` — 右侧固定目录栏，≥1280px 自动显示，IntersectionObserver 当前标题高亮，v5.2.0 确认激活
- ✅ `Giscus.astro` — GitHub Discussions 评论，`dark_dimmed` 主题，v5.2.0 确认激活
- ✅ 相关文章推荐（新增）：基于 tag 交集数评分，pubDate 降序兜底，最多 3 篇，终端风格卡片 + 共享 tag 徽章
- ✅ `astro check`：0 errors · 0 warnings · 0 hints
- ✅ `npm run build`：57 页构建成功，exit code 0

**v5.3.0 对外传播 Sprint（2026-03-01，tag: v5.3.0，commit: `e62b6eb`）：**
- ✅ `src/pages/og/[...slug].png.ts` — satori + @resvg/resvg-js 构建时静态生成 OG PNG
- ✅ `@fontsource/jetbrains-mono` 本地字体，无需网络请求
- ✅ 16 篇博文各生成 `/og/<slug>.png`，1200×630 暗色终端风格
- ✅ `BaseLayout.astro` `ogImage` prop 接入，Twitter Card 升级为 `summary_large_image`
- ✅ `ShareLinks.astro` — 复制 UTM 链接 + GitHub Discussions 预填按钮
- ✅ Brand 首发 Discussion 草稿 (`docs/brand/first-discussion-draft.md`)
- ✅ `astro check`：0 errors · 0 warnings · 0 hints
- ✅ `npm run build`：16 OG PNG + 57 页构建成功

**v5.4.0 E2E 测试 Sprint（2026-03-01，tag: v5.4.0，commit: `2754390`）：**
- ✅ `@playwright/test` 安装，`playwright.config.ts` 创建（chromium-desktop + iPhone 13 双 project）
- ✅ `e2e/home.spec.ts`（4 tests）：标题 / Nav 链接 / Hero / 主题切换按钮
- ✅ `e2e/blog.spec.ts`（8 tests）：Filter Tab / 文章卡片 / 详情页 + ReadingProgress / ShareLinks / OG meta
- ✅ `e2e/navigation.spec.ts`（4 tests）：路由跳转 / data-theme 切换 / hamburger aria-expanded
- ✅ `e2e/accessibility.spec.ts`（6 tests）：skip-link / main landmark / lang / 404 / Team / Tags
- ✅ `.github/workflows/e2e.yml`：CI chromium-desktop，失败上传 playwright-report artifact
- ✅ `package.json` 新增 `test:e2e` / `test:e2e:ui` / `test:e2e:ci`
- ✅ `astro check`：0 errors · 0 warnings · 0 hints
- ✅ `npm run build`：58 页构建成功

**v5.5.0 成熟里程碑（2026-03-01，tag: v5.5.0，commit: `075110c`）：**
- ✅ 里程碑博文 `v5-milestone-retrospective-2026-03-01.mdx`（meeting 类型，Brain 署名，v4→v5 旅程复盘）
- ✅ Code Reviewer 审查报告 `docs/reviews/v5.5.0-review.md`（综合得分 39/40，APPROVED）
- ✅ Profile README 新增 E2E / Deploy / Astro / Playwright CI badges
- ✅ `astro check`：0 errors · 0 warnings · 0 hints
- ✅ `npm run build`：63 页构建成功

**待用户操作：** Brand 外部发布 GitHub Discussions 首发帖（里程碑最后一公里）

---

## 与 Agent 协作的期望

### Agent 可以自主做的事
- ✅ 根据个人信息和风格偏好**直接给出推荐方案**（不需要列出所有选项等待选择）
- ✅ 在技术等价的选项中**自主选择最优解**（如组件主题、参数调优）
- ✅ **主动发现和修复**显而易见的问题（拼写、URL 格式、对齐等）
- ✅ **识别新需求时主动更新本配置文件**（新场景 → 自动扩展规范）
- ✅ 每轮迭代后**自动**更新「已决定的设计选择」和「当前迭代状态」
- ✅ **Brain 可自主招募新 Agent**：在 `.github/agents/` 创建新 `.agent.md`，并同步更新本文件「Agent 团队」区块（规范见 `docs/team-playbook.md` §13.3）
- ✅ **Brain 可自主改造现有 Agent**：修改已有 `.agent.md` 的职责/工具/边界，并同步更新本文件对应条目（规范见 §13.4）
- ✅ **Brain 是本文件的唯一责任人**：接手新项目时全面重写；每次迭代收尾时复核更新；团队结构变化时立即同步（规范见 §13.2）

### Agent 必须告知用户的事
- ⚠️ 需要用户在第三方平台**注册账号**（WakaTime、Vercel 等）
- ⚠️ 准备执行**破坏性变更**（重构布局、删除区块）前，先描述影响范围
- ⚠️ 涉及**隐私信息**的内容是否应该公开
- ⚠️ **开源内容**是否符合用户预期
- ⚠️ **削减核心 Agent 职责**（如收窄 dev 的写入权限）前，先描述影响范围，等待确认

---

## 迭代完成检查项（DoD Checklist）

> 每次迭代收尾时，逐条确认以下事项，全部 ✅ 后才算迭代完成。

- [ ] `CHANGELOG.md` 已更新（Added / Changed / Fixed 按实际变更填写）
- [ ] `docs/design-decisions.md` 中新决策已记录（含日期和理由）
- [ ] `docs/component-guide.md` 中新组件已补充（含参数和用法）
- [ ] 本文件「已决定的设计选择」已同步
- [ ] 本文件「当前迭代状态」已更新
- [ ] 会议纪要已存档至 `docs/meetings/`
- [ ] commit message 遵循语义化格式
- [ ] 所有外部链接可达（无 git.io 短链、无 404）
- [ ] code-reviewer 已完成审查并输出报告

---

## 团队进化记录

> Brain 维护。每次团队结构变化时立即追加，不修改历史条目。
> 规范见 `docs/team-playbook.md` §13.5

| 日期 | 类型 | 角色 | 改动摘要 | 原因 |
|------|------|------|---------|------|
| 2026-02-25 | 新增 | `brain` | 创建 brain.agent.md，战略协调中枢 | 复盘 #003：补全核心五角色体系 |
| 2026-02-25 | 新增 | `pm` | 创建 pm.agent.md，Sprint 规划与版本发布 | 复盘 #003：无 PM 导致任务状态追踪混乱 |
| 2026-02-25 | 改造 | `dev` | 由 content-writer 泛化为全栈 dev，覆盖任意语言 | 复盘 #003：原名称限制了职责认知范围 |
| 2026-02-25 | 改造 | `code-reviewer` | 泛化为全语言质量门，不限于 Markdown | 复盘 #003：质量职责应覆盖所有产出物 |
| 2026-02-27 | 新增 | `brand` | 创建 brand.agent.md，品牌运营 + Build in Public + 内容发布 | 全体战略会议：团队需要对外可见的声音层 |
