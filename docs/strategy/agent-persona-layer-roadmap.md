# Agent Persona Layer — 完整开发路线图

> **Feature 代号：** `agent-persona-layer`  
> **战略定位：** Agent 可视化 × 数字身份 × 协作透明化  
> **规划状态：** ✅ 已通过专题研讨，等待 Ray 确认后启动实施  
> **计划周期：** v6.x 专项 feature（v6.0.0 主体工程完成后启动）  
> **触发记录：** `2026-03-11-01-pixel-agents-all-hands.md` → `2026-03-11-03-agent-visualization-tech-seminar.md`  
> **调研依据：** `docs/research/agent-visualization-landscape-2026.md`

---

## 一、愿景与目标

### 我们在做什么

把团队的 AI Agent 协作体系——目前以 Markdown 文件和会议纪要形式存在——转化为**可以被任何人感知和探索的数字身份空间**。

不是做一个 Agent 管理后台，而是做一个**叙事性入口**：访问这个空间的人，能在五分钟内理解「这支 AI 团队是谁、在做什么、积累了什么知识」，并产生「我也想要这样的团队」的冲动。

### 成功标准

| 验收维度 | 具体标准 |
|---------|---------|
| **可感知性** | 没有任何技术背景的人打开页面，能在 2 分钟内说清楚「这里有 7 个 Agent，每个在做什么」 |
| **信息真实性** | Agent Card 的所有数据来自现有 agent.md / patterns / 会议纪要，无手动维护的副本 |
| **更新可持续性** | 活动时间线通过脚本自动提取，新会议 commit 后无需手动更新 |
| **工程质量** | Lighthouse Performance ≥ 90，Accessibility ≥ 90（含无 JS 降级版本） |
| **与现有站点一致** | 视觉风格、导航结构与 njueeray.github.io 完全统一 |

---

## 二、功能层架构

```
L1  角色身份层        Agent 是谁？有什么特质？
    ↓ agent.md + 视觉系统
L2  协作过程层        Agent 在做什么？怎么协作？
    ↓ 协作拓扑图 + 角色边界可视化
L3  记忆知识层        Agent 知道什么？学到了什么？
    ↓ patterns 图谱 + 记忆分层展示
L4  历史叙事层        Agent 经历了什么？有哪些成就？
    ↓ 时间线 + 项目档案 + 版本成就
L5  交互界面层        用户如何与 Agent 的世界互动？
    ↓ 空间叙事导航（长期愿景）
L6  社区连接层        Agent 如何进入更大的生态？
    ↓ 对外输出 + 身份互认协议（最远期）
```

**实施优先级：** L1 + L4 并行启动 → L3 → L2 → L5 → L6  
（L5/L6 为 v7.x 或更晚的长期愿景，本 Roadmap 覆盖 L1–L4）

---

## 三、Phase 0 — 数据层准备

> **时机：** 可在 v6.x 启动前任意时机先行执行，不影响主轨道  
> **性质：** 数据结构化，非可视化，对现有工程零风险  
> **Ray 的操作：** 无需操作，授权 Dev 和 Profile Designer 执行即可

### 0-A：agent.md 结构化升级

**负责人：** Dev  
**工作量：** < 1h  
**内容：** 为 7 个 agent.md 文件增加 YAML frontmatter 字段

```yaml
---
id: brain                    # 唯一标识，kebab-case
displayName: Brain           # 显示名称
agentVersion: v1.1
joined: 2026-02-25          # 团队加入日期（来自 team-evolution.ts）
color: "#3B5BDB"            # 品牌色（Profile Designer 指定）
symbol: hexagon              # 几何符号（Profile Designer 指定）
role: 战略大脑               # 一句话角色定义
tagline: "将模糊意图精确化"   # 角色核心价值 slogan
---
```

**7 个 Agent 的 color + symbol 规划（待 Profile Designer 确认）：**

| Agent | 暂定色系 | 暂定符号 | 语义 |
|-------|---------|---------|------|
| Brain | 深蓝 `#3B5BDB` | 六边形 | 多维综合思考 |
| PM | 翠绿 `#2F9E44` | 时序流 | 进度与节点 |
| Dev | 紫色 `#7048E8` | 齿轮复合 | 实现与构建 |
| Researcher | 橙色 `#E8590C` | 散点/星群 | 发现与扫描 |
| Code Reviewer | 红色 `#C92A2A` | 菱形 | 边界与精确度 |
| Profile Designer | 金色 `#F08C00` | 分形 | 美学生成 |
| Brand | 青色 `#0C8599` | 波形 | 传播与共鸣 |

---

### 0-B：视觉规格文档

