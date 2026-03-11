# 项目 Roadmap：v5.8.0 → v6.1.0

> **文档状态**：v6.0.0 + v6.1.0 + v6.2.0 已完成 ✅ — 下一站 v6.3.0（Agent Persona Layer Phase 0）  
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
v5.7.0 ──► v5.8.0 ──────────────────────────────────────► v6.0.0 ──► v6.1.0 ──► v6.2.0 ──► v6.3.0 (进行中)
(已发布)  (治理范式转移)                               (内容质量飞跃)  (入口文章+  (开源宣布+  (Agent Persona
                                                       worktree=       外循环机制)  CONTRIBUTING   Layer Phase 0)
                                                       expressive-code             友好化改造)
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
| C-3 | **Discussion 发版公告** | v6.0.0 + v6.1.0 发版公告，草稿已就绪，Ray 手动发布（截止 2026-03-13） | ✅ 完成（Playwright 自动发布，Discussion #5）|
| C-4 | CHANGELOG [6.1.0] + git tag | 发版标准操作 | ✅ 完成（2026-03-11） |

---

## v6.2.0 — OpenProfile 开源正式宣布（已完成，2026-03-11）

| # | 交付物 | 状态 |
|---|--------|------|
| D-1 | 开源公告博文 `open-source-announcement.mdx`（技术选型 + Agent 架构 + 工作流 + 踩坑复盘 + Fork 上手）| ✅ 完成 |
| D-2 | `CONTRIBUTING.md` 新增「Fork 上手（5 分钟）」章节 | ✅ 完成 |
| D-3 | GitHub Discussion 开源宣布帖（v6.2.0 + 邀请关注）| 🔵 待发（Playwright 已有模版，需补发 Discussion #7 或合并入 #9）|

---

## v6.3.0 — Agent Persona Layer Phase 0 + Phase 1（目标：2026-03-25）

**核心目标**：让 7 个 AI Agent 从「隐藏在 YAML 文件里的规范配置」变成「可被访客感知的鲜活角色」。

**触发条件**：v6.2.0 发布后自主规划，Sprint Board #7 推进完成

### Phase 0：数据层准备

| # | 交付物 | 技术实现 | 状态 |
|---|--------|---------|------|
| E-1 | `src/content/config.ts` 扩展 authors schema | 新增字段：`color`（主题色 hex）/ `symbol`（几何符号）/ `joined`（加入日期）/ `tagline`（一句话简介）/ `skills`（能力标签数组）| ✅ 完成 |
| E-2 | 7 个 author YAML 填充（`.yaml` 文件已就绪）| brain/pm/dev/researcher/code-reviewer/profile-designer/brand 各自填充新字段 | ✅ 完成 |
| E-3 | `docs/strategy/agent-visual-spec.md` | 每个 Agent 的视觉定义：色彩含义 + 符号选择理由 + 角色素描（≤100 字）| ✅ 完成 |

### Phase 1：Agent Card 静态页面

| # | 交付物 | 技术实现 | 状态 |
|---|--------|---------|------|
| E-4 | `/agents` 路由页面（静态 SSG）| 7 张 Agent Card，每张包含：symbol / name / role / tagline / skills-pills / joined / 文章数 + 最近一篇链接 | ✅ 完成 |
| E-5 | Nav 新增 agents 序列入口 | `Nav.astro` 添加 `/agents` 导航项 | ✅ 完成 |
| E-6 | `astro check` + `npm run build` 通过 | 构建验证 | ✅ 完成（v6.3.0，2026-03-14）|

---

## v6.4.0 — Agent Persona Layer Phase 2：详情页 + 活动时间线（目标：2026-04-05）

**前置条件**：v6.3.0 完成

| # | 交付物 | 说明 | 状态 |
|---|--------|------|------|
| F-1 | Agent Activity 数据聚合 | 扫描 `src/content/blog/` 按 `author` 字段聚合：文章数 + 最近发布日 + 内容类型分布 | ✅ 完成（内联于 /agents/index.astro + [id].astro）|
| F-2 | `/agents/[id]` 详情页 | 个人简历卡 + 文章时序展示（复用 GitTimeline 风格）+ 天赋语自寄 | ✅ 完成（v6.4.0，2026-03-14）|
| F-3 | Brand Discussion：Agent 角色介绍帖 | 展示全制 7 个 Agent 的第一人称角色自述 | ✅ 完成（Discussion #12，2026-03-14）|

