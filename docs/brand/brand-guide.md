# Brand Guide — 开源项目品牌化细则

> 本文件承接 Playbook §16 的品牌化实施细节，供 dev + Brain 执行品牌化时参考。
> Playbook §16 保留品牌化**时机判断**和**执行角色分工**，具体规格见本文件。

---

## Logo 设计规范

**规格：**

- 尺寸：宽版 `480×160px`（README 用）+ 方形 `160×160px`（头像/图标用）
- 格式：SVG（可缩放，体积小）
- 存储：`assets/logo.svg`，`assets/logo-square.svg`

**视觉语言（由 Brain 根据项目定位决定）：**

- 背景：深色（如 `#0d1117`）或浅色，视项目调性而定
- 强调色：项目品牌色（在 copilot-instructions.md 中锁定）
- 字体风格：与项目气质匹配（如工程项目用等宽字体，设计项目用无衬线字体）
- 视觉元素：与项目领域相关的图标或风格

**光标动画（可选，增加活力）：**

```svg
<rect ...>
  <animate attributeName="opacity" values="0.9;0.1;0.9"
           dur="1.2s" repeatCount="indefinite"/>
</rect>
```

---

## 话题标签策略

**选择原则：**

- 技术标签（具体）：项目使用的框架、语言、工具
- 场景标签（中等宽度）：项目解决的问题域
- 理念标签（宽泛）：`ai-native`, `open-source`, `workflow-template`
- **避免过泛标签**：`web`, `tool`, `project`（竞争太大，无区分度）

**设置方式：** 使用 Playbook §15.3 中的 API 操作，不要在 GitHub 网页上手动拖拽。

---

## Badge 套件规范

**标准 Badge 顺序（README 顶部 `div align="center"` 内）：**

```markdown
[![Stars](https://img.shields.io/github/stars/{owner}/{repo}?style=flat-square&color=gold&logo=github)]()
[![Forks](https://img.shields.io/github/forks/{owner}/{repo}?style=flat-square&color=58a6ff&logo=github)]()
[![Latest Release](https://img.shields.io/github/v/release/{owner}/{repo}?style=flat-square&color=3fb950)]()
[![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)]()
[![CI](https://img.shields.io/github/actions/workflow/status/{owner}/{repo}/{workflow}.yml?style=flat-square&label=CI)]()
```

**可选 Badge（按需添加）：**

```markdown
[![Built with Copilot](https://img.shields.io/badge/Built%20with-GitHub%20Copilot-0078d4?style=flat-square&logo=github)]()
```

**一句话描述位置：** Logo 图片下方，badges 上方，**加粗**显示。

---

*本文件由 brand + dev 共同维护。品牌化执行完成后在 CHANGELOG 记录变更。*
