# Playbook Changelog

独立记录 Team Playbook（L2 层）的版本变更。与项目版本（L1 层）解耦。

格式遵循 [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)。

---

## [Unreleased]

---

## [Playbook v2.2] — 2026-03-01

> **文档治理 + Sprint/Priority 工程框架 + Git Worktree 规范 + copilot-instructions 迁移协议**
>
> 全体会议 `2026-03-01-01-playbook-v22-planning.md` 形成 D-01~D-06 六项决议。
> 精简原则：只写不依赖项目类型就能直接执行的规范；净增量尽量非正值。

### Added

- §3.0 P0-P3 优先级分类表（新章节）：Sprint 内处理规则 + P3 积压机制
- §3.4 Git Worktree 工作约定（新章节）：生命周期命令 + `worktree-context.md` 模板 + 汇报模板 + 边界禁令
- 会议文件 `docs/meetings/2026-03-01-01-playbook-v22-planning.md`

### Changed

- 版本头部：v2.1 → v2.2，内联精简原则声明
- §2.3：重命名为"文档治理（Document Governance）"，表格新增「所有权人」「过期判断」两列
- §3.1：Sprint 流水线更新 — Done 标准在规划时写定；P3 不进 Sprint；max 3 P1 约束
- §8.2：会议命名规范 → `YYYY-MM-DD-NN-<type>.md`（NN 为当日序列号）+ head 模板
- §13.2：新增 Fixed（直接继承）vs Replaceable（按项目重写）迁移对照表（9 行）
- Agent 文件：pm / brain / dev 升级至 v1.1（Sprint 约束、迁移协议、Worktree 职责同步）

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
