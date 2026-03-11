# 项目 Roadmap：v5.8.0 → v6.1.0

> **文档状态**：v6.0.0 + v6.1.0 已完成 ✅ — 下一站 v6.2.0（开源宣布）  
> **确立于**：Meeting #09（2026-03-11，转折点深度反思会）+ v5.x Retro + v6 规划会  
> **维护人**：Brain（战略）+ PM（进度）  
> **协作协议**：Board 驱动 Ship 循环 — Recall → Execute → Ship

---

## 北极星

**核心目标** = **B（AI-native 工作方式示范）**

所有版本决策的第一判断标准：**是否推进「AI-native person 如何工作」的示范？**

---

## 版本地图

```
v5.7.0 ──► v5.8.0 ──────────────────────────────────────► v6.0.0 ──► v6.1.0 ──► v6.2.0 (待定)
(已发布)  (治理范式转移)                               (内容质量飞跃)  (入口文章+  (开源宣布)
                                                       worktree=       外循环机制)
                                                       expressive-code
                                                       +Callout
                                                       +阅读时长
                                                       +SeriesNav
```

---

## v5.8.0 — 协作范式转移（已完成，2026-03-11）

**核心交付**：Board 驱动 Ship 循环正式确立

| # | 交付物 | 状态 |
|---|--------|------|
| A1 | `docs/governance/sprint-board.md` 创建 + Decision Journal | ✅ 完成 |
| A2 | SessionStart hook 改为读取 Sprint Board | ✅ 完成（本次会话）|
| A3 | copilot-instructions「已决定的设计选择」→ design-decisions.md | ✅ 完成 |
| A4 | Playbook v2.5 精简为项目无关可迁移知识 | ✅ 完成 |
| A5 | Agent Persona Layer Roadmap 文档 | ✅ 完成 |

---

## v6.0.0 — 博客内容质量飞跃（目标：2026-03-18）

**触发条件**：feature/blog-content-quality worktree 四项 DoD 全部完成后合并  
**负责人**：Dev  
**仓库**：`njueeray.github.io`（feature/blog-content-quality 分支）

### DoD 清单

| # | 功能 | 技术实现 | 状态 |
|---|------|---------|------|
| B-1 | **expressive-code 代码块** | `astro-expressive-code` + `github-dark-dimmed` 主题 + `borderRadius: 6px` + copy button | ✅ 完成（v5.8.0 实现，v6.0.0 确认） |
| B-2 | **Callout.astro 提示框** | 四类（tip/warning/info/note），终端风 icon（✦/⚠/ℹ/📝）+ uppercase 标签 + 对应色系 | ✅ 完成（v5.8.0 实现，v6.0.0 确认） |
| B-3 | **阅读时长显示** | 中文 500 字/分钟 + 英文 200 词/分钟，剥离 frontmatter/代码块/HTML；BlogCard + 文章页 header | ✅ 完成（v5.8.0 实现，v6.0.0 确认） |
| B-4 | **SeriesNav.astro 系列导航** | series + seriesOrder frontmatter + 系列内上/下篇导航；位置：author-card 后、相关文章前 | ✅ 完成（v5.8.0 实现，v6.0.0 确认） |
| B-5 | `astro check` 0 errors | 构建验证 | ✅ 完成 |
| B-6 | `npm run build` 构建成功 | 完整页数输出 | ✅ 完成 |

### 合并流程

```
1. feature/blog-content-quality DoD 全绿
2. git merge feature/blog-content-quality → main
3. CHANGELOG.md [Unreleased] → [6.0.0] — 2026-MM-DD
4. git tag v6.0.0 && git push origin --tags
5. git worktree remove + git branch -d feature/blog-content-quality
6. Brand 在 72h 内发 Discussion（v6.0.0 发版公告）← 这是 v6.x 新规第一次执行
```

---

## v6.1.0 — 读者入口 + 外循环机制正式化（目标：2026-03-22）

**负责人**：Brand + Dev  
**前置条件**：v6.0.0 发布完成

### DoD 清单

| # | 交付物 | 说明 | 状态 |
|---|--------|------|------|
| C-1 | **读者入口文章** | `2-min-guide-njueeray-github-io.mdx`（featured: true，seriesOrder: 4，AI-native 核心主张） | ✅ 完成（2026-03-11） |
| C-2 | **Brand 72h 规则写入 DoD** | PM 在每个 Minor 版本提案时检查上一版本的外循环是否完成 | ✅ 完成（写入 CHANGELOG v6.1.0） |
| C-3 | **Discussion 发版公告** | v6.0.0 + v6.1.0 发版公告，草稿已就绪，Ray 手动发布（截止 2026-03-13） | 🔵 进行中（等待 Ray） |
| C-4 | CHANGELOG [6.1.0] + git tag | 发版标准操作 | ✅ 完成（2026-03-11） |

---

## v6.2.0 — OpenProfile 开源正式宣布（待定，目标 04 月）

| # | 交付物 | 说明 |
|---|--------|------|
| D-1 | 开源公告博文 | 「如何用 AI Agent 协作构建 GitHub Profile」 |
| D-2 | CONTRIBUTING.md 入门指南 | 外部贡献者友好 |
| D-3 | GitHub Discussion 开源宣布帖 | 含项目故事 + 邀请 star |

---

## 远期路线（v6.x → v7.x）

### Agent Persona Layer（v6.x 后专项）

| Phase | 内容 | 前置条件 |
|-------|------|---------|
| Phase 0 | config.ts schema 扩展（color/symbol/joined/tagline）+ 7 个 author YAML 填充 + visual-spec 文档 | v6.x 期间任意窗口 |
| Phase 1 | `/agents` 页面，7 张 Agent Card | Phase 0 完成 |
| Phase 2 | Activity Timeline 脚本，Card 接入自动数据 | Phase 1 完成 |
| Phase 3 | `/agents/graph` 知识图谱（react-force-graph） | Phase 2 完成 |
| Phase 4 | Pixel Agents 社区对外输出 | v7.x 以后 |

---

## Sprint Board 对照

> 本 Roadmap 是 Sprint Board 的策略背景文档。执行状态以 Sprint Board 为准。

| Roadmap 条目 | Sprint Board 条目 |
|-------------|-----------------|
| v6.0.0 B1~B4 | #3 v6.0.0 expressive-code + Callout + reading-time |
| v6.1.0 C1~C3 | #4 v6.1.0 读者入口文章 + Brand 72h 外循环 / #5 Discussion 月度反馈帖 |

---

## Decision Journal（Roadmap 相关）

| 日期 | 决策 | Ray 的判断 | 理由 |
|------|------|-----------|------|
| 2026-03-11 | v6.0.0 定义 = expressive-code + Callout + 阅读时长（worktree 触发）| ✅ 同意 | Meeting #02 决议 A |
| 2026-03-11 | Board 驱动 Ship 循环范式转移 | ✅ 同意 | Meeting #09 | 
| 2026-03-11 | Pixel Agents 放 v6.x 后专项，当前只规划不实施 | ✅ 同意 | 主轨道优先 |
| 2026-03-11 | Agent Persona Layer 技术决策 A：扩展 authors/（不新建 agents/）| ✅ 同意 | SSOT 原则 |
| 2026-03-11 | Agent Persona Layer 技术决策 B：Pattern 条目级粒度 | ✅ 同意 | 信息密度更高 |
