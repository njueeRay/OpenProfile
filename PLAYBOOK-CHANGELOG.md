# Playbook Changelog

独立记录 Team Playbook（L2 层）的版本变更。与项目版本（L1 层）解耦。

格式遵循 [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)。

---

## [Unreleased]

### Added
- `docs/brand-content-checklist.md` — 博文八维度内容审查清单（Brand × Code Reviewer 联合制定，正式生效）
- `docs/research/build-in-public-channels-2026.md` — Build in Public 渠道选型 Research Brief（Researcher）
- `docs/brand-discussions-plan.md` — Brand 首批 GitHub Discussions 发布计划

### Changed
- team-playbook.md §13.6（待补充）— Brand Agent 工作流集成，发布决策链写入 Playbook 职责定义

---

## [Playbook v2.1] — 2026-02-26

> **AI-native 哲学体系嵌入 + 八维度质量门 + Release 编码规范修复**
>
> 在 AI-native person 峰会后，全员重读 Playbook 并识别出哲学基础层缺失问题。
> 本次升级将 AI-native 世界观从博文层落入工具层。

### Added
- §0 哲学立场章节（全新）：AI-native 团队本质 · 与工具依赖的根本区别 · 每个角色的哲学定位
- §3.3 Implementation Plan 规范补充：认知清晰度原理说明（"写 IP 是强制练习"）
- §6 第八维度：AI-native 健康度（判断力委托陷阱检查）→ 由此更名为"八维度质量门"
- 6 个 Agent 文件均新增 `## AI-native 工作哲学` 声明

### Fixed
- §15.3 Release 创建脚本：修复 JSON 序列化编码问题，改用 UTF-8 字节发送模式
- §15.4 PM Release 清单：新增编码验证步骤 + 乱码快速修复指引
- 核心原则添加"AI-native 哲学立场"

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
[Playbook v2.1]: https://github.com/njueeRay/OpenProfile/compare/v3.0.0...v4.0.0
[Playbook v2.0]: https://github.com/njueeRay/OpenProfile/compare/v2.0.0...v3.0.0
[Playbook v1.0]: https://github.com/njueeRay/OpenProfile/releases/tag/v2.0.0
