# Agent 能力演进机制（GEP 实验性框架）

> **状态：实验性** — 尚未在完整项目中验证。
> 待 Gene 积累到 20+ 后，由 Brain 评估是否纳入 Playbook 正式章节。
>
> **背景：** 灵感来源 EvoMap/evolver GEP（Genome Evolution Protocol），1.4k ⭐
> 写入时间：2026-03-10（团队演进机制研究会）
> 移出正式 Playbook 时间：2026-03-11（Playbook v2.5 精简 — 实验性内容分离）

---

## 三级演进结构

```
Level 1：Genes（原子模式）
  ↳ 位置：每个 Agent 的知识库文件
  ↳ 格式：唯一编号 + 场景 + 模式 + 验证记录
  ↳ 来源：每次 Sprint 结束 / 每次会话结束提炼（Playbook §2.2 Step 4）
  
Level 2：Capsules（元模式束）
  ↳ 位置：集中的元模式文件
  ↳ 格式：编号 + 场景 + 关联 Genes 列表 + 组合效果描述
  ↳ 触发：多个 Gene 总是配合使用且产生 1+1>2 效果时提炼
  ↳ 当前状态：框架已建立，等待 Gene 积累到 20+ 后填写
  
Level 3：Evolution Events（演进事件链）
  ↳ 位置：演进事件归档文件（建议 JSONL 格式）
  ↳ 格式：每行一条 {date, trigger, agent, type, patternId, description}
  ↳ 触发：季度归档（不承诺自动触发，Agent 可主动追加）
  ↳ 目的：使演进可审计，防止「不知道为什么改了」
```

---

## 能力局限声明规范

每个 Agent 的知识库文件末尾**必须**包含以下小节：

```markdown
## 已知能力局限（Known Limitations）

> 来源：<最近一次成长会>
> 上次更新：YYYY-MM-DD

| 局限类型 | 描述 | 规避策略 | 成长方向 |
|---------|------|---------|---------|
| ...     | ...  | ...     | ...     |
```

**规则：**
- 局限是反映事实，不是批评——每个 Agent 的局限源自角色约束，不代表失败
- 局限声明和 Gene（L2 模式）在同一文件中，确保能力地图完整
- 成长会（每 3 个 Minor 版本或 30 天触发）后必须检视并更新此小节

---

## 演进触发机制（Strategy Presets）

| 触发条件 | 策略模式 | 执行主体 | 行动 |
|---------|---------|---------|------|
| CI 连续失败 / 生产故障 | `repair-only` | Brain 紧急响应 | 立即开紧急响应会 |
| 新 Major 版本前 | `harden` | Code Reviewer 强化 | 八维度审查 + 强化测试 |
| 新 Sprint 启动（功能探索期）| `innovate` | Brain 主持技术决策会 | 验证新方向 |
| 正常迭代 | `balanced` | 标准 Sprint 流程 | 正常执行 |
| 距上次成长会 > 30 天 | `evolve-team` | Brain 自动触发 | 成长会 + patterns 更新 |
| 连续 3 次 Minor 中 Fixed > Added | `harden` 信号 | PM 感知并上报 | 建议切 harden Sprint |

---

## 版本间信号感知（PM 职责）

PM 在每次 Minor 版本发布后执行「信号扫描」：

1. 检视 CHANGELOG 的 `Fixed` 与 `Added` 比例
   - `Fixed` > `Added` 连续 3 次 → 发出 `harden` 信号，建议调整下一 Sprint 策略
2. 检视 Discussions 帖子的回复情况（Brand 提供数据）
   - 无回复超过 2 个帖子 → 发出「内容触达」信号，Brand 调整内容策略
3. 将信号记录在 Sprint 规划会议纪要的「外部信号」字段中

---

## 新增 patterns 的 DoD

向任何 Agent 知识库新增条目必须满足：

- [ ] 有唯一编号（团队自定编号规则，如 P-XX-NNN，XX 为 Agent 缩写，NNN 三位数字）
- [ ] 有「场景」字段（什么时候用）
- [ ] 有「模式」字段（怎么做，步骤化）
- [ ] 有「验证」字段（哪个版本/事件验证过）
- [ ] 有「来源」字段（哪次会议/实践）
- [ ] （可选）向演进事件归档文件追加一行记录

---

## 纳入 Playbook 正式章节的条件

当以下条件**全部**满足时，Brain 可发起提案将本框架升级为正式 Playbook 章节：

1. Gene 积累量 ≥ 20 条（来自真实 Sprint，非模拟）
2. 至少 1 个 Capsule（元模式束）通过 2 次以上 Sprint 验证
3. 框架与 §14（Agent 经验沉淀机制）的关系已明确（替代 or 扩展）
4. 术语体系（Gene/Capsule/Evolution Event）已与团队成员对齐

*本文件由 Brain 维护，验证达标后提交 Playbook 升级提案。*
