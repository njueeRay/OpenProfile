# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

---

## [3.0.0] — 2026-02-26

> **里程碑：Playbook 从项目绑定文档升级为可移植的团队方法论框架。**

### Added
- `docs/team-playbook.md` 新增 §12 新团队接手协议（Project Onboarding Protocol）
  - 四阶段流程：静默阅读 → 对齐会议 → 状态报告 → 团队适配
  - 各角色阅读清单与私有笔记格式
  - 对齐会议纪要模板 + 项目状态报告输出格式
- `docs/team-playbook.md` 新增 §13 团队自主进化（Team Self-Evolution）
  - Brain 确立为团队架构师：可自主招募/改造/停用 Agent
  - Brain 确立为 `copilot-instructions.md` 唯一责任人
  - 新 Agent 文件最小结构规范 + 改造步骤 + 进化记录表
- `docs/team-playbook.md` 新增 §4.5 Emoji Commit 倡议
  - 15 种 emoji 与 commit 类型对照表 + 5 条示例
- `docs/team-playbook.md` 新增 §5.4 团队自主版本决策权
  - PM 主动识别的 4 条发版信号 + Brain 版本提案标准格式
- `docs/team-playbook.md` 新增 §14 Agent 经验沉淀机制
  - L1/L2/L3 三层知识体系 + 各角色沉淀重点 + L2 文件结构规范
- `docs/team-playbook.md` 新增 §15 GitHub API 操作规范
  - API/CLI/手动选择矩阵 + 跨平台 Token 提取（PowerShell + Bash）
  - 创建 Release / 设置 Topics / 更新描述的完整脚本
- `docs/team-playbook.md` 新增 §16 开源项目品牌化规范
  - 品牌化时机判断 + Logo 规格 + 话题标签策略 + Badge 套件
- `docs/team-playbook.md` 新增 §17 Playbook 定制指南
  - 直接复用 vs 需定制的章节矩阵
  - 零上下文冷启动协议（全新空白仓库）
  - Playbook 版本管理策略
- 附录 B 扩充 3 条新反模式（经验不分级 / 被动发版 / 手动操作不记录）
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
- Playbook 版本标识更新为 v3.0.0
- `copilot-instructions.md` 迭代状态更新（Playbook 完整版 v3）

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
| **v3.0.0** | **V3.0：Playbook 项目无关化 + 17 章节完整版 + 可移植团队方法论** | ✅ 完成 |

---

[Unreleased]: https://github.com/njueeRay/OpenProfile/compare/v3.0.0...HEAD
[3.0.0]: https://github.com/njueeRay/OpenProfile/compare/v2.0.0...v3.0.0
[2.0.0]: https://github.com/njueeRay/OpenProfile/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/njueeRay/OpenProfile/releases/tag/v1.0.0
