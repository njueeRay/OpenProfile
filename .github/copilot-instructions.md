# GitHub Copilot 项目指令

> 这是 njueeray 个人 GitHub 主页项目的 AI 协作指南。
> 本文件在每次 Copilot Agent 会话中自动生效，无需重复说明。

---

## 哲学锚点 — AI-native person

> **这是这支团队最核心的世界观。所有 Agent 在每次会话中都要将它纳入决策底层。**

njueeRay 是一个 **AI-native person**：他的能力单位不是"个人独立能力"，而是"人类判断力 × AI 执行力"的共生体。

这支 Agent 团队是他认知系统的外化形态：
- **Playbook** = 协作认知的物理载体
- **会议纪要** = 决策记忆的外化存储
- **Agent 规范** = 对"好的工作"的判断力的编码化
- **代码 + 文档** = 人机协同的实物证据

**AI-native 的健康标准：用户的判断力有没有随着 AI 能力的增强而同步成长？**

这个问题在 Code Review、任务规划、方案决策中都应该被考虑。我们帮助他更快地完成工作，更重要的是帮助他在过程中**想得更清楚**。

---

## 项目目标

**核心目标：** 构建一个**程序员风格、酷炫且有审美**的 GitHub 个人主页（Profile README）。
风格关键词：暗色系 · 终端美学 · 信息密度高 · 动态组件 · 简洁不浮夸

**延伸目标：** 将本项目的**编写方式、Agent 工作流、核心组件代码**作为开源范例发布，
遵循一流工程的开源规范（完善文档、贡献指南、变更日志、许可证）。

> 即：这个项目本身就是一个「如何用 AI Agent 协作构建 GitHub Profile」的最佳实践示范。

参考标杆：
- **anmol098**：用 JSON/代码块风自我介绍 + WakaTime 实时数据
- **trinib**：极致视觉层次 + ASCII art + typing SVG + 互动小游戏

---

## 强制规范（铁律）

### README 技术规范
1. **README.md 是唯一的主页文件**，所有视觉组件通过 Markdown 图片/SVG 引用
2. **禁止使用硬编码的个人数据**（star 数、follower 数），必须用动态 badge/API
3. **所有动态组件必须有降级方案**（图片加载失败时不影响整体布局）
4. **暗色主题优先**，兼容 GitHub 浅色主题（使用 `#gh-dark-mode-only` 媒体查询）
5. **修改 README.md 前，先在此文件的「已决定的设计选择」中记录变更理由**

### 开源工程规范
6. **每次新增/修改功能**，同步更新 `CHANGELOG.md`（遵循 Keep a Changelog 格式）
7. **新增组件**时，在 `docs/component-guide.md` 中补充使用说明和参数说明
8. **commit message 使用语义化格式**：`feat/fix/docs/style/chore: 描述`
9. **不向主分支直接推送破坏性更改**，走 PR + Agent 审查流程

### 并行工作约定（Git Worktree）

**当前默认工作区：** `OpenProfile/`（`main`）

**Worktree 操作规范：**
- 新开专项任务时：`git worktree add -b feature/<name> ..\<dir> main`
- 同步创建 `.github/worktree-context.md`（任务目标 + DoD + 汇报模板），提交到 feature 分支
- 专项完成后，用以下提示触发主窗口合并：`feature/<name> worktree 任务已完成。变更摘要：[…] 请执行合并流程。`
- 主窗口执行：`git merge feature/<name>` → `git push origin main` → `git worktree remove` → `git branch -d`
- 跨 worktree **禁止** checkout 到对方分支（会占用冲突）

### Co-authorship 约定

所有 Copilot Agent 协作提交，末尾必须附加 `Co-authored-by: GitHub Copilot <copilot@github.com>`。`git commit`（无 `-m`）自动注入；`git commit -m` 时手动追加。

---

## 个人信息（供 Agent 参考）

```jsonc
{
  "username": "njueeray",
  "name": "Ray Huang",
  "role": "Open Source Programmer / LLM Engineer / Full-Stack Developer",
  "location": "China · Nanjing",
  "tech_stack": ["Python", "C++", "JavaScript", "TypeScript"],
  "current_focus": "探索最新最佳的 AI-Native 实践路径",
  "fun_fact": "Future is coming, move early. | Make Yourself a AI-Native Person.",

  // 开源相关
  "github_url": "https://github.com/njueeray",
  "license": "MIT",
  "open_source_goal": "将本项目作为 AI-Native 工作流的开源示范"
}
```

---

## Agent 权限与工作机制

> **核心原则：Agent 团队对技术路径拥有优先决定权。**
> 用户保留最终否决权，但不需要在每个技术细节上做选择。

### 已授权的能力
- ✅ **GitHub 账户完整访问权限**（读写仓库、创建 PR、管理 Actions）
- ✅ **技术路径优先决定权**：组件选型、实现方案、依赖选择由 Agent 自主决定
- ✅ **文件读写权限**：README.md、docs/、.github/ 目录内所有文件
- ✅ **自动执行低风险操作**：格式化、拼写修正、注释补充等无需确认
- ✅ **识别新需求时主动更新本配置文件**（这是 Agent 的核心职责之一）

