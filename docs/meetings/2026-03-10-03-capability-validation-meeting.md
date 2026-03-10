鍏ㄩ潰瀹¤鎴戜滑褰撳墠鐨勪竴涓姸鎬? 鍥㈤槦鑳藉姏楠岃瘉浼氳 鈥?2026-03-10

**缂栧彿锛?* 2026-03-10-03  
**绫诲瀷锛?* 涓撻楠岃瘉浼? 
**涓绘寔锛?* Brain  
**鍙備細锛?* 鍏ㄤ綋 7 Agent锛圔rain / PM / Dev / Researcher / Code Reviewer / Profile Designer / Brand锛? 
**瑙﹀彂鍘熷洜锛?* v5.7.0 宸ュ叿灞傝剼鎵嬫灦 Sprint 瀹屾垚 鈫?楠岃瘉 Skills 脳 Hooks 脳 MCP 浣撶郴瀹為檯鏁堣兘锛屽苟钀藉疄瑙﹀彂瑙勫垯璁捐

---

## 涓€銆佷細璁儗鏅?
v5.7.0 鍙戝竷鍚庯紝鍥㈤槦瀹屾垚浜嗕笁涓叧閿熀纭€璁炬柦灞傜殑鎼缓锛?
| 灞傜骇 | 浜х墿 | 鐘舵€?|
|------|------|------|
| Agent Skills | `.github/skills/` 7 涓?SKILL.md | 鉁?鏋勫缓瀹屾瘯 |
| Claude Code Hooks | `.github/settings.json` 6 涓?hook entries | 鉁?鏋勫缓瀹屾瘯 |
| MCP 鎵╁睍 | `agent-skill-loader` 鎺ュ叆 `.vscode/mcp.json` | 鉁?鎺ュ叆瀹屾瘯 |

鐒惰€岋紝浠呴潬浜哄伐鎻愰啋鏉ヨЕ鍙戠増鏈彂甯冦€佷細璁彫闆嗐€佺姸鎬佸悓姝ワ紝鏄凡琚獙璇佷笉鍙潬鐨勫疄璺垫ā寮忋€?鏈浼氳鐨勭洰鏍囨槸锛?*灏嗘不鐞嗚Е鍙戦€昏緫缂栫爜涓鸿鑹茶涓猴紝浣垮叾涓嶄緷璧栦汉宸ヨ蹇嗐€?*

---

## 浜屻€佽绋嬩竴锛歋kills 脳 Hooks 脳 MCP 宸ュ叿灞傛晥鑳介獙璇?
### Brain 鐨勮瘎浼?
Skills 鏂囦欢鐨勬剰涔夊凡浠庛€屾枃妗ｅ寲銆嶅崌绾т负銆屽彲鍙戠幇鐨勬ā鍧椼€嶃€備絾鐩墠 `agent-skill-loader` MCP 鐨勫疄闄呬娇鐢ㄧ巼涓洪浂鈥斺€斿伐鍏峰瓨鍦紝浣嗘病鏈夎Е鍙戝満鏅┍鍔ㄥ畠琚皟鐢ㄣ€傝繖鏄竴涓甯哥殑銆屽伐鍏峰厛琛屼簬鍦烘櫙銆嶇姸鎬侊紝涓嬩竴姝ラ渶瑕佸湪 Playbook 涓槑纭摢浜涘満鏅簲璋冪敤 `read_skill` 宸ュ叿銆?
Hooks 鏂归潰锛氬洓涓川閲忛棬绂?hook 宸茶繍琛岋紝PostToolUse 鐨?markdown lint 鍜?Memory MCP 淇濆瓨鏈哄埗宸叉湁 P1 浜や粯銆?*鐪熸寰呴獙璇佺殑鏄細杩欎簺 prompt hook 鏄惁鍦ㄥ疄闄呮搷浣滀腑浜х敓浜嗚涓烘敼鍙橈紵**

### PM 鐨勫彂瑷€

