# Team Playbook  AI-Native 团队协作手册

> **本手册是团队最高优先级的核心资产。**
> 它不绑定任何特定项目记录的是方法论、协同规范与共识，可随团队带入任意新项目。
>
> **最后更新：** 2026-02-26（新增 §12 接手协议 + §13 团队自主进化）
> **适用版本：** Team V2.0（Brain · PM · Dev · Researcher · Code-Reviewer）
> **核心原则：** 角色边界清晰 · 会话连续 · CI 先行 · 有据可查 · 团队可自主进化

---

## 1. 团队拓扑与角色边界

### 1.1 标准团队结构

```
用户（目标 & 最终决策）
         
         
    
      brain    唯一对话出口  战略中枢  优先决定权
    
          任务分发（Task Dispatch）
    
                                
             
   pm   dev            code-reviewer
             
             按需
            
       
       researcher  只读  不修改文件  输出摘要
       
```

### 1.2 角色职责速查

| 角色 | 核心职责 | 权限 | 绝不做的事 |
|------|----------|------|------------|
| `brain` | 战略规划  任务综合  用户汇报  阻塞决策 | 读写 + 决策 | 绕过用户直接实施 Breaking Change |
| `pm` | Sprint 规划  DoD 执行  CHANGELOG 维护  版本发布 | 读写 + 规划 | 直接编写功能代码 |
| `dev` | 全栈实现（代码、文档、配置、基础设施） | 读写 | 在没有 Implementation Plan 的情况下改动核心架构 |
| `researcher` | 技术调研  方案对比  依赖风险分析 | **只读** | 修改任何工作文件 |
| `code-reviewer` | 七维度 QA  CI 门禁  阻断问题上报 | 只读 + 诊断 | 通过一个存在 🔴 问题的 PR |

### 1.3 专项角色（Specialist Layer）

核心五角色是通用底座。特定项目可按需叠加专项角色，**不替换核心角色**：

| 专项角色 | 适用场景 | 关系 |
|----------|---------|------|
| `profile-designer` | GitHub Profile  个人主页  Landing Page | 叠加在 dev 上游 |
| `arch-designer` | 系统设计  API 设计  数据模型设计 | 叠加在 dev 上游 |
| `security-reviewer` | 安全敏感项目 | 叠加在 code-reviewer 下游 |
| `data-analyst` | 数据驱动项目 | 叠加在 researcher 旁侧 |

### 1.4 角色边界的根本原则

> **复盘会议 #003 教训：角色边界模糊是最大的效率损耗点。**

- **Brain 不写代码**：Brain 负责"要做什么"，Dev 负责"怎么做"
- **Dev 不定策略**：Dev 执行经 brain 和 pm 明确的任务，有疑问时向上升级（Escalate）
- **Researcher 不修改文件**：输出结论+摘要，由 Dev 决定是否采纳并实施
- **Code-Reviewer 不实现修复**：发现问题上报给 Dev 处理，不直接改代码
- **PM 不编写功能代码**：PM 管理进度和版本，不直接参与功能实现

---

## 2. 会话连续性协议（Session Continuity）

> **根本问题：每次新的 Copilot 会话 context 清零，团队"失忆"。**
> 以下协议是解决这一问题的标准答案，每次会话必须执行。

### 2.1 会话开启协议（Brain 执行）

```
1. 读取 .github/copilot-instructions.md
    确认当前项目状态、技术栈、个人信息、决策记录
2. 读取 docs/meetings/ 最新会议纪要
    恢复上次结束点：完成了什么、遗留什么、阻塞什么
3. 扫描 CHANGELOG.md [Unreleased] 区块
    确认哪些变更已完成但未发布
4. 向用户输出三行简报：
   
   上次完成：[主要变更列表]
   当前目标：[本次用户目标 / 待执行任务]
   需决策/确认：[阻塞点 or "无"]
   
5. 等待用户确认继续，或用户给出新目标
```