**负责人：** Profile Designer  
**工作量：** < 4h  
**输出物：** `docs/guides/agent-visual-spec.md`

内容包含：
- 7 个 Agent 的完整色值（主色、辅色、深色模式备选）
- 7 个 Agent 的几何符号 SVG 草稿（不需要精稿，确定构型即可）
- 像素头像风格参考（为 Phase 1 的 Avatar 设计提供输入）
- 视觉语言双轨说明（像素头像用于外向传播层，几何符号用于站点内部）

---

### 0-C：asset 存储结构预定义

**负责人：** Dev + Profile Designer 共同决策  
**工作量：** < 30 min（只需要产出一个决策记录）  
**内容：**

```
public/
└── agents/
    ├── avatars/          ← 像素头像 PNG（Phase 1 使用）
    │   ├── brain.png
    │   ├── pm.png
    │   └── ...
    └── symbols/          ← 几何符号 SVG（图谱节点等用）
        ├── brain.svg
        └── ...
```

决策点：头像尺寸规格（建议 64×64 和 256×256 两种规格）

---

## 四、Phase 1 — Agent Card 静态页面

> **时机：** v6.x 第一个 Sprint（v6.0.0 主体工程完成后）  
> **前置条件：** Phase 0 全部完成  
> **Ray 的操作：** 确认 Phase 1 启动 + 回答两个技术决策（见下）

### 需要 Ray 回答的技术决策

| 决策 | 选项 A（推荐） | 选项 B |
|------|-------------|--------|
| Content Collection 结构 | 独立 `src/content/agents/`（清晰，扩展性好） | 扩展现有 team 相关数据结构（改动少，但耦合） |
| 知识图谱节点粒度（Phase 3 前置决策，现在锁定方向） | Pattern 文件级（粗粒度，简单） | Pattern 条目级（细粒度，内容丰富但复杂） |

---

### 1-A：Astro Content Collection 创建

**负责人：** Dev  
**工作量：** 1d

```
src/
└── content/
    └── agents/
        ├── brain.md         ← 来自 .github/agents/brain.agent.md（内容同步）
        ├── pm.md
        ├── dev.md
        ├── researcher.md
        ├── code-reviewer.md
        ├── profile-designer.md
        └── brand.md
```

每个文件 frontmatter 沿用 Phase 0-A 定义的字段，正文为公开版角色介绍（从 agent.md 提炼，去除执行层指令，保留 persona 层内容）。

**content/config.ts 中的 schema 定义：**

```typescript
const agentsCollection = defineCollection({
  type: 'content',
  schema: z.object({
    id: z.string(),
    displayName: z.string(),
    agentVersion: z.string(),
    joined: z.string(), // ISO date
    color: z.string(),
    symbol: z.string(),
    role: z.string(),
    tagline: z.string(),
  }),
});
```

---

### 1-B：Agent Card 组件设计与实现

**负责人：** Dev（实现）× Profile Designer（视觉规格输入）  
**工作量：** 2-3d

**Agent Card 信息架构（Who / What / How / Why 四维度）：**

```
┌─────────────────────────────────────────┐
│  [几何符号]  Brain           [加入日期]  │  ← Who
│             战略大脑                    │
│  "将模糊意图精确化"                      │
├─────────────────────────────────────────┤
│  最近活动                               │  ← What（Phase 2 自动填充）
│  · 2026-03-11 主持 Agent 可视化研讨会    │
│  · 2026-03-10 全体系统审视              │
│  · 贡献 patterns: 3 条                  │
├─────────────────────────────────────────┤
│  典型发言风格                            │  ← How
│  "这不是一个工具问题，这是一个认知架构    │
│   问题。"                               │
├─────────────────────────────────────────┤
│  存在意义                               │  ← Why
│  将人类判断力和 AI 执行力之间的翻译层     │
└─────────────────────────────────────────┘
```

**两套视觉规格（同一组件，不同用途）：**

- **Agent List 卡片**（`/agents` 列表页）：紧凑版，64px 头像/符号 + 名称 + tagline + 最近一条活动
- **Agent Detail 页**（`/agents/[id]`）：完整版，四维度全展示 + 完整活动时间线（Phase 2 接入后）

---

### 1-C：路由与页面创建

**负责人：** Dev  
**工作量：** 1d

```
src/pages/
└── agents/
    ├── index.astro          ← /agents 列表页，展示全部 7 个 Agent Card
    └── [id].astro           ← /agents/brain 等详情页
```

`/agents` 页面集成进主导航（`Nav.astro`），位置：在「Team」之后。

---

### 1-D：E2E 测试与审查

