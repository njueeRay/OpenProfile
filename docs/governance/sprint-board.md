# Sprint Board

> 上次更新：2026-03-14（v7.1.0–v7.3.0 全量交付）· 活跃项 0
>
> **铁律：** ≤50 行 · ≤7 条 · 超 2 周未动则 triage（做 / 删 / 降级到 backlog）
> **协议：** 每个会话执行 Recall → Execute → Ship（只做一件事，做完）

| # | 事项 | Owner | 状态 | Deadline | 完成物 |
|---|------|-------|------|---------|--------|
| 1~14 | （v6 全系列 v6.3.0–v6.10.0 已完成见 CHANGELOG）| — | ✅ | — | — |
| 15 | Discussion #14 — v6 Agent Persona Layer 公告 | Brand | ✅ | 03-14 | https://github.com/njueeRay/OpenProfile/discussions/7 |
| 16 | v7.0-pre 技术债清偿：AgentOffice 拆分 + CI 补全 | Dev+CR | ✅ | 03-14 | AgentOffice 655→327 行，draw-symbols.ts + MemoryPanel.tsx |
| 17 | v7.1.0 Pixel Avatar System | Profile Designer | ✅ | 03-14 | 7 个像素头像，PixelAvatarCanvas.tsx |
| 18 | v7.2.0 L3 知识层 — 知识时间线 | Researcher+Dev | ✅ | 03-14 | agent-knowledge.ts（24条）+ /agents/[id] 知识体系区块 |
| 19 | v7.3.0 /how-we-work 工作流指南 | PM+Dev | ✅ | 03-14 | how-we-work.astro（5区块，95页面） |

---

## Backlog（不计入活跃项上限）

- 标志性传播内容「AI-native 工作流图解」（Brand，v7.4）
- `forage-mcp` 接入
- `.github/skills/` 贡献至社区

---

## Decision Journal（最近 10 条）

| 日期 | 决策 | Ray 的判断 | 理由（一句话）|
|------|------|-----------|-------------|
| 03-14 | v7.1–v7.3 三版本自主推进授权 | ✅ Ray 全权授权 | 「自主发布，按会议决议直接推进」 |
| 03-14 | 知识层采用静态 TS 数据文件（非脚本动态生成） | ✅ Agent 自主 | 可直接控制质量，无需外部依赖 |
| 03-14 | /how-we-work 以「3个习惯改变」为 DoD | ✅ 沿用会议决议 | DoD 以行为改变衡量，不以页面完成衡量 |
| 03-14 | v6.7.0~v6.10.0 全部做完 | ✅ Ray 决策 | 果断决策，无需逐项确认 |
| 03-14 | v6.9.0 方案 C（几何身份+记忆面板）同时做 | ✅ Ray 选择 | 两版本分步交付，视觉+交互双升级 |
| 03-14 | 记忆面板改为弹层展示（不直接跳转）| ✅ Agent 自主 | 减少跳出率，保持沉浸感 |
| 03-14 | v7 北极星：「让 AI-native 思考过程可感知」| ✅ Ray 确认 | 从「展示是谁」升级至「展示如何思考」|
