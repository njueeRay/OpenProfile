# PM · L2 验证模式

> 位置：`.github/agents/knowledge/pm-patterns.md`
> 层级：L2（验证有效，可复用）
> 维护人：PM

---

### P-PM-001：Sprint 收尾的知识沉淀触发

**场景：** 每次 Sprint 结束（或 Major 迭代完成）后
**模式：**
1. PM 在提交 CHANGELOG 更新之前，先检视本轮的会议纪要
2. 用 §14.1 的筛选标准判断：有没有 L1 值得升级为 L2？
3. 有 → 写入对应 `knowledge/<role>-patterns.md`；无 → 在会议结束消息中注明"本轮无新 L2"
4. L2 写入后更新 `knowledge/README.md` 的条目计数
**验证：** v4.0 迭代 + 2026-02-27 全体战略会议
**注意：** 不要等到"有空了再整理"，L1 的保质期只有一个 Sprint
**来源：** Playbook §14.3

---

### P-PM-002：DoD 必须在 worktree-context.md 中提前定义

**场景：** 开 worktree 进行专项工作时
**模式：**
1. worktree 创建时同步生成 `worktree-context.md`，其中 DoD 明确列出
2. DoD 的粒度：每条都可以被 binary 判断（完成/未完成），不能有模糊项
3. 合并前逐条确认 DoD，不能"大概差不多了就合"
**验证：** feature/readme-update 专项（2026-02-27）
**来源：** 2026-02-27 全体战略会议