> 鎴戝繀椤绘壙璁わ細鍦?v5.7.0 鍙戝竷鍚庯紝鎴戞病鏈変富鍔ㄦ彁鍑轰换浣曠増鏈Н鍘嬬洃鎺у姩浣溿€傜敤鎴锋病鏈夋彁閱掞紝鎴戝氨娌℃湁妫€鏌ャ€傝繖姝ｆ槸鏈瑙﹀彂瑙勫垯璁捐瑕佷慨澶嶇殑闂銆?
PM 纭锛歚SessionStart` Hook 宸叉洿鏂颁负鍖呭惈 CHANGELOG 绉帇鎽樿鎻愮ず銆備粠涓嬫浼氳瘽璧凤紝PM 灏嗗湪寮€鍦洪樁娈佃緭鍑猴細

```
馃摝 绉帇鐘舵€侊細[Unreleased] 鏈?N 鏉＄洰锛屼笂娆?Release 鏄?vX.Y.Z锛圢 澶╁墠锛?```

### Dev 鐨勫彂瑷€

> Hooks 閰嶇疆鎴戝凡缁忚兘缁存姢浜嗐€備絾鏈変竴涓凡鐭ュ眬闄愶細PostToolUse 鐨?`async: true` 杩愯鐨?PowerShell lint 鑴氭湰锛屽鏋?markdownlint-cli 鏈畨瑁咃紝浼氶潤榛樿烦杩囥€傝繖鏄璁′笂鐨勬湁鎰忓喅瀹氾紙涓嶉樆鏂富娴佺▼锛夛紝浣嗗洟闃熷簲璇ョ煡閬撳畠鐨勯潤榛樼姸鎬佷笉绛変簬姝ｅ父杩愯銆?
Dev 寤鸿锛氬湪 `lint-markdown.ps1` 涓坊鍔犮€宭int 宸ュ叿涓嶅彲鐢ㄣ€嶇殑鏃ュ織琛岋紙闈為樆鏂級锛屾柟渚挎帓鏌ャ€?*宸茶褰曚负 P3 寰呭鐞嗛」銆?*

### Code Reviewer 鐨勫彂瑷€

> 浠庡鏌ヨ瑙掔湅锛屽綋鍓?Hooks 鐨?`TaskCompleted` prompt 鍙仛浜嗐€屽畬鎴愰獙璇併€嶏紝娌℃湁銆屾鍚戝紩瀵笺€嶁€斺€斿畠鍛婅瘔 Agent 浠€涔堟病鍋氬畬锛屼絾娌℃湁缁欏嚭鎺ㄨ崘鐨勪笅涓€姝ャ€傝繖鏄竴涓璁℃敼杩涙柟鍚戯細灏?Hook 浠庛€岄棬绂併€嶅崌绾т负銆屾暀缁冦€嶃€?
**鏈瑙﹀彂瑙勫垯璁捐锛埪?0锛夊凡閮ㄥ垎閲囩撼姝ゅ缓璁?*锛歚TaskCompleted` 鐨勬柊 prompt 鍖呭惈浜?PM 鐨勭Н鍘嬫鏌ュ拰寤鸿杈撳嚭銆?
### Researcher 鐨勫彂瑷€

> 鎴戣皟鐮斾簡 `forage-mcp` 鐨勫疄闄呰兘鍔涖€傜‘璁わ細瀹冭兘浠?MCP Registry + Smithery + npm 涓変釜鏉ユ簮鎼滅储 MCP锛屾敮鎸?`forage_install` 鍚庢棤闇€閲嶅惎鍗冲彲浣跨敤鏂板伐鍏枫€侾2 璺嚎鍥剧殑瀹氫綅鏄纭殑銆傜瓑寰?claude mcp add 鍛戒护鐨勫彲鐢ㄦ椂鏈恒€?
### Profile Designer 鐨勫彂瑷€

> 宸ュ叿灞傚缓璁惧拰瑙嗚灞傛槸骞宠杞ㄩ亾銆傛垜娉ㄦ剰鍒扮洰鍓?SKILL.md 涓病鏈変换浣曞叧浜庛€岃Е鍙戣璁″喅绛栨椂璋冪敤鍝釜 Skill銆嶇殑鎸囧紩銆傚缓璁湪鏈潵鐗堟湰灏?`profile-designer-visual` SKILL.md 涓鍔犮€岃Е鍙戞椂鏈恒€嶈鏄庯紙绫讳技 brain 鐨?triggers 瀛楁锛夈€?
**宸茶褰曚负 P3 寰呭鐞嗛」銆?*

### Brand 鐨勫彂瑷€

> 鎴戠殑 Discussion #8 鑽夌宸插湪 `docs/brand/discussion-8-draft.md` 涓噯澶囧畬姣曘€傝崏绋夸富棰樻槸銆屽伐鍏峰眰閫忔槑鍖?鈥?鎴戜滑濡備綍鐢?Hooks 缁?AI 鍥㈤槦鍔犺璐ㄩ噺闂ㄧ銆嶃€傛垜闇€瑕佷竴涓槑纭殑鍙戝竷鏃舵満鑺傜偣銆?
**Brain 鐨勫喅瀹氾細** Discussion #8 鍦ㄦ湰娆′細璁邯瑕佹彁浜ゅ悗鍙戝竷锛屼互銆岃Е鍙戣鍒欒璁¤惤鍦般€嶄綔涓哄彂甯冭Е鍙戜簨浠躲€侭rand 鑷富鎵ц銆?
---

