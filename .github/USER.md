# .github/USER.md 鈥?Ray Huang 鐨勪釜浜哄亸濂芥。妗?
> **鏂囦欢鑱岃矗锛?* 璁板綍鐢ㄦ埛锛圧ay锛変釜浜虹殑璇█椋庢牸銆佹帓鐗堝彛鍛炽€佸伐浣滀範鎯瓑鍋忓ソ銆? 
> **涓?copilot-instructions.md 鐨勫尯鍒細** copilot-instructions 鏄?*椤圭洰瑙勮寖**锛堝洟闃熷叡浜級锛沀SER.md 鏄?*鐢ㄦ埛涓汉 taste**锛堣法椤圭洰澶嶇敤锛夈€? 
> **缁存姢璐ｄ换锛?* Brain 璐熻矗鍦ㄥ璇濅腑璇嗗埆鐢ㄦ埛鏂板亸濂藉苟鎻愯杩藉姞锛涚敤鎴锋渶缁堢‘璁ゃ€? 
> **鍋忓ソ璺敱鏈哄埗锛?* 褰撶敤鎴峰湪瀵硅瘽涓〃杈俱€屾垜甯屾湜浠ュ悗...銆嶇被鐨勫亸濂芥椂锛孊rain 绔嬪嵆璇嗗埆锛屽垽鏂槸鍚﹀€煎緱璁板綍锛屽苟鏇存柊鏈枃浠舵垨閫氱煡瀵瑰簲 Agent 鐨?`knowledge/` patterns 鏂囦欢銆?
---

## 搂1 璇█涓庤〃杈鹃鏍?
```yaml
language:
  primary: zh-CN          # 鎵€鏈夊師鍒涘唴瀹归粯璁や腑鏂?  technical_symbols: en   # 浠ｇ爜銆佽矾寰勩€佸懡浠や繚鎸佽嫳鏂?  mixing_style: |
    涓枃鍙欒堪涓轰富锛屾妧鏈湳璇紙妗嗘灦鍚嶃€丄PI 鍚嶇瓑锛変繚鎸佽嫳鏂囧師鏂囷紝
    涓嶇炕璇?"commit"銆?Sprint"銆?workflow" 绛夊凡閫氱敤鐨勬妧鏈瘝姹?
tone:
  preferred: |
    - 鐩存帴銆佹竻鏅帮紝涓嶇粫寮?    - 閫傚害鏂囧鎰燂紝浣嗕笉杩芥眰鍗庝附
    - 浼氳绾鍏佽鏈変釜鎬э紙Agent 鏈夊悇鑷０闊筹級
    - 涓嶈繃搴︿娇鐢ㄦ劅鍙瑰彿

length:
  preference: 閫備腑锛堜笉杩芥眰绠€鐭紝鏈夌敤鐨勪俊鎭畞闀垮嬁鐭紱浣嗕笉鍫嗙爩鍐椾綑锛?```

---

## 搂2 Commit 涓庣増鏈鑼冨亸濂?
```yaml
commit:
  format: "璇箟鍖栧墠缂€: 绠€娲佹弿杩帮紙涓枃锛?
  preferred_prefix: [feat, fix, docs, style, chore, refactor, test]
  emoji_suggestion: |
    鍙€夛紝浣?Release Notes 寤鸿浣跨敤 emoji 浣滀负瑙嗚鍒嗙被
    鍙傝€冿細馃帀 鏂板姛鑳?| 馃悰 淇 | 馃摑 鏂囨。 | 馃帹 瑙嗚 | 鈿欙笍 宸ョ▼

release_notes:
  emoji_categories:       # 鐢ㄦ埛鏄庣‘甯屾湜閬靛惊鐨?Release Note 鏍煎紡
    "## 馃帀 鏂板": Added 绫诲彉鏇?    "## 馃悰 淇": Fixed 绫诲彉鏇?    "## 馃敤 鏀硅繘": Changed 绫诲彉鏇?    "## 馃摑 鏂囨。": 鏂囨。鏇存柊
  language: zh-CN
  always_include: "Co-authored-by: GitHub Copilot <copilot@github.com>"

versioning:
  philosophy: 澧為噺鍙戝竷锛圥atch 闅忔椂锛孧inor 1-3 澶╋紝Major 鏋舵瀯绾э級
  cooldown: Minor 鐗堟湰鍙戝竷鍚庣瓑寰呰嚦灏戜竴娆″閮ㄤ俊鍙峰啀鍙戜笅涓€涓?Minor
```

---