**负责人：** Dev（测试）× Code Reviewer（审查）  
**工作量：** 1d

测试覆盖点：
- `/agents` 页面可正常渲染 7 张 Agent Card
- `/agents/brain` 等详情页可正常渲染
- 所有 Agent Card 的内部链接有效
- 无障碍：所有图像有 alt 文本，颜色对比度符合 WCAG AA
- 无 JS 降级：在禁用 JavaScript 的环境下页面内容仍可读

---

## 五、Phase 2 — 活动时间线自动生成

> **时机：** v6.x 第二个 Sprint  
> **前置条件：** Phase 1 完成  
> **Ray 的操作：** 无特殊操作，Dev 自主执行

### 2-A：时间线数据提取脚本

**负责人：** Dev  
**工作量：** 2d  
**输出物：** `scripts/extract-agent-timeline.ts`

**数据源：**

| 来源 | 提取内容 | 提取方式 |
|------|---------|---------|
| `docs/meetings/*.md` | Agent 参与记录（frontmatter 的 `参会` 字段或正文的角色标记） | 正则/灰质 frontmatter 解析 |
| `.github/agents/knowledge/*-patterns.md` | Pattern 新增条目（每条 `[日期]` 前缀） | 正则提取日期+标题 |
| `CHANGELOG.md` | 版本发布事件（按版本关联 Agent 贡献） | 解析 `## [X.Y.Z]` 区块 |

**输出格式：**

```typescript
// src/content/agents/brain-timeline.json（自动生成，不手动维护）
{
  agentId: "brain",
  events: [
    {
      date: "2026-03-11",
      type: "meeting",        // meeting | pattern | release
      title: "主持 Agent 可视化研讨会",
      ref: "docs/meetings/2026-03-11-03-..."
    },
    {
      date: "2026-03-10",
      type: "pattern",
      title: "新增 P-BR-004：战略会议主持规范",
      ref: ".github/agents/knowledge/brain-patterns.md"
    }
  ]
}
```

---

### 2-B：CI 集成

**负责人：** Dev  
**工作量：** 0.5d

在 `package.json` 中新增脚本：
```json
"scripts": {
  "gen:timeline": "tsx scripts/extract-agent-timeline.ts",
  "prebuild": "npm run gen:timeline"
}
```

`prebuild` 钩子确保每次 `npm run build` 前自动重新生成时间线数据，无需手动维护。

---

### 2-C：Agent Detail 页时间线 UI

**负责人：** Dev  
**工作量：** 1-2d

在 `/agents/[id]` 详情页接入自动生成的 `*-timeline.json`，展示为：
- **竖向时间线**（类似博客的 GitTimeline 组件，复用或扩展现有 `GitTimeline.astro`）
- 支持按类型筛选（全部 / 会议 / Patterns / 发布）
- 最近 10 条默认显示，「查看全部」展开

---

## 六、Phase 3 — 知识图谱可视化

> **时机：** v6.x 第三 Sprint（可选，视前期反馈决定是否执行）  
> **前置条件：** Phase 2 完成 + Code Reviewer 完成 dependency audit  
> **Ray 的操作：** 在 Phase 2 完成后，确认是否进入 Phase 3

### 3-A：前置安全审计

**负责人：** Code Reviewer  
**工作量：** 0.5d  
**内容：**

对 `react-force-graph` 及其依赖进行 supply chain 审计：
```bash
npm audit --audit-level=high
npx license-checker --onlyAllow "MIT;ISC;Apache-2.0;BSD-2-Clause;BSD-3-Clause"
```

只有审计通过（无 high/critical 漏洞，许可证合规）才进入 3-B。

---

### 3-B：图谱数据结构设计

**负责人：** Dev + Brain  
**工作量：** 1d

**节点类型：**

```typescript
type GraphNode =
  | { type: 'agent';   id: string; label: string; color: string }
  | { type: 'pattern'; id: string; label: string; agentId: string; date: string }
  | { type: 'meeting'; id: string; label: string; date: string }
```

**边类型：**

```typescript
type GraphEdge =
  | { source: agentId;   target: meetingId;  rel: 'participated' }
  | { source: agentId;   target: patternId;  rel: 'contributed'  }
  | { source: patternId; target: meetingId;  rel: 'referenced'   }
  | { source: agentId;   target: agentId;    rel: 'collaborated' }
```

**图谱数据输出脚本：** `scripts/extract-knowledge-graph.ts`（基于 Phase 2-A 脚本扩展）

---

### 3-C：Astro Island 图谱组件实现

**负责人：** Dev  
**工作量：** 3-5d

**组件路径：** `src/components/AgentKnowledgeGraph.tsx`（React，Astro Island）

