# V5 路线图全体规划会议纪要

**日期：** 2026-02-28
**参与者：** brain · pm · dev · researcher · code-reviewer · profile-designer · brand
**会议类型：** 路线图规划会
**核心诉求：** 拒绝大版本跃进，每个小版本聚焦一个可交付主题

---

## 零、会议背景 — Ray 的直接反馈

> "v1 到 v4 之间的粒度太粗了。我希望在 v4 和 v5 之间有 v4.1、v4.2、v4.3 这样的小版本，每个版本都有明确的主题，做完一件事就发布一次。"

这条反馈直接触发了本次规划会。PM 在会议开始前已梳理了 `[Unreleased]` 积压的 10 类变更，建议切成 4-5 个 Minor 版本分批发布。

---

## 一、PM 状态汇报

| 层级 | 当前版本 | 待发布内容 |
|------|---------|-----------|
| L1 项目 | `v4.0.0` | `[Unreleased]` 积压 10 类变更 |
| L2 Playbook | `v2.1`（含 Brand 新增） | 无积压 |
| L3 Agent | 各 `v1.0` | 无积压 |

`[Unreleased]` 主要内容分类：
1. CI 修复（link-check 排除规则）
2. Brand Agent 加入（brand.agent.md + Discussions 计划）
3. 工程质量（CSS 拆分 + 组件化）
4. 响应式优化（移动端 hamburger 菜单）
5. a11y 基础（skip-to-content + landmark）
6. 博客卡片微交互
7. 首页 Hero 优化
8. 团队动态墙
9. SEO 基础（JSON-LD + Lighthouse CI）
10. Astro 5 可行性评估

---

## 二、小量版本哲学确认

**规则（三级粒度）：**

| 级别 | 触发条件 | Max 工作量 | 示例 |
|------|---------|-----------|------|
| Patch | Bug 修复 / 内容更新 | 随时 | v4.0.1 |
| Minor | 一个有主题的 Sprint | 1-3 天 | v4.2.0 |
| Major | 架构级变更 | 按需 | v5.0.0 |

**发版 SOP 节奏：**
1. Sprint 完成 → Code Reviewer 出审查报告
2. 报告 ≥ 35/40 → PM 更新 CHANGELOG + 创建 GitHub Tag
3. Brain 在 Discussions 发版公告（Major/Minor）
4. `[Unreleased]` 积压上限：5 天

**Code Reviewer 质量门禁：**
- Minor 及以上版本必须有审查报告（`docs/reviews/vX.Y.Z-review.md`）
- 评分标准：七维度各 0-10 分（满分 70 分归一化为 40 分制）

**决策 #1 — 版本哲学：小量增量发布，[Unreleased] 积压不超过 5 天**

---

## 三、自由发言轮

### Dev
- CSS 需要统一（当前 BaseLayout 有 120 行内联样式，应提取为 global.css）
- blog/index.astro 346 行，Filter Tab 和 BlogCard 应独立组件化
- 移动端导航：≤768px 时缩字号不够，需要 hamburger 菜单
- 构建缓存：CI 每次全量构建，`.astro/` Vite 增量产物应缓存
- a11y：缺少 skip-to-content、main landmark、focus-visible 样式

### Researcher
- Astro 5 已发布，ContentLayer API 是破坏性变更，需要专项迁移
- ViewTransitions → ClientRouter 接口变更
- Lighthouse CI 可以通过 treosh/lighthouse-ci-action 集成，staticDistDir 模式最简单
- hreflang 标签对双语文章的 SEO 价值很高
- JSON-LD Person 结构化数据是 SEO 基础

### Code Reviewer
- TypeScript strict 模式未启用，存在隐式 any 风险
- 相关文章推荐缺少测试
- 组件间直接 import 而无接口定义
- `docs/reviews/` 目录应该被用起来，不应该是空的

### Profile Designer
- 博客卡片需要微交互（倾斜 + 呼吸动画）
- 首页 Hero 打字机动画过于单调，应改为逐行揭示
- 团队动态墙应像 git log 一样展示最新博文活动流
- 暗色主题准入门槛很高，但我们要关注 2027 年的趋势

### Brand
- GitHub Discussions 是最低摩擦的 Build in Public 起点
- README 应该有一个"着陆页"风格的开头，吸引外部贡献者
- 需要 Good First Issue 标签，让社区知道怎么参与
- 每个 Minor/Major 发布后，Brand 在 Discussions 发版公告

### PM
- Sprint 仪式需要标准化：Sprint 开始时规划会 + 结束时 Code Reviewer 审查
- DoD checklist 应该自动化验证（不只是列清单）
- SOP 文档化：发版 SOP 应该是可执行的步骤清单

---

## 四、v4.1.0 回顾性切版提案

**背景：** 当前 `[Unreleased]` 已积压大量团队品牌化相关变更（Brand Agent 加入、Discussions 计划、CI 修复等），应该先切一个版本"了结"，再开始下一个 Sprint。

**PM 提案：** 将当前 `[Unreleased]` 全部切为 `v4.1.0`，主题为"团队品牌化 + 内容架构"。