### 2.2 会话关闭协议（PM 执行）

```
1. 逐项核查 DoD Checklist（见第 7 节）
2. 更新 CHANGELOG.md  [Unreleased] 补充本次变更
3. 更新 copilot-instructions.md  「当前迭代状态」区块
4. 评估是否达到 Release 条件（见第 5 节）
5. 提交 commit（遵循本手册第 4 节规范）
6. 向用户输出会话收尾摘要：
   
   本次完成：[变更列表，含 commit hash]
   遗留事项：[未完成的任务 or "无"]
   建议下次：[下一步优先行动 or "无"]
   
```

### 2.3 信息单一来源（Single Source of Truth）

| 信息类型 | 权威存储位置 | 更新时机 |
|----------|-------------|---------|
| 项目状态 & 当前迭代 | `copilot-instructions.md`  当前迭代状态 | 每次会话关闭时 |
| 已决定的设计决策 | `copilot-instructions.md`  已决定的设计选择 | 做出决策后立即记录 |
| 变更历史 | `CHANGELOG.md` | 每次有实质变更时 |
| 会议决议 | `docs/meetings/YYYY-MM-DD-<类型>.md` | 会议当时 |
| 方法论 & 规范 | `docs/team-playbook.md`（本文件）| 复盘会议后 |

---

## 3. 任务执行流程

### 3.1 标准执行管道

```
用户输入 / Brain 确认目标
        
        
   PM：Sprint 规划
    任务拆解（每条不超过 2 小时工作量）
    交付物定义（what = done）
    优先级标注（P0 / P1 / P2）
        
        
   Researcher：Pre-flight Research（如有新技术/依赖/组件）
    输出：调研摘要（不超过 10 行）+ 推荐方案 + 已知坑点
        
        
   Dev：实现
    先写 Implementation Plan（修改哪些文件的哪些部分）
    Brain 或 PM 确认 Plan（复杂变更需确认，小变更可跳过）
    执行  提交
        
        
   Code-Reviewer：QA（七维度，见第 6 节）
    APPROVED  PM 更新状态  关闭任务
    APPROVED_WITH_SUGGESTIONS  Dev 选择性处理
    REQUEST_CHANGES  Dev 修复  重新 Review
        
        
   PM：更新 CHANGELOG + copilot-instructions + DoD 核查
```

### 3.2 Pre-flight Research 触发规则

**由 PM 在任务执行前主动触发，以下任一条件满足即触发：**

- 引入未使用过的第三方库或 API
- 升级主框架版本（Major 或 Minor）
- 接入新的第三方服务（CI、CDN、分析工具等）
- 实现未经验证的技术方案
- 任务描述中包含"可能"、"也许"、"待确认"等不确定词

**Researcher 输出格式：**

```markdown
## 调研结论：[主题]

**推荐方案：** [一句话结论]
**关键版本约束：** [如有]
**已知坑点：**
- [坑 1]：[规避方法]
- [坑 2]：[规避方法]
**参考链接：** [必要时]
```

### 3.3 Implementation Plan 规范

Dev 在处理任何跨越 3 个以上文件、或改动核心架构的任务时，先输出 IP：

```markdown
## Implementation Plan：[任务名称]

**目标：** 一句话
**影响文件：**
- `path/to/file.ts`  [将做什么修改]
- `path/to/file.md`  [将做什么修改]
**执行顺序：**
1. [步骤 1]
2. [步骤 2]
**验证方式：** [如何确认完成且正确]
**回滚方案：** [如有破坏性修改]
```

---

## 4. Commit 规范

### 4.1 格式

```
<type>(<scope>): <subject>

[可选 body  72 字符换行，说明"为什么"而非"做了什么"]

[可选 footer  关联 issue / breaking change 说明]
```

**Subject 规范：**
- 用祈使语气（"add feature"而非"added feature"）
- 首字母小写
- 不以句号结尾
- 不超过 72 字符

