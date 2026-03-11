# Roadmap: 当前状态 → v6.1.0

> **创建日期：** 2026-03-11  
> **来源：** Meeting #09 转折点反思会决议 + v5.x 复盘 + v6 规划会  
> **执行方式：** Board 驱动 Ship 循环（Recall → Execute → Ship），每步完成后更新本文件状态

---

## 总览

```
当前状态（2026-03-11）
    ↓
Phase 0: Turning Point 落地闭环（本文件 + A2 hook）
    ↓
Phase 1: v5.8 worktree 完成（B1~B4）
    ↓
v6.0.0 发版（merge + tag + Brand 72h）
    ↓
Phase 2: v6.1.0 内容 Sprint
    ↓
v6.1.0 发版
```

---

## Phase 0 — Turning Point 落地闭环

**目标：** 让 Meeting #09 的三段式协议在技术层真正运行，而不仅仅是文字存在

### A1 ✅ Sprint Board 初始化
- 完成时间：2026-03-11
- 产出：`docs/governance/sprint-board.md`

### A2 ⬜ SessionStart Hook 更新
- **Owner：** Dev  
- **内容：** 修改 `.github/settings.json` 中 SessionStart hook 的注入内容，改为读取 `docs/governance/sprint-board.md` 作为启动上下文，取代旧的 `copilot-instructions` 全文注入
- **产出：** `.github/settings.json` 更新

### A3 ✅ copilot-instructions 清理
- 完成时间：2026-03-11
- 产出："已决定的设计选择" HTML 注释块已移除，迁移正式闭环

### A4 ✅ 本 Roadmap 文档创建
- 完成时间：2026-03-11
- 产出：本文件

---

## Phase 1 — v5.8 Blog Content Quality Sprint

**目标版本：** njueeray.github.io v6.0.0（v5.8 worktree 完成后触发 Major）  
**分支：** `feature/blog-content-quality`（已存在于 `njueeray.github.io/`）

### B1 ⬜ expressive-code 集成
- **Owner：** Dev  
- 代码块一键复制 + 文件名标注 + 行高亮  
- 主题：`github-dark-dimmed`，`borderRadius: 6px`，copy button accent 色  
- **文件：** `njueeray.github.io/astro.config.mjs`

### B2 ⬜ Callout.astro 组件
- **Owner：** Dev  
- 四类：tip / warning / info / note  
- 终端风 icon + uppercase 标签 + 对应色系  
- **文件：** `njueeray.github.io/src/components/Callout.astro`（已存在，需实现或修复）

### B3 ⬜ 阅读时长组件
- **Owner：** Dev  
- 中文 500 字/分钟 + 英文 200 词/分钟，剥离 frontmatter/代码块/HTML  
- BlogCard + 文章页 header 均显示  
- **文件：** `njueeray.github.io/src/lib/readingTime.ts`（已存在，需验证逻辑）

### B4 ⬜ SeriesNav.astro 组件
- **Owner：** Dev  
- series + seriesOrder frontmatter 支持  
- 系列内上/下篇导航  
- 位置：author-card 后、相关文章前  
- **文件：** `njueeray.github.io/src/components/SeriesNav.astro`（已存在，需验证）

### DoD Gate ⬜
- [ ] `astro check` 0 errors  
- [ ] `npm run build` 构建成功  
- [ ] 所有 B1~B4 交互在本地验证

---

## Phase 1.5 — v6.0.0 发版

**触发条件：** B1~B4 DoD 全部通过

### C1 ⬜ worktree 合并
- `git merge feature/blog-content-quality`（在 njueeray.github.io 主窗口执行）
- `git push origin main`
- `git worktree remove ..\njueeray.github.io` + `git branch -d feature/blog-content-quality`

### C2 ⬜ CHANGELOG v6.0.0
- 在 `njueeray.github.io/CHANGELOG.md` 将 `[Unreleased]` 切版为 `[6.0.0] — 2026-03-XX`

### C3 ⬜ git tag v6.0.0
- `git tag v6.0.0 && git push origin v6.0.0`

### C4 ⬜ Brand 72h Discussion
- v6.0.0 发布公告，展示 B1~B4 功能（截图 + 说明）
- **截止：** v6.0.0 发版后 72h 内
- **这是 v6.x 外循环规则的第一次实际执行**

---

## Phase 2 — v6.1.0 内容 Sprint

**目标：** 填补最大内容空白，建立读者入口 + 外循环

### D1 ⬜ 读者入口文章
- **Owner：** Brand + Dev  
- 标题示例：「用 2 分钟了解这个项目：AI-native 工作流实验室」  
- 定位：B类（technical），featured: true  
- 内容：项目是什么 + 工作方式 + 怎么参与  
- **文件：** `njueeray.github.io/src/content/blog/`

### D2 ⬜ Brand 72h 外循环机制正式化
- PM 在下一个版本提案时，检查上一个版本的 72h 外循环是否完成  
- 写入 Sprint Board 为常规 DoD 项

### D3 ⬜ Discussion 月度读者反馈帖
- 发布「三月份有什么问题/想法？」形式的读者互动帖  
- **目标：** 引入第一条真实外部反馈

### DoD Gate ⬜
- [ ] D1 文章发布并验证可访问
- [ ] D2 写入下版本 DoD
- [ ] D3 Discussion 已发布

---

## Phase 2.5 — v6.1.0 发版

### E1 ⬜ CHANGELOG v6.1.0
### E2 ⬜ git tag v6.1.0 + push
### E3 ⬜ Brand 72h Discussion（v6.1.0 发版公告）

---

## 执行日志

| 日期 | 步骤 | 产出 | 状态 |
|------|------|------|------|
| 2026-03-11 | A1: Sprint Board 初始化 | `docs/governance/sprint-board.md` | ✅ |
| 2026-03-11 | A3: copilot-instructions 清理 | HTML 注释块移除 | ✅ |
| 2026-03-11 | A4: 本 Roadmap 创建 | 本文件 | ✅ |

---

## 关键约束提醒

- **三段式协议**：每个会话 Recall → Execute → Ship，只做一件事做完
- **外循环强制**：每个 Minor 版本 72h 内 Brand 必须输出一条 Discussion
- **Sprint Board 铁律**：≤50 行 / ≤7 条 / 2 周存活期，超限强制 triage
- **v6.0.0 触发条件**：B1~B4 DoD 全部绿灯，不提前合并
