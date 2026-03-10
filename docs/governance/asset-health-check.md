# 团队核心资产健康检查表

> **定位：** 这是一份**常设检查文档**，而非一次性报告。  
> **触发方式：** 用户主动说「检查资产状态」或「资产健康检查」，Brain 读取本文件并执行更新。  
> **维护人：** Brain（检查） + PM（存档）  
> **上次全量检查：** 2026-03-10（全体会议 #06）  
> **下次建议检查：** 每 5 个 Minor 版本后，或用户主动触发

---

## 检查触发协议

当用户发起「资产健康检查」时，Brain 执行以下流程：

1. **扫描各资产**（对照下表，逐项验证当前状态）
2. **更新状态栏**（将 ✅/⚠️/🔴 和「上次更新日期」刷新为当前值）
3. **输出摘要**（仅列出 ⚠️ 和 🔴 项，健康项不重复读）
4. **写入检查日志**（在文末「检查历史」追加一行）

---

## 一、治理配置层（`.github/`）

### 1.1 Agent 文件

| 资产 | 路径 | 版本 | 上次更新 | 状态 | 检查标准 |
|------|------|------|---------|------|---------|
| Brain | `.github/agents/brain.agent.md` | v1.1 | 2026-03-01 | ✅ | 职责/工具/边界与 §1 描述一致 |
| PM | `.github/agents/pm.agent.md` | v1.1 | 2026-03-01 | ✅ | 含「自动触发规则」章节 |
| Dev | `.github/agents/dev.agent.md` | v1.1 | 2026-03-01 | ✅ | 含跨平台指令（PowerShell/Bash）|
| Researcher | `.github/agents/researcher.agent.md` | v1.0 | 2026-02-25 | ⚠️ | 未升级至 v1.1；局限声明存在 |
| Code Reviewer | `.github/agents/code-reviewer.agent.md` | v1.0 | 2026-03-10 | ⚠️ | 未升级至 v1.1；八维度含轻量审查规则 |
| Profile Designer | `.github/agents/profile-designer.agent.md` | v1.0 | 2026-02-25 | 🔵 | 按需角色，无版本升级压力 |
| Brand | `.github/agents/brand.agent.md` | v1.0 | 2026-03-10 | ✅ | 含自主发布授权条款（2026-03-10） |

**检查方法：** `grep "agentVersion" .github/agents/*.agent.md`

---

### 1.2 L2 知识库（patterns 文件）

| 资产 | 路径 | 模式数 | 上次更新 | 状态 | 健康阈值 |
|------|------|--------|---------|------|---------|
| Brain patterns | `knowledge/brain-patterns.md` | 3 | 2026-03-01 | ✅ | ≥2 条即可（决策类经验少） |
| PM patterns | `knowledge/pm-patterns.md` | 2 | 2026-03-10 | ✅ | ≥2 条 |
| Dev patterns | `knowledge/dev-patterns.md` | 9+ | 2026-03-10 | ✅ | ≥5 条（执行类经验多） |
| Researcher patterns | `knowledge/researcher-patterns.md` | 4 | 2026-03-10 | ✅ | ≥3 条（本次补充后达标）|
| Code Reviewer patterns | `knowledge/code-reviewer-patterns.md` | 3 | 2026-03-10 | ✅ | ≥2 条（本次补充后达标）|
| Profile Designer patterns | `knowledge/profile-designer-patterns.md` | 2 | 2026-03-10 | 🔵 | 按需角色，≥1 条 |
| Brand patterns | `knowledge/brand-patterns.md` | 2 | 2026-03-10 | ✅ | ≥2 条 |
| Memory 知识图谱 | `knowledge/memory.jsonl` | 7实体 | 2026-03-10 | ⚠️ | VS Code 不支持 auto-recall；Brain 需手动读取 |
| Evolution Events | `knowledge/evolution-events.jsonl` | 29+ | 2026-03-10 | 🔵 | 人工档案，无自动触发要求 |

**检查方法：** `grep -c "^###" .github/agents/knowledge/*-patterns.md`

---

### 1.3 执行层（Hooks / Skills / Settings）

| 资产 | 路径 | 上次更新 | 状态 | 检查标准 |
|------|------|---------|------|---------|
| Settings / Hooks | `.github/settings.json` | 2026-03-10 | ✅ | SessionStart 无硬编码版本号；4 个 Hook 类型齐全 |
| Markdown Lint | `.github/hooks/lint-markdown.ps1` | 2026-03-10 | ✅ | exit 2（非 exit 0）；markdownlint-cli 校验后退出 |
| Skills（7个） | `.github/skills/*/SKILL.md` | 2026-03-10 | ✅ | 每个 SKILL 含 triggers/examples/constraints/reference 四节 |
| CI Workflows | `.github/workflows/` | 2026-03-01 | ✅ | link-check + markdown-lint + deploy 三条流水线 |