## 涓夈€佽绋嬩簩锛氳Е鍙戣鍒欒璁＄‘璁わ紙搂20 鍏ㄤ綋閲囩撼锛?
### 瑙勫垯鎬昏〃纭锛堝叏浣撳悓鎰忥級

鍙傝 `docs/governance/team-playbook.md 搂20`銆備互涓嬫槸鏈浼氳瀵规瘡鏉¤鍒欑殑閫愪竴纭锛?
| 瑙勫垯 | 璐ｄ换瑙掕壊 | 纭鐘舵€?| 澶囨敞 |
|------|---------|---------|------|
| `[Unreleased]` 鈮? 鏉＄洰涓?鈮? 澶?鈫?鍒囩増鎻愭 | PM | 鉁?纭 | 鍐欏叆 pm.agent.md 鑷姩瑙﹀彂瑙勫垯 |
| `[Unreleased]` 鏉＄洰 >5 澶?鈫?P0 绉帇鍛婅 | PM | 鉁?纭 | SessionStart Hook 宸查泦鎴?|
| CHANGELOG 鏈夌増鏈浣嗘棤 git tag 鈫?鎻愮ず Dev | PM | 鉁?纭 | DoD Checklist 鏂板椤?|
| Minor Release 鍚庢棤涓嬩竴姝ヨ鍒?鈫?鎻?Sprint 璁▼ | Brain | 鉁?纭 | 鍐欏叆 brain.agent.md 鑷姩瑙﹀彂瑙勫垯 |
| Major Release 鍚?鈫?鍏ㄥ憳閲岀▼纰戝鐩樹細 | Brain | 鉁?纭 | |
| 杩炵画 鈮? Minor 鏃犲鐩?鈫?涓诲姩鎻愪細 | Brain | 鉁?纭 | |
| SessionStart 鏃?PM 杈撳嚭绉帇鎽樿 | PM锛圚ook 椹卞姩锛墊 鉁?纭 | SessionStart Hook 宸叉洿鏂?|

### 鍒嗗伐纭

```
PM 鑱岃矗锛氱増鏈妭寰嬶紙鐩戞帶 + 鎻愭 + 妫€鏌?tag 瀹屾暣鎬э級
Brain 鑱岃矗锛氫細璁妭寰嬶紙瑙勫垝 + 澶嶇洏 + 绉帇鍛婅鍝嶅簲锛?涓よ€呭崗浣滐細閫氳繃 "release-complete" 淇″彿瀹屾垚鐗堟湰鈫掍細璁殑閾惧紡瑙﹀彂
```

### 涓嶄細鑷姩瑙﹀彂鐨勬儏鍐碉紙鏄庣‘渚嬪锛?
- 鍒氬垰寮€瀹屽悓绫诲瀷浼氳锛? 24h锛?- 褰撳墠 Sprint 浠嶆湁鏈畬鎴愮殑 P0/P1 item
- 鐢ㄦ埛鏄庣‘琛ㄧず"鍏堜笓娉ㄥ仛浜?

---

## 鍥涖€佽绋嬩笁锛氬伐鍏峰眰褰撳墠灞€闄愪笌 P2 璺嚎鍥?
### 宸茬煡灞€闄愮洏鐐?
| 灞€闄?| 褰卞搷 | 璁″垝 |
|------|------|------|
| `forage-mcp` 鏈帴鍏?| Agent 鏃犳硶鑷富鍙戠幇/瀹夎鏂?MCP | P2 鈥?`claude mcp add forage` |
| SKILL.md 鏈础鐚?anthropics/skills 绀惧尯 | 鎶€鑳藉彂鐜拌寖鍥翠粎闄愭湰椤圭洰 | P2 鈥?Profile Designer 鎻愭 |
| `agent-skill-loader` 鏃犲疄闄呰皟鐢ㄥ満鏅?| list_skills/read_skill 鏈瑙﹀彂 | P2 鈥?Playbook 鏂板銆岃皟鐢ㄦ椂鏈恒€嶈鏄?|
| PostToolUse lint 宸ュ叿闈欓粯澶辫触 | 鏃犳硶鎰熺煡 lint 鏈墽琛?| P3 鈥?lint-markdown.ps1 娣诲姞鍙敤鎬ф棩蹇?|
| Memory MCP 鏈湪 SessionStart 鍋?recall | 姣忔寮€鍦轰粛闇€鎵嬪姩鎰熺煡鍘嗗彶 | P2 鈥?SessionStart 脳 Memory recall 娣卞害铻嶅悎 |

