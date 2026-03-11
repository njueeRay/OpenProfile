# Brand Discussion 草稿 — v6.2.0 开源宣布

> **发布时机：** v6.2.0 tag 推送后 72h 内（截止 2026-03-13）  
> **频道：** GitHub Discussions → njueeRay/OpenProfile  
> **类型：** Announcements（公告类）  
> **Owner：** Brand → `gh` CLI 自动发布（待 gh auth 完成）

---

## 标题

```
OpenProfile 正式开源：用 AI Agent 协作构建 GitHub Profile 的完整示范
```

---

## 正文

```markdown
## 🎉 OpenProfile 正式开源

今天，[njueeRay/OpenProfile](https://github.com/njueeRay/OpenProfile) 正式对外开放。

这不只是一个 GitHub Profile README 模板——**这是一套「AI-native 工作方式」的完整记录和可复用示范**。

---

### 这个项目是什么

两个月前，我开始了一个实验：

> 不独自构建个人主页，而是组建一支 7 人 AI Agent 团队，让他们负责设计、开发、调研、审查和对外运营。我只负责判断。

结果是这个：
- 🌐 **站点**：[njueeray.github.io](https://njueeray.github.io)（Astro 5 + GitHub Pages）
- 📋 **治理仓库**：[njueeRay/OpenProfile](https://github.com/njueeRay/OpenProfile)（Agent 规范 + 决策日志 + 协作流程）

---

### 你可以从这里拿走什么

| 内容 | 路径 |
|------|------|
| **7 个 Agent 定义文件**（可直接复用） | `.github/agents/` |
| **copilot-instructions.md 范式**（权限边界 + DoD 规范）| `.github/copilot-instructions.md` |
| **Sprint Board 极简治理**（50 行内驱动完整项目）| `docs/governance/sprint-board.md` |
| **Astro 5 站点模板**（博客 + 个人主页）| [njueeRay/njueeray.github.io](https://github.com/njueeRay/njueeray.github.io) |
| **Fork 上手指引**（5 分钟快速启动）| [CONTRIBUTING.md](https://github.com/njueeRay/OpenProfile/blob/main/CONTRIBUTING.md) |

---

### 开源公告博文

完整的技术故事（架构 + 踩坑 + 工作哲学）见这篇博文：

📖 [OpenProfile 正式开源：如何用 AI Agent 协作构建你的 GitHub Profile](https://njueeray.github.io/blog/open-source-announcement)

---

### 一个开放邀请

如果你有任何问题、想法或想参与贡献——

- **提 Issue**：[njueeRay/OpenProfile/issues](https://github.com/njueeRay/OpenProfile/issues)
- **参与讨论**：直接在这条帖子回复
- **Fork + Star**：如果你觉得这套方法值得传播

最重要的问题：**你最想看到这个项目接下来做什么？**

---

*这个项目的每一行代码、每一个决策、每一个 Agent 规范文件，都是一次关于「人机共生」的真实记录。欢迎来看，欢迎一起做。*
```

---

## 发布 checklist

- [ ] `gh auth login` 完成
- [ ] 获取 OpenProfile 仓库的 discussionCategoryId（Announcements category）
- [ ] 执行 GraphQL mutation 发布 Discussion
- [ ] 发布后将 Sprint Board #5（v6.1.0 发版公告）和本 D-3 标记为 ✅
- [ ] 72h 内回复留言

---

## GraphQL 发布命令（gh auth 完成后执行）

```powershell
# Step 1: 获取 Announcements category ID
& "F:\Software\Github CLI\gh.exe" api graphql -f query='
query {
  repository(owner: "njueeRay", name: "OpenProfile") {
    discussionCategories(first: 10) {
      nodes { id name }
    }
  }
}'

# Step 2: 发布 Discussion（替换 CATEGORY_ID）
$title = "OpenProfile 正式开源：用 AI Agent 协作构建 GitHub Profile 的完整示范"
$body = @"
（粘贴上方正文内容）
"@

& "F:\Software\Github CLI\gh.exe" api graphql -f query='
mutation CreateDiscussion($repoId: ID!, $categoryId: ID!, $title: String!, $body: String!) {
  createDiscussion(input: {
    repositoryId: $repoId,
    categoryId: $categoryId,
    title: $title,
    body: $body
  }) {
    discussion { url }
  }
}' -f repoId="R_kgDON..." -f categoryId="CATEGORY_ID" -f title="$title" -f body="$body"
```
