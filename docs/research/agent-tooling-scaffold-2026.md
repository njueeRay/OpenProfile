# Agent Team 工具层能力升级调研报告

**研究目的：** 深度调研 Skills / MCPs / Hooks 三大工具层机制，为 njueeRay 团队能力升级提供路线图  
**撰写人：** Researcher Agent  
**日期：** 2026-03-10  
**状态：** FINAL

---

## TL;DR（一分钟摘要）

> **结论：** 工具层升级存在三个可立即实施的路径。最高价值动作是：  
> 1. 在 `.claude/settings.json` 写入 Hooks 质量门禁（`TeammateIdle` / `TaskCompleted`）  
> 2. 为每个 Agent 创建 `SKILL.md` 文件，纳入 Claude 官方 Skills 体系  
> 3. 将 `agent-skill-loader` MCP 加入 `.vscode/mcp.json`，实现技能动态发现  
>
> 这三件事合在一起，相当于给团队装上「自动检查站 + 模块化知识库 + 技能市场」——不需要开发者手动介入。

---

## 一、现有工具层基础盘点

| 层级 | 当前状态 | 覆盖范围 |
|------|---------|---------|
| Agent 配置文件 | 7 个 `.agent.md` 文件 | 角色定义、工具权限、patterns |
| MCP 服务器 | Memory MCP 已接入 | 知识持久化（部分使用） |
| Hooks | ❌ 空白 | 未配置任何生命周期钩子 |
| Skills | ❌ 空白 | 未创建 `.claude/skills/` 目录 |
| 技能发现 | ❌ 手动 | Agent 无法动态发现可用技能 |

**关键缺口：** Hooks 和 Skills 两个机制都是 Anthropic 官方支持的 Claude Code 核心功能，但我们完全未利用。

---

## 二、Claude Agent Skills 深度解析

### 2.1 什么是 Skills

官方定义（来源：`claude.com/blog/skills`，2025-10-16 发布，2025-12-18 更新为开放标准）：

> Skills 是文件夹，包含指令（SKILL.md）、脚本、资源。Claude 在需要时动态加载，只加载当前任务所需的最小信息。

**核心特性：**
- **Composable（可组合）**：多个 Skills 会自动叠加，Claude 识别需要哪些技能并协调使用
- **Portable（可移植）**：`.claude/skills/` → Claude apps / Claude Code / API 全平台通用
- **Efficient（按需加载）**：不是一次性注入到 context，而是按需加载——减少 token 消耗
- **Executable（可执行）**：Skills 可以包含可运行的脚本，实现「传统编程比 token 生成更可靠」的任务

### 2.2 Skills 的文件结构

```
~/.claude/skills/
├── code-review/
│   ├── SKILL.md          ← 核心：指令描述、能力、何时激活
│   ├── review-checklist.md
│   └── review-template.py  ← 可选：可执行脚本
├── brand-publishing/
│   ├── SKILL.md
│   └── tone-guide.md
└── ...
```

SKILL.md 示例（frontmatter 格式）：

```yaml
---
name: code-review
description: 七维度代码质量审查，输出结构化报告
triggers:
  - "code review"
  - "审查代码"
  - "check quality"
hooks:  # Skills 可以携带 hooks！
  PostToolUse:
    - matcher: "Write|Edit"
      hooks:
        - type: command
          command: "./scripts/lint-check.sh"
---

## 激活条件
当用户要求代码审查，或有新文件被写入时...

## 核心能力
...
```

### 2.3 安装和发现

**三种安装方式：**
1. `~/.claude/skills/` — 全局（所有项目可用）
2. `.claude/skills/` — 项目级（仅当前项目）
3. 通过 Plugins 市场：`anthropics/skills` 官方仓库

**官方技能市场：** `github.com/anthropics/skills`（已有 Excel/PowerPoint/Word/PDF 等 Anthropic 官方 Skills）

**开放标准：** Anthropic 将 Agent Skills 作为跨平台开放标准发布（`agentskills.io`）

---

## 三、Claude Code Hooks 深度解析

### 3.1 完整事件列表（18个事件）

