# Team Playbook — 团队作战手册

> 本手册是团队核心资产之一，记录可移植到任何项目的 Agent 协作规范。
> 不含项目特定内容——这里只有方法论。
>
> **最后更新：** 2026-02-25（复盘会议 #003 产出）
> **适用版本：** Team V2.0（Brain / PM / Dev / Researcher / Code-Reviewer）

---

## 1. 团队拓扑

```
用户（目标 & 最终决策）
         │
         ▼
    ┌─────────┐
    │  brain  │  ← 战略协调中枢，用户唯一对话窗口
    └────┬────┘
         │ 任务分发
    ┌────┴──────────────────┐
    ▼         ▼             ▼
  ┌────┐   ┌─────┐   ┌──────────────┐
  │ pm │   │ dev │   │ code-reviewer│
  └────┘   └──┬──┘   └──────────────┘
              │
              ▼
         ┌──────────┐
         │researcher│  ← 按需调用（dept on-demand）
         └──────────┘
```

### 角色一览

| 角色 | 文件 | 核心职责 | 权限 |
|------|------|----------|------|
| `brain` | `brain.agent.md` | 战略协调、会议主持、用户汇报 | 读写 + 决策 |
| `pm` | `pm.agent.md` | Sprint 规划、DoD 执行、版本管理 | 读写 + 规划 |
| `dev` | `content-writer.agent.md` | 全栈实现（代码/文档/配置） | 读写 |
| `researcher` | `researcher.agent.md` | 技术调研（只输出结论，不修改文件） | 只读 |
| `code-reviewer` | `qa-reviewer.agent.md` | 七维度质量门禁 | 只读 + 诊断 |

> 专项角色（如 `profile-designer`）按项目需要追加，不影响核心团队。

---

## 2. 会话开启 / 关闭协议

### 会话开启（Session Open）

Brain 在每次新会话开始时执行：

```
1. 读取 .github/copilot-instructions.md → 了解项目上下文
2. 读取 docs/meetings/ 最新会议纪要 → 恢复上次进度
3. 核查 CHANGELOG.md [Unreleased] 区块 → 确认待发布事项
4. 向用户输出 3 行摘要：
   "上次完成：[X] | 本次目标：[Y] | 需用户决策：[Z]"
```

### 会话关闭（Session Close）

Brain 在每次会话结束前执行：

```
1. 确认所有 DoD 检查项已打 ✅
2. 更新 copilot-instructions.md → 「当前迭代状态」
3. 提交 commit（遵循语义化格式，见第 3 节）
4. 向用户输出收尾摘要：
   "本次完成：[变更列表] | 遗留：[未完成项] | 下次建议：[下一步]"
```

---

## 3. Commit 规范

### 格式

```
<type>(<scope>): <subject>

[可选 body，72 字符自动换行]

[可选 footer，关联 issue / breaking change]
```

### Type 速查表

| Type | 使用场景 | 示例 |
|------|---------|------|
| `feat` | 新功能、新组件 | `feat(blog): add content collections` |
| `fix` | 修复 bug / 破损链接 | `fix(readme): broken wakatime badge url` |
| `docs` | 仅文档变更 | `docs(changelog): add v2.0 release notes` |
| `style` | 格式/空格，不影响逻辑 | `style(readme): normalize line endings` |
| `refactor` | 代码重构（非 feat 非 fix） | `refactor(nav): extract reusable component` |
| `chore` | 构建/依赖/配置 | `chore(deps): bump astro to 4.16.18` |
| `ci` | CI/CD 工作流 | `ci(lint): add markdown-lint workflow` |
| `perf` | 性能优化 | `perf(image): convert hero to webp` |

### Scope 约定（本团队）

| Scope | 对应目录 | 示例 |
|-------|---------|------|
| `readme` | njueeRay-profile/README.md | `feat(readme): add dual-mode header` |
| `astro` | njueeray.github.io/src/ | `feat(astro): add blog system` |
| `agent` | .github/agents/ | `feat(agent): add brain role` |
| `docs` | docs/ | `docs(playbook): add commit standards` |
| `ci` | .github/workflows/ | `ci(link-check): add lychee action` |
| `deps` | package.json | `chore(deps): add @astrojs/mdx@3` |

### 多仓库提交约定

跨仓库操作时，在 commit body 中标注影响范围：

```
feat(readme): V2.0 complete rewrite

Affects: njueeRay-profile, njueeray.github.io, OpenProfile
- Phase A/B: dual-mode README restructure
- Phase C: Astro nav/footer/blog
- Phase D: CI + editorconfig + v1.0.0 tag
```

---

## 4. 版本发布规则

