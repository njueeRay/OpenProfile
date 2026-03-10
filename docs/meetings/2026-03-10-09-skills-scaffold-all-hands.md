# 工具层 Skills 脚手架全体会议

**时间**：2026-03-10（接续 cae48dd docs 重组 Push 后）  
**主持**：Brain  
**参与**：Brain / PM / Dev / Researcher / Code Reviewer / Profile Designer / Brand  
**背景**：docs/ 重组与 MCP 模板撤销已推送。本次会议聚焦：当前 7 个 Skills 是否过于单薄？如何用 agent-skill-loader 发现并引入高质量 Skills？

---

## 一、当前 Skills 清单回顾

| SKILL 名 | 定位 | 现有 triggers | 已知薄弱点 |
|---------|------|-------------|---------|
| `brain-coordinator` | 战略协调 | 规划/协调/开会/团队状态 | description 中文乱码，triggers 无英文兜底 |
| `brand-publishing` | 内容/对外 | 发布/Discussion/Brand | 缺少 LinkedIn/Twitter 等平台关键词 |
| `code-reviewer-quality` | 质量门禁 | 代码审查/审计/DoD | 仅输出报告，无 fix suggestion 触发路径 |
| `dev-fullstack` | 全栈实现 | 实现/写代码/修改 | 触发词太通用，容易误触；缺 debug 触发词 |
| `pm-sprint-planner` | 项目管理 | Sprint/CHANGELOG/DoD | 缺少 Milestone/issue triage 触发词 |
| `profile-designer-visual` | GitHub Profile 视觉 | README 布局/badge | 定位太窄，仅 Profile README 场景 |
| `researcher-analysis` | 技术调研 | 调研/研究/分析 | 输出偏文字报告，缺少可操作数据格式规范 |

### 整体评估（Code Reviewer 视角）

- **覆盖深度**：7 个 Skills 与 7 个 Agent 一一对应，角色完整性 OK
- **内容质量**：description 存在中文乱码（Windows CRLF 问题遗留）；triggers 单语言覆盖不足
- **格式规范**：符合 `agentskills.io` 开放标准字段（name / description / triggers），基本达标
- **薄弱点**：
  1. 无 `examples` 字段（标准支持 input/output 示例，有助于 Agent 自主判断）
  2. 无 `constraints` 字段（未声明边界，如 dev-fullstack 应限制不做架构决策）
  3. `triggers` 仅中文，英文对话场景无法识别

---

## 二、agent-skill-loader 能力盘点

**当前配置**（`.vscode/mcp.json`）：
```json
{
  "agent-skill-loader": {
    "type": "stdio",
    "command": "agent-skill-loader",
    "args": ["--skills-dir", ".github/skills"]
  }
}
```

**可用工具**（MCP 暴露）：
- `list_skills`：列出 `.github/skills/` 下所有已安装 Skills
- `read_skill`：读取指定 Skill 内容
- `install_skill`：从远程（GitHub repo / npm / URL）安装新 Skill 到 `.github/skills/`

**现状**：MCP Server 已配置，但本会话尚未调用任何工具进行发现。

---

## 三、Researcher 调研报告摘要

> *由 Brain 代为呈现，完整报告见 Researcher 会后补充*

**agent-skill-loader 生态（已知）**：
- 官方文档/社区：`agentskills.io`（标准规范来源）
- 安装来源：`npm` 包名 / GitHub repo URL / 本地路径
- 高质量公开 Skills（候选）：
  - `anthropics/skills`（官方示例，含 web-search / code-execution / file-management）
  - `github-copilot-skills`（VS Code 生态，含 PR review / issue triage）
  - 社区 Skills 目录尚待 forage-mcp 接入后系统扫描（P2）

**forage-mcp 状态**：已识别为 `isaac-levine/forage-mcp`，尚未接入（P2），但 `agent-skill-loader` 的 `install_skill` 工具已可手动安装公开 Skills。

---

## 四、讨论记录