| 事件 | 触发时机 | 可阻断 | 我们的用途 |
|------|---------|--------|-----------|
| `SessionStart` | 会话启动/恢复 | 否 | 加载 Memory 上下文，注入 copilot-instructions 摘要 |
| `UserPromptSubmit` | 用户提交 prompt 前 | ✅ | 过滤格式不符的指令，注入项目上下文 |
| `PreToolUse` | 工具调用前 | ✅ | 阻断危险操作（`rm -rf`），注入安全检查 |
| `PermissionRequest` | 权限弹窗前 | ✅ | 自动批准已知安全操作 |
| `PostToolUse` | 工具调用成功后 | 否（可给 Claude 反馈）| 写文件后触发 lint，MCP 操作日志 |
| `PostToolUseFailure` | 工具调用失败后 | 否 | 错误上报，提供修复建议 |
| `Notification` | Claude 发送通知时 | 否 | 系统通知（空闲/权限）转发 |
| `SubagentStart` | 子 Agent 启动 | 否 | 注入 Agent 角色上下文 |
| `SubagentStop` | 子 Agent 完成 | ✅ | 验证子 Agent 输出质量 |
| **`TeammateIdle`** | **Agent 团队成员准备空闲** | **✅** | **核心！强制质量门禁** |
| **`TaskCompleted`** | **任务被标记为完成** | **✅** | **核心！DoD 检查** |
| `Stop` | Claude 准备停止响应 | ✅ | 确保会话结束前同步 Memory |
| `InstructionsLoaded` | CLAUDE.md 被加载时 | 否 | 审计日志 |
| `ConfigChange` | 配置文件变更 | ✅ | 阻断未授权配置修改 |
| `WorktreeCreate` | 创建 worktree 时 | ✅ | 自定义 worktree 初始化逻辑 |
| `WorktreeRemove` | 删除 worktree 时 | 否 | 清理钩子 |
| `PreCompact` | 上下文压缩前 | 否 | 保存重要状态到 Memory |
| `SessionEnd` | 会话结束 | 否 | 同步状态，更新 evolution-events.jsonl |

### 3.2 四种 Hook 处理器类型

| 类型 | 描述 | 适用场景 |
|------|------|---------|
| `command` | 运行 Shell 脚本，stdin 接收 JSON | 文件检查、格式验证、系统操作 |
| `http` | 发送 HTTP POST 到端点 | 外部服务集成（日志、通知） |
| `prompt` | 调用 Claude 模型做单轮评估，返回 `{ok: bool}` | 语义质量判断（无法用规则表达的条件） |
| `agent` | 启动有工具访问权限的 Agent 做验证 | 需要读取文件/运行命令才能判断的复杂条件 |

### 3.3 对 Agent 团队最高价值的 Hook 模式

**模式A：TeammateIdle 质量门禁**
```json
{
  "hooks": {
    "TeammateIdle": [
      {
        "hooks": [
          {
            "type": "prompt",
            "prompt": "评估团队成员是否完成了任务。上下文：$ARGUMENTS\n\n检查：\n1. 是否完成了所有声明的任务？\n2. 是否更新了相关文档？\n3. commit message 是否符合语义化格式？\n\n如果检查通过，返回 {\"ok\": true}。否则返回 {\"ok\": false, \"reason\": \"具体原因\"}"
          }
        ]
      }
    ]
  }
}
```

**模式B：TaskCompleted DoD 验证**
```json
{
  "hooks": {
    "TaskCompleted": [
      {
        "hooks": [
          {
            "type": "agent",
            "prompt": "验证任务完成 DoD。任务信息：$ARGUMENTS\n读取 .github/copilot-instructions.md 中的 DoD Checklist，验证以下文件是否已更新：CHANGELOG.md、相关设计决策。如果 DoD 完成返回 {\"ok\": true}，否则返回 {\"ok\": false, \"reason\": \"未完成项\"}",
            "timeout": 120
          }
        ]
      }
    ]
  }
}
```

**模式C：PostToolUse Markdown Lint**
```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/lint-markdown.ps1",
            "async": true
          }
        ]
      }
    ]
  }
}
```

---

## 四、MCP 生态系统关键发现

来源：`punkpeye/awesome-mcp-servers`（Awesome List，定期更新）

### 4.1 架构级发现：Aggregator 模式

**Aggregator MCPs**（单一入口管理所有 MCP）：

| 项目 | 亮点 |
|------|------|
| `sitbon/magg` | LLM 自主发现、安装、编排 MCP 服务器。类似「MCP 的包管理器」 |
| `metatool-ai/metatool-app` | 统一 GUI 管理所有 MCP，支持 MCP 的 MCP |
| `1mcp-app/agent` | 单入口聚合所有 MCP（商业产品，但开源核心） |

**意义：** 未来 Agent 可以自主发现和注册新的 MCP 服务器，而无需用户手动配置。

### 4.2 技能发现机制

| 项目 | 机制 |
|------|------|
| `back1ply/agent-skill-loader` | MCP 服务器，暴露 `list_skills/read_skill/install_skill` 工具。将 `~/.claude/plugins/cache` 中的技能库桥接给动态 Agent |
| `K-Dense-AI/claude-skills-mcp` | 将 Claude Code Skills 作为原生工具暴露（不通过 MCP，而是 native Skills API） |
| `entire-vc/evc-spark-mcp` | 4500+ Agent/Skills/MCP/Prompt 资产目录，语义搜索发现 |
| `isaac-levine/forage` | 自我改进的工具发现 MCP，通过使用反馈持续优化 |

### 4.3 Memory + Hooks 深度集成

| 项目 | 特色 |
|------|------|
| `alibaizhanov/mengram` | **29 个 MCP 工具** + Claude Code Hooks 自动保存/召回（auto-save on PostToolUse，auto-recall on UserPromptSubmit）。真正的「认知档案」模式 |
| `aitytech/agentkits-memory` | 自动上下文钩子：会话开始自动加载记忆，会话结束自动保存 |
| `mem0-ai/mem0-mcp` | 基于 vector embedding 的智能记忆，比 key-value 更语义化 |