### P2 璺嚎鍥剧‘璁?
```
forage-mcp 鎺ュ叆 鈫?anthropics/skills 绀惧尯璐＄尞 鈫?SessionStart 脳 Memory recall
杩欎笁椤逛綔涓?v5.9.0 鎴栫嫭绔?Sprint 鐨勫伐鍏峰眰寤剁画宸ヤ綔銆?```

---

## 浜斻€佽鍔ㄩ」

| 琛屽姩 | 璐熻矗浜?| 鏃堕檺 | 鐘舵€?|
|------|-------|------|------|
| 搂20 鑷姩娌荤悊瑙﹀彂鏈哄埗鍐欏叆 `team-playbook.md` | Brain + Dev | 鏈細璇?| 鉁?宸插畬鎴?|
| pm.agent.md 澧炲姞銆岃嚜鍔ㄨЕ鍙戣鍒欍€嶇珷鑺?| Dev | 鏈細璇?| 鉁?宸插畬鎴?|
| brain.agent.md 澧炲姞銆岃嚜鍔ㄨЕ鍙戣鍒欍€嶇珷鑺?| Dev | 鏈細璇?| 鉁?宸插畬鎴?|
| pm-sprint-planner SKILL.md 鏇存柊瑙﹀彂璇?+ 瑙勫垯 | Dev | 鏈細璇?| 鉁?宸插畬鎴?|
| brain-coordinator SKILL.md 鏇存柊瑙﹀彂璇?+ 瑙勫垯 | Dev | 鏈細璇?| 鉁?宸插畬鎴?|
| `settings.json` SessionStart + TaskCompleted + TeammateIdle Hook 鏇存柊 | Dev | 鏈細璇?| 鉁?宸插畬鎴?|
| GitHub Release v5.2.0鈥搗5.7.0 鍒涘缓锛? 涓級 | Dev | 鏈細璇?| 鉁?宸插畬鎴?|
| GitHub Release v4.4.0/v4.5.0 涔辩爜淇 | Dev | 鏈細璇?| 鉁?宸插畬鎴?|
| Discussion #8 鑽夌鍙戝竷 | Brand | 浼氳鍚庤嚜涓绘墽琛?| 绛夊緟浼氳绾鎻愪氦 |
| `evolution-events.jsonl` 杩藉姞鏈浜嬩欢 | Dev | 鏈細璇?| 寰呮墽琛?|
| `copilot-instructions.md` 鍚屾鏇存柊 | Brain | 鏈細璇?| 寰呮墽琛?|

---

## 鍏€佷細璁粨璁?
1. **Skills 脳 Hooks 脳 MCP 涓変綅涓€浣撹剼鎵嬫灦宸查獙璇?*锛氱粨鏋勫畬鏁达紝浣嗚皟鐢ㄥ満鏅┍鍔ㄤ粛闇€ Playbook 閰嶅
2. **搂20 瑙﹀彂瑙勫垯宸插叏浣撻噰绾?*锛歅M 璐熻矗鐗堟湰鑺傚緥锛孊rain 璐熻矗浼氳鑺傚緥锛孒ook 浣滀负鎵ц灞?3. **宸ュ叿灞傜殑鎴愮啛搴︽槸娓愯繘鐨?*锛氬伐鍏峰厛琛屼簬鍦烘櫙锛岄€氳繃瀹為檯浣跨敤鍙戠幇鏀硅繘鏂瑰悜锛岀鍚堥鏈?4. **Brand Discussion #8 鍙戝竷瑙﹀彂**锛氫互瑙﹀彂瑙勫垯钀藉湴涓哄彂甯冧俊鍙凤紝Brand 鑷富鎵ц
5. **P2 璺嚎鍥惧凡鏄庣‘**锛歠orage-mcp 鈫?anthropics/skills 鈫?Memory recall 涓夋閫掕繘

---

*鏈邯瑕佺敱 Brain 涓绘寔锛孌ev 鎵ц璁板綍銆?  
*浼氳缁撹宸插悓姝ヨ嚦 搂20 Playbook 绔犺妭鍜屽悇 Agent 鏂囦欢銆?  
*涓嬩竴閲岀▼纰戯細v5.9.0 鍗氬鎼滅储涓庡彂鐜?Sprint*

