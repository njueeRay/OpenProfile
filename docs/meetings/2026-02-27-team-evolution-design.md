# 团队进化可视化设计会 — 2026-02-27

**召集人：** 🧠 Brain  
**参会者：** Brain · Profile Designer · Dev · Brand · PM  
**议题：** GitHub.io 团队成长时间线页面 — 结构设计与实现方案

---

## 用户反馈摘要

1. Phase K 的静态 SVG 知识图谱不够帅，视觉不达标
2. Playbook 每次迭代都是有价值的，需要专门记录和维护
3. 团队成员的迭代过程和成长需要**节点式可视化** — 像 Git Graph 一样
4. 所有内容放到 GitHub.io（Astro 站点），**暂不动 Profile README**
5. 内容结构需要团队内部讨论后决定

---

## 讨论与决策

### D-01: 页面路由与导航

**Profile Designer**: 建议新建 `/team` 顶级路由，与 home / blog 平级。Nav 增加 "team" 入口。  
**Brand**: "team" 这个词在 AI-native 语境下很合适，暗示这不是一个人的项目，而是一个人机共生团队。  
**决定**: ✅ `/team` 顶级路由 + Nav 新增 "team" 链接

### D-02: 核心视觉 — Git Graph 风格时间线

**Profile Designer**: 用 CSS 实现 Git Graph 风格垂直时间线。关键视觉要素：
- 左侧发光主干线（neon glow，终端美学）
- 节点按事件类型着色（五种颜色）
- 横向连接线 → 内容卡片
- 分支事件有视觉分组和缩进
- 版本标签像 Git tag 一样显示
- Intersection Observer 滚动渐显动画

**色彩系统：**
| 类型 | 颜色 | 用途 |
|------|------|------|
| Release | `#58a6ff` 蓝 | 项目版本发布 |
| Team | `#3fb950` 绿 | 团队结构变动 |
| Playbook | `#e3b341` 黄 | 方法论迭代 |
| Feature | `#f778ba` 粉 | 功能/Phase 交付 |
| Milestone | `#bc8cff` 紫 | 里程碑事件 |

**Dev**: 推荐 TypeScript 数据文件驱动渲染。新增事件只需追加数据，零模板改动。  
**决定**: ✅ CSS Git Graph + TypeScript 数据驱动 + 滚动动画

### D-03: 数据范围

**PM**: 从 v1.0.0 到当前，覆盖五类事件，共 15 个里程碑。  
**Brand**: 每个事件标注参与 Agent（emoji + 名称），强化 AI-native 团队可见性。  
**决定**: ✅ 15 个里程碑，全部标注参与 Agent

### D-04: 补充模块

**Brand**: 页面底部增加两个模块：
1. **Playbook 迭代档案** — 可折叠版本卡片（v2.1 / v2.0 / v1.0），记录每个版本的核心变化
2. **团队成员快速入口** — emoji 头像 + 角色名 + 链接到 `/blog/authors/[agent]`

**Profile Designer**: 团队成员用 grid 布局，hover 时发光，与主题色呼应。  
**决定**: ✅ Playbook 卡片 + 团队成员 Grid

### D-05: Profile README 处理

**Brain**: 用户明确要求暂不动 Profile。Phase K 的 SVG 和 `<details>` 块保留，后续单独评审。  
**决定**: ✅ 本次只动 GitHub.io

### D-06: 未来可扩展性

**Dev**: 数据文件设计为可追加结构，后续新版本/新 Agent/新 Phase 只需在数组末尾添加对象。  
**PM**: 每次迭代收尾时，Dev 同步更新 `team-evolution.ts`。写入 DoD checklist。  
**决定**: ✅ 数据驱动 + DoD 联动

---

## 实现分工

| 任务 | 负责人 | 产出物 |
|------|--------|--------|
| 数据文件 `src/data/team-evolution.ts` | Dev | 15 个事件 + 类型配置 |
| 时间线组件 `src/components/GitTimeline.astro` | Dev | CSS Git Graph + 滚动动画 |
| 团队页面 `src/pages/team.astro` | Dev | Hero + Timeline + Playbook + Members |
| Nav 更新 | Dev | 新增 "team" 链接 |
| 视觉审查 | Profile Designer | 确认色彩/间距/动画一致性 |
| 文案审查 | Brand | 确认叙事语气和品牌一致性 |
| CHANGELOG + 状态更新 | PM | 同步协调文档 |

---

## 会议结论

本次会议决定在 GitHub.io 构建 `/team` 页面，以 **Git Graph 风格垂直时间线** 为核心视觉，
数据驱动渲染 15 个团队里程碑事件，辅以 Playbook 迭代档案和团队成员入口。
这个页面本身就是 AI-native 团队协作能力的最佳证明。

**立即执行。**