**关键验证：** settings.json SessionStart 命令中是否含有硬编码的版本号字符串（🔴 = 含有）

---

## 二、文档治理层（`docs/`）

### 2.1 核心治理文档

| 资产 | 路径 | 行数 | 上次更新 | 状态 | 检查标准 |
|------|------|------|---------|------|---------|
| **本文件** | `docs/governance/asset-health-check.md` | — | 2026-03-10 | ✅ | 存在即健康 |
| Playbook（主） | `docs/governance/team-playbook.md` | ~1838 | 2026-03-10 | ✅ | §0–§20 齐全；**`docs/team-playbook.md` 不存在** |
| Playbook 变更日志 | `docs/governance/PLAYBOOK-CHANGELOG.md` | — | 2026-03-01 | ✅ | 每次 Playbook 升级同步追加 |
| Agent 工作流说明 | `docs/governance/agent-workflow.md` | — | 2026-02-27 | ⚠️ | 面向开源社区，最后更新较早，可能与现状偏差 |
| Release SOP | `docs/governance/release-sop.md` | — | 2026-03-01 | ✅ | 发版流程规范 |
| 工具层脚手架 | `docs/governance/tooling-scaffold.md` | — | 2026-03-10 | ✅ | 工具层架构决策 |
| 设计决策 | `docs/governance/design-decisions.md` | — | 2026-03-01 | ⚠️ | 是否与 copilot-instructions.md「已决定的设计选择」同步 |
| **孤儿副本** | `docs/team-playbook.md` | — | — | ✅ | 已于 2026-03-10 删除；若再次出现 = 🔴 |

---

### 2.2 Brand / 内容资产

| 资产 | 路径 | 上次更新 | 状态 | 检查标准 |
|------|------|---------|------|---------|
| Brand 内容矩阵 | `docs/brand/content-matrix.md` | 2026-03-10 | ✅ | 内容规划表 |
| Discussion 发布计划 | `docs/strategy/brand-discussions-plan.md` | 2026-03-11 | ✅ | #9/#10/#11 已发布（2026-03-11）；首批 3 条计划帖全部完成 |
| 内容审查清单 | `docs/strategy/brand-content-checklist.md` | 2026-03-01 | ✅ | Brand 自主发布判断基准 |
| 72h 跟进模板 | `docs/brand/discussion-72h-followup-template.md` | 2026-03-10 | ✅ | Brand 发布后强制跟进流程 |
| Release 模板 | `docs/strategy/brand-release-template.md` | 2026-03-01 | ✅ | 对外里程碑通告模板 |

---

### 2.3 调研报告（`docs/research/`）

| 资产 | 路径 | 日期 | 状态 | 过期标准 |
|------|------|------|------|---------|
| GitHub Profile 组件调研 | `astro-v5-feasibility-2026.md` | 2026-03-01 | ✅ | 已执行迁移，结论已兑现 |
| MCP 路线图 | `mcp-roadmap-2026.md` | 2026-03-10 | ✅ | P1 Memory MCP 已接入；P2 forage 待执行 |
| Agent 团队演进 | `agent-team-evolution-2026.md` | 2026-03-10 | ✅ | 方法论参考 |
| Build in Public 渠道 | `build-in-public-channels-2026.md` | 2026-02-28 | ✅ | 结论已采纳（GitHub Discussions）；#9/#10/#11 执行落地（2026-03-11） |
| Agent 工具层脚手架 | `agent-tooling-scaffold-2026.md` | 2026-03-10 | ✅ | P0/P1 已执行；P2 forage 待执行 |
| Skills 生态 | `skills-ecosystem-2026.md` | 2026-03-10 | ✅ | SKILL.md 已落地 |

**时效原则：** 调研报告超过 3 个月未被引用或行动项未跟进 = ⚠️

---

### 2.4 Code Review 覆盖率

| 版本范围 | 审查报告 | 状态 |
|---------|---------|------|
| v4.1.0–v4.3.0 | `docs/reviews/v4.1.0/v4.2.0/v4.3.0-review.md` | ✅ |
| v4.4.0–v4.5.0 | 无 | ⚠️ 历史缺口，已决议不补 |
| v5.0.0–v5.4.0 | 无 | ⚠️ 历史缺口，已决议不补 |
| v5.5.0 | `docs/reviews/v5.5.0-review.md` | ✅（里程碑审查）|
| v5.6.0–v5.9.0 | 无 | ⚠️ 历史缺口，已决议不补 |
| **v5.10.0 及之后** | **执行新规** | 🟡 每 Minor 轻量 + 每3个 Minor 深度 |

**新规触发时机：** PM 提出版本提案 → Code Reviewer 同步收到信号 → 轻量审查与发版流程并行

---

### 2.5 会议纪要覆盖率