---

## 远期路线（v6.5+ → v7.x）

### v6.5.0 — Agent Persona Layer Phase 3：`/agents/graph` 知识图谱

**前置**：v6.4.0 完成 + Code Reviewer 完成 react-force-graph 供应链审计

| # | 交付物 | 说明 | 状态 |
|---|--------|------|------|
| G-1 | 供应链安全审计 | `npm audit fix` 修复 svgo DoS + react-force-graph MIT 验证 | ✅ 完成（2026-03-14）|
| G-2 | 图谱数据结构 | `src/data/agent-graph-data.ts`：11 节点 + 17 边 + TS 类型 | ✅ 完成（2026-03-14）|
| G-3 | Astro Island 图谱组件 | `AgentKnowledgeGraph.tsx`（React，懒加载 react-force-graph）| ✅ 完成（2026-03-14）|
| G-4 | `/agents/graph` 页面 | 全互动图谱，无 JS 降级为静态关系表格 | ✅ 完成（v6.5.0，2026-03-14）|

### v7.0.0 — Pixel Agents 社区

- Agent Card 系统向社区开放：「设计你自己的 AI Agent 团队」
- forage-mcp 接入：`forage_search/forage_install/forage_learn`
- `.github/skills/` 贡献至社区（Anthropic Agent Skills 开放标准）

---

## Sprint Board 对照

> 本 Roadmap 是 Sprint Board 的策略背景文档。执行状态以 Sprint Board 为准。

| Roadmap 条目 | Sprint Board 条目 |
|-------------|-----------------|
| v5.8.0 A1~A5 | #1 Playbook 精简 / #2 Sprint Board 初始化 |
| v6.0.0 B1~B4 | #3 v6.0.0 expressive-code + Callout + reading-time |
| v6.1.0 C1~C3 | #4 v6.1.0 读者入口文章 + Brand 72h 外循环 / #5 Discussion 发版公告 |
| v6.2.0 D1~D3 | #6 v6.2.0 开源公告博文 + CONTRIBUTING.md |
| v6.3.0 E1~E6 | #7 Agent Persona Layer Phase 0+1 |
| v6.4.0 F1~F3 | #8 Agent 详情页 + 活动时间线 + Brand Discussion |
| v6.5.0 G1~G4 | #9 供应链审计 + 图谱组件 + /agents/graph 页面 |

---

## Decision Journal（Roadmap 相关）

| 日期 | 决策 | Ray 的判断 | 理由 |
|------|------|-----------|------|
| 2026-03-11 | v6.0.0 定义 = expressive-code + Callout + 阅读时长（worktree 触发）| ✅ 同意 | Meeting #02 决议 A |
| 2026-03-11 | Board 驱动 Ship 循环范式转移 | ✅ 同意 | Meeting #09 | 
| 2026-03-11 | Pixel Agents 放 v6.x 后专项，当前只规划不实施 | ✅ 同意 | 主轨道优先 |
| 2026-03-11 | Agent Persona Layer 技术决策 A：扩展 authors/（不新建 agents/）| ✅ 同意 | SSOT 原则 |
| 2026-03-11 | Agent Persona Layer 技术决策 B：Pattern 条目级粒度 | ✅ 同意 | 信息密度更高 |
| 2026-03-11 | v6.3.0 范围 = Phase 0 + Phase 1（列表页，E-1~E-6）| ✅ 同意 | 一次性交付数据层+展示层 |
| 2026-03-11 | Agent 颜色/符号方案：主色 7 色 + Unicode 几何符号 | ✅ Agent 自主决定 | Profile Designer 锁定 |
| 2026-03-11 | Agent Persona Layer Roadmap 融入主 roadmap | ✅ 同意 | Phase 0→3 映射到 v6.3~v6.5 |
