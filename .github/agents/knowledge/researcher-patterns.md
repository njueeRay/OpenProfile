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