| 指标 | 当前值 | 健康阈值 | 状态 |
|------|--------|---------|------|
| 总纪要数 | 26 篇 | — | ✅ |
| 最新纪要日期 | 2026-03-10 #06 | 距今 ≤30 天 | ✅ |
| **上一个 Major 有全员复盘会** | v5.0.0 ← 无专属复盘 | 必须有 | ⚠️ |
| 连续 Minor 无复盘数 | 已超过 3 个 | §20 需 Brain 提议 | ⚠️ |

---

## 三、产品层（`njueeray.github.io`）

| 指标 | 当前值 | 健康阈值 | 状态 |
|------|--------|---------|------|
| 当前版本 | v5.10.0 | — | ✅ |
| [Unreleased] 积压 | 0（v5.10.0 已发布）| ≤5 天积压 | ✅ |
| CHANGELOG 同步 | 已同步至 v5.10.0 | 与最新 tag 一致 | ✅ |
| E2E 测试数 | 22 tests | ≥20 | ✅ |
| CI 全绿 | ✅ | 所有 workflow 通过 | ✅ |
| Blog 文章数 | 17 篇 | — | ✅ |
| GitHub Discussions 已发布 | #6 / #7 / #8 / #9 / #10 / #11 | 每月 ≥1 篇 | ✅ 首批 3 条计划帖已完成（2026-03-11）|

---

## 四、综合健康摘要（上次检查结论）

> 最后全量检查：2026-03-11（`2026-03-11-02-v5x-retro-v6-planning.md`）

**🔴 阻断项：** 无

**⚠️ 待改善项：** 无（全部已关闭 ✅）

**✅ 本次优化已关闭项（✅1 ✅2 ✅3 ✅4 ✅5 ✅6 ✅7）：**

| # | 原⚠️ 项 | 执行内容 | 关闭时间 |
|---|---------|---------|----------|
| 1 | Researcher / Code Reviewer agent v1.0 | 升级至 v1.1，将 L2 patterns 核心原则提炼入 agent.md | 2026-03-10 |
| 2 | `agent-workflow.md` 五角色旧内容 | 补充 Brand/profile-designer；新增治理会议/工具层调用模式；更新日期 | 2026-03-10 |
| 3 | `design-decisions.md` 同步状态不明 | 重定义文件范围（深度理由档案 ≠ 决策速查镜像）；补充 v5.0/v5.6 架构决策 | 2026-03-10 |
| 4 | Discussion #2/#3/#4 未执行 | 发布 #9（Announcements 团队时间线）、#10（Team Insights 七位 Agent 首发）、#11（AI-native Journey 开放议论）| 2026-03-11 |
| 5 | build-in-public 执行频率偏低 | #9/#10/#11 发布落地；Brand 72h 跟进机制激活；持续执行由 Brand 负责 | 2026-03-11 |
| 6 | v5.0.0 Major 发布无全员复盘 | `2026-03-11-02-v5x-retro-v6-planning.md` 执行 v5.x 系列总结 + v6.0.0 方向确认；全员参与；决议 6 项 | 2026-03-11 |
| 7 | Playbook 减法目标（-200 行） | §15.3/§15.5 交叉引用优化 + 附录C 瘦身，净减约 90 行；更新 PLAYBOOK-CHANGELOG v2.3 | 2026-03-10 |

**🔵 信息项：**
- Profile Designer agent 按需启用，低活跃属正常
- Memory MCP 在 VS Code 需手动 recall，非缺陷，是平台限制
- Code Review 历史覆盖缺口已决议不补，新规从 v5.10.0 后执行
- Playbook 减法目标原为 -200 行，本次执行 -90 行（更保守但质量更高，不破坏 Playbook 独立可读性）

---

## 检查历史

> 每次触发检查后，在此追加一行。格式：`| YYYY-MM-DD | 触发人 | 🔴N / ⚠️N | 主要发现摘要 |`

| 日期 | 触发人 | 状态分布 | 主要发现 |
|------|--------|---------|---------|
| 2026-03-10 | Ray（全体会议 #06）| 🔴 0 / ⚠️ 7 / ✅ 覆盖全量 | H-1 幽灵文件删除；H-2 settings.json 静态版本修复；H-3 Code Review 覆盖新规确立；patterns 补充 5 条 |
| 2026-03-10 | Ray（全体优化会议 #07）| 🔴 0 / ⚠️ 3 / ✅ 覆盖全量 | 关闭 ⚠️1/2/3/7：Researcher+CR v1.1 升版；agent-workflow.md 七角色更新；design-decisions.md 范围重定义+v5.x 决策补充；Playbook §15 -90 行减法（v2.3）|
| 2026-03-11 | Brain（`2026-03-11-02-v5x-retro-v6-planning.md`）| 🔴 0 / ⚠️ 0 / ✅ 覆盖全量 | 关闭 ⚠️4/⚠️5：Discussion #9/#10/#11 发布；build-in-public 首批落地；关闭 ⚠️6：v5.x 系列总结 + v6.0.0 方向确认会；**所有 ⚠️ 项归零** |
