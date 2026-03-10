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

**当前默认工作区：** `OpenProfile/`（`main`）

**Worktree 操作规范：**
- 新开专项任务时：`git worktree add -b feature/<name> ..\<dir> main`
- 同步创建 `.github/worktree-context.md`（任务目标 + DoD + 汇报模板），提交到 feature 分支
- 专项完成后，用以下提示触发主窗口合并：`feature/<name> worktree 任务已完成。变更摘要：[…] 请执行合并流程。`
- 主窗口执行：`git merge feature/<name>` → `git push origin main` → `git worktree remove` → `git branch -d`
- 跨 worktree **禁止** checkout 到对方分支（会占用冲突）

### Co-authorship 约定

所有 Copilot Agent 协作提交，末尾必须附加 `Co-authored-by: GitHub Copilot <copilot@github.com>`。`git commit`（无 `-m`）自动注入；`git commit -m` 时手动追加。

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
- [x] **expressive-code 主题**：`astro-expressive-code` + `github-dark-dimmed` 主题，`borderRadius: 6px`，copy button accent 色匹配 `--color-accent`（v5.8.0）
- [x] **Callout 组件**：四类（tip/warning/info/note），终端风 icon + uppercase 标签 + 对应色系（v5.8.0）
- [x] **阅读时长算法**：中文 500 字/分钟 + 英文 200 词/分钟，剥离 frontmatter/代码块/HTML 标签（v5.8.0）
- [x] **SeriesNav 位置**：文章详情页 author-card 后、相关文章前；仅当 series + seriesOrder 且系列 > 1 篇时渲染（v5.8.0）
- [x] **博客搜索快捷键**：`Ctrl+K` + `/`（后者跳过 input/textarea/contentEditable 场景）；Nav 搜索按钮 title 同步提示
- [x] **系列 URL 策略**：`/blog/series/[encodeURIComponent(seriesName)]`，支持中文系列名
- [x] **归档页设计**：年/月分组，type-dot 圆点色彩编码 + 系列文章显示 `⊃` badge
- [x] **博客页头发现导航**：`# 标签 / ▶ 系列 / ⌥ 归档` 三连 pill 链接（替换原单个「全部标签」链接）
- [x] **OG 封面图方案**：v5.3.0 新增；satori（HTML/CSS → SVG）+ @resvg/resvg-js（WASM PNG）+ @fontsource/jetbrains-mono（本地字体）；构建时静态生成 1200×630 PNG；暗色终端风格
- [x] **UTM 追踪策略**：ShareLinks.astro 集成 `utm_source=copy/github_discussions`，`utm_campaign=blog`
- [x] **Claude Code Hooks 配置**：`.github/settings.json` 定义 4 个质量门禁 hooks — `TeammateIdle`（DoD 评估）/ `TaskCompleted`（DoD 验证）/ `Stop`（防止提前停止）/ `SessionStart`（注入项目上下文）；hooks 使用 `type: "prompt"` 做语义判断，避免复杂脚本维护
- [x] **Agent Skills 架构**：`.github/skills/` 目录下 7 个 SKILL.md（每个 Agent 一个），遵循 Anthropic Agent Skills 开放标准（`agentskills.io`）；统一纳入 `.github/` 治理体系（与 `agents/` `workflows/` 平级），能力从「内部配置」升级为「可发现模块」
- [x] **MCP 扩展 — agent-skill-loader**：`.vscode/mcp.json` 新增 `agent-skill-loader` MCP，Agent 可通过 `list_skills/read_skill/install_skill` 动态发现和加载技能库
- [x] **PostToolUse Hooks（P1 扩展）**：`.github/settings.json` 新增两条异步 PostToolUse hook — ① `command` 类型调用 `.github/hooks/lint-markdown.ps1`（Write/Edit 触发 markdownlint）；② `agent` 类型自动保存关键文件变更到 Memory MCP（mengram 模式）
- [x] **forage MCP（P2 路线图）**：`isaac-levine/forage-mcp` — Agent 自动搜索/安装/学习 MCP 工具的 find-skills 最佳实践；关键能力：`forage_search/forage_install/forage_learn`，安装后无需重启即可获取新工具
- [x] **会议文件命名规范**：`YYYY-MM-DD-NN-<type>.md`，序号 NN 为**当日序号**，每天从 01 重新计数，禁止跨日连续编号
- [x] **self-improvement skill**：`.github/skills/self-improvement/SKILL.md`；用户说「复盘」时触发七维度自评，跨项目教训写入 `/memories/lessons-learned.md`，OpenProfile 特定教训写入 `/memories/repo/openprofile-lessons.md`
- [x] **Meeting #09 校准结论**：会议纪要长度因会而异，深度和沉淀优先于效率指标；Playbook 回归「可移植的冷启动手册」定位，去除项目特定内容，假设用户对下一个项目一无所知

---

## 当前迭代状态

**语言偏好：** 中文（所有原创内容默认中文，技术符号保持英文）

**北极星 = B（AI-native 工作方式示范）：** 核心目标是展示「AI-native person 如何工作」。所有版本决策、体系设计均以「是否推进 AI-native 工作方式示范」为第一判断标准。

> 完整历史见 `CHANGELOG.md` · 会议决议见 `docs/meetings/` · 活跃待办见 `docs/governance/sprint-board.md`

---

## 与 Agent 协作的期望

### Agent 可以自主做的事
- ✅ 根据个人信息和风格偏好**直接给出推荐方案**（不需要列出所有选项等待选择）
- ✅ 在技术等价的选项中**自主选择最优解**（如组件主题、参数调优）
- ✅ **主动发现和修复**显而易见的问题（拼写、URL 格式、对齐等）
- ✅ **识别新需求时主动更新本配置文件**（新场景 → 自动扩展规范）
- ✅ 每轮迭代后**自动**更新「已决定的设计选择」和「当前迭代状态」
- ✅ **Brain 负责维护本文件和 Agent 团队**：招募/改造 Agent 时同步更新，规范见 `docs/team-playbook.md` §13

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