**核心交互：**
- 默认视图：7 个 Agent 节点 + 连接密度热图（越活跃的 Agent 节点越大）
- 点击 Agent 节点：展开该 Agent 的 patterns 和关联会议
- 点击 Pattern/Meeting 节点：侧边面板显示摘要 + 跳转链接
- 缩放/拖拽：标准力导向图交互

**页面集成：**
```
src/pages/
└── agents/
    └── graph.astro          ← /agents/graph 独立页面
```

同时在 Agent 列表页 `/agents` 的顶部放置图谱的缩略版（300px 高度，不可交互，点击跳转到 `/agents/graph`）。

---

### 3-D：无 JS 降级版本

**负责人：** Dev  
**工作量：** 1d

当浏览器禁用 JavaScript 时，`/agents/graph` 页面降级为一个静态的关系表格：

```
| Agent | 协作最多的 Agent | patterns 数量 | 参与会议数量 |
|-------|----------------|-------------|------------|
| Brain | PM (15次)       | 8 条        | 41 场       |
| ...   | ...            | ...         | ...        |
```

确保 Lighthouse Accessibility 不因图谱引入而下降。

---

## 七、Phase 4 — 对外社区连接

> **时机：** v7.x 或更晚（Phase 1-3 稳定运行 ≥ 3 个月后评估）  
> **触发条件：** Phase 1-3 内容质量经过验证，有明确的外部社区需求  
> **当前状态：** 方向确认，技术细节待届时重新评估

### 方向概述

**4-A：向 Pixel Agents 社区贡献**
- 将 7 个 Agent 的 persona 配置转化为 Pixel Agents 支持的格式
- 在 Pixel Agents 平台建立 OpenProfile 的「社区节点」
- 使用 Pixel Agents 的像素办公室作为「对外展示版」入口

**4-B：MCP 身份协议兼容**
- 评估将 agent.md 映射为 MCP 资源格式
- 实现 Agent 身份的跨平台互认
- 这是最远期的方向，依赖 MCP 生态成熟度

---

## 八、Obsidian Publish 先行传播实验

> **发起：** Brand（在专题研讨会上提出）  
> **定性：** 零成本的 L3+L4 原型验证，与主开发轨道完全并行，不影响任何工程工作  
> **Ray 是否需要操作：** 是。Obsidian Publish 是付费服务，需要 Ray 手动开通。下面是完整操作步骤。

---

### 这个实验做什么

把我们现有的 `docs/` 目录（会议纪要、patterns、research 报告、策略文档）发布为一个**带知识图谱导航的公开网站**，让外部读者能看到「这支团队积累了多少知识」。

