# USER.md — Ray Huang 的个人偏好档案

> **文件职责：** 记录用户（Ray）个人的语言风格、排版口味、工作习惯等偏好。  
> **与 copilot-instructions.md 的区别：** copilot-instructions 是**项目规范**（团队共享）；USER.md 是**用户个人 taste**（跨项目复用）。  
> **维护责任：** Brain 负责在对话中识别用户新偏好并提议追加；用户最终确认。  
> **偏好路由机制：** 当用户在对话中表达「我希望以后...」类的偏好时，Brain 立即识别，判断是否值得记录，并更新本文件或通知对应 Agent 的 `knowledge/` patterns 文件。

---

## §1 语言与表达风格

```yaml
language:
  primary: zh-CN          # 所有原创内容默认中文
  technical_symbols: en   # 代码、路径、命令保持英文
  mixing_style: |
    中文叙述为主，技术术语（框架名、API 名等）保持英文原文，
    不翻译 "commit"、"Sprint"、"workflow" 等已通用的技术词汇

tone:
  preferred: |
    - 直接、清晰，不绕弯
    - 适度文学感，但不追求华丽
    - 会议纪要允许有个性（Agent 有各自声音）
    - 不过度使用感叹号

length:
  preference: 适中（不追求简短，有用的信息宁长勿短；但不堆砌冗余）
```

---

## §2 Commit 与版本规范偏好

```yaml
commit:
  format: "语义化前缀: 简洁描述（中文）"
  preferred_prefix: [feat, fix, docs, style, chore, refactor, test]
  emoji_suggestion: |
    可选，但 Release Notes 建议使用 emoji 作为视觉分类
    参考：🎉 新功能 | 🐛 修复 | 📝 文档 | 🎨 视觉 | ⚙️ 工程

release_notes:
  emoji_categories:       # 用户明确希望遵循的 Release Note 格式
    "## 🎉 新增": Added 类变更
    "## 🐛 修复": Fixed 类变更
    "## 🔨 改进": Changed 类变更
    "## 📝 文档": 文档更新
  language: zh-CN
  always_include: "Co-authored-by: GitHub Copilot <copilot@github.com>"

versioning:
  philosophy: 增量发布（Patch 随时，Minor 1-3 天，Major 架构级）
  cooldown: Minor 版本发布后等待至少一次外部信号再发下一个 Minor
```

---

## §3 工作流偏好

```yaml
agent_interaction:
  autonomy_preference: |
    高度授权 — Agent 团队对技术路径有优先决定权
    用户只保留最终否决权 + 核心方向确认
  
  confirmation_needed:
    - 破坏性变更前
    - 涉及隐私信息
    - 外部账号注册/操作
    - 大额成本（如付费 API）

  decision_style: |
    不喜欢被列出「选项 A / 选项 B / 选项 C」再等我选
    偏好：Agent 给出推荐方案 + 理由，我只需确认或否决

meeting_preference:
  initiation: Brain 主动感知并提议（不依赖用户触发）
  frequency: 不要过度；有实质议题才召开
  record: 所有会议都要有 docs/meetings/ 纪要

content_creation:
  blog_default_lang: zh-CN
  bilingual_trigger: 当内容有明显国际传播价值时，考虑双语版本
```

---

## §4 技术偏好

```yaml
stack_preferences:
  primary: [Python, TypeScript, Astro, Node.js]
  styling: 暗色主题优先，终端美学，信息密度高但不浮夸
  
ai_tooling:
  philosophy: AI-native（人机共生，不是 AI 辅助）
  mcp_interest: high  # 希望系统化引入 MCP skills
  multimodal: 图像/视频生成能力是未来工作流的重要部分

social_media:
  platforms_of_interest: [小红书, YouTube, 飞书, GitHub Discussions]
  workflow_vision: |
    在飞书提需求 → Agent 自动生成内容和配图 → 发预览链接 → 我批准 → 自动发布
  api_policy: "Ray 负责提供必要 API，Agent 负责调用逻辑"
```

---

## §5 偏好演进记录

> 每次 Brain 发现新偏好并追加时，在此记录日期和来源。

| 日期 | 偏好项 | 来源 |
|------|--------|------|
| 2026-03-01 | Release Notes 应使用 emoji 分类（🎉/🐛/🔨/📝） | 团队成长会用户输入 |
| 2026-03-01 | USER.md 结构参照 openclaw 风格 | 团队成长会用户输入 |
| 2026-03-01 | 社交媒体工作流愿景（飞书→内容→发布）| 团队成长会用户输入 |
| 2026-03-01 | 工作流授权风格（高度授权，不要列选项）| 历史对话归纳 |

---

*由 Brain 根据团队成长会（2026-03-01-03）及历史对话整理*  
*用户最终确认版本：v1.0*
