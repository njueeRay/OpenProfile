# Worktree 任务上下文：feature/readme-update

> **Branch:** `feature/readme-update` → 合并目标：`main`
> **创建日期：** 2026-02-26
> **负责人：** Dev Agent（本窗口专属）
> **Owner：** njueeRay（Ray Huang）

---

## 快速定位：你在哪里？

这是 `OpenProfile` 仓库的一个**并行工作目录（Git Worktree）**。
主线开发在 `OpenProfile/`（main 分支），本窗口专注于 README 文档更新，互不干扰。

**全局规范** → 见 `.github/copilot-instructions.md`（本窗口已自动加载）

---

## 本次任务：README 全面更新

### 核心目标

将 `README.md` 升级为一份**面向开源社区**的高质量入口文档，反映项目已演进到 v4.0 的实际状态。

### 具体工作项

- [ ] **项目简介区**：更新项目描述，体现"AI-native 工作流范例"定位
- [ ] **功能亮点**：补充 v3.0/v4.0 新增能力（Astro 站点、RSS、标签系统、3D 贡献图、Trophy）
- [ ] **快速开始**：检查步骤是否仍然有效，更新过时内容
- [ ] **组件清单**：与 `docs/component-guide.md` 保持一致
- [ ] **AI 协作工作流**：引导读者读 `docs/agent-workflow.md`
- [ ] **Badge 区**：确认所有 badge URL 可达，无 404
- [ ] **CHANGELOG 引用**：确认最新版本号指向 v4.0.0

### 关键参考文件

| 文件 | 用途 |
|------|------|
| `README.md` | 主要修改目标 |
| `CHANGELOG.md` | 版本历史，获取最新功能列表 |
| `docs/component-guide.md` | 组件说明，同步到 README 功能区 |
| `docs/agent-workflow.md` | AI 协作说明，README 要引用 |
| `.github/copilot-instructions.md` | 全局规范（已决定的设计选择） |

---

## 提交规范

**模板已自动配置**，`git commit`（不带 `-m`）会弹出编辑器，末尾已预填：

```
Co-authored-by: GitHub Copilot <copilot@github.com>
```

推荐 commit 格式：
```
docs(readme): <描述>

Co-authored-by: GitHub Copilot <copilot@github.com>
```

---

## DoD（完成标准）

全部满足才算本任务完成：

- [ ] README.md 内容与当前 v4.0.0 状态一致
- [ ] 所有外部链接可达
- [ ] Badge 引用的数据是动态的（无硬编码数字）
- [ ] 排版在 GitHub 暗色模式下正常渲染
- [ ] `CHANGELOG.md` 已在 `[Unreleased]` 区记录变更

---

## 完成后：向主窗口汇报

任务完成后，在**主窗口**（`OpenProfile/` main 分支）向 Copilot 发送以下提示即可触发合并：

```
feature/readme-update worktree 任务已完成。
变更摘要：[粘贴本次主要改动]
请执行合并流程：merge → push → 清理 worktree 和分支。
```

主窗口会执行：
```bash
git merge feature/readme-update
git push origin main
git worktree remove ..\OpenProfile-readme
git branch -d feature/readme-update
```
