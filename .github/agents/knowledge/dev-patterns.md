# Dev 路 L2 楠岃瘉妯″紡

> 浣嶇疆锛歚.github/agents/knowledge/dev-patterns.md`
> 灞傜骇锛歀2锛堥獙璇佹湁鏁堬紝鍙鐢級
> 缁存姢浜猴細Dev

---

### P-DV-001锛欸it Worktree 鍦?Windows 涓嬬殑鎿嶄綔缁嗚妭

**鍦烘櫙锛?* Windows + VS Code 鐜涓嬩娇鐢?git worktree
**妯″紡锛?*
```powershell
# 鍒涘缓锛堜粠 main 鍒嗘敮鏂板缓锛?git worktree add -b feature/<name> ..\<dir> main

# 娓呯悊锛堟爣鍑嗘祦绋嬶級
git worktree remove ..\<dir>      # 鐩綍鏈鍗犵敤鏃?git worktree prune                 # 鐩綍琚?VS Code 閿佸畾鏃讹紝鍏?prune 娉ㄥ唽琛?# 鐒跺悗鎵嬪姩鍒犳枃浠跺す锛屾垨鍏抽棴 VS Code 绐楀彛鍚?remove

# 杩滅鍒嗘敮娓呯悊
git push origin --delete feature/<name>
```
**楠岃瘉锛?* OpenProfile feature/readme-update锛?026-02-27锛?**娉ㄦ剰锛?* `git worktree remove --force` 鍦?Windows 浠嶄細鎶?Permission Denied锛宍prune` 鏄洿鍙潬鐨勬浛浠?**鏉ユ簮锛?* 2026-02-27 worktree 棣栨璺戦€?
---

### P-DV-002锛欳o-authorship 涓変粨搴撻厤缃柟寮?
**鍦烘櫙锛?* 闇€瑕佷负澶氫釜浠撳簱缁熶竴閰嶇疆 co-author 鎻愪氦妯℃澘
**妯″紡锛?*
```powershell
# 涓烘瘡涓粨搴撻厤缃紙涓嶇敤 --global锛岄伩鍏嶅奖鍝嶅叾浠栭」鐩級
git -C "<repo-path>" config commit.template ".gitmessage"
# .gitmessage 鍐呭锛?# Co-authored-by: GitHub Copilot <copilot@github.com>
```
**楠岃瘉锛?* OpenProfile + njueeRay-profile + njueeray.github.io锛?026-02-26锛?**娉ㄦ剰锛?* `git commit -m` 涓嶄細璇诲彇妯℃澘锛岄渶鎵嬪姩杩藉姞锛涘彧鏈?`git commit`锛堟棤 `-m`锛変細寮瑰嚭缂栬緫鍣?**鏉ユ簮锛?* 2026-02-26 worktree 璁剧疆浼氳瘽

---

### P-DV-003锛欸itHub Release body 鐨?UTF-8 缂栫爜闄烽槺

**鍦烘櫙锛?* 浣跨敤 PowerShell + GitHub API 鍒涘缓 Release锛宐ody 鍚腑鏂?**妯″紡锛?*
```powershell
# 蹇呴』鐢?[System.Text.Encoding]::UTF8.GetBytes() 杞崲
$bodyBytes = [System.Text.Encoding]::UTF8.GetBytes($body)
# 鐒跺悗閫氳繃 Invoke-WebRequest 鐨?-Body 鍙傛暟鍙戦€?# 涓嶈兘鐩存帴浼犲瓧绗︿覆锛孭owerShell 榛樿缂栫爜浼氭崯鍧忎腑鏂?```
**楠岃瘉锛?* v4.0.0 Release 鍒涘缓锛?026-02-26锛孶TF-8 PATCH 淇锛?**娉ㄦ剰锛?* 鍦ㄩ獙璇?Release 鍓嶅厛 `iwr <url> | select Content` 妫€鏌?body 鏄惁姝ｇ‘娓叉煋
**鏉ユ簮锛?* 2026-02-26 v4.0.0 Release encoding 淇

---

### P-DV-004锛欰stro 鍗氬 frontmatter 鎵╁睍鐨勬纭柟寮?
**鍦烘櫙锛?* 闇€瑕佺粰 Astro content collection 澧炲姞鏂板瓧娈碉紙濡?`author`锛?**妯″紡锛?*
1. 鍏堜慨鏀?`src/content/config.ts`锛屽湪 schema 涓坊鍔犲瓧娈碉紙鍙€?`z.string().optional()`锛?2. 鍐嶄慨鏀圭幇鏈夋枃绔狅紝涓嶅己鍒惰姹傛棫鏂囩珷蹇呴』濉啓锛坥ptional 鍏煎锛?3. 鍦ㄧ粍浠朵腑鐢?`entry.data.author ?? 'njueeray'` 鍋?fallback
4. 鏂板 content collection锛堝 `authors`锛夋椂闇€鍚屾鍦?`config.ts` 娉ㄥ唽
**楠岃瘉锛?* 瑙勫垝涓紝Phase A
**娉ㄦ剰锛?* Astro 绫诲瀷妫€鏌ヤ弗鏍硷紝schema 涓嶅尮閰嶄細瀵艰嚧 build 澶辫触
**鏉ユ簮锛?* 2026-02-27 Agent 鍗氬鏍忕洰璁捐璁ㄨ

---

## 宸茬煡鑳藉姏灞€闄愶紙Known Limitations锛?
> 鏈皬鑺傝褰?Dev 鐨勭粨鏋勬€у眬闄愨€斺€旈潪缂洪櫡锛岃€屾槸杈圭晫銆? 
> 鏉ユ簮锛?026-03-01 鍥㈤槦鎴愰暱浼氳兘鍔涜嚜鐪佺幆鑺? 
> 涓婃鏇存柊锛?026-03-10

| 灞€闄愮被鍨?| 鎻忚堪 | 瑙勯伩绛栫暐 | 鎴愰暱鏂瑰悜 |
|---------|------|---------|----------|
| 鏃犺法浼氳瘽璁板繂 | 姣忔浼氳瘽浠庨浂寮€濮嬶紱涓婃鐨勫喅绛栥€侀敊璇€佸亸濂戒笉浼氳嚜鍔ㄥ欢缁?| 渚濊禆 `copilot-instructions.md` + `knowledge/dev-patterns.md` + `memory.jsonl` | Memory MCP 娣卞害闆嗘垚锛沗memory.jsonl` 鍐欏叆瑙勮寖鍖?|
| patterns 缁存姢鎯版€?| `dev-patterns.md` 缁存姢涓诲姩鎬т笉瓒筹紝瀹规槗绉帇 | Playbook 搂2.2 Step 4锛氭瘡娆′細璇濈粨鏉熸椂涓诲姩鎻愮偧鏂板锛堝凡鍐欏叆娴佺▼绾︽潫锛?| 寤虹珛姣忔浼氳瘽缁撴潫鐨?patterns 鎻愮偧涔犳儻 |
| 鐢ㄦ埛鍋忓ソ鎰熺煡寮?| 瀵硅瘽涓幏鍙栫殑鐢ㄦ埛鍋忓ソ娌℃湁鍥哄寲鍏ュ彛锛屼笅娆′細璇濆氨涓㈠け | `.github/USER.md` 浣滀负鐢ㄦ埛鍋忓ソ閿氱偣锛涘璇濅腑閬囧埌鏄庣‘鍋忓ソ鏃剁珛鍗冲啓鍏?| 寤虹珛鍋忓ソ璺敱鏈哄埗 |