## 搂3 宸ヤ綔娴佸亸濂?
```yaml
agent_interaction:
  autonomy_preference: |
    楂樺害鎺堟潈 鈥?Agent 鍥㈤槦瀵规妧鏈矾寰勬湁浼樺厛鍐冲畾鏉?    鐢ㄦ埛鍙繚鐣欐渶缁堝惁鍐虫潈 + 鏍稿績鏂瑰悜纭
  
  confirmation_needed:
    - 鐮村潖鎬у彉鏇村墠
    - 娑夊強闅愮淇℃伅
    - 澶栭儴璐﹀彿娉ㄥ唽/鎿嶄綔
    - 澶ч鎴愭湰锛堝浠樿垂 API锛?
  decision_style: |
    涓嶅枩娆㈣鍒楀嚭銆岄€夐」 A / 閫夐」 B / 閫夐」 C銆嶅啀绛夋垜閫?    鍋忓ソ锛欰gent 缁欏嚭鎺ㄨ崘鏂规 + 鐞嗙敱锛屾垜鍙渶纭鎴栧惁鍐?
meeting_preference:
  initiation: Brain 涓诲姩鎰熺煡骞舵彁璁紙涓嶄緷璧栫敤鎴疯Е鍙戯級
  frequency: 涓嶈杩囧害锛涙湁瀹炶川璁鎵嶅彫寮€
  record: 鎵€鏈変細璁兘瑕佹湁 docs/meetings/ 绾

content_creation:
  blog_default_lang: zh-CN
  bilingual_trigger: 褰撳唴瀹规湁鏄庢樉鍥介檯浼犳挱浠峰€兼椂锛岃€冭檻鍙岃鐗堟湰
```

---

## 搂4 鎶€鏈亸濂?
```yaml
stack_preferences:
  primary: [Python, TypeScript, Astro, Node.js]
  styling: 鏆楄壊涓婚浼樺厛锛岀粓绔編瀛︼紝淇℃伅瀵嗗害楂樹絾涓嶆诞澶?  
ai_tooling:
  philosophy: AI-native锛堜汉鏈哄叡鐢燂紝涓嶆槸 AI 杈呭姪锛?  mcp_interest: high  # 甯屾湜绯荤粺鍖栧紩鍏?MCP skills
  multimodal: 鍥惧儚/瑙嗛鐢熸垚鑳藉姏鏄湭鏉ュ伐浣滄祦鐨勯噸瑕侀儴鍒?
social_media:
  platforms_of_interest: [灏忕孩涔? YouTube, 椋炰功, GitHub Discussions]
  workflow_vision: |
    鍦ㄩ涔︽彁闇€姹?鈫?Agent 鑷姩鐢熸垚鍐呭鍜岄厤鍥?鈫?鍙戦瑙堥摼鎺?鈫?鎴戞壒鍑?鈫?鑷姩鍙戝竷
  api_policy: "Ray 璐熻矗鎻愪緵蹇呰 API锛孉gent 璐熻矗璋冪敤閫昏緫"
```

---

## 搂5 鍋忓ソ婕旇繘璁板綍

> 姣忔 Brain 鍙戠幇鏂板亸濂藉苟杩藉姞鏃讹紝鍦ㄦ璁板綍鏃ユ湡鍜屾潵婧愩€?
| 鏃ユ湡 | 鍋忓ソ椤?| 鏉ユ簮 |
|------|--------|------|
| 2026-03-01 | Release Notes 搴斾娇鐢?emoji 鍒嗙被锛堭煄?馃悰/馃敤/馃摑锛?| 鍥㈤槦鎴愰暱浼氱敤鎴疯緭鍏?|
| 2026-03-01 | .github/USER.md 缁撴瀯鍙傜収 openclaw 椋庢牸 | 鍥㈤槦鎴愰暱浼氱敤鎴疯緭鍏?|
| 2026-03-01 | 绀句氦濯掍綋宸ヤ綔娴佹効鏅紙椋炰功鈫掑唴瀹光啋鍙戝竷锛墊 鍥㈤槦鎴愰暱浼氱敤鎴疯緭鍏?|
| 2026-03-01 | 宸ヤ綔娴佹巿鏉冮鏍硷紙楂樺害鎺堟潈锛屼笉瑕佸垪閫夐」锛墊 鍘嗗彶瀵硅瘽褰掔撼 |

---

*鐢?Brain 鏍规嵁鍥㈤槦鎴愰暱浼氾紙2026-03-01-03锛夊強鍘嗗彶瀵硅瘽鏁寸悊*  
*鐢ㄦ埛鏈€缁堢‘璁ょ増鏈細v1.0*