### 4.2 Type 速查

| Type | 使用场景 | 影响 CHANGELOG |
|------|---------|---------------|
| `feat` | 新功能、新组件、新页面 | ✅ Added |
| `fix` | Bug 修复、链接修复 | ✅ Fixed |
| `docs` | 文档变更（不含代码） | ✅ Changed |
| `refactor` | 代码重构（无新功能、无 bug 修复） | ✅ Changed |
| `style` | 格式、空格、换行（不影响逻辑） | ❌ 不进 CHANGELOG |
| `chore` | 构建、依赖、配置、gitignore | ❌ 不进 CHANGELOG |
| `ci` | CI/CD 工作流 | ❌ 不进 CHANGELOG |
| `perf` | 性能优化 | ✅ Changed |
| `test` | 测试代码 | ❌ 不进 CHANGELOG |
| `revert` | 回滚之前 commit | ✅ Fixed |

### 4.3 Scope 约定

Scope 写在括号内，填入受影响的模块标识：

```
feat(blog): add RSS feed generation
fix(ci): exclude rate-limited domains from link-check
docs(playbook): add session continuity protocol
chore(deps): pin astro to 4.16.18
```

常用 Scope：`readme`  `astro`  `blog`  `ci`  `docs`  `agent`  `deps`  `config`  
（项目可自定义扩展，约定后写入 copilot-instructions.md）

### 4.4 多仓库 commit 约定

跨多仓库的操作在 body 中标注影响范围：

```
feat(readme): restructure Profile README for V2.0

Affects: njueeRay-profile, OpenProfile
- Phase A: dual-mode <picture> header
- Phase B: 12-field JSON identity + Typing SVG
```

---

## 5. 版本发布规则

### 5.1 语义化版本

