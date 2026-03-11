# Playbook Changelog

独立记录 Team Playbook（L2 层）的版本变更。与项目版本（L1 层）解耦。

格式遵循 [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)。

---

## [Unreleased]

---

## [Playbook v2.5] — 2026-03-11

> **精简三章：§19 实验分离 · §20 整章删除并内联 · §16 细则移至 Brand Guide**
>
> 第二轮内容审查（审计报告 Top 5 高影响改进中的 3 项），净减少 206 行（-12%）。

### Changed

- §19 Agent 能力演进机制（GEP）：整章内容移出至 `docs/governance/playbook-experimental-gep.md`（实验性框架，待 Gene 积累 20+ 后再评估纳入）；Playbook 中保留 5 行指针
- §20 自动治理触发机制：**整章删除**（激进方案）；关键规则内联回归：
  - PM 自动检查规则表（SessionStart / 任务完成 / DoD 三节点）合并至 §5.4 末尾
  - Brain Major/session 后触发规则新增至 §8.3 触发表
- §16 开源品牌化：§16.3（Logo）+ §16.4（话题标签）+ §16.5（Badge）详细规范迁移至新建 `docs/brand/brand-guide.md`；§16 保留时机判断、组件清单和执行角色分工（约 30 行）
- 页脚版本标注更新：v2.4 → v2.5

### Added

- `docs/governance/playbook-experimental-gep.md`：GEP 实验专区，含验证标准和纳入条件
- `docs/brand/brand-guide.md`：开源品牌化实施细则（Logo 规格 / 话题标签 / Badge 套件）

---

## [Playbook v2.4] — 2026-03-11

> **项目绑定精简：7 个章节去除 OpenProfile 特定内容，回归可迁移知识定位**
>
> Meeting #09 转折点会议 + Ray 校准：Playbook 应是「项目无关的冷启动手册」。
> 重点改造 §11（整段重写为资产分类原则）；§4/§13/§15/§16/§19/§20 替换具体项目引用为泛型占位。

### Changed

- §4.3/§4.5：Scope 和 emoji 示例泛型化（移除 `blog`/`astro`/`lychee` 等项目词汇）
- §11 核心资产清单：**整段重写** — 从 OpenProfile 文件列表改为三分类资产评估原则（✅ 可复用 / ⚠️ 需适配 / ❌ 需重建）
- §13.6：进化日志示例泛型化（`profile-designer` → `<role>`）
- §15：项目特定引用（`P-DV-003`/`P-DV-006`/`njueeray`）→ 泛型「项目 L2 知识库」
- §16.4：话题标签示例泛型化（移除 `astro`/`github-profile`）
- §19.1/§19.2/§19.5：Gene 编码和文件路径泛型化
- §20.5：触发规则 DoD 文件引用泛型化
- 页脚版本标注更新：v2.3 → v2.4

---

## [Playbook v2.3] — 2026-03-10

> **内容瘦身 + 交叉引用优化：§15/附录C 减法，消除与 dev-patterns.md 的内容重叠**
>
> 全体优化讨论会 `2026-03-10-07-comprehensive-asset-optimization.md` 形成 D 决议。
> 净减少约 90 行（§15.3 精简 -50 行 + §15.5 精简 -40 行 + 附录C 精简 -13 行）。

### Changed

- §15.3 标准操作速查：保留通用模板 + 铁律警告，移除项目特定代码示例，改为指向 `dev-patterns.md` P-DV-003
- §15.5 GitHub Discussions GraphQL SOP：移除项目特定参数（repoId/categoryId），改为指向 `dev-patterns.md` P-DV-006；保留流程说明
- 附录 C：移除重复的六列示例表，改为指针指向 `copilot-instructions.md` 团队能力快照区块（避免双维护）
- Playbook 页脚版本标注更新：v2.0 → v2.3

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
