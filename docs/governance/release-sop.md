# Release SOP 鈥?鐗堟湰鍙戝竷鏍囧噯鎿嶄綔娴佺▼

> 鏈枃妗ｅ畾涔変粠浠ｇ爜鍐荤粨鍒?GitHub Release 鐨勫畬鏁存楠ゃ€?> 閫傜敤浜庢墍鏈?Minor (x.Y.0) 鍙婁互涓婄増鏈彂甯冦€侾atch 鐗堟湰鍙畝鍖栵紙璺宠繃 Code Review锛夈€?
---

## 鍓嶇疆鏉′欢

- [ ] `CHANGELOG.md` 涓?`[Unreleased]` 鏈夋槑纭殑鍙樻洿鏉＄洰
- [ ] 鎵€鏈?CI锛坢arkdown-lint + link-check锛夐€氳繃 鉁?- [ ] 鏃犳湭鍚堝苟鐨勪緷璧?PR

---

## 鍙戝竷娴佺▼

### 1. 浠ｇ爜鍐荤粨

```bash
# 纭褰撳墠鍒嗘敮鏄?main
git status
# 纭鏃犳湭鎻愪氦鐨勫彉鏇?git diff --stat
```

### 2. Code Reviewer 瀹℃煡锛圡inor+ 蹇呴』锛?
- 瑙﹀彂 Code Reviewer Agent 杩涜鍏淮搴﹀鏌?- 瀹℃煡鎶ュ憡瀛樻。鑷?`docs/reviews/v{VERSION}-review.md`
- 蹇呴』杈惧埌 `APPROVED` 鎴?`APPROVED WITH NOTES`锛堟棤 BLOCKER锛?- BLOCKER 椤瑰繀椤讳慨澶嶅悗閲嶆柊瀹℃煡

### 3. 鐗堟湰鍙风‘瀹?
閬靛惊璇箟鍖栫増鏈紙SemVer锛夛細

| 绫诲瀷 | 鐗堟湰鍙樺寲 | 瑙﹀彂鏉′欢 |
|------|---------|---------|
| Patch | x.y.Z | Bug 淇銆佹枃妗ｅ嫎璇€丆I 淇 |
| Minor | x.Y.0 | 鏂板姛鑳姐€佹柊缁勪欢銆丼print 浜や粯 |
| Major | X.0.0 | 鏋舵瀯绾у彉鏇达紙濡?Astro 5 杩佺Щ锛?|

### 4. 鏇存柊 CHANGELOG

```markdown
## [x.y.z] 鈥?YYYY-MM-DD

### Added
- ...

### Changed
- ...

### Fixed
- ...
```

- 灏?`[Unreleased]` 鍐呭绉诲姩鍒版柊鐗堟湰鏍囬涓?- 搴曢儴娣诲姞鐗堟湰姣旇緝閾炬帴锛歚[x.y.z]: https://github.com/njueeRay/OpenProfile/compare/vPREV...vNEW`

### 5. 鏇存柊椤圭洰鐘舵€?
- `copilot-instructions.md`锛氭洿鏂扮増鏈彿銆佽凯浠ｇ姸鎬?- `docs/governance/design-decisions.md`锛氳褰曟柊鍐崇瓥锛堝鏈夛級
- `docs/guides/component-guide.md`锛氳ˉ鍏呮柊缁勪欢锛堝鏈夛級

### 6. 鎻愪氦 Release Commit

```bash
git add -A
git commit -m "chore: release v{VERSION}

- CHANGELOG 鍒囩増
- 椤圭洰鐘舵€佸悓姝?- Code Review: docs/reviews/v{VERSION}-review.md

Co-authored-by: GitHub Copilot <copilot@github.com>"
```

### 7. 鍒涘缓 Git Tag

```bash
git tag -a v{VERSION} -m "v{VERSION}: {涓€鍙ヨ瘽鎻忚堪}"
git push origin main --tags
```

### 8. 鍒涘缓 GitHub Release

閫氳繃 GitHub API 鎴?Web UI锛?
- **Tag**: `v{VERSION}`
- **Title**: `v{VERSION}: {Sprint 涓婚}`
- **Body**: 浠?CHANGELOG 鎻愬彇锛屽寘鍚細
  - 鐗堟湰浜偣锛?-3 鍙ユ€荤粨锛?  - Added / Changed / Fixed 瀹屾暣鍒楄〃
  - 璐＄尞鑰呰嚧璋?- **缂栫爜娉ㄦ剰**: Body 鍐呭浣跨敤 UTF-8 缂栫爜鍙戦€?
### 9. 鍙戝竷鍚庨獙璇?
- [ ] Release 椤甸潰娓叉煋姝ｅ父锛堟棤涔辩爜锛?- [ ] Tag 鎸囧悜姝ｇ‘鐨?commit
- [ ] CI badge 鏄剧ず鏈€鏂扮姸鎬?- [ ] CHANGELOG 鐗堟湰姣旇緝閾炬帴鍙敤

---

## Patch 蹇€熷彂甯冿紙绠€鍖栨祦绋嬶級

1. 淇 bug 鈫?鎻愪氦
2. 鏇存柊 CHANGELOG
3. `git tag -a v{VERSION} -m "..."`
4. `git push origin main --tags`
5. 鍒涘缓 GitHub Release锛堢畝鐭弿杩帮級

---

## 妫€鏌ユ竻鍗曢€熸煡

```
鈻?CI green
鈻?Code Review passed (Minor+)
鈻?CHANGELOG updated
鈻?copilot-instructions.md synced
鈻?Release commit pushed
鈻?Git tag created & pushed
鈻?GitHub Release created
鈻?Post-release verification done
```