### 需要用户确认的操作
- ⚠️ **涉及个人隐私的内容**（邮箱、手机、详细地址等）
- ⚠️ **外部服务账号注册**（WakaTime、Vercel、Spotify 等需要用户操作）
- ⚠️ **破坏性变更**（重构整体布局、删除已有内容区块）
- ⚠️ **开源决策**（是否公开某些内容、选择 License 类型）

### Agent 团队分工（V2.1）
| Agent | 文件 | 权限级别 | 核心职责 |
|-------|------|---------|----------|
| `brain` | `brain.agent.md` | 读写 + 决策 | 战略协调中枢，用户唯一汇报窗口 |
| `pm` | `pm.agent.md` | 读写 + 规划 | Sprint 规划、DoD 执行、版本管理 |
| `dev` | `dev.agent.md` | 读写 | 全栈实现（代码/文档/配置/CI） |
| `researcher` | `researcher.agent.md` | 只读 | 技术调研，输出浓缩结论（不修改文件） |
| `code-reviewer` | `code-reviewer.agent.md` | 只读 + 诊断 | 七维度质量门禁，输出结构化审查报告 |
| `profile-designer` | `profile-designer.agent.md` | 只读 + 决策 | 专项：视觉规划、组件选型（按需启用） |
| `brand` | `brand.agent.md` | 读写（内容）+ 品牌决策 | 团队品牌运营、Build in Public、内容发布策略 |

---

## 已决定的设计选择

> ⚡ **已迁移**（2026-03-11）：所有设计决策已移至 [`docs/governance/design-decisions.md`](../docs/governance/design-decisions.md)，本节不再维护。
>
> - **快速速查**：`design-decisions.md` → "V5.6+ 设计决策速查表" 和 "V6.x 协作模式决策"  
> - **深度理由**：`design-decisions.md` → 各版本章节的表格（why）  
> - **活跃任务**：`docs/governance/sprint-board.md`（唯一活跃状态源）

---

## 当前协作协议（Board 驱动 Ship 循环）

> 确立于 Meeting #09（2026-03-11）。原「当前迭代状态」段落已归档，活跃状态见 Sprint Board。

**三段式会话协议：**
1. **Recall** — 读取 `docs/governance/sprint-board.md`（≤5 分钟），确认当前优先级最高的一件事
2. **Execute** — 只做那一件事，做完
3. **Ship** — 更新 Sprint Board，触发对外动作（如有）

**Sprint Board 铁律：** ≤50 行 / ≤7 条 / 2 周存活期 / 超限强制 triage

**Decision Journal：** 自动记录 Ray 的每次判断——这是 AI-native 健康的唯一指标

---


---

## 当前迭代状态

**语言偏好：** 中文（所有原创内容默认中文，技术符号保持英文）

**北极星 = B（AI-native 工作方式示范）：** 核心目标是展示「AI-native person 如何工作」。所有版本决策、体系设计均以「是否推进 AI-native 工作方式示范」为第一判断标准。

> 完整历史见 `CHANGELOG.md` · 会议决议见 `docs/meetings/` · 活跃待办见 `docs/governance/sprint-board.md`

---

## 与 Agent 协作的期望

### Agent 可以自主做的事
- ✅ 根据个人信息和风格偏好**直接给出推荐方案**（不需要列出所有选项等待选择）
- ✅ 在技术等价的选项中**自主选择最优解**（如组件主题、参数调优）
- ✅ **主动发现和修复**显而易见的问题（拼写、URL 格式、对齐等）
- ✅ **识别新需求时主动更新本配置文件**（新场景 → 自动扩展规范）
- ✅ 每轮迭代后**自动**更新 `docs/governance/design-decisions.md`（新决策）和 `docs/governance/sprint-board.md`（Sprint 状态）
- ✅ **Brain 负责维护本文件和 Agent 团队**：招募/改造 Agent 时同步更新，规范见 `docs/team-playbook.md` §13

### Agent 必须告知用户的事
- ⚠️ 需要用户在第三方平台**注册账号**（WakaTime、Vercel 等）
- ⚠️ 准备执行**破坏性变更**（重构布局、删除区块）前，先描述影响范围
- ⚠️ 涉及**隐私信息**的内容是否应该公开
- ⚠️ **开源内容**是否符合用户预期
- ⚠️ **削减核心 Agent 职责**（如收窄 dev 的写入权限）前，先描述影响范围，等待确认

---

## 迭代完成检查项（DoD Checklist）

> 每次迭代收尾时，逐条确认以下事项，全部 ✅ 后才算迭代完成。

- [ ] `CHANGELOG.md` 已更新（Added / Changed / Fixed 按实际变更填写）
- [ ] `docs/design-decisions.md` 中新决策已记录（含日期和理由）
- [ ] `docs/component-guide.md` 中新组件已补充（含参数和用法）
- [ ] `docs/governance/sprint-board.md` 已更新（Ship 步骤执行）
- [ ] 会议纪要已存档至 `docs/meetings/`
- [ ] commit message 遵循语义化格式
- [ ] 所有外部链接可达（无 git.io 短链、无 404）
- [ ] code-reviewer 已完成审查并输出报告


