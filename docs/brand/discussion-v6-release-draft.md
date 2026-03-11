# Brand Discussion 草稿 — v6.0.0 + v6.1.0 发版公告

> **发布时机：** 本文档创建于 2026-03-11，需在 72h 内发布（截止 2026-03-13）  
> **频道：** GitHub Discussions → njueeRay/OpenProfile  
> **类型：** Announcements（公告类）  
> **Owner：** Brand → Ray 手动发布  
> **注意：** 当前工具不支持直接创建 GitHub Discussion，需 Ray 访问 [njueeRay/OpenProfile/discussions/new?category=announcements](https://github.com/njueeRay/OpenProfile/discussions/new?category=announcements) 手动发布

---

## 标题

```
v6.0.0 + v6.1.0 发布：博客内容生态完整落地 + 协作模式升级
```

---

## 正文

```markdown
## 🚀 v6.0.0 + v6.1.0 双版本发布：这次我们做了什么

过去几天，团队完成了两个版本的迭代。相对于技术细节，更重要的是幕后发生的一次**工作方式的范式转移**。



### v6.0.0 — 博客内容生态完整落地

这个版本主要确认了 v5.8~v5.10 期间完成的工作：

| 功能 | 说明 |
|------|------|
| **expressive-code** | 代码块一键复制 + 行高亮 + 文件名标注（github-dark-dimmed 主题）|
| **Callout 组件** | tip / warning / info / note 四类终端风格提示框 |
| **阅读时长** | 中文 500字/分钟，自动显示在 BlogCard 和文章页头 |
| **SeriesNav** | 系列文章上/下篇导航，支持中文系列名 |
| **首页品牌化** | 双栏叙事重设计，左侧 terminal 动效 + 右侧 AI-native 核心主张 |

但 v6.0.0 真正重要的变化不是功能，而是**协作模式升级**：

> 从「Ray 提需求 → 团队执行」的 AI-assisted 模式，升级为「Board 驱动 Ship 循环」的 AI-native 模式。
> 
> 每个工作会话：**Recall**（读 Sprint Board） → **Execute**（只做一件事，做完）→ **Ship**（更新 Board + 触发对外）
> 
> 这个改变的核心不是效率——是 **Ray 的判断力有没有随着 AI 能力的增强同步成长**。



### v6.1.0 — 读者入口 + 外循环机制

这个版本只做了一件事：

📖 **[新博文] 用 2 分钟了解这个项目**  
→ 详见：[njueeray.github.io](https://njueeray.github.io)（featured 文章）

如果你是第一次看到这个项目，这篇文章会告诉你：这里在做什么、AI 团队怎么工作、你能从这里拿走什么。

另外，从 v6.0.0 起，我们正式启动「**外循环强制机制**」：每个版本发布后 72h 内，Brand 必须发布 Discussion 或博文摘要。这是我们对「对外始终排在链条末端」这个结构性问题的直接反制。

你正在看的这条 Discussion，就是这个机制的第一次执行。



### 开放问题

我们有一个问题想问：

> **作为访客 / 读者 / 开发者，你最想看到这个项目接下来做什么？**

选项参考：
- A：更多技术实现细节（expressive-code 怎么配置，SeriesNav 怎么扩展）
- B：更多协作方式记录（7 个 Agent 如何争论、如何决策）
- C：OpenProfile 仓库更完整的使用文档（fork 后怎么快速上手）
- D：Agent 可视化（Pixel Agents 形态）

或者你有其他想法——**直接留言**，我们会在 72h 内回复并把你的意见纳入下一个 Sprint 的优先级排序。

---

[→ njueeray.github.io 博客](https://njueeray.github.io)  
[→ OpenProfile 仓库](https://github.com/njueeRay/OpenProfile)  
[→ CHANGELOG v6.0.0](https://github.com/njueeRay/njueeray.github.io/blob/main/CHANGELOG.md)
```

---

## 发布前检查

- [ ] Ray 访问 Discussions 页面创建新讨论
- [ ] 选择分类：Announcements
- [ ] 标题复制上方标题
- [ ] 正文复制上方正文（Markdown 格式）
- [ ] 发布后记录发布时间：______  
- [ ] 72h 后（自动提醒：2026-03-13）执行 72h 跟进模板

---

## 发布后 Sprint Board 更新

发布后，将 Sprint Board 条目 #5 更新为 ✅ 完成，并在 Decision Journal 追加：

```
| 03-11 | v6.0.0+v6.1.0 Brand 72h Discussion | ✅ 发布 | 首次执行外循环强制机制 |
```
