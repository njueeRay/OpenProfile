# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

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

### Changed
- Hero 组件优化：添加技术栈标签、zsh 风格提示符、GitHub 图标按钮

### Fixed
- Astro 版本从 5.x 降级至 4.16.18（解决 `ohash@^2.0.11` 依赖缺失问题）
- OpenProfile git 根目录修复（从父目录移动到独立仓库）

---

## 版本规划

| 版本 | 目标 | 状态 |
|------|------|------|
| v0.1.0 | 项目初始化：目录结构 + Agent 配置 | ✅ 完成 |
| v0.2.0 | 首版 README：基础信息 + Stats 组件 | 🔄 进行中 |
| v0.3.0 | 视觉升级：Header 动画 + 技术栈图标 | ⏸️ 待开始 |
| v0.4.0 | 动态数据：WakaTime 编程统计 | ⏸️ 待开始 |
| v1.0.0 | 开源发布：完整文档 + 组件指南 | ⏸️ 待开始 |

---

<!-- 版本链接（待发布第一个 tag 后取消注释）
[Unreleased]: https://github.com/njueeray/njueeray/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/njueeray/njueeray/releases/tag/v0.1.0
-->
