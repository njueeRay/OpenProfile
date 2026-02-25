# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

### Added
- Profile README 区块顺序重组（V2.0 新顺序）
- Profile README 添加 `<picture>` 双模（暗/亮）兼容：Header / Footer / Stats / Streak / Activity Graph / Skill Icons / Featured / 贡献蛇
- Profile README JSON 自述扩展至 12 字段 + 英文叙事段
- Profile README Typing SVG 文案改为个人身份标签
- Profile README WakaTime 改为 `<details>` 折叠区块，附 fallback 说明
- Profile README 新增 🤝 Connect with Me 区块（Portfolio + GitHub + OpenProfile badge）
- Profile README 新增页面浏览计数器（komarev.com）
- Profile README 新增三处 capsule-render 渐变分隔线

---

## [1.0.0] — 2026-02-25

### Added
- 初始化项目目录结构
- 创建 `.github/copilot-instructions.md` 主指令文件
- 创建 `.github/agents/` 专项 Agent 团队（profile-designer、content-writer、researcher、qa-reviewer）
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
| **v2.0.0** | **V2.0：叙事重构 + 浅色兼容 + Astro 多页 + CI** | 🏗️ 进行中 |

---

[Unreleased]: https://github.com/njueeRay/OpenProfile/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/njueeRay/OpenProfile/releases/tag/v1.0.0