遵循 [Semantic Versioning 2.0.0](https://semver.org)：`MAJOR.MINOR.PATCH`

| 版本号位置 | 触发条件 | 决策人 |
|-----------|---------|-------|
| `PATCH` (0.0.X) | Bug 修复、链接修复、文案调整 | PM 自主决定 |
| `MINOR` (0.X.0) | 新增功能、新增组件（向后兼容） | Brain 确认 |
| `MAJOR` (X.0.0) | 架构重构、视觉大改、Breaking Change | 用户确认 |

### 5.2 发布检查流程（PM 执行）

```
1. 确认 CHANGELOG.md [Unreleased] 内容完整，覆盖本次变更
2. 将 [Unreleased] 更名为 [X.Y.Z]  YYYY-MM-DD
3. 在 CHANGELOG 末尾补充版本对比链接：
   [X.Y.Z]: https://github.com/{owner}/{repo}/compare/vA.B.C...vX.Y.Z
4. code-reviewer 确认：DoD Checklist 全部 ✅，CI 全部绿
5. 提交：git commit -m "docs(changelog): release vX.Y.Z"
6. 打 Tag：git tag -a vX.Y.Z -m "Release vX.Y.Z  <一句话描述>"
7. 推送：git push && git push --tags
8. 在 GitHub 上创建 Release（填写 Release Notes）
```

### 5.3 CHANGELOG 结构规范

```markdown
# Changelog

## [Unreleased]

## [X.Y.Z]  YYYY-MM-DD

### Added
- 新增的功能、组件、页面

### Changed
- 修改了已有行为的变更

### Fixed
- Bug 修复

### Removed
- 删除的功能（Breaking Change 时必填）

[Unreleased]: https://github.com/{owner}/{repo}/compare/vX.Y.Z...HEAD
[X.Y.Z]: https://github.com/{owner}/{repo}/compare/vA.B.C...vX.Y.Z
```

---

## 6. Code-Reviewer 七维度质量门

每次 Review 时，code-reviewer 按以下维度逐条评估：

| 维度 | 检查内容 | 严重级别 |
|------|---------|---------|
| **正确性** | 逻辑/实现是否符合需求，边界条件是否处理 | 🔴 阻断 |
| **链接可达性** | 所有外链有效，无 404，本地锚点准确 | 🔴 阻断 |
| **CI 状态** | 所有工作流通过，无 Failed/Skippable 警告 | 🔴 阻断 |
| **安全性** | 无硬编码密钥，无意外暴露的个人信息 | 🔴 阻断 |
| **兼容性** | 移动端/暗色/浅色模式渲染正常，跨浏览器适配 | 🟡 建议 |
| **一致性** | 风格统一（空格、命名、语气），与已有内容协调 | 🟡 建议 |
| **性能** | 无不必要的大文件，图片已优化，加载路径合理 | 🟢 参考 |

**输出格式：**

```markdown
## Code Review  [任务/PR 名称]

**结论：** APPROVED / APPROVED_WITH_SUGGESTIONS / REQUEST_CHANGES

### 🔴 阻断问题（必须修复）
（无  填"无"）

### 🟡 建议（可选修复）
（无  填"无"）

### 🟢 优化参考
（无  填"无"）
```

---

## 7. CI 先行原则

> **来自 code-reviewer 的铁律（复盘会议 #003）：**
> *"CI 完全缺失时，所有质量依赖人的记忆。这不可接受。"*

### 7.1 CI 建立时机

- **任何新项目**：第一个 commit 可以是初始化，**第二个 commit 必须包含基础 CI**
- **新增外链**：link-check CI 必须已就绪
- **新增 Markdown 文档**：markdown-lint CI 必须已就绪

### 7.2 基础 CI 套件

| 工作流 | 文件 | 触发条件 | 作用 |
|--------|------|---------|------|
| link-check | `link-check.yml` | push / PR | 验证外部链接可达性（lychee） |
| markdown-lint | `markdown-lint.yml` | push / PR | 验证 Markdown 格式规范 |
| build | `build.yml` | push / PR | 验证项目可构建（视项目类型） |

### 7.3 CI 配置原则

- **忽略文件优先于忽略规则**：用 `.markdownlintignore`、`.lycheeignore` 控制范围，不在 workflow 里堆 `--exclude` 参数
- **接受已知的间歇性失败**：速率限制（429）用 `--accept 429` 处理，不算 failure
- **超时宽松**：link-check 每链接超时 10s + 3 次重试

---

## 8. 会议体系

### 8.1 会议类型

| 类型 | 触发时机 | 主持 | 必须参与 | 核心输出 |
|------|---------|------|---------|---------|
| **架构启动会** | 新项目立项时 | brain | 全员 | 技术选型决议 + V1.x 执行计划 |
| **Sprint 规划会** | 每个迭代周期前 | pm | brain  pm  相关 dev | 任务列表 + 优先级 + DoD 定义 |
| **里程碑复盘会** | 每个 Major/Minor 版本发布后 | brain | 全员 | 复盘纪要 + 方法论更新 + 下版规划 |
| **紧急热修复会** | 发现 🔴 阻断问题 | brain | brain  dev  code-reviewer | 问题诊断 + 修复方案 + 复盘行动项 |
| **快速站会** | 用户输入模糊目标时 | brain | brain  pm | 3 行目标确认摘要 |

### 8.2 会议纪要规范

**文件命名：** `docs/meetings/YYYY-MM-DD-<会议类型>.md`

| 会议类型 | 文件名示例 |
|---------|-----------|
| 架构启动会 | `2026-02-25-kickoff.md` |
| Sprint 规划会 | `2026-02-25-v2-planning.md` |
| 里程碑复盘会 | `2026-02-25-retrospective.md` |
| V3.0 规划会 | `2026-02-25-v3-planning.md` |

**纪要必含：**
- 参与成员 + 日期 + 状态
- 每位 Agent 发言摘要（完整记录，不删减）
- 核心决议（编号，有标准格式）
- 行动项（明确负责角色 + 优先级）

---

## 9. 新项目 Pre-flight 清单

迁移本团队框架到任何新项目时，brain 在首次会话中逐条确认：

### 9.1 项目定位（首次会话前明确）

- [ ] 项目类型（Web App / Library / CLI / Docs / Profile / Other）
- [ ] 主要受众（个人 / 团队 / 开源社区）
- [ ] 核心技术栈（语言 + 框架 + 构建工具 + 部署目标）
- [ ] 内容边界（哪些信息可以公开，哪些不能）

### 9.2 仓库基础配置（第一个 commit 包含）

- [ ] `.github/copilot-instructions.md`  按本项目定制个人信息区块
- [ ] `.github/agents/`  复制五个核心 Agent 文件
- [ ] `.editorconfig`  统一缩进、换行、编码
- [ ] `.gitattributes`  强制 LF 换行，防 CRLF 污染
- [ ] `CHANGELOG.md`  初始化，仅含 `[Unreleased]`
- [ ] `docs/`  创建目录骨架（design-decisions / component-guide / agent-workflow / meetings/）
- [ ] `CONTRIBUTING.md`  开源项目必备

### 9.3 CI 配置（第二个 commit 包含）

- [ ] `link-check.yml` （外链可达性）
- [ ] `markdown-lint.yml` （Markdown 格式）
- [ ] 项目构建/测试 CI（视技术栈）
- [ ] `.markdownlintignore` / `.lycheeignore`  排除不受控文件

### 9.4 团队配置

- [ ] 确认是否需要专项 Agent（如 `profile-designer`）
- [ ] researcher 完成首次技术选型预调研
- [ ] 召开架构启动会  输出 V1.x 执行计划

### 9.5 首次 commit 规范

```bash
git commit -m "chore(init): bootstrap project with OpenProfile team template

Team: brain  pm  dev  researcher  code-reviewer
Template: OpenProfile vX.Y.Z"
```

---

## 10. DoD 核查清单

> 每次迭代收尾，PM 逐条核查。未完成项不允许关闭迭代、打 Tag 或发布 Release。

### 内容完整性

- [ ] `CHANGELOG.md [Unreleased]` 已记录本轮所有 Added / Changed / Fixed
- [ ] `docs/design-decisions.md` 中新做出的设计决策已归档（含日期和理由）
- [ ] `docs/component-guide.md` 中新引入的组件已补充说明

### 配置同步

- [ ] `copilot-instructions.md`  「已决定的设计选择」已更新
- [ ] `copilot-instructions.md`  「当前迭代状态」已更新

### 质量门

- [ ] CI 所有检查通过（绿灯）
- [ ] code-reviewer 已输出 Review 报告（APPROVED / APPROVED_WITH_SUGGESTIONS）
- [ ] 所有外链可达（link-check 通过）
- [ ] 所有 🔴 阻断问题已关闭

### 归档

- [ ] 本次会话变更已提交（遵循第 4 节 commit 规范）
- [ ] 会议纪要已存档至 `docs/meetings/`（如有全体会议）
- [ ] 已评估版本号（PATCH / MINOR / MAJOR）是否需要发布

---

## 11. 核心资产清单

> **这是你能带走的所有东西。** 下列资产构成"OpenProfile 方法论包"，迁入任何新项目时直接带走。

| 资产 | 路径 | 项目独立性 | 迁移操作 |
|------|------|-----------|---------|
| 团队作战手册（本文件） | `docs/team-playbook.md` | ✅ 通用 | 直接复用，无需修改 |
| 五角色 Agent 定义 | `.github/agents/*.agent.md` | ✅ 通用 | 直接复用 |
| 全局项目指令 | `.github/copilot-instructions.md` | ⚠️ 需替换个人信息 | 保留结构，替换个人区块 |
| CI 模板 | `.github/workflows/link-check.yml` 等 | ⚠️ 需微调路径 | 复制后调整 paths |
| 工程配置 | `.editorconfig`  `.gitattributes`  `.markdownlintignore` | ✅ 通用 | 直接复用 |
| 工作流说明 | `docs/agent-workflow.md` | ✅ 通用 | 直接复用，可面向开源社区展示 |
| Commit 规范 | 本手册第 4 节 | ✅ 通用 | 团队记忆，无需单独文件 |
| Pre-flight 清单 | 本手册第 9 节 | ✅ 通用 | 团队记忆，无需单独文件 |


---

## 12. 新团队接手协议（Project Onboarding Protocol）

> **适用场景：** 团队被带入一个已有历史的项目，需要从零建立认知，然后开始高质量协作。
>
> 企业级最佳实践：**先读后谈**每位成员独立阅读全部上下文，形成初步判断，再召开对齐会议，绝不在信息不充分时贸然开会。

### 12.1 接手流程四阶段

```
阶段 1  静默阅读（Silent Reading）
        每位 Agent 独立阅读，不交叉影响，形成私有判断
        
        
阶段 2  认知对齐会议（Alignment Meeting）
        Brain 主持，全员发言，消除信息差
        
        
阶段 3  项目状态报告（Project Assessment）
        Brain 综合发言，输出官方状态报告给用户
        
        
阶段 4  团队适配决策（Team Adaptation）
        Brain 决定是否新增/改造 Agent  执行见 13
```

### 12.2 阶段 1：静默阅读

**Brain 宣布开始阅读，各角色按自己的视角独立读完以下文档：**

| Agent | 重点阅读文档 | 关注视角 |
|-------|------------|--------|
| `brain` | `copilot-instructions.md` + 所有会议纪要 + `CHANGELOG.md` | 战略连贯性、未完成承诺、方向对齐 |
| `pm` | `CHANGELOG.md` + 最新会议纪要 + `copilot-instructions.md` 迭代状态 | 任务完成率、版本节奏、遗留积压 |
| `dev` | `docs/design-decisions.md` + `docs/component-guide.md` + 主要源文件 | 技术债、可维护性、实现质量 |
| `researcher` | `docs/agent-workflow.md` + `docs/component-guide.md` | 技术选型合理性、依赖风险 |
| `code-reviewer` | CI 配置 + 近期 commit 记录 + `docs/design-decisions.md` | 质量门现状、已知风险点 |

**每位 Agent 阅读完成后输出私有笔记（不超过 10 行）：**

```
项目健康度：[1-5 分，附一句定性]
最大亮点：[一句话]
最大隐患：[一句话]
我能立刻贡献的价值：[一句话]
需要问 Brain 的问题：[最多 2 条，无则写"无"]
```

### 12.3 阶段 2：认知对齐会议

**Brain 主持，议程固定，不可跳过：**

```
1. Brain 宣读项目简介（来自 copilot-instructions.md 开头）
2. 逐角色汇报私有笔记中的「最大隐患」和「待问问题」
3. Brain 识别：哪些隐患是共识？哪些有分歧？
4. Brain 提出初步判断：项目当前阶段 + 主要挑战
5. 全员确认或补充
6. Brain 宣布：团队是否需要适配
```

**会议纪要模板：**

```markdown
# 接手对齐会议  [项目名称]

**日期：** YYYY-MM-DD
**参与者：** brain  pm  dev  researcher  code-reviewer
**读取项目版本：** vX.Y.Z

## 各角色初读判断摘要

| 角色 | 健康度 | 最大亮点 | 最大隐患 |
|------|--------|---------|---------|
| brain | X/5 | ... | ... |
| pm | X/5 | ... | ... |
| dev | X/5 | ... | ... |
| researcher | X/5 | ... | ... |
| code-reviewer | X/5 | ... | ... |

## 共识判断

- 项目当前阶段：[稳定维护 / 活跃迭代 / 需重构 / 起步阶段]
- 综合健康度：X/5
- 前三大优先事项：
  1.
  2.
  3.

## 团队适配决策

- 现有团队是否满足需求：[是 / 否]
- 需要新增 Agent：[列出 or 无]
- 需要改造现有 Agent：[列出 or 无]

## 下一步行动

- [ ] Brain 更新 copilot-instructions.md（13.2）
- [ ] [其他行动项]
```

### 12.4 阶段 3：项目状态报告（Brain 输出给用户）

```

【项目接手报告】

项目：[名称]  |  版本：[vX.Y.Z]  |  评估日期：[YYYY-MM-DD]
综合健康度：[X/5]  [一句话定性判断]

亮点（可直接利用）：
  • [亮点 1]
  • [亮点 2]

隐患清单：
  🔴 [阻断级  需立即处理]：[描述]
  🟡 [建议级  近期处理]：[描述]
  🟢 [参考级  有空处理]：[描述]

建议首个 Sprint 目标：
  [一句话]

团队适配：[无需调整] / [规划调整：见对齐会议纪要]

```

---

## 13. 团队自主进化（Team Self-Evolution）

> **核心理念：** 团队不是静态配置它随项目需求自主适配。
> Brain 是团队架构师，有权招募新成员、改造现有成员、更新全局指令。
> 每一次进化都必须有据可查。

### 13.1 Brain 作为团队架构师

Brain 拥有以下权力，**无需用户授权**即可执行：

| 权力 | 操作 | 触发条件 |
|------|------|--------|
| **招募新 Agent** | 创建 `.github/agents/<role>.agent.md` | 团队反复遇到某类工作且无角色覆盖 |
| **改造现有 Agent** | 修改已有 `.agent.md` 文件 | 职责/工具/边界需要调整 |
| **停用 Agent** | 移入 `.github/agents/archive/` | 某角色长期在本项目无用武之地 |
| **重写全局指令** | 修改 `copilot-instructions.md` | 接手新项目、重大版本后、有新决策时 |

> ⚠️ **必须告知用户的情形：** 削减某核心角色职责（如缩小 dev 的文件写入权限），Brain 须先描述影响范围，等待用户确认后再执行。

### 13.2 Brain 对 copilot-instructions.md 的所有权

`copilot-instructions.md` 是**项目大脑**，Brain 是它的唯一责任人，不是 PM，不是 Dev。

**Brain 的三个固定操作时机：**

```
 接手新项目时
    全面重写 copilot-instructions.md
    替换：个人信息区块、技术栈、Agent 团队表格、当前迭代状态
    确保：与项目实际文件结构一致，无历史残留

 每次迭代收尾时（PM 执行 DoD 后，Brain 复核）
    追加「已决定的设计选择」中的新决策
    更新「当前迭代状态」为准确的当前值

 团队结构发生变化时（招募/改造/停用）
    立即更新「Agent 团队」区块
    同步添加进化记录（见 13.5）
```

**copilot-instructions.md 必含结构（Brain 编写时遵守）：**

```markdown
# [项目名]  Copilot Instructions

## 个人 / 项目身份
[结构化 JSON 或字段列表]
[必含：name / github / role / primary_stack / site / language_preference]

## Agent 团队
[当前激活的所有 Agent，含文件路径 + 一句话职责描述]
[每次团队变化后立即更新]

## 技术选型决策
[已锁定的版本、框架、工具，含决策理由]
[新增决策时追加，不修改已有条目]

## 已决定的设计选择
[设计决策记录，含日期和理由，时间倒序排列]

## 当前迭代状态
[正在做什么 / 已完成什么 / 遗留什么]
[每次会话关闭时更新]

## 与 Agent 协作的期望
[哪些事 Agent 可以自主做，哪些事必须告知用户]

## 迭代完成检查项（DoD Checklist）
```

### 13.3 招募新 Agent 的规范

**何时招募：**
- 接手会议中识别出明确的能力缺口
- 团队在执行中连续 3 次以上遇到「没有角色负责这件事」的卡点
- 项目规模扩大导致现有角色负荷失衡

**新 Agent 文件最小结构：**

```markdown
---
description: >
  [一句话：这个 Agent 做什么，何时触发]
tools: [allowed-tool-1, allowed-tool-2]
---

# [角色名] Agent

## 角色定位
[负责什么 / 不负责什么]

## 触发时机
[PM 或 Brain 何时该调用这个 Agent]

## 标准输出格式
[输出给下游 Agent 的结构化格式]

## 与其他 Agent 的接口
[上游：接收谁的输入 | 下游：输出给谁]

## 绝不做的事
[明确边界，确保不越权]
```

**招募完成后，Brain 必须：**
1. 在 `copilot-instructions.md` 的「Agent 团队」区块新增条目
2. 在 `CHANGELOG.md [Unreleased]` 记录：`feat(agent): add <role> agent  [一句话理由]`
3. 在本轮会议纪要中说明招募背景

### 13.4 改造现有 Agent 的规范

**改造步骤：**

```
1. Brain 起草改造方案（对比格式）：
   原职责：[原文]
   新职责：[新文]
   改造理由：[一句话]

2. 判断是否涉及核心角色职责削减
    是：告知用户，等待确认
    否：Brain 直接执行

3. 修改 .agent.md 文件

4. 更新 copilot-instructions.md 对应条目

5. commit：refactor(agent): refine <role>  [改造内容一句话]
```

### 13.5 进化记录（Evolution Log）

每次团队结构变化，Brain 在 `copilot-instructions.md` 末尾维护进化记录：

```markdown
## 团队进化记录

| 日期 | 类型 | 角色 | 改动摘要 | 原因 |
|------|------|------|---------|------|
| YYYY-MM-DD | 新增 | `data-analyst` | 创建 data-analyst.agent.md | 项目引入数据分析需求 |
| YYYY-MM-DD | 改造 | `dev` | 扩展 Python 工具集权限 | 新项目后端为 Python |
| YYYY-MM-DD | 停用 | `profile-designer` | 移入 archive/ | 主站已稳定，不再需要专项设计角色 |
```
---

## 附录 A：升级路径（Escalation Path）

当 Agent 遇到超出自身权限或判断边界的情况时：

```
Dev 遇到架构决策  向上汇报给 Brain  Brain 评估  必要时请用户拍板
Researcher 发现重要风险  汇报给 PM  PM 纳入任务优先级
Code-Reviewer 发现 🔴 阻断  直接汇报 Brain  Brain 通知用户
PM 发现任务范围蔓延  汇报 Brain  Brain 与用户对齐
```

**升级原则：** 不确定时向上升级，不要自行打破角色边界以"节省时间"。

---

## 附录 B：反模式警示

> **以下行为是已知的协作反模式，明令禁止。**

| 反模式 | 后果 | 正确做法 |
|--------|------|---------|
| Brain 直接写代码 | 策略与执行耦合，质量下降 | Brain 输出任务，Dev 实现 |
| 没有 IP 直接改架构 | 范围不可控，回滚困难 | 先写 Implementation Plan |
| 跳过 Researcher 直接引入新依赖 | "执行时才发现的坑" | Pre-flight Research 触发 |
| CI 缺失时靠人工 QA | 人工质量不稳定，漏检率高 | CI 先行，第二个 commit |
| 设计决策不记录 | 下次会话重新争论已决定的事 | 实时更新 copilot-instructions.md |
| 会话结束不更新状态 | 下次开场"失忆"，重复工作 | 执行会话关闭协议 |

---

*本手册由 Brain + PM 共同维护，每次复盘会议后更新版本。*
*最后重大修订：2026-02-26 — 新增 §12 新团队接手协议 + §13 团队自主进化；Brain 确立为 copilot-instructions.md 唯一责任人。*
