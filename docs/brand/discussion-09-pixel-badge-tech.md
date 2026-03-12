# Discussion #9 — 我在 GitHub Profile 里放了一张 AI 团队的像素头像墙

**草稿状态：** 待 Ray 在浏览器手动发布  
**目标仓库：** njueeRay/OpenProfile  
**分类：** Team Insights  
**话题标签建议：** `build-in-public` `github-profile` `ai-native`

---

## 正文草稿

---

如果你今天访问 [github.com/njueeRay](https://github.com/njueeRay)，你会在 README 里看到一个不太寻常的东西——一排 7 个像素风格的 AI Agent 小人：

> **Brain · PM · Dev · Researcher · Code-Reviewer · Brand · Prof.Designer**

这不是装饰性的 8-bit 怀旧符号，而是我工作方式的一张「名片」。

---

## 为什么要在 Profile 里放 AI 团队？

我在用 GitHub Copilot Agent 模式维护我的所有 GitHub 资产——个人主页、个人网站、以及 OpenProfile 这个工作流仓库本身。

这 7 个 Agent 各有具体职责：Brain 做跨会话的策略协调，PM 维护 Sprint Board，Dev 写代码，Researcher 负责外部信息调研，Code-Reviewer 把关质量，Profile-Designer 管视觉，Brand 控制对外传播一致性。

**这不是「AI 帮我写代码」，而是「AI 团队帮我维护认知连续性」。** 每一次我打开 VS Code，这 7 个 Agent 已经知道当前的 Sprint 状态、上一次的决策和理由、以及「下一步」的建议。

---

## 像素头像从哪里来？

`njueeray.github.io` 上有一个 [/agents](https://njueeray.github.io/agents) 页面，每个 Agent 都有一张用 Canvas 绘制的 8×8 像素头像（在 `PixelAvatarCanvas.tsx` 里实现）。

但 GitHub Profile README 只支持静态图片，不能运行 JavaScript Canvas。

所以我写了一个 Python 脚本（`scripts/gen-pixel-badge.py`）：读取和网站相同的像素数据，离线生成 SVG，然后嵌入 README。这样做的好处是：**网站和 Profile 使用同一份像素数据**，如果哪天改了头像，重新运行脚本就能同步。

核心逻辑：

```python
PIXEL_AVATARS = {
    "brain": [
        [0,0,1,1,1,1,0,0],
        [0,1,2,2,2,2,1,0],
        # ... 8 rows × 8 cols
    ],
    # ... 7 agents
}

def render_agent_svg(name, pixels, color, accent):
    block = 5  # px per pixel
    for row_i, row in enumerate(pixels):
        for col_i, val in enumerate(row):
            if val == 0:
                continue
            fill = color if val == 1 else accent
            x = pad_x + agent_idx * (40 + gap_x) + col_i * block
            y = pad_y + row_i * block
            # write SVG <rect>
```

生成结果是两张 SVG（dark / light 主题切换），通过 `<picture>` 标签嵌入 README：

```markdown
<picture>
  <source media="(prefers-color-scheme: dark)"  srcset="assets/agent-pixel-badge-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/agent-pixel-badge-light.svg">
  <img src="assets/agent-pixel-badge-dark.svg" alt="AI Team Pixel Badges" width="396">
</picture>
```

---

## 如果你也想做类似的事

完整的工作流模板在 [njueeRay/OpenProfile](https://github.com/njueeRay/OpenProfile)。

核心文件：
- `scripts/gen-pixel-badge.py` — 像素头像条生成器
- `scripts/gen-knowledge-graph.py` — 团队知识图谱 SVG 生成器
- `ai-team/agents/*.agent.md` — 7 个 Agent 的角色定义文件（直接 fork 使用）
- `ai-team/skills/*.md` — 每个 Agent 对应的技能文件

最小可行启动：fork 仓库，编辑 `copilot-instructions.md` 写入你自己的项目背景，就能让 Brain 开始工作了。

---

## 一个问题给大家

> **你们是怎么在多个 AI 会话之间保持上下文连续性的？**
>
> 我现在的做法是用 `copilot-instructions.md` 做"长期记忆"，用 Sprint Board 做"工作记忆"。  
> 每次新会话开始，Agent 先 Recall（读状态），再 Execute（做一件事），最后 Ship（提交关闭）。
>
> 好奇大家有没有不同的解法，或者遇到过哪些坑——欢迎在评论区分享。

---

*发布建议：在 njueeRay/OpenProfile > Discussions > Team Insights 分类下创建。*