**Code Reviewer 要求：** v4.1.0 发布前必须提交 `docs/reviews/v4.1.0-review.md`。

**决策 #2 — v4.1.0 回顾性切版，主题：团队品牌化 + 内容架构**

---

## 五、V5 路线图 — 六个 Sprint

### v4.2.0 — 工程质量 Sprint

| 编号 | 任务 | 说明 |
|------|------|------|
| Q-1 | `src/styles/global.css` | 从 BaseLayout 提取全局 CSS 变量 |
| Q-2 | `BlogCard.astro` + `FilterTabs.astro` | blog/index.astro 组件拆分 |
| Q-3 | hamburger 菜单 | ≤768px 移动端折叠导航 |
| Q-4 | `content-types.ts` | typeConfig 共享配置 |
| Q-5 | TypeScript strict | 0 errors 验证 |
| Q-6 | CI 修复 | markdownlint + link-check 持续失败问题 |

### v4.3.0 — 社区首发 Sprint

| 编号 | 任务 | 说明 |
|------|------|------|
| C-1 | GitHub Discussions 架构 | Announcements / Team Insights / AI-native Journey |
| C-2 | Brand 首发 Discussion | 项目公开亮相 |
| C-3 | README 着陆页重写 | 面向外部贡献者的 OpenProfile 介绍 |
| C-4 | Good First Issue 标签 | 3-5 个 Good First Issue |
| C-5 | CONTRIBUTING.md 更新 | Fork / PR 流程标准化 |
| C-6 | 发版 SOP 文档 | docs/governance/release-sop.md |

### v4.4.0 — 体验精修 Sprint

| 编号 | 任务 | 说明 |
|------|------|------|
| U-1 | 博客卡片微交互 | 3D 透视倾斜 + breathe 动画 |
| U-2 | 首页 Hero 打字机 | term-reveal 逐行揭示 |
| U-3 | a11y 基础 | skip-to-content + main landmark + focus-visible |
| U-4 | 团队动态墙 | git-log 风格活动流 |
| U-5 | FeaturedCard | 博客列表首条宽卡 |

### v4.5.0 — SEO & 性能 Sprint

| 编号 | 任务 | 说明 |
|------|------|------|
| S-1 | JSON-LD | Person + WebSite + BlogPosting 结构化数据 |
| S-2 | hreflang | 双语文章 zh/en/x-default |
| S-3 | Lighthouse CI | treosh/lighthouse-ci-action a11y/seo ≥ 0.9 |
| S-4 | axe-core CI | 首页 + 博客 + team 三页 a11y 扫描 |
| S-5 | 构建缓存 | `.astro/` Vite 增量产物缓存 |
| S-6 | Astro 5 调研 | Researcher 出可行性报告 |

### v5.0.0 — Astro 5 迁移（门槛触发）

仅当 Researcher 确认可行且用户批准后触发。预计变更：
- `astro@5.x` 升级
- `ViewTransitions` → `ClientRouter`
- Content Layer API 迁移
- `type: 'content'` → `loader: glob()` 集合配置

### 后续（v5.1+ 规划中）

读者体验、对外传播、E2E 测试、视觉专项等主题待 v5.0.0 后规划。

---

## 六、L2/L3 版本节点对齐

| 项目版本 | 联动 Playbook 版本 | 备注 |
|---------|------------------|------|
| v4.2.0 | Playbook v2.1（当前） | 无升级 |
| v4.3.0 | Playbook v2.2 | PM 需规划升级内容 |
| v5.0.0 | Playbook v3.0（预案） | 架构升级时同步 |

**决策 #3 — Playbook v2.2 随 v4.3.0 发布，PM 负责组织升级规划会**

---

## 七、执行优先级

**P0（本会话完成）：**
1. v4.1.0 回顾性切版 + Code Reviewer 审查
2. Discussions 分类架构创建（用户操作）

**P1（v4.2.0 Sprint，3 天内）：**
3. global.css 提取
4. 组件拆分（BlogCard + FilterTabs）
5. hamburger 菜单
6. TypeScript strict

**P2（v4.3.0 Sprint）：**
7. GitHub Discussions 首发
8. README 着陆页

---

## 八、用户操作清单

- [ ] 在 GitHub 仓库 Settings 开启 Discussions 功能
- [ ] 创建 Discussions 分类：Announcements / Team Insights / AI-native Journey
- [ ] 安装 Giscus App 到 njueeray.github.io 仓库
- [ ] 确认 WakaTime 集成 Secrets 已配置

---

## 九、版本规划状态表

| 版本 | 主题 | 状态 |
|------|------|------|
| v4.1.0 | 团队品牌化 + 内容架构 | ⬜ 待切版 |
| v4.2.0 | 工程质量 Sprint | ⬜ 待规划 |
| v4.3.0 | 社区首发 Sprint | ⬜ 待规划 |
| v4.4.0 | 体验精修 Sprint | ⬜ 待规划 |
| v4.5.0 | SEO & 性能 Sprint | ⬜ 待规划 |
| v5.0.0 | Astro 5 迁移（门槛触发） | ⬜ 门控中 |

---

*会议纪要由 Brain 整理，PM 校对，2026-02-28*
