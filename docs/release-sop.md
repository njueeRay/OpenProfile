# Release SOP — 版本发布标准操作流程

> 本文档定义从代码冻结到 GitHub Release 的完整步骤。
> 适用于所有 Minor (x.Y.0) 及以上版本发布。Patch 版本可简化（跳过 Code Review）。

---

## 前置条件

- [ ] `CHANGELOG.md` 中 `[Unreleased]` 有明确的变更条目
- [ ] 所有 CI（markdown-lint + link-check）通过 ✅
- [ ] 无未合并的依赖 PR

---

## 发布流程

### 1. 代码冻结

```bash
# 确认当前分支是 main
git status
# 确认无未提交的变更
git diff --stat
```

### 2. Code Reviewer 审查（Minor+ 必须）

- 触发 Code Reviewer Agent 进行八维度审查
- 审查报告存档至 `docs/reviews/v{VERSION}-review.md`
- 必须达到 `APPROVED` 或 `APPROVED WITH NOTES`（无 BLOCKER）
- BLOCKER 项必须修复后重新审查

### 3. 版本号确定

遵循语义化版本（SemVer）：

| 类型 | 版本变化 | 触发条件 |
|------|---------|---------|
| Patch | x.y.Z | Bug 修复、文档勘误、CI 修复 |
| Minor | x.Y.0 | 新功能、新组件、Sprint 交付 |
| Major | X.0.0 | 架构级变更（如 Astro 5 迁移） |

### 4. 更新 CHANGELOG

```markdown
## [x.y.z] — YYYY-MM-DD

### Added
- ...

### Changed
- ...

### Fixed
- ...
```

- 将 `[Unreleased]` 内容移动到新版本标题下
- 底部添加版本比较链接：`[x.y.z]: https://github.com/njueeRay/OpenProfile/compare/vPREV...vNEW`

### 5. 更新项目状态

- `copilot-instructions.md`：更新版本号、迭代状态
- `docs/design-decisions.md`：记录新决策（如有）
- `docs/component-guide.md`：补充新组件（如有）

### 6. 提交 Release Commit

```bash
git add -A
git commit -m "chore: release v{VERSION}

- CHANGELOG 切版
- 项目状态同步
- Code Review: docs/reviews/v{VERSION}-review.md

Co-authored-by: GitHub Copilot <copilot@github.com>"
```

### 7. 创建 Git Tag

```bash
git tag -a v{VERSION} -m "v{VERSION}: {一句话描述}"
git push origin main --tags
```

### 8. 创建 GitHub Release

通过 GitHub API 或 Web UI：

- **Tag**: `v{VERSION}`
- **Title**: `v{VERSION}: {Sprint 主题}`
- **Body**: 从 CHANGELOG 提取，包含：
  - 版本亮点（2-3 句总结）
  - Added / Changed / Fixed 完整列表
  - 贡献者致谢
- **编码注意**: Body 内容使用 UTF-8 编码发送

### 9. 发布后验证

- [ ] Release 页面渲染正常（无乱码）
- [ ] Tag 指向正确的 commit
- [ ] CI badge 显示最新状态
- [ ] CHANGELOG 版本比较链接可用

---

## Patch 快速发布（简化流程）

1. 修复 bug → 提交
2. 更新 CHANGELOG
3. `git tag -a v{VERSION} -m "..."`
4. `git push origin main --tags`
5. 创建 GitHub Release（简短描述）

---

## 检查清单速查

```
□ CI green
□ Code Review passed (Minor+)
□ CHANGELOG updated
□ copilot-instructions.md synced
□ Release commit pushed
□ Git tag created & pushed
□ GitHub Release created
□ Post-release verification done
```
