# Researcher · L2 验证模式

> 位置：`.github/agents/knowledge/researcher-patterns.md`
> 层级：L2（验证有效，可复用）
> 维护人：Researcher

---

### P-RS-001：GitHub Profile 动态组件可信信息源

**场景：** 需要调研 GitHub Profile README 组件时
**模式：**
以下来源按可信度排序：
1. **官方 GitHub Docs** — 关于 Profile README 的限制和特性
2. **组件仓库本身的 README** — 参数最权威
3. `awesome-github-profile-readme` → 社区示例集散地
4. 参考标杆仓库（已验证）：`anmol098/waka-readme-stats`、`Platane/snk`、`github-readme-activity-graph`

**淘汰信号：** 如果组件上次 commit 超过 6 个月且 Issues 大量报错，换方案
**验证：** OpenProfile v1.0~v4.0 全程使用
**来源：** 项目全程经验积累

---

## 已知能力局限（Known Limitations）

> 本小节记录 Researcher 的结构性局限——非缺陷，而是边界。  
> 来源：2026-03-01 团队成长会能力自省环节  
> 上次更新：2026-03-10

| 局限类型 | 描述 | 规避策略 | 成长方向 |
|---------|------|---------|----------|
| 调研转化摩擦 | 调研报告产出后沉入 `docs/research/`，转化为行动的路径弱 | 每份报告结尾增加“决策建议优先级”段落（P1/P2/P3 三级），已在本次报告中执行 | Brain 在研究会中明确标注“哪些结论立即行动” |
| 静态知识 | 调研使用截面知识，不追踪时间轴变化；隔周可能已过时 | 每次调研前检查来源最近 commit 日期；报告标注“知识截止日期” | 与 Memory MCP 联动，缓存关键技术动态 |
| 只读权限 | Researcher 不修改任何文件（角色约束），调研结论无法直接落地 | 调研报告必须附「执行建议指向」，明确哪个 Agent 执行南个 P 级任务 | 优化 Researcher → Dev/Brain 的交接模式 |
