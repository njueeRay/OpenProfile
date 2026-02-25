# 设计决策日志

> 记录每次迭代中确认的设计选择，避免 Agent 在后续会话中重复讨论已决定的问题。
> 格式：`[日期] 决策内容 — 理由 — 决策人（you/copilot/协商）`

---

## 视觉风格

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| 整体色调 | GitHub Dark (#0d1117) | 与 GitHub 原生暗色模式一致，零违和感 | 2026-02-25 |
| 主强调色 | `#58a6ff`（GitHub Blue） | Profile README 与 Astro 站点均统一; 在暗色背景上对比度高 | 2026-02-25 |
| 辅助色 | `#3fb950`（Green）/ `#e3b341`（Yellow） | 终端提示符 / fork 标签差异化 | 2026-02-25 |
| 字体风格 | JetBrains Mono / Fira Code | 终端美学 + 代码可读性 | 2026-02-25 |
| 动效密度 | 克制（3 个动效组件） | Typing SVG + capsule-render twinkling + 贡献蛇，避免过度动效 | 2026-02-25 |

---

## Header 区域

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| Header 类型 | capsule-render waving | 波浪形渐变，视觉层次好，不廉价 | 2026-02-25 |
| 渐变颜色 | `0:0d1117 → 100:1a1b27` | 深色到更深色，不抢内容注意力 | 2026-02-25 |
| 动画 | twinkling | 微妙闪烁，比 fadeIn/blinking 更克制 | 2026-02-25 |
| 标题文字 | `njueeRay` + 描述行 | 用户名 + 三个角色标签 | 2026-02-25 |

---

## 统计组件

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| Stats 主题 | `github_dark_dimmed` | 统一深色调，与 Streak 不撞色 | 2026-02-25 |
| Streak 主题 | `github-dark-blue` | 蓝色系与主强调色一致 | 2026-02-25 |
| Activity Graph | ✅ 启用，`github-compact` + area 填充 | 补全"时间维度"数据可视化 | 2026-02-25 |
| WakaTime | ✅ 已接入，`anmol098/waka-readme-stats` | 信息密度高，含 OS/编辑器/项目分布 | 2026-02-25 |
| 贡献蛇动画 | ✅ 启用，`Platane/snk` | 视觉亮点，暗色版，每日自动更新 | 2026-02-25 |

---

## 技术栈展示

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| 展示方式 | skill-icons（深色版） | 图标精美、辨识度高、无需额外账号 | 2026-02-25 |
| 包含的技术 | py, cpp, ts, js, react, docker, git, linux | 覆盖主力语言 + 核心工具链 | 2026-02-25 |
| 分类方式 | 单行展示，不分类 | Profile README 空间有限，Astro 站点做详细分类 | 2026-02-25 |

---

## Featured 项目选择

| 维度 | 决策 | 理由 | 日期 |
|------|------|------|------|
| 项目 1 | OpenProfile | 本项目，AI-Native 工作流最佳实践 | 2026-02-25 |
| 项目 2 | wechat_article_exporter | 原创工具，与 LLM/RAG 直接关联 | 2026-02-25 |
| ~~MediaCrawler~~ | ❌ 已移除 | fork 项目，展示可能引发归属误解 | 2026-02-25 |

---

## 已废弃的方案

> 记录曾经考虑但最终放弃的选择，以及放弃原因（避免未来重复考虑）

- `merko` Stats 主题 — 绿色系与 Streak `tokyonight-duo` 蓝色系同屏撞色，改为统一 `github_dark_dimmed`
- `#00b4d8` (Cyan) 强调色 — 与 Profile README 的 `#58a6ff` 不一致，统一为后者
- MediaCrawler 作为 Featured — fork 项目，存在归属误解风险
- `git.io` 短链 — 服务已于 2022 年停止新增，改用完整 URL

---

## 变更历史

- `[2026-02-25]` — 项目初始化，全部设计决策确定（视觉风格 + Header + Stats + 技术栈 + Featured）
- `[2026-02-25]` — 迭代二完成：主题统一、WakaTime/Activity Graph/贡献蛇接入、强调色对齐
