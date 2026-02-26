# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

### Docs
- `docs/meetings/2026-02-26-v4-planning.md` — V4.0 全体规划会议纪要（三层版本体系决议 + Phase V/W/P 执行计划）

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
| **v2.0.0** | **V2.0：叙事重构 + 浅色兼容 + Astro 多页 + CI + Agent 团队重构** | ✅ 完成 |
| **v3.0.0** | **V3.0：SEO 地基 + Blog 标签系统 + Profile 新组件 + Playbook 可移植化** | ✅ 完成 |

---

[Unreleased]: https://github.com/njueeRay/OpenProfile/compare/v3.0.0...HEAD
[3.0.0]: https://github.com/njueeRay/OpenProfile/compare/v2.0.0...v3.0.0
[2.0.0]: https://github.com/njueeRay/OpenProfile/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/njueeRay/OpenProfile/releases/tag/v1.0.0
