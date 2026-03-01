# Brand 首发 Discussion 草稿

**状态：** 待发布（v5.3.0 发布后执行）  
**作者：** Brand Agent  
**发布频道：** GitHub Discussions → Announcements  
**目标仓库：** `njueeRay/njueeray.github.io`

---

## 帖子 1：首发时刻 — 用 AI Agent 团队构建 GitHub Profile

### 分类
📢 **Announcements**

### 标题
```
🤖 我用 7 个 AI Agent 协作构建了这个 GitHub 主页 — 来看看我们是怎么做到的
```

### 正文

---

你好，GitHub 社区 👋

我叫 Ray，是一个 **AI-native person** — 我相信人类最强大的工作方式是"人类判断力 × AI 执行力"的共生体，而不是把 AI 当工具用。

今天，我想分享一个特别的项目：我用 **7 个专职 AI Agent 组成的团队**，协作构建了这个 GitHub 主页和博客站点。

---

### 🏗️ 这不只是一个 GitHub Profile

这是一个正在运转中的 AI 协作系统：

| Agent | 职责 |
|-------|------|
| `brain` | 战略协调，你的唯一汇报窗口 |
| `pm` | Sprint 规划、版本发布管理 |
| `dev` | 全栈实现（Python/TS/Astro/YAML）|
| `researcher` | 技术调研，输出浓缩结论 |
| `code-reviewer` | 七维度质量门禁 |
| `profile-designer` | 视觉规划与组件选型 |
| `brand` | 品牌运营（就是写这篇帖子的我）|

我们用了不到一周时间，从零构建出：
- 🎨 一个暗色终端风格的 GitHub Profile README
- 📝 一个 Astro 5 博客站点（16 篇文章，7 位 Agent 各有首发文章）
- 🤖 完整的 CI/CD 流水线（Lighthouse CI + a11y 检查 + 自动部署）
- 🗺️ 知识图谱、团队进化时间线等可视化页面

---

### 🌱 什么是 AI-native person？

> **能力单位不是"个人独立能力"，而是"人类判断力 × AI 执行力"的共生体。**

这不是"用 AI 帮我写代码"——而是把 AI 作为认知系统的外化形态，团队的工作记忆、决策框架、执行手臂全都外化出来，形成一个 **可持续运转的协作系统**。

我写了一篇文章详细解释这个范式：  
👉 [什么是 AI-native person？](https://njueeray.github.io/blog/what-i-mean-by-ai-native/?utm_source=github_discussions&utm_medium=social&utm_campaign=launch)

---

### 🔓 完全开源

整个项目的 Agent 团队配置、工作流、Playbook 都开放在：  
👉 [njueeRay/OpenProfile](https://github.com/njueeRay/OpenProfile)

---

### 💬 我想听听你的想法

- 你认为 AI-native 团队协作和传统 AI 辅助编程有什么本质区别？
- 如果你也在探索 AI-native 实践，你现在面临的最大挑战是什么？

---

*这篇帖子由 Brand Agent 执笔，Ray Huang 审阅发布。*

---

## 帖子 2：Tech Deep-dive — 用 Astro 5 + satori 生成 OG 封面图

### 分类
🔧 **Tech Deep-dives**

### 标题
```
在静态站点中生成动态 OG 封面图：Astro 5 + satori + @resvg/resvg-js 实战
```

### 正文（一周后发布）

---

v5.3.0 发布后，我们引入了**构建时 OG 封面图自动生成**：每篇博文都有一张暗色终端风格的 1200×630 PNG，包含文章标题、作者、日期和标签。

技术栈：
- `satori`（HTML/CSS → SVG，纯 JS，无 native 依赖）
- `@resvg/resvg-js`（SVG → PNG，WASM）
- `@fontsource/jetbrains-mono`（本地字体，无需网络）

核心代码片段：[链接补充]

踩坑记录：
1. TypeScript `Buffer<ArrayBufferLike>` vs `BodyInit` 类型冲突
2. satori 对 flexbox 外的 CSS 支持有限（不支持 grid）
3. 字体必须显式加载（不能为空数组）

---

## 发布清单（Brand 操作指引）

- [x] v5.5.0 发布并部署到 GitHub Pages（✅ 2026-03-01，tag v5.5.0）
- [x] Ray 在仓库 Settings → Discussions 中确认以下分类已创建：（✅ 已全部确认）
  - 📢 Announcements
  - 💡 Team Insights  
  - 🔧 Tech Deep-dives
  - 🌱 AI-native Journey
- [x] 在 njueeRay/njueeray.github.io 发布帖子 1（✅ Discussion #6 — https://github.com/njueeRay/njueeray.github.io/discussions/6）
- [ ] 在 njueeRay/OpenProfile 发布同步公告
- [ ] 7 天后发布帖子 2（技术深度分享）
