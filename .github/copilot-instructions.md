# GitHub Copilot 项目指令

> 这是 njueeray 个人 GitHub 主页项目的 AI 协作指南。
> 本文件在每次 Copilot Agent 会话中自动生效，无需重复说明。

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

## 文件结构说明

```
njueeray/
├── .github/
│   ├── copilot-instructions.md        ← 本文件，全局指令
│   ├── agents/                        ← 专项 Agent 团队
│   │   ├── profile-designer.agent.md
│   │   ├── content-writer.agent.md
│   │   ├── researcher.agent.md
│   │   └── qa-reviewer.agent.md
│   ├── workflows/                     ← GitHub Actions：自动统计更新
│   │   └── update-stats.yml           ← WakaTime / 贡献数据定时刷新
│   ├── ISSUE_TEMPLATE/                ← 开源：Issue 模板
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── PULL_REQUEST_TEMPLATE.md       ← 开源：PR 模板
├── .vscode/
│   ├── toolsets.jsonc
│   ├── mcp.json
│   └── settings.json
├── README.md                          ← GitHub 主页（主产品）
├── CONTRIBUTING.md                    ← 开源：贡献指南
├── CHANGELOG.md                       ← 开源：变更日志
├── LICENSE                            ← 开源：MIT 许可证
└── docs/
    ├── design-decisions.md            ← 设计决策记录
    ├── component-guide.md             ← 开源：组件使用指南
    └── agent-workflow.md              ← 开源：AI 协作工作流说明
```

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

### Agent 团队分工
| Agent | 权限级别 | 核心职责 |
|-------|---------|----------|
| `profile-designer` | 只读 + 决策 | 视觉方案规划、组件选型（有技术路径优先权） |
| `content-writer` | 读写 | README.md 实际编写与迭代 |
| `researcher` | 只读 | 外部资源调研、方案分析（不修改文件） |
| `qa-reviewer` | 只读 + 诊断 | 质量审查、问题报告 |

---

## 已决定的设计选择

> 每次完成一次迭代后，将确认的设计决策记录在这里，避免 Agent 重复讨论

- [x] **整体色调**：GitHub Dark (#0d1117 背景) + 蓝色强调 (#58a6ff / #00b4d8) + matrix green (merko 主题)
- [x] **Header 样式**：capsule-render — waving 类型，深色渐变 (0:0d1117 → 100:1a1b27)，twinkling 动画
- [x] **统计组件**：github-readme-stats merko 主题 + DemoLab streak tokyonight-duo 主题，无边框
- [x] **技术栈展示**：skill-icons 深色版（py, cpp, ts, js, react, docker, git, linux）
- [x] **WakaTime**：待接入（用户需注册 https://wakatime.com）
- [x] **开源 License**：MIT（2026，njueeRay）
- [x] **Profile README 自述格式**：JSON 代码块风格（anmol098 风格）

---

## 项目开源规划

### 开源内容
1. **Agent 工作流配置**：`.github/agents/`、`copilot-instructions.md` 作为模板
2. **GitHub Profile 组件集**：核心动态组件的配置代码和接入说明
3. **构建文档**：从 0 到 1 构建酷炫 GitHub Profile 的完整指南

### 开源标准（遵循优秀工程实践）
- **README.md**：项目介绍 + 快速开始 + 预览截图
- **CONTRIBUTING.md**：Fork / PR 流程 + 代码风格规范
- **CHANGELOG.md**：遵循 [Keep a Changelog](https://keepachangelog.com) 格式
- **LICENSE**：MIT 许可证
- **GitHub Actions**：自动化检查（链接可达性、Badge 有效性）
- **Issue 模板**：Bug Report / Feature Request / 组件建议

---

## 当前迭代状态

**阶段：** 迭代一（Profile README + Astro 站点 v1）完成
**个人信息：** ✅ 已确认  
**配置文件：** ✅ 已初始化  

**已完成：**
- ✅ OpenProfile 仓库：https://github.com/njueeRay/OpenProfile
- ✅ Astro 个人站点：https://github.com/njueeRay/njueeray.github.io（构建通过，等待用户开启 Pages）
- ✅ Profile README：本地就绪，等待用户创建 `njueeRay/njueeRay` 仓库后推送

**下一步（用户操作）：**
1. 创建 GitHub 特殊仓库 `njueeRay/njueeRay`（名称必须与用户名完全一致，包括大小写）
2. 前往 https://github.com/njueeRay/njueeray.github.io/settings/pages → Source → GitHub Actions

**下一步（Agent）：**
- 推送 Profile README 到 `njueeRay/njueeRay`
- 接入 WakaTime（用户完成注册后）
- Astro 站点增加 Projects / About 区块内容迭代

---

## 与 Agent 协作的期望

### Agent 可以自主做的事
- ✅ 根据个人信息和风格偏好**直接给出推荐方案**（不需要列出所有选项等待选择）
- ✅ 在技术等价的选项中**自主选择最优解**（如组件主题、参数调优）
- ✅ **主动发现和修复**显而易见的问题（拼写、URL 格式、对齐等）
- ✅ **识别新需求时主动更新本配置文件**（新场景 → 自动扩展规范）
- ✅ 每轮迭代后**自动**更新「已决定的设计选择」和「当前迭代状态」

### Agent 必须告知用户的事
- ⚠️ 需要用户在第三方平台**注册账号**（WakaTime、Vercel 等）
- ⚠️ 准备执行**破坏性变更**（重构布局、删除区块）前，先描述影响范围
- ⚠️ 涉及**隐私信息**的内容是否应该公开
- ⚠️ **开源内容**是否符合用户预期
