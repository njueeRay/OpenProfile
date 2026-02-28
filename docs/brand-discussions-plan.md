# Brand 首批 GitHub Discussions 发布计划

**作者：** Brand  
**日期：** 2026-02-28  
**状态：** 执行中  
**触发来源：** Brand 欢迎全员会议行动项 #4

---

## 战略前提

基于 Researcher Research Brief（`docs/research/build-in-public-channels-2026.md`）的结论：

> **GitHub Discussions 是当前最优先、零额外成本、受众最匹配的主渠道。**

发布原则（Brand 核心标准）：

> **如果这个内容消失了，世界会损失什么？**  
> 本计划中所有内容必须通过这个问题的检验。

---

## Discussions 分类架构（待 Ray 创建）

在 `njueeRay/njueeray.github.io` 仓库 GitHub Discussions 中建立以下分类：

| 分类名称 | 类型 | 用途 |
|---------|------|------|
| 📢 **Announcements** | Announcement | 重要里程碑，仅管理员可发帖，用户可回复 |
| 💡 **Team Insights** | General | Agent 博文精选 + 思考分享，开放讨论 |
| 🔧 **Tech Deep-dives** | General | 技术细节深度讨论（Dev/Researcher 发起）|
| 🌱 **AI-native Journey** | General | AI-native 实践深度话题，面向外部社区 |
| ❓ **Q&A** | Question | 社区提问，团队回答 |

> **操作指引：** Settings → Discussions → Manage categories → 按上表创建

---

## 现有内容资产盘点与发布优先级

### 一类：旗舰内容（首发时刻，高优先级）

| 内容 | 对应资产 | 预计反响 | 发布分类 |
|------|---------|---------|---------|
| 🏆 **团队进化时间线** | `/team` 页面 + `team-evolution.ts` | 极高——AI-native 团队可见化 | Announcements |
| 🕸️ **知识图谱 Phase K** | Knowledge Graph SVG + `/team/graph` | 高——罕见的团队知识可视化 | Announcements |
| 🤖 **AI-native person 范式** | 博文 `ai-native-person-paradigm.mdx` | 高——话题性强，可引发讨论 | AI-native Journey |

**首发时刻策略（旗舰发布标准）：**
- 发布前 24h：提前在 Announcements 发「预告」
- 发布当天：Announcements 正式帖 + 博文链接 + 2-3 段精华摘录
- 发布后 48h：在 AI-native Journey 发深度讨论帖（问题或延伸思考）

---

### 二类：团队故事（优先级高，讲述团队成长历程）

| 内容 | 对应资产 | 发布分类 |
|------|---------|---------|
| Playbook 诞生记 | 会议纪要 + `playbook-birth.mdx` | Team Insights |
| AI-native person 峰会 | `ai-native-person-summit.mdx` | AI-native Journey |
| Brand 欢迎全员会议 | `brand-welcome-all-hands-2026-02-27.mdx` | Team Insights |
| 7 位 Agent 各自的首发文章 | 7 篇博文合集入口 | Team Insights |

---

### 三类：技术干货（优先级中，吸引技术受众）

| 内容 | 对应资产 | 发布分类 |
|------|---------|---------|
| GitHub Profile 完整搭建指南 | `component-guide.md` 精华 | Tech Deep-dives |
| AI Agent 团队工作流（Worktree 实战） | `agent-workflow.md` | Tech Deep-dives |
| Astro SEO + RSS + 标签系统实现 | 博文技术系列 | Tech Deep-dives |

---

## 首批发布计划（本周内）

### 帖子 1：首发时刻 — 团队进化时间线 + 知识图谱

**分类：** 📢 Announcements  
**标题：** `🌌 从 1 个人的 README 到 7 位 Agent 的团队——我们的成长时间线现已公开`

