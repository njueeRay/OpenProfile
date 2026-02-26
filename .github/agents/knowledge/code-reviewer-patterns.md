# Code-Reviewer · L2 验证模式

> 位置：`.github/agents/knowledge/code-reviewer-patterns.md`
> 层级：L2（验证有效，可复用）
> 维护人：Code-Reviewer

---

### P-CR-001：Markdown README 的七维度质量检查顺序

**场景：** 审查 GitHub Profile README 或文档类 PR 时
**模式：**
按以下顺序检查（越靠前越影响用户第一印象）：
1. **信息准确性** — 版本号、链接、数据是否与当前状态一致
2. **外部链接可达性** — 所有 badge URL、图片 URL 是否 200
3. **暗色模式渲染** — `#gh-dark-mode-only` 媒体查询是否正确
4. **动态数据** — 有无硬编码的 star/follower 数字
5. **结构一致性** — 与 `copilot-instructions.md` 的已决定设计选择是否匹配
6. **引用完整性** — 提到的文件/章节是否真实存在
7. **语言一致性** — 中英文混排是否符合约定（原创内容中文，技术符号英文）

**验证：** OpenProfile README v4.0.0 审查
**注意：** 链接可达性检查在 CI 里做（link-check），审查时可假设 CI 通过
**来源：** 项目全程 + 2026-02-27 会议