效果：类似 [obsidian.md/publish](https://obsidian.md/publish) 展示的那种，文章之间有双向链接，右侧有实时图谱，点击节点可以导航。

这是在 Phase 3 知识图谱工程实现之前，用接近零成本验证「知识图谱对外部读者是否有吸引力」的方法。

---

### Ray 的完整操作步骤

**Step 1：下载安装 Obsidian 桌面应用（免费）**

访问 [obsidian.md](https://obsidian.md)，下载 Windows 版安装包，安装。

**Step 2：打开 OpenProfile 目录作为 Obsidian Vault**

启动 Obsidian → 选择「Open folder as vault」→ 选择  
`F:\Project\GitHub\njueeRay\OpenProfile` 目录

打开后，Obsidian 会自动索引所有 `.md` 文件并构建链接关系图。在左侧「Graph view」里可以看到文件之间的关系图谱——这就是 Publish 发布出去的效果。

**Step 3：开通 Obsidian Publish 订阅（付费）**

- 费用：**$8/月**，或 $96/年
- 注册 Obsidian 账号：进入 Obsidian 应用 → Settings → Obsidian Sync / Publish → Create account
- 购买 Publish 订阅：[obsidian.md/pricing](https://obsidian.md/pricing)

**Step 4：在 Obsidian 内开启 Publish 插件并配置**

进入 Obsidian → Settings → Core Plugins → 打开「Publish」

之后在左侧边栏会出现 Publish 面板。选择要发布的文件：

**建议发布的文件范围（可选全部或子集）：**

```
✅ docs/meetings/         ← 全部会议纪要（这是内容核心）
✅ docs/research/         ← 全部调研报告
✅ docs/governance/team-playbook.md  ← Playbook 主文件
✅ docs/strategy/agent-persona-layer-roadmap.md  ← 本文件
✅ docs/strategy/open-source-strategy.md
❌ .github/agents/        ← 不发布（执行层配置，不适合对外）
❌ *.tmp_*                ← 不发布（临时文件）
```

**Step 5：设置站点名称和域名**

在 Publish 设置里：
- Site name：`OpenProfile Knowledge Base`（或 Ray 自定的名称）
- Site URL：Obsidian 会分配一个 `publish.obsidian.md/你的slug` 形式的免费域名  
  例如：`publish.obsidian.md/openprofile`

也可以配置自定义域名（如 `wiki.njueeray.dev`），需要在域名解析处加一条 CNAME 记录指向 Obsidian 的服务器。

**Step 6：发布并分享**

点击「Publish」按钮，几分钟后站点上线。

把链接分享到：
- GitHub 仓库的 README
- njueeray.github.io 的 About 或 Footer
- 社交媒体（Brand 负责文案）

**Step 7：评估传播效果（Brand 执行，1 个月后）**

- Obsidian Publish 提供基础访问统计
- 评估哪些页面被访问最多、Graph view 是否被使用
- 作为 Phase 3 知识图谱「是否值得投入工程资源」的决策数据

---

### 成本总结

| 项目 | 费用 | 是否必须 |
|------|------|---------|
| Obsidian 桌面应用 | 免费 | 是 |
| Obsidian Publish 订阅 | $8/月 | 是（实验期间） |
| 配置时间（Ray） | 约 30 分钟 | — |
| 配置时间（Brand，内容筛选 + 发布后文案） | 约 2h | — |

如果实验结论是「值得做」，可以继续订阅；如果结论是「受众反应冷淡，Phase 3 另行评估」，取消订阅即可，无其他损失。

---

## 九、整体时间线与里程碑

```
现在 (2026-03)
  │
  ├─ Phase 0   数据层准备      < 1 周（授权后随时启动）
  │   ├── Dev: agent.md frontmatter 升级
  │   ├── Profile Designer: 视觉规格文档
  │   └── Ray: Obsidian Publish 配置（约 30 min）
  │
v6.0.0 发布    主体工程完成    （门控节点，需等待）
  │
  ├─ Phase 1   Agent Card 静态页面    约 5-6 天
  │   Sprint 目标：/agents 页面上线，7 张 Agent Card 可访问
  │
  ├─ Phase 2   活动时间线自动化        约 3-4 天  
  │   Sprint 目标：Agent 详情页显示自动生成的活动时间线
  │
  ├─ Phase 3   知识图谱可视化          约 6-8 天（可选）
  │   Sprint 目标：/agents/graph 上线，知识图谱可交互
  │
v7.x 或更晚
  └─ Phase 4   对外社区连接            待评估
```

---

## 十、已确认的技术决策

| 决策 | 结论 | 决策会议 |
|------|------|---------|
| 技术路径 | 路径 A（自建 Astro 扩展）为主 | 2026-03-11-03 |
| 功能层启动顺序 | L1 + L4 并行 → L3 → L2 | 2026-03-11-03 |
| 知识图谱渲染库 | `react-force-graph`（Astro Island 形式） | 2026-03-11-03 |
| 维护可持续性方案 | 时间线通过 `prebuild` 脚本自动生成 | 2026-03-11-03 |
| 视觉语言双轨 | 像素头像（传播层）+ 几何符号（工具层） | 2026-03-11-03 |
| 展示层与执行层解耦 | 可视化层仅展示，不暴露 Agent 执行入口 | 2026-03-11-01 |
| Agent content collection | **待 Ray 确认**：独立 vs 扩展现有结构 | — |
| 知识图谱节点粒度 | **待 Ray 确认**：文件级 vs 条目级 | — |

---

## 十一、风险项追踪

| 风险 | 可能性 | 影响 | 缓解措施 |
|------|--------|------|---------|
| Phase 3 `react-force-graph` dependency audit 不通过 | 低 | 中 | 备选库：Cytoscape.js（同样可作为 Astro Island） |
| Obsidian Publish 实验受众反应冷淡 | 中 | 低 | 实验数据用于决策 Phase 3 投入，不影响 Phase 1/2 |
| 拟人化信任失真（用户过度信任 Agent） | 低 | 中 | 每个 Agent 详情页包含「能力边界」说明区块（Code Reviewer 要求） |
| Agent Card 内容与 agent.md 执行层信息混淆 | 低 | 中 | content/agents/ 为独立公开版，只含 persona 层，不含执行指令 |
| 时间线脚本在大量会议纪要后性能下降 | 低 | 低 | 脚本每次全量重算但只在 build 时运行，生产无影响 |

---

*文档维护：Brain（策略层）× PM（版本跟踪）*  
*最后更新：2026-03-11*  
*状态：规划完成，Phase 0 可随时授权启动*
