# Sprint Board

> 上次更新：2026-03-14 · 活跃项 ≤ 7
>
> **铁律：** ≤50 行 · ≤7 条 · 超 2 周未动则 triage（做 / 删 / 降级到 backlog）
> **协议：** 每个会话执行 Recall → Execute → Ship（只做一件事，做完）

| # | 事项 | Owner | 状态 | Deadline | 完成物 |
|---|------|-------|------|---------|--------|
| 1 | Playbook v2.4 项目绑定精简 | Dev | ✅ 完成 | 03-11 | team-playbook.md §4/§11/§13/§15/§16/§19/§20 |
| 2 | Sprint Board 初始化 + 三段式协议落地 | Brain | ✅ 完成 | 03-11 | 本文件 |
| 3 | v6.0.0 expressive-code + Callout + reading-time | Dev | ✅ 完成 | 03-11 | B1~B4 已在 v5.8.0 完成，v6.0.0 tag 已推送 |
| 4 | v6.1.0 读者入口文章 + Brand 72h 外循环正式化 | Brand+Dev | ✅ 完成 | 03-11 | 2-min-guide 博文 + CHANGELOG C-2 外循环规则 |
| 5 | Brand Discussion：v6.0.0+v6.1.0+v6.2.0 发版公告 | Brand | ✅ 完成 | 03-13 | Discussion #5 + #6 由 Playwright 自动发布 |
| 6 | v6.2.0 开源公告博文 + CONTRIBUTING.md 上手指引 | Dev+Brand | ✅ 完成 | 03-11 | open-source-announcement.mdx + CONTRIBUTING.md Fork 章节 |
| 7 | Agent Persona Layer Phase 0+1：/agents 页面 + 视觉身份系统 | Dev | ✅ 完成 | 03-14 | config.ts schema + 7 YAML + visual-spec + /agents/index.astro + Nav 入口；v6.3.0 tag 发布 |
| 8 | v6.4.0 Agent 详情页 + 活动时间线 + Brand Discussion | Dev+Brand | ✅ 完成 | 03-14 | /agents/[id].astro (F-2) + discussion-agent-personas-draft.md (F-3)；v6.4.0 tag 发布 |
| 9 | v6.5.0 Agent Knowledge Graph：供应链审计 + 图谱数据 + /agents/graph 页面 | Dev+Researcher | ✅ 完成 | 2026-03-14 | G-1 npm audit fix (svgo) / G-2 agent-graph-data.ts / G-3 AgentKnowledgeGraph.tsx / G-4 /agents/graph 页面 + tag v6.5.0 |

---

## Backlog（不计入活跃项上限）

- `forage-mcp` 接入
- `.github/skills/` 贡献至社区
- `docs/guides/` 扩充
- OpenProfile v6.2.0 开源公告

---

## Decision Journal（最近 10 条）

> 自动记录 Ray 的判断。AI-native 健康度的唯一指标。

| 日期 | 决策 | Ray 的判断 | 理由（一句话）|
|------|------|-----------|-------------|
| 03-11 | Board 驱动 Ship 循环 | ✅ 同意 | 认可范式转移方向 |
| 03-11 | 纪要不超过100行 | ❌ 否决 | 纪要是团队思想证明，以价值为先不设硬限 |
| 03-11 | 停止维护 Playbook | ❌ 否决 → 修订 | Playbook 应继续维护，进化为项目无关的可迁移知识 |
| 03-11 | Decision Journal 机制 | ✅ 同意 | 自动记录判断轨迹 |
| 03-11 | Sprint Board 唯一状态源 | ✅ 同意 | 取代 copilot-instructions 迭代状态段落 |
| 03-11 | Roadmap 执行通 v6.1.0 | ✅ 同意 | 按规划逐个 check 执行 |
| 03-11 | 继续推进到 v6.2.0 并自主规划后续 | ✅ 同意 | Dev 自主规划 Agent Persona Layer 为下一站 |
| 03-13 | v6.0.0+v6.1.0+v6.2.0 Brand Discussion 发布 | ✅ 完成 | 首次 Playwright 自动发布成功（Discussion #5、#6） |
| 03-14 | v6.3.0 scope = Phase 0+1，E-1~E-5 | ✅ Agent 自主决策 | B 方案；含 /agents 静态页 + Nav 入口，一次发完有闭合感 |
| 03-14 | v6.4.0 目标 = F-1~F-3（Agent 详情页 + Brand Discussion 稿）| ✅ 同意扩展 | 用户确认 "直到推到 v6.4.0 完成" |
| 03-14 | /agents/[id].astro 详情页实现策略 | ✅ Agent 自主决策 | Profile Card + 双栏 + 时序时间线；SoftwareApplication JSON-LD；复用 --agent-color 系统 |
