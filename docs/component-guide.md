# 组件使用指南

> 本文件记录 README.md 中使用的所有动态组件，包括接入方法、可用参数和最佳配置。
> 适合想复用这些组件构建自己主页的开发者参考。

---

## 组件总览

| 组件 | 用途 | 是否需要账号 | 可靠性 |
|------|------|------------|--------|
| [capsule-render](#capsule-render) | Header/Footer 渐变图 | 否 | ⭐⭐⭐⭐⭐ |
| [readme-typing-svg](#readme-typing-svg) | 打字动画 | 否 | ⭐⭐⭐⭐⭐ |
| [github-readme-stats](#github-readme-stats) | GitHub 统计卡片 + Pin 卡片 | 否 | ⭐⭐⭐⭐ |
| [github-readme-streak-stats](#github-readme-streak-stats) | 连续贡献统计 | 否 | ⭐⭐⭐⭐ |
| [skill-icons](#skill-icons) | 技术栈图标 | 否 | ⭐⭐⭐⭐⭐ |
| [waka-readme-stats](#waka-readme-stats) | 编程时间统计 | ✅ 需要 WakaTime | ⭐⭐⭐⭐ |
| [github-readme-activity-graph](#github-readme-activity-graph) | 贡献活动曲线图 | 否 | ⭐⭐⭐⭐ |
| [snk (Contribution Snake)](#contribution-snake) | 贡献蛇动画 | 否 | ⭐⭐⭐⭐ |

---

## capsule-render

**仓库：** https://github.com/kyechan99/capsule-render

### 基础用法

```markdown
![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=200&section=header&text=njueeray&fontSize=60)
```

### 关键参数

| 参数 | 说明 | 常用值 |
|------|------|--------|
| `type` | 形状 | `waving`, `rect`, `egg`, `shark`, `cylinder` |
| `color` | 颜色 | `gradient`, `timeGradient`, `#hexcode`, `auto` |
| `height` | 高度（px） | `150` - `300` |
| `text` | 标题文字 | 你的名字或口号 |
| `fontSize` | 字号 | `40` - `80` |
| `animation` | 动画 | `fadeIn`, `twinkling`, `blinking` |

---

## readme-typing-svg

**仓库：** https://github.com/DenverCoder1/readme-typing-svg

### 基础用法

```markdown
[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&lines=LLM+Engineer;Full-Stack+Developer;Open+Source+Builder)](https://git.io/typing-svg)
```

### 关键参数

| 参数 | 说明 | 常用值 |
|------|------|--------|
| `font` | 字体 | `Fira+Code`, `JetBrains+Mono` |
| `lines` | 循环显示的文字（分号分隔） | `Line1;Line2;Line3` |
| `color` | 字色 | `#hex` 或 `gradient` |
| `speed` | 打字速度 | `50`（默认），越小越快 |
| `pause` | 每行暂停时间（毫秒） | `1000` |

---

## github-readme-stats

**仓库：** https://github.com/anuraghazra/github-readme-stats

### 基础用法

```markdown
![Stats](https://github-readme-stats.vercel.app/api?username=njueeray&show_icons=true&theme=tokyonight)
```

### 推荐暗色主题

| 主题名 | 风格描述 |
|--------|---------|
| `tokyonight` | 蓝紫渐变，最流行 |
| `radical` | 粉红+紫，赛博朋克 |
| `merko` | 绿色终端风 |
| `gruvbox` | 暖棕复古风 |
| `nord` | 冷色系极简 |
| `onedark` | VS Code 经典暗色 |

---

## github-readme-streak-stats

**仓库：** https://github.com/DenverCoder1/github-readme-streak-stats

```markdown
![Streak](https://streak-stats.demolab.com?user=njueeray&theme=tokyonight&hide_border=true)
```

---

## skill-icons

**仓库：** https://github.com/tandpfun/skill-icons

```markdown
![Skills](https://skillicons.dev/icons?i=python,cpp,ts,js,react,docker,git&theme=dark)
```

完整图标列表：https://skillicons.dev

---

## waka-readme-stats

**仓库：** https://github.com/anmol098/waka-readme-stats

> ⚠️ 需要先注册 [WakaTime](https://wakatime.com) 账号并在 VS Code 安装插件

### 接入步骤
1. 注册 WakaTime：https://wakatime.com
2. 安装 WakaTime VS Code 插件
3. 在 GitHub Settings → Secrets 中添加 `WAKATIME_API_KEY` + `GH_TOKEN`（PAT，需 `repo` + `user` scope）
4. 在 README.md 中添加占位注释（Actions 自动填充）

```markdown
<!--START_SECTION:waka-->
<!--END_SECTION:waka-->
```

### 本项目使用的 Action 配置

```yaml
# .github/workflows/waka-readme.yml
- uses: anmol098/waka-readme-stats@master
  with:
    WAKATIME_API_KEY: ${{ secrets.WAKATIME_API_KEY }}
    GH_TOKEN: ${{ secrets.GH_TOKEN }}
    SHOW_OS: "True"
    SHOW_PROJECTS: "True"
    SHOW_EDITORS: "True"
    LANG_COUNT: "6"
```

> ⚠️ WakaTime 免费账号数据保留 14 天。需持续使用编辑器才有数据填充。

---

## github-readme-activity-graph

**仓库：** https://github.com/Ashutosh00710/github-readme-activity-graph

### 基础用法

```markdown
![Activity Graph](https://github-readme-activity-graph.vercel.app/graph?username=njueeRay&theme=github-compact&hide_border=true&area=true)
```

### 关键参数

| 参数 | 说明 | 本项目使用值 |
|------|------|------------|
| `theme` | 配色主题 | `github-compact`（深色极简） |
| `hide_border` | 隐藏边框 | `true` |
| `area` | 面积填充 | `true`（视觉更厚重） |
| `custom_title` | 自定义标题 | `Contribution Activity` |

### 推荐暗色主题

`github-compact` · `react-dark` · `xcode` · `tokyo-night`

---

## Contribution Snake

**仓库：** https://github.com/Platane/snk

通过 GitHub Actions 自动生成贡献蛇动画 SVG，推送到 `output` 分支。

### 本项目使用的 Action 配置

```yaml
# .github/workflows/snake.yml
- uses: Platane/snk/svg-only@v3
  with:
    github_user_name: njueeRay
    outputs: |
      dist/github-contribution-grid-snake.svg
      dist/github-contribution-grid-snake-dark.svg?palette=github-dark
```

### README 中引用

```markdown
![snake](https://raw.githubusercontent.com/njueeRay/njueeRay/output/github-contribution-grid-snake-dark.svg)
```

### 前置要求

- Actions → General → Workflow permissions → **Read and write permissions**
- 首次需手动触发 workflow（Actions 页面 → Run workflow）
