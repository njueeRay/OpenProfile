# Brand 内容决策备忘：Discussion #8 发布计划

**决策方：** Brand Agent  
**日期：** 2026-03-10  
**状态：** ✅ 内容已定稿，待手动发布至 GitHub Discussions (Tech Deep-dives)

---

## Brand 的思考过程

我花了一些时间认真考虑这个问题，而不是条件反射地"发布"。

### 有什么值得发布的？

过去两周，团队完成了：
1. **GEP 团队进化机制**（2026-03-10-01 会议）：一套完整的 Agent 能力演进跟踪体系，包含 patterns 文件、evolution-events.jsonl、Playbook §19
2. **工具层升级调研**（本次研究）：深入研究 Claude Skills / Hooks / MCP 生态，产出了落地路线图

这两件事合起来，形成了一个完整的故事：**"一个 AI-native 团队如何持续升级自身能力"**。

### 这值得发布吗？

诚实地说：**是的，而且是很好的 Build in Public 素材**。原因：
- 技术深度真实，不是表演——这是我们实际在做的事
- 对其他想构建 AI Agent 团队的人有直接参考价值
- 展示了"认真思考工具层"的工程态度，区别于大多数「用 GPT 写几行代码」的展示

### 什么值得发布，什么不值得？

**应该发布的：** 「我们在研究什么、为什么、早期发现是什么」——这个阶段的真实思考  
**不应该发布的：** 技术细节堆砌（JSON config 大段、hooks 参数表）——这些是文档，不是故事

**发布形式：**  Discussion，而非博文。原因：
- 还在探索期，Discussion 更适合对话和反馈
- 博文适合「已验证的经验总结」，这个阶段用 Discussion 更诚实

---

## 实际决策

**发布 Discussion #8：「我们正在给 AI Agent 团队装「工具层脚手架」——研究笔记分享」**

**要点：**
- 我们在研究 Hooks（生命周期钩子）、Skills（知识封装单元）、MCP 生态
- 为什么研究这个：让 Agent 更像真正的工程师，而不只是执行文本命令
- 早期发现：Hooks 的 TeammateIdle + TaskCompleted 对 Agent 团队有直接价值
- 一个问题给读者：你们怎么给自己的 Copilot / Claude 工作流做「质量自动化」？

**不发的部分：**
- 不发技术实现细节（那是给开发者的文档，不是 Discussion 的内容）
- 不吹嘘「我们的 Agent 团队多厉害」——那是表演，不是分享

---

## Draft 草稿

（投稿到 GitHub Discussions — Tech Deep-dives 分类）

---

**标题：** 给 AI Agent 团队装「工具层脚手架」：Hooks × Skills × MCP 研究笔记

**正文：**

最近我们暂停了功能开发，做了一件可能更重要的事：**认真研究我们的 Agent 团队少了什么工具层能力**。

简单说：我们有 7 个 AI Agent 各司其职，但它们之间的「质量门控」完全靠人工——是我来检查「Code Reviewer 跑了吗」「CHANGELOG 更新了吗」。这不对。

所以我们深入研究了三件事：

**1. Claude Code Hooks（生命周期钩子）**  
有个事件叫 `TeammateIdle`——当一个 Agent 准备停下来的时候会触发。如果钩子返回「不行，你还没完成某某检查」，Agent 就继续工作。  
还有 `TaskCompleted`，在任务被标记完成前运行验证脚本。  
这两个加起来，就是我们一直手动做的「DoD 检查」的自动化版本。

**2. Claude Agent Skills（知识封装单元）**  
Anthropic 在 2025 年发布了一个开放标准：每个 SKILL.md 文件是 Claude 的一个「专项技能」，按需加载、跨平台通用。  
我们的每个 Agent（Brain / Dev / Researcher...）的核心知识，理论上都可以打包成 Skills，让 Claude 在任何地方动态加载——不需要复制配置文件。

**3. MCP 生态 —— 技能发现**  
有个叫 `agent-skill-loader` 的 MCP，专门解决「Agent 如何发现和加载技能库」的问题。另外发现了 `mengram`，能把 Hooks 和 Memory 融合——会话开始自动加载上次的认知状态，会话结束自动保存。

---

**一个问题想問大家：**  
你们在用 Claude Code / Copilot 工作的时候，有没有做过什么「自动化质量检查」的尝试？  
Hook 系统？还是其他方式？  
很好奇不同规模的团队是怎么处理这个问题的。

---

> *这是来自 njueeray.github.io 「AI-native 工作流实验室」系列*  
> *技术实现细节已整理为博文：[工具层架构三件套：Skills × Hooks × MCP](https://njueeray.github.io/blog/tool-layer-architecture-skills-hooks-mcp/?utm_source=github_discussions&utm_campaign=blog)*

---

**发布时间：** ✅ 条件已满足（Hooks 实施完成 + 对应博文已上线 2026-03-10）  
**发布分类：** Tech Deep-dives  
**操作步骤：** https://github.com/njueeRay/njueeray.github.io/discussions/new → 选 Tech Deep-dives → 粘贴上方 Draft 正文
