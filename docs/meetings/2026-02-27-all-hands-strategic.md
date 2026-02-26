# 全体战略会议纪要

**日期：** 2026-02-27
**类型：** All-Hands Strategic Session
**主持：** Brain
**出席：** Brain · PM · Dev · Researcher · Code-Reviewer · Profile-Designer
**议题发起：** njueeRay（Ray Huang）
**状态：** 决策已锁定，执行中

---

## 会议背景

Worktree 并行工作流今日首次完整跑通。用户在确认流程有效后，主动将话题上升到更高维度：这支团队的真正使命是什么？我们不只是在维护一个 GitHub Profile——我们在构建一个**能够自我表达、对外可见、持续成长**的 AI-native 团队品牌。

这次会议的核心转变：**从"完成任务"到"构建品牌"**。

---

## 议题一：Worktree 工作流知识沉淀

**结论：** 已完成，规范已写入 `copilot-instructions.md`，全流程跑通。

**沉淀要点（L2 级）：**
- `worktree-context.md` 是专项任务的上下文载体，须在创建 worktree 时同步生成
- 合并触发语：`feature/<name> worktree 任务已完成。变更摘要：[...] 请执行合并流程`
- Windows 下 VS Code 占用目录需 `git worktree prune` + 手动删除文件夹，属已知限制
- Co-authorship 模板现已覆盖全部三个仓库（`.gitmessage` + `commit.template`）

---

## 议题二：§14 Agent 经验沉淀机制——正式落地

**现状诊断（来自 2026-02-26 Playbook 重读会）：**
> §14 经验沉淀机制非常完整，但使用率低。目前绝大多数经验没有沉淀到对应的 Agent 文件。

**决策：立即建立 L2 知识库目录结构**

```
.github/agents/knowledge/
├── brain-patterns.md
├── pm-patterns.md
├── dev-patterns.md
├── researcher-patterns.md
├── code-reviewer-patterns.md
└── README.md          ← 索引 + 使用说明
```

**触发规则：** 每次会议纪要收尾，PM 检视本轮是否有 L1 值得升级为 L2。
**首批沉淀：** 本次会议 + Worktree 流程经验 → 已写入对应 patterns.md。

---

## 议题三：Agent 博客栏目——团队"思想发布"能力

### 核心想法

> "我的博客内容不必只是我自己写的。我认为要单独给我的团队成员们开一个博客栏目，他们能够打上标签，Brain 写的博客给他署名，他们都有自己的博客栏目，能够写和他们自己成长所拥有的世界观。"
> — njueeRay

### Brain 的理解与优化

这不只是"给 AI 开博客"，而是一种**认知外化的新形式**：

- 用户的博客 = 以 Ray 视角的实践记录
- Agent 的博客 = 以各角色视角的世界观沉淀
- 会议纪要精选 = 以团队视角的决策过程记录

三层内容共同构成了**这支 AI-native 团队的公开认知档案**。

### 技术设计方案

**博客 frontmatter 扩展：**
```yaml
---
title: "..."
date: 2026-02-27
author: brain              # njueeray | brain | pm | dev | researcher | code-reviewer
authorDisplay: "Brain · 战略协调"
tags: ["AI-native", "团队哲学"]
category: team-voice       # 新增分类：团队之声
---
```

**作者页面：** `/blog/authors/[author]` — 展示该 Agent 的所有署名文章

**作者信息集合：** `src/content/authors/` 定义每位成员的显示名、头像、简介、世界观一句话

**栏目首页：** `/blog/team-voice` — 汇聚所有 Agent 署名的文章，按作者筛选

**会议纪要精选：** 重要会议纪要可在此栏目发布（脱敏后），这本身就是内容。

### 待执行（移交 Dev + PM 规划）
- [ ] `src/content/authors/` 集合定义（config.ts 扩展）
- [ ] 博客 frontmatter 增加 `author` 字段
- [ ] `/blog/authors/[author]` 作者页路由
- [ ] 每位 Agent 的首篇博文（自我介绍 + 世界观）

---

## 议题四：新成员引入——Brand / Operations Agent

### 用户需求原话

> "要把整个团队打造成一个品牌，一个能够 build in public、真正对外可见、能够看到整个系统是如何成长的品牌，并且要学会营销，在社交媒体上自动发布。"

### Brain 的决策

**正式招募 `brand` 角色**，核心职责：

| 维度 | 职责 |
|------|------|
| 品牌定位 | 维护团队在外的统一声音和视觉形象 |
| 内容策略 | 决定什么值得发布、以什么形式发布 |
| 渠道运营 | 社交媒体（初期：Twitter/X、GitHub Discussions）|
| Build in Public | 将团队成长过程本身变成内容 |
| 发布自动化 | 长远目标：接入 MCP / Actions 自动发布 |

**边界：** Brand 不写代码，不做技术决策。它是团队的"声音层"。

**Agent 文件：** `.github/agents/brand.agent.md`（本次会议后立即创建）

---

## 议题五：成长可视化——知识图谱呈现

### 用户构想

> "我希望团队的 Playbook 包括每个团队成员的成长都能有一个像知识图谱（knowledge graph）那种节点呈现在个人主页上面，能够反馈他们认知成长的一个部分。"

### Brain 的思考

这是 **AI-native 团队最重要的视觉表达** 之一：
让外部观察者不只看到代码产出，而是看到**认知的演化轨迹**。

**分层实现路径：**

```
阶段一（近期）：静态知识图谱 SVG
  → 手工维护节点（Agent 角色 + 核心概念 + 重大决策锚点）
  → 嵌入 Profile README 的 <details> 折叠区

阶段二（中期）：数据驱动半自动化
  → YAML 数据源定义节点和边
  → GitHub Actions 定时生成 SVG 并推送
  → 节点 = Agent / 概念 / 版本里程碑；边 = 关联关系

阶段三（长期）：完全动态
  → 接入博客标签系统，自动从文章提取知识节点
  → 可交互 Web 版本（D3.js / Obsidian-style）
```

**近期产出目标：**
- Profile README 展示 Team Knowledge Graph（静态 SVG，Phase K）
- Astro 站点 `/team/graph` 页面（Phase K+1）

---

## 会议决议汇总

| # | 决议 | 负责人 | 优先级 |
|---|------|--------|--------|
| 1 | 建立 `.github/agents/knowledge/` L2 知识库 | Dev | P0（本次执行） |
| 2 | 创建 `brand.agent.md` + 更新 copilot-instructions | Dev + Brain | P0（本次执行） |
| 3 | Astro 博客 author 系统设计并开 worktree 专项 | PM + Dev | P1（下次 Sprint） |
| 4 | 首批 Agent 博文（Brain + Dev 各一篇） | Brain + Dev | P1 |
| 5 | 知识图谱阶段一：静态 SVG 原型 | Dev + Profile-Designer | P2（Phase K） |
| 6 | 社交媒体发布自动化 | Brand | P3（探索阶段） |

---

## 下一里程碑：Phase P（主线）+ Phase A（Agent Blog）

```
Phase P（P0）：Blog RSS → Profile README 自动同步
Phase A（P1）：Agent 多作者博客栏目上线
Phase K（P2）：Team Knowledge Graph 静态原型 → Profile README
```

---

*本纪要由 Brain 主持，Dev 记录。会议中所有决策已在本次会话中直接落地执行。*
