# Playbook Changelog

独立记录 Team Playbook（L2 层）的版本变更。与项目版本（L1 层）解耦。

格式遵循 [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)。

---

## [Unreleased]

---

## [Playbook v2.0] — 2026-02-26

> **三层版本体系建立 + 招募决策树 + Agent 能力快照卡 + 冷启动升级**
>
> 这是 Playbook 独立版本体系的第一个正式版本。
> 之前所有 Playbook 内容随项目 v1.0.0–v3.0.0 一同发布，从本版起独立追踪。

### Added
- §18 版本体系规范（三层独立版本：L1 项目 / L2 Playbook / L3 Agent）
- 附录 C Agent 能力快照卡格式规范
- §13 招募决策树：任务缺口 → Agent 矩阵 → 缺口识别 → 招募优先级
- §17.3 冷启动协议 Step 3 扩充：评估快照 → 缺口识别 → 招募 SOP
- `PLAYBOOK-CHANGELOG.md`（本文件）：Playbook 独立变更记录

### Changed
- Playbook 头部版本号从「持续更新（随项目版本发布）」改为独立版本 `Playbook v2.0`
- §17.4 版本管理章节重写，引用 §18 三层版本规范
- 所有 Agent 文件头部新增 `agentVersion` 元数据字段

---

## [Playbook v1.0] — 2026-02-26（追溯）

> **追溯标记。** 此版本对应项目 v3.0.0 发布时的 Playbook 状态。

### Included（追溯记录）
- §1–§11 核心章节（团队拓扑 / 会话连续性 / 任务流程 / Commit 规范 / 版本发布 / Code Review / CI / 会议 / Pre-flight / DoD / 核心资产）
- §12 新团队接手协议
- §13 团队自主进化（基础版，无招募决策树）
- §14 Agent 经验沉淀机制
- §15 GitHub API 操作规范
- §16 开源项目品牌化规范
- §17 Playbook 定制指南（基础冷启动协议）
- 附录 A 升级路径 + 附录 B 反模式警示
- 项目无关化重构完成

---

[Unreleased]: https://github.com/njueeRay/OpenProfile/compare/v4.0.0...HEAD
[Playbook v2.0]: https://github.com/njueeRay/OpenProfile/compare/v3.0.0...v4.0.0
[Playbook v1.0]: https://github.com/njueeRay/OpenProfile/releases/tag/v3.0.0
