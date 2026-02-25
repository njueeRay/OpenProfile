# 贡献指南

> 感谢你对本项目感兴趣！本项目是一个「用 AI Agent 协作构建 GitHub Profile」的开源示范工程。

---

## 贡献内容类型

| 类型 | 说明 |
|------|------|
| 🐛 Bug 修复 | 组件 URL 失效、Markdown 渲染错误等 |
| ✨ 新组件 | 推荐一个新的 GitHub Profile 动态组件 |
| 📖 文档改进 | 补充 component-guide.md、纠正说明错误 |
| 🤖 Agent 优化 | 改进 `.github/agents/` 中的 Agent 指令 |
| 🎨 视觉改进 | 提议更好的颜色、布局或动效方案 |

---

## 快速开始

### 1. Fork 仓库

```bash
# Fork 后克隆到本地
git clone https://github.com/YOUR_USERNAME/njueeray.git
cd njueeray
```

### 2. 创建分支

```bash
# 分支命名规范：type/short-description
git checkout -b feat/add-spotify-widget
git checkout -b fix/broken-stats-url
git checkout -b docs/improve-component-guide
```

### 3. 提交修改

遵循**语义化 commit message**：

```
feat: 新功能
fix: 缺陷修复
docs: 文档更新
style: 样式/格式调整（不影响逻辑）
chore: 构建/工具链相关
```

示例：
```bash
git commit -m "feat: 添加 Spotify 正在播放组件"
git commit -m "fix: 修复暗色主题下 stats 卡片边框问题"
git commit -m "docs: 完善 capsule-render 参数说明"
```

### 4. 提交 PR

- 填写 PR 模板中的所有字段
- 确保 PR 描述包含「Before / After」对比（如涉及视觉变更）
- 标注相关 Issue（如 `Closes #123`）

---

## 代码风格

### Markdown 规范
- 使用 2 空格缩进（嵌套列表）
- 图片必须包含 `alt` 描述文字
- 链接使用绝对 URL，不使用相对路径
- 每个图片组件注释说明来源和参数

### 组件 URL 规范
```markdown
<!-- ✅ 正确：包含注释和 alt -->
<!-- github-readme-stats: https://github.com/anuraghazra/github-readme-stats -->
![Ray's GitHub stats](https://github-readme-stats.vercel.app/api?username=njueeray&theme=tokyonight&show_icons=true)

<!-- ❌ 错误：无注释、无 alt -->
![](https://github-readme-stats.vercel.app/api?username=njueeray)
```

---

## 添加新组件

如果你想贡献一个新的 GitHub Profile 组件：

1. 在 `docs/component-guide.md` 中添加该组件的**完整说明**
2. 在 README.md 中的对应区域添加**带注释的代码**
3. 在 `CHANGELOG.md` 中记录变更
4. PR 描述中附上**实际渲染效果截图**

---

## 问题反馈

- 使用 [Issue 模板](.github/ISSUE_TEMPLATE/) 提交问题
- 在提交前先搜索是否有相同问题
- 尽量提供复现步骤和截图

---

## 许可证

提交 PR 即表示你同意你的贡献在 [MIT 许可证](LICENSE) 下发布。
