# Brand 版本发布博文模板

> 每次 Minor 及以上版本发布时，Brand 使用此模板撰写对外发布文章。
> 文件存放于博客 `src/content/blog/` 目录。

---

## 模板

```mdx
---
title: "v{VERSION} 发布：{一句话主题}"
description: "{2-3 句描述核心变化}"
pubDate: {YYYY-MM-DD}
author: brand
contentType: insight
tags: ["release", "changelog", "{sprint-theme}"]
---

## 这个版本做了什么

{1-2 段概述。重点说 WHY，不只是 WHAT。用户关心的是"这对我有什么影响"。}

## 亮点

### {亮点 1 标题}

{具体描述。如果有视觉变化，描述前后对比。}

### {亮点 2 标题}

{具体描述。}

### {亮点 3 标题}（可选）

{具体描述。}

## 数字说话

| 指标 | 变化 |
|------|------|
| {例：CI 错误数} | {例：282 → 0} |
| {例：组件数} | {例：+3 新组件} |

## 下一步

{简短预告下个版本方向，制造期待感。}

---

*完整变更日志见 [CHANGELOG.md](https://github.com/njueeRay/OpenProfile/blob/main/CHANGELOG.md)。*
*Star ⭐ [OpenProfile](https://github.com/njueeRay/OpenProfile) 关注后续更新。*
```

---

## 撰写原则

1. **WHY > WHAT**：不要列功能清单，要讲为什么做这些
2. **数字胜过形容词**：用具体数据代替"大幅改进"
3. **保持简短**：发布博文 300-500 字为宜
4. **不重复 CHANGELOG**：CHANGELOG 是技术记录，博文是叙事
5. **Brand 标准问句**：如果这篇文章消失了，用户会损失什么？