遵循 [Semantic Versioning](https://semver.org)：`MAJOR.MINOR.PATCH`

| 版本号 | 触发条件 | 示例 |
|--------|---------|------|
| `PATCH` | 修复 bug、链接失效、小文案调整 | v1.0.1 |
| `MINOR` | 新增功能、新增页面、新增组件 | v1.1.0 |
| `MAJOR` | 架构重构、视觉风格大改、Breaking Change | v2.0.0 |

### 发布流程

```
1. 确认 CHANGELOG.md [Unreleased] 内容完整
2. 将 [Unreleased] 重命名为 [X.Y.Z] - YYYY-MM-DD
3. 在末尾添加版本对比链接：
   [X.Y.Z]: https://github.com/njueeRay/OpenProfile/compare/vA.B.C...vX.Y.Z
4. 提交 docs(changelog): release vX.Y.Z
5. 打 tag：git tag -a vX.Y.Z -m "Release vX.Y.Z"
6. 推送：git push && git push --tags
```

---

## 5. 会议类型

| 类型 | 触发条件 | 主持 | 输出 |
|------|---------|------|------|
| **里程碑会议** | 每个 Major/Minor 版本前 | brain | 迭代计划 + 分工 |
| **复盘会议** | 每个版本发布后 | brain | 复盘纪要 + 改进清单 |
| **快速站会** | 用户输入模糊目标时 | brain | 3 行确认摘要 |
| **紧急响应** | 发现 🔴 阻断问题 | code-reviewer | 问题报告 + 修复方案 |

**会议纪要命名规范：** `docs/meetings/YYYY-MM-DD-<会议类型>.md`

---

## 6. 新项目 Pre-Flight 清单

迁移本团队到全新项目时，执行以下检查：

### 基础配置（30 分钟内完成）

- [ ] Fork / 复制 `.github/agents/` 目录（5 个核心 agent 文件）
- [ ] 复制 `.github/copilot-instructions.md` 并替换个人信息区块
- [ ] 创建 `docs/` 目录：`design-decisions.md`、`component-guide.md`、`agent-workflow.md`、`meetings/`
- [ ] 初始化 `CHANGELOG.md`（仅包含 `[Unreleased]`）
- [ ] 添加 `.editorconfig` 和 `.gitattributes`（防 CRLF）

### CI 配置（视项目需要）

- [ ] `link-check.yml`（外部链接可达性）
- [ ] `markdown-lint.yml`（Markdown 格式规范）
- [ ] `update-stats.yml`（动态数据刷新，如有）

### 角色配置

- [ ] 确认项目类型 → 决定是否需要专项 Agent（如 `profile-designer`）
- [ ] 更新 `copilot-instructions.md` 中的 Agent 团队表格
- [ ] 召开里程碑会议 #001 → 产出 V1.0 执行计划

### 第一次提交规范

```
chore(init): bootstrap project with OpenProfile team template

Team: brain / pm / dev / researcher / code-reviewer
Template: OpenProfile vX.Y.Z
```

---

## 7. DoD 核查清单

> 每次迭代收尾时，brain 逐条核查（未完成项不允许关闭迭代）

- [ ] `CHANGELOG.md` 已更新（按实际变更填写 Added / Changed / Fixed）
- [ ] `docs/design-decisions.md` 新决策已记录（含日期和理由）
- [ ] `docs/component-guide.md` 新组件已补充（含参数和用法）
- [ ] `copilot-instructions.md` → 「已决定的设计选择」已同步
- [ ] `copilot-instructions.md` → 「当前迭代状态」已更新
- [ ] 会议纪要已存档至 `docs/meetings/`
- [ ] commit message 遵循语义化格式（见第 3 节）
- [ ] 所有外部链接可达（无 404）
- [ ] `code-reviewer` 已输出审查报告（APPROVED / APPROVED_WITH_SUGGESTIONS / REQUEST_CHANGES）
- [ ] PATCH/MINOR/MAJOR 发布规则已评估（视需要打 Tag）

---

## 8. 团队资产目录

| 资产 | 路径 | 说明 |
|------|------|------|
| 全局项目指令 | `.github/copilot-instructions.md` | 每次会话自动生效 |
| Agent 角色定义 | `.github/agents/*.agent.md` | chatagent 格式 |
| 本手册 | `docs/team-playbook.md` | 方法论，可跨项目复用 |
| 设计决策记录 | `docs/design-decisions.md` | 项目特定 |
| 组件使用指南 | `docs/component-guide.md` | 项目特定 |
| 工作流说明 | `docs/agent-workflow.md` | 对外展示用（开源） |
| 会议纪要 | `docs/meetings/` | 按日期归档 |

---

*本手册由 brain + pm 共同维护，每次复盘会议后更新。*