### 4.4 自进化 MCP

| 项目 | 特色 |
|------|------|
| `rsdouglas/janee` | **运行时自生成工具**：MCP 服务器分析需求并在运行时生成、改进自己的工具 |
| `isaac-levine/forage` | 通过使用反馈自我改进的工具发现 |

---

## 五、对标分析：优秀团队脚手架模式

### 5.1 EvoMap/evolver 模式（GEP 参考架构）

（注：429 限速未能直接读取 SKILL.md，以下信息来自 GitHub 描述）

核心理念：**SKILL.md = Agent 的特化能力封装单元**

```
evolver/
├── .claude/
│   ├── agents/       ← 各 Agent 定义（.md 格式，含 hooks frontmatter）
│   └── skills/       ← 各领域 SKILL.md
├── SKILL.md          ← 项目级主技能（可被外部发现）
└── ...
```

**关键洞察：** Agent 定义文件 + SKILL.md 不是两种东西，而是同一事物的两种视图（内部定义 vs 外部可发现接口）。

### 5.2 panaversity/learn-agentic-ai（DACA 模式）

**Dapr Agentic Cloud Ascent** — 企业级 Agent 协同架构：
- 基于 Dapr 的分布式状态管理
- StatefulActor 模式（每个 Agent 是有状态的 Actor）
- 适合大规模多 Agent 部署

（对我们当前阶段过重，但架构思路值得关注）

### 5.3 mengram 的 Hooks × Memory 融合模式（直接可用）

```
SessionStart → 自动从 Memory MCP 加载相关认知档案
UserPromptSubmit → 自动检索相关历史决策
PostToolUse (Write) → 自动保存重要决策到 Memory
SessionEnd → 清理 + 摘要存储
```

这个模式完全可以现在就为 njueeRay 团队实现。

---

## 六、对 njueeRay 团队的落地路线图

### P0（本次 Sprint）— 零成本高价值

| 动作 | 实现方式 | 预期效果 |
|------|---------|---------|
| 创建 `.claude/settings.json`，写入 TeammateIdle + TaskCompleted 质量门 | JSON 配置文件 | Agent 完成任务前自动检查 DoD |
| 为每个 Agent 创建 `SKILL.md`（7 个文件） | 在 `.claude/skills/` 目录下创建 | Agent 能力变为「可发现的」，可被外部工具索引 |
| `PostToolUse (Write)` → async markdown lint | PowerShell 脚本 + hooks 配置 | 每次写 .md 文件后自动 lint |

### P1（下一个 Sprint）— 中等投入

| 动作 | 实现方式 | 预期效果 |
|------|---------|---------|
| `agent-skill-loader` MCP 加入 `.vscode/mcp.json` | npm 安装 + mcp.json 配置 | Agent 可动态发现和加载技能 |
| Memory × Hooks 融合（mengram 模式） | 配置自动保存/召回 hooks | 跨会话知识真正连续 |
| `SessionStart` hook → 加载项目上下文 | Shell 脚本 读取 copilot-instructions 摘要 | 每次会话自动注入当前状态 |

### P2（未来探索）— 较高投入

| 动作 | 实现方式 | 预期效果 |
|------|---------|---------|
| magg（MCP 聚合器）接入 | 替换现有 MCP 配置 | LLM 自主发现和安装 MCP |
| janee（自进化 MCP）实验 | 独立沙盒实验 | 运行时生成适合团队的工具 |
| 发布 OpenProfile Skills | 在 `anthropics/skills` 发 PR | 贡献到官方生态 |

---

## 七、安全注意事项

Hooks 运行环境等同于用户的系统权限。实施前必须：

1. 所有 hook 脚本存放在 `.claude/hooks/` 目录下，版本控制管理
2. 脚本中所有 Shell 变量加引号（`"$VAR"` 而非 `$VAR`）
3. 验证文件路径，防范路径穿越攻击
4. `prompt` 类和 `agent` 类 hooks 会消耗额外 token，不要在高频事件上滥用
5. `agent` hooks 最长 60s（默认），避免阻塞主流程

---

## 八、关键资源汇总

| 资源 | 链接 |
|------|------|
| Claude Skills 官方博客 | https://claude.com/blog/skills |
| Claude Skills 开放标准 | https://agentskills.io/ |
| Anthropic 官方 Skills 仓库 | https://github.com/anthropics/skills |
| Claude Code Hooks 文档 | https://code.claude.com/docs/en/hooks |
| Claude Code Skills 文档 | https://docs.claude.com/en/docs/claude-code/skills |
| agent-skill-loader MCP | https://github.com/back1ply/agent-skill-loader |
| mengram（Hooks + Memory） | https://github.com/alibaizhanov/mengram |
| awesome-mcp-servers 目录 | https://github.com/punkpeye/awesome-mcp-servers |
| EvoMap/evolver（GEP 参考） | https://github.com/EvoMap/evolver |

---

*本报告由 Researcher Agent 撰写。不包含代码实现，仅作研究和分析。实施由 Dev Agent 负责。*
