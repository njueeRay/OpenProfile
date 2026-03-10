# 工作会议纪要 — Profile 视觉修复 + 会议行动项执行

**日期：** 2026-02-28
**参与者：** brain · pm · dev · profile-designer · brand
**会议类型：** 工作执行会（非规划会）
**相关 commit：** `b8ffe3f`（Profile 修复批次）、`556e053`（深色模式默认值）

---

## 一、Profile README 视觉问题修复（commit: b8ffe3f）

经 Profile Designer 审查，发现以下五个问题并全部修复：

| 编号 | 问题描述 | 修复方案 |
|------|---------|---------|
| P-1 | Header capsule-render 文字遮挡（文字过大） | `fontSize: 70 → 60`，`descAlignY: 55 → 63` |
| P-2 | Tech Stack 图标过少（10个），排列单调 | 扩展至 20 个图标，`perline=10` 双行布局 |
| P-3 | Trophy 组件不支持 light/dark 分离主题 | 改为 `<picture>` 元素，dark→darkhub / light→flat |
| P-4 | 3D 贡献图缺少 light 模式适配 | 新增 light 模式 SVG（green-animate 主题） |
| P-5 | Pin cards 缓存时间未设置，频繁请求 | 添加 `cache_seconds=86400` |

---

## 二、博客深色模式默认值修复（commit: 556e053）

**问题：** 首次访问博客站点时，主题跟随系统偏好，可能显示浅色。用户希望默认始终深色。

**修复：** `localStorage || 'dark'`，即：
- 如果用户已手动切换过主题 → 使用 localStorage 存储的值
- 如果是首次访问（无 localStorage） → 强制默认深色，不跟随系统偏好

---

## 三、ThemeToggle 重复监听修复

**问题（Code Reviewer 在自由交流会中报告）：** `astro:after-swap` 生命周期未清理旧监听器，每次页面切换都注册新监听，触发多次主题切换。

**修复：** 添加 `window._themeListenerBound` 标志位，防止重复注册：

```javascript
if (!window._themeListenerBound) {
  document.addEventListener('astro:after-swap', () => { /* ... */ });
  window._themeListenerBound = true;
}
```

---

## 四、Brand 行动项执行确认

| 行动项 | 来源会议 | 状态 |
|--------|---------|------|
| Build in Public 渠道选型调研 | 2026-02-27 全员战略会 | ✅ 已完成（Research Brief 输出） |
| Brand × Code Reviewer 内容审查清单 | 2026-02-27 全员战略会 | ✅ 已完成（brand-content-checklist.md） |
| Brand 首批 Discussions 发布计划 | 2026-02-27 全员战略会 | ✅ 已完成（brand-discussions-plan.md） |
| ThemeToggle bug 修复确认 | 2026-02-26 自由交流会 | ✅ 已完成（见第三节） |

---

## 五、待推送文件列表

提交 `b8ffe3f` 包含以下文件：

```
njueeRay-profile/README.md          ← Profile 5 项视觉修复
njueeray.github.io/src/components/ThemeToggle.astro  ← 重复监听修复
njueeray.github.io/src/layouts/BaseLayout.astro      ← 默认深色逻辑
```

---

## 六、尚未执行行动项

以下来自 2026-02-27 全员战略会，执行中：

| 行动项 | 负责人 | 计划完成 |
|--------|--------|---------|
| Git Worktree 并行格式规范写入 Playbook | Brain + PM | v4.1.0 |
| Co-authorship .gitmessage 三仓库配置 | Dev | 本周 |
| Brand Agent 正式加入文件（brand.agent.md） | Brain | 本周 |
| GitHub Discussions 分类架构创建 | Brand + 用户操作 | 下次会话 |

---

## 七、关键技术决策记录

**决策 1 — 博客默认主题：首次访问始终深色**
不跟随系统偏好，理由：目标用户是程序员，深色主题是默认预期。

**决策 2 — Build in Public 主渠道：GitHub Discussions**
X API 调用成本高，Bluesky 生态尚小。Discussions 与代码仓库同域，最低摩擦。

**决策 3 — Profile README 图标数量：20 个**
`perline=10` 双行排列，在 GitHub 桌面端不换行，移动端自适应。

---

*会议纪要由 Brain 整理，Dev 执行记录，2026-02-28*