### Brain（主持）
当前 7 个 Skills 是"角色映射"向设计——每个 Agent 一个技能卡。问题在于，这是"Agent 自我声明"而非"通用能力模块"。两种设计哲学不同：
- **角色映射型**：适合本项目（封闭团队，角色明确）
- **能力模块型**：适合社区开放复用（跨项目、跨角色）

> **Brain 决策**：维持"角色映射"为主，但每个 SKILL.md 补充 `examples` + `constraints` 字段，提升描述精度。

### PM
当前 Sprint 没有专项 Skills 质量任务。建议将"补充 examples/constraints + 修复乱码"纳入 v5.10.0 或单独发布为 Patch（v5.9.1）。

> **PM 决议**：合入 v5.10.0 前置清理（非独立版本发布），DoD 新增检查项：Skills 无乱码 + 含 examples。

### Dev
乱码根因：SKILL.md 文件创建时部分使用 Windows CRLF 编码，中文在非 UTF-8 终端下显示异常。修复方案：
1. 用 `Get-Content | Set-Content -Encoding UTF8NoBOM` 批量转码
2. 或在 `.editorconfig` 中对 `*.md` 强制 `end_of_line = lf, charset = utf-8`

> **Dev 技术决策**：利用现有 `.editorconfig` 配置（项目已有），下次 git checkout 自动规范；乱码显示问题不影响 Agent 读取（文件本身是 UTF-8，乱码仅是终端渲染问题）— 暂不做额外修复，确认后可关闭。

### Researcher
建议优先调研两类高质量 Skills：
1. **通用工具类**：web-search（外部信息获取）、file-diff（精准变更比对）
2. **团队专项类**：meeting-facilitator（Brain 减负）、changelog-generator（PM 减负）

> **Researcher 行动项**：会后补充调研报告 `docs/research/skills-ecosystem-2026.md`

### Code Reviewer
当前 Skills 最大问题不是字段缺失，而是 `description` 过长导致 Agent 识别时摘要困难。建议每个 description 控制在 50 字（中文）以内，核心能力一句话。

### Brand
`brand-publishing` 的 triggers 缺少 `社交媒体`、`内容日历`、`帖子` 等词，实际使用中 Alt+/ 无法召唤。会后自行更新。

### Profile Designer
`profile-designer-visual` 定位太窄。建议扩展为 `visual-design`，覆盖博客视觉 / 组件设计 / 配色决策，而不仅限于 Profile README。

---

## 五、决议汇总

| # | 决议内容 | 负责人 | 时间线 |
|---|---------|-------|-------|
| D-1 | Skills 保持"角色映射"设计，不切换为"能力模块"型 | Brain | 已决定 |
| D-2 | 每个 SKILL.md 补充 `examples:` + `constraints:` 字段（1-3 条） | Dev | v5.10.0 前置 |
| D-3 | description 精简至 ≤50 字（中文） | 各 Agent 自行更新 | v5.10.0 前置 |
| D-4 | `brand-publishing` triggers 补充社交媒体关键词 | Brand | 本会话内 |
| D-5 | `profile-designer-visual` 扩展范围 → 更名待议 | Profile Designer | 下次 Sprint |
| D-6 | Researcher 输出 `docs/research/skills-ecosystem-2026.md` | Researcher | 本周内 |
| D-7 | forage-mcp 接入列为 v5.10.0 P2 前置任务 | PM | v5.10.0 |

---

## 六、后续行动（DoD 追踪）

- [ ] `brand-publishing/SKILL.md` — triggers 补充（Brand，本会话）
- [ ] `docs/research/skills-ecosystem-2026.md` — Skills 生态调研（Researcher，本周）
- [ ] 7 个 SKILL.md 全部补充 examples + constraints（Dev，v5.10.0 前置）
- [ ] evolution-events.jsonl 追加会议事件（Brain / Dev）
- [ ] forage-mcp 接入方案列入 v5.10.0 backlog（PM）

---

*Brain 主持，全 7 Agent 参与 | 会议时长预计 25 min*  
*下次全体会议触发条件：v5.10.0 Sprint 启动 OR Researcher 调研报告完成*
