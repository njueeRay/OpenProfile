# AI 协作工作流说明

> 本文件记录了本项目是如何利用 GitHub Copilot Agent 团队进行协作开发的。
> 适合想将 AI-Native 工作流引入自己项目的开发者参考。

---

## 核心理念

**传统开发流程：** 人类 → 写代码 → 审查 → 提交

**AI-Native 工作流（本项目采用）：**
```
人类（目标&决策）
    ↓
profile-designer（视觉规划）
    ↓
content-writer（代码实现）
    ↓
qa-reviewer（质量审查）
    ↓
人类（最终确认）
```

人类只需要：**给目标、做决策、最终审核**。具体实现交给 Agent 团队。

---

## Agent 团队

### profile-designer
- **职责：** 视觉架构师，规划整体布局和组件选型
- **工具：** fetch（调研参考主页）、search（查找组件）
- **输出：** 设计文档，不直接修改 README
- **启用场景：** 每次大改版前

### content-writer
- **职责：** 内容工程师，将设计方案转化为 Markdown 代码
- **工具：** editFiles（修改文件）、fetch、codebase
- **输出：** 实际的 README.md 变更
- **启用场景：** 设计方案确认后

### researcher
- **职责：** 情报官，深度调研节省主会话 context
- **工具：** fetch、search（只读）
- **输出：** 浓缩的调研摘要
- **启用场景：** 调研新组件、分析竞品主页

### qa-reviewer
- **职责：** 质检官，六维度审查 README 质量
- **工具：** codebase、problems（只读）
- **输出：** 结构化审查报告
- **启用场景：** 每次迭代完成后

---

## 典型工作流示例

### 场景：添加一个新的技术栈组件

```
1. [你] 告诉 Copilot："我想展示我的技术栈"

2. [researcher] 调研 skill-icons 和 shields.io，
   输出：对比报告 + 推荐方案

3. [profile-designer] 基于调研，
   决策：使用 skill-icons，暗色主题，展示 7 个核心技能
   输出：组件 URL 模板 + 布局说明

4. [content-writer] 按方案修改 README.md，
   添加带注释的 skill-icons 代码块

5. [qa-reviewer] 审查新增组件，
   输出：验证图片可访问性、alt text、URL 正确性

6. [你] 确认效果，合并变更
```

---

## 配置文件说明

| 文件 | 作用 |
|------|------|
| `.github/copilot-instructions.md` | 全局项目指令，每次会话自动生效 |
| `.github/agents/*.agent.md` | 各 Agent 的角色定义、工具权限、handoff 规则 |
| `.vscode/toolsets.jsonc` | 工具集分组（readonly/writer/runner） |
| `.vscode/mcp.json` | MCP 服务器连接（GitHub API、fetch）|
| `.vscode/settings.json` | 终端自动批准规则 |

---

## 如何复用本工作流

1. Fork 本仓库
2. 修改 `.github/copilot-instructions.md` 中的个人信息
3. 按需调整 `.github/agents/` 中的 Agent 配置
4. 在 VS Code 中使用 GitHub Copilot Chat，选择对应 Agent 开始工作

> 详细组件说明见 [docs/component-guide.md](component-guide.md)