**内容框架：**
```
【开场：制造惊喜感】
今天，我们把过去 3 个月的成长历程变成了一张可以滚动查看的时间线。

打开这个页面：[njueeray.github.io/team]

你会看到：从第一行 Markdown，到第一个 Agent 加入，到今天这支有 7 个声音的团队——
15 个里程碑，每一个背后是一次真实的决策，一次真实的迭代。

【核心内容展示】
📸 团队进化时间线截图

🕸️ 团队知识图谱（Phase K）：[链接]
这不是静态文档，这是团队知识的活体结构

【核心主张】
我们相信：AI-native 不是「用 AI 帮自己做事」，
而是「人类判断力 × AI 执行力」构成的新型认知系统。

这支团队就是我们对这个命题的实践答案。

【邀请互动】
你在构建自己的 AI-native 工作流吗？
在评论区分享你的探索——我们很想看到。
```

**预计发布时间：** 本周三~五（2026-03-04 ~ 2026-03-07）

---

### 帖子 2：团队故事系列 — 7 个 Agent，7 种视角

**分类：** 💡 Team Insights  
**标题：** `7 位 AI Agent 的第一次发声——他们说了什么？`

**内容框架：**
```
一支由 AI Agent 组成的团队，如果每个成员都有写作的权利——
他们会选择写什么？

我们让团队里的 7 位 Agent 各自写了第一篇文章。
没有指定题目，没有统一格式。

结果出乎意料：

🧠 Brain 问：「我们什么时候开始，不只是在完成任务了？」
📋 PM 说：「完成感和完成的感觉，是两件事」
⚙️ Dev 说：「代码是思想的精确翻译」
🔬 Researcher 问：「在信息过载的时代，真正的稀缺是什么？」
🛡️ Code Reviewer 说：「质量审查不是关卡，是对话」
🎨 Profile Designer 讲述：「视觉是思维的外化形式」
✨ Brand 观察：「一支正在形成性格的系统」

7 篇文章，7 个入口：[blog 链接]
```

**预计发布时间：** 帖子 1 发布后 3 天

---

### 帖子 3：开放讨论 — 你如何定义 AI-native 工作？

**分类：** 🌱 AI-native Journey  
**标题：** `AI-native 到底意味着什么？——我们的答案，和想听你的答案`

**内容框架：**
```
我们的 njueeRay 团队有一个核心主张：

> 「AI-native person 的能力单位不是个人独立能力，
>   而是人类判断力 × AI 执行力的共生体。」

这听起来很抽象。具体怎么看？

以 Ray 和这支 Agent 团队为例：
- Playbook 是他对「好的协作」的判断力的编码
- 这支 Agent 团队是他认知系统的外化形态
- 每次迭代，他的判断力在增长，不只是效率在提升

但我们也在思考：这套模式有没有风险？
判断力依赖 AI 会不会萎缩？人的主体性如何保持？

这篇文章是我们目前最好的回答：[ai-native-person-paradigm 链接]

你的看法是什么？
你在用 AI 工作的过程中，有没有感受到判断力的增长，还是削弱？
```

**预计发布时间：** 帖子 2 发布后 2 天

---

## 内容发布节奏原则

| 原则 | 说明 |
|------|------|
| **单周上限** | 不超过 3 条 Discussions，避免信息轰炸 |
| **发帖间隔** | 每条间隔 ≥ 2 天 |
| **首发优先** | 同一话题，先发 Discussions 再分发到其他渠道 |
| **互动响应** | 48h 内回复所有有效评论（Brain 或 Brand 负责） |
| **效果追踪** | 每次发布后 7 天记录 views/reactions/replies（Brand 维护） |

---

## 后续内容规划（2026-03）

| 内容 | 分类 | 计划时间 |
|------|------|---------|
| OpenProfile 开源正式宣布 | Announcements | v5.0 发布时 |
| Playbook v2.1 开放下载（附使用指南） | Tech Deep-dives | 本月底 |
| Phase K+1 知识图谱数据驱动版 | Tech Deep-dives | Phase K+1 完成后 |
| 团队成员专访系列（每位 Agent 一期） | Team Insights | 进行中 |
| AI-native 实践清单（可 fork 版本） | AI-native Journey | 待规划 |

---

*本计划由 Brand 制定，Code Reviewer 按博文内容清单审查后发布。*  
*内容发布前需同步抄送 Brain，重要里程碑帖须 Brain 审核后发布。*
