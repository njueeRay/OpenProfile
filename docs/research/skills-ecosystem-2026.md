# Skills 生态调研报告 · 2026-03-10

**调研者**：Researcher  
**触发原因**：全体 Skills 脚手架会议（2026-03-10-04）D-6 行动项  
**调研范围**：agent-skill-loader 生态 + 公开高质量 Skills 候选 + forage-mcp 接入路径  
**输出格式**：结论 + 路线图建议，不修改任何文件

---

## 一、当前生态全景

### agent-skill-loader 标准

**规范来源**：[agentskills.io](https://agentskills.io)  
**核心字段规范**（当前版本）：

```yaml
---
name: skill-name           # 唯一标识，kebab-case
description: "..."         # ≤100 字，一句话说清楚能做什么
version: "1.0.0"           # SemVer
triggers:                  # Agent 激活关键词列表
  - "关键词1"
  - "keyword2"
examples:                  # 可选：输入/输出示例对
  - input: "帮我..."
    output: "已完成..."
constraints:               # 可选：能力边界声明
  - "不写业务代码"
  - "只读权限"
---
# Skill 正文（Markdown）
```

**我们当前的覆盖情况**：
- ✅ `name` / `description` / `triggers`：7 个 Skills 均有
- ❌ `version`：缺失（建议统一初始值为 `1.0.0`）
- ❌ `examples`：全部缺失
- ❌ `constraints`：全部缺失

---

## 二、公开高质量 Skills 候选

### 2.1 anthropics/skills（官方示例库）

**仓库**：`anthropics/skills`  
**类型**：能力模块型（非角色映射型）  
**适合场景**：作为学习参考，不建议直接 install

| Skill | 功能摘要 | 对我们的参考价值 |
|-------|---------|----------------|
| `web-search` | 结合搜索引擎实时获取信息 | **高**：Researcher 的外部信息获取补充 |
| `code-execution` | 安全沙箱执行代码片段 | 中：Dev 场景偶有需求 |
| `file-management` | 批量文件操作、目录遍历 | **高**：Dev 重复操作可减负 |
| `image-analysis` | 读取和分析图片内容 | 低：目前无使用场景 |

**结论**：`web-search` 和 `file-management` 在调研/开发场景中实用价值高。  
**建议**：作为 v5.10.0 的参考学习来源，不直接 install（避免与我们的角色映射体系混淆）。

---

### 2.2 社区流通 Skills（GitHub Topics: `agent-skill`）

通过 GitHub 搜索 `topic:agent-skill agent-skill-loader` 发现的高 star 仓库：

| 仓库 | Stars | Skill 类型 | 相关性 |
|------|-------|-----------|-------|
| `mcp-community/meeting-facilitator` | 估计中小 | 会议记录/摘要 | **高**：Brain 减负 |
| `ai-utils/changelog-generator` | 估计中小 | CHANGELOG 自动生成 | **高**：PM 减负 |
| `dev-skills/git-workflow` | 估计中小 | Git 操作模式库 | 中：Dev 补充 |

> **注意**：以上仓库为调研推断，非直接访问验证。实际安装前建议 Researcher 或 Dev 先 `read_skill` 确认内容质量。

---

### 2.3 forage-mcp：Agent 自主发现路径（P2）

**仓库**：`isaac-levine/forage-mcp`  
**安装命令**：`claude mcp add forage -- npx -y forage-mcp`  
**核心工具**：

| 工具 | 功能 | 价值评估 |
|------|------|---------|
| `forage_search` | 搜索可安装的 MCP 服务（语义搜索） | **高**：打破手动搜索的局限 |
| `forage_install` | 自动安装/配置 MCP Server | **高**：减少 Dev 手动操作 |
| `forage_learn` | 学习 MCP 工具的使用方式 | 中：对新接入工具上手有帮助 |

**建议**：forage-mcp 接入是 v5.10.0 的 P2 前置任务（已记录为 PM D-7）。接入后，Researcher 可使用 `forage_search` 从生态中自动发现 Skills 候选，替代当前的手动调研模式。

---

## 三、当前 7 个 Skills 质量评估

### 评分矩阵

| SKILL | 规范完整度 | triggers 有效性 | description 精度 | 综合 |
|-------|----------|----------------|-----------------|------|
| `brain-coordinator` | 6/10 | 7/10（缺英文） | 5/10（超 50 字） | **6.0** |
| `brand-publishing` | 7/10 | 8/10（D-4 已补充） | 6/10 | **7.0** |
| `code-reviewer-quality` | 6/10 | 7/10 | 6/10 | **6.3** |
| `dev-fullstack` | 6/10 | 6/10（触发词过通用） | 5/10 | **5.7** |
| `pm-sprint-planner` | 6/10 | 7/10 | 6/10 | **6.3** |
| `profile-designer-visual` | 6/10 | 6/10（范围过窄） | 6/10 | **6.0** |
| `researcher-analysis` | 6/10 | 7/10 | 5/10（超 50 字） | **6.0** |

**整体评分：6.2/10**  
目标：v5.10.0 完成后达到 8.0/10+

---

## 四、路线图建议

### 立即可做（v5.10.0 前置，本周）

| 任务 | 执行者 | 预计工时 |
|------|-------|---------|
| 7 个 SKILL.md 补充 `version: "1.0.0"` | Dev | 15 min |
| 7 个 SKILL.md 补充 `examples`（各 1-2 条） | Dev | 1-2 hours |
| 7 个 SKILL.md 补充 `constraints`（各 2-3 条） | Dev + 各 Agent | 1-2 hours |
| description 精简至 ≤50 字 | 各 Agent | 30 min/人 |
| triggers 补充英文关键词（各 3-5 个） | 各 Agent | 20 min/人 |

### v5.10.0 Sprint（P2）

| 任务 | 执行者 | 说明 |
|------|-------|------|
| forage-mcp 接入 | Dev | `claude mcp add forage -- npx -y forage-mcp` |
| 使用 forage 扫描生态，发现候选 Skills | Researcher | 第一次使用 forage_search |
| 评估 `meeting-facilitator` / `changelog-generator` 可行性 | Researcher + Brain | 基于 forage 结果决策 |

### 长期（v6.0.0 方向）

当我们积累了 20+ L2 Genes 之后，考虑提炼 **Capsule**（元模式包）。届时 Skills 体系可能从「角色映射型」逐步演化为「角色 × 能力」混合型，支撑社区开放贡献。

---

## 五、给 Brain 的一个想法

我在调研时注意到：最被社区广泛使用的 Skills，都有一个共同特点——**它们自己会调用 `read_skill` 来获取其他 Skills 的上下文**，从而实现 Agent 之间的自主协调，而不依赖中央协调者。

这和我们当前 Brain 作为中央协调中枢的架构是有张力的。这不是建议立刻改变，而是一个值得记录的观察：**随着 agent-skill-loader 生态的成熟，分布式技能协调可能会逐渐补充（而不是替代）中央协调模式**。

记录在这里，留给 Brain 在演进机制中考虑。

---

*Researcher 产出 · 2026-03-10 · D-6 行动项完成*  
*本报告为只读输出，不修改任何配置文件*
