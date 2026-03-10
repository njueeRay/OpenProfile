# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

---

## [5.7.0] 鈥?2026-03-10

> **宸ュ叿灞傝兘鍔涘崌绾?馃洜锔?鈥?Agent Skills 脳 Hooks 脳 MCP 涓変綅涓€浣撹剼鎵嬫灦**

鏈増鏈畬鎴?Agent 鍥㈤槦宸ュ叿灞傜殑绯荤粺鎬у崌绾э細7 涓?Agent 鐨勮兘鍔涘寘琚紪鐮佷负鍙彂鐜扮殑 SKILL.md 妯″潡锛?Claude Code Hooks 瀹炵幇鑷姩璐ㄩ噺闂ㄧ锛孧emory MCP 鎺ュ叆瀹炵幇璺ㄤ細璇濈煡璇嗘寔涔呭寲銆?杩欐槸 AI-native 宸ヤ綔娴佷粠銆屽彛鑰崇浉浼犮€嶈蛋鍚戙€岀粨鏋勫寲鑴氭墜鏋躲€嶇殑閲岀▼纰戙€?
### Added

- **宸ュ叿灞傚崌绾?鈥?Agent Skills锛? 涓?SKILL.md锛?*锛坄.github/skills/`锛?  - 涓哄叏浣?7 涓?Agent 鍒涘缓 SKILL.md锛歜rain-coordinator / pm-sprint-planner / dev-fullstack / researcher-analysis / code-reviewer-quality / profile-designer-visual / brand-publishing
  - Agent 鑳藉姏浠庛€屽唴閮ㄩ厤缃€嶅崌绾т负銆屽彲鍙戠幇鐨勬ā鍧楀寲鐭ヨ瘑鍗曞厓銆嶏紝鍏煎 Claude Code Skills 瀹樻柟寮€鏀炬爣鍑嗭紙`agentskills.io`锛?  - **P1 鐩綍缁熶竴**锛氫粠 `.claude/skills/` 杩佺Щ鑷?`.github/skills/`锛坄git mv` 淇濈暀鍘嗗彶锛夛紝缁熶竴绾冲叆 `.github/` 娌荤悊浣撶郴
- **宸ュ叿灞傚崌绾?鈥?Claude Code Hooks**锛坄.claude/settings.json`锛?  - `TeammateIdle` / `TaskCompleted` / `Stop` / `SessionStart` 鍥涗釜璐ㄩ噺闂ㄧ hooks
  - **P1 鎵╁睍**锛歚PostToolUse` 鍙?hook 鈥?async markdown lint锛坄.github/hooks/lint-markdown.ps1`锛? Memory MCP 鑷姩淇濆瓨鍏抽敭鍐崇瓥
- **Hooks 鎵╁睍鑴氭湰**锛坄.github/hooks/lint-markdown.ps1`锛?  - 浠?`.claude/hooks/` 杩佺Щ鑷?`.github/hooks/`锛孭owerShell 鑴氭湰锛屼笉闃绘柇涓绘祦绋?- **MCP 鎵╁睍 鈥?agent-skill-loader**锛坄.vscode/mcp.json`锛?  - 鏆撮湶 `list_skills/read_skill/install_skill` 宸ュ叿锛屽姩鎬佸彂鐜?`.github/skills/` 鎶€鑳藉簱
- **璋冪爺鎶ュ憡**锛坄docs/research/agent-tooling-scaffold-2026.md`锛夛細P0/P1/P2 宸ュ叿灞傝矾绾垮浘锛涜瘑鍒?forage-mcp 涓?P2 find-skills 鏂规
- **Brand 鍐呭鍐崇瓥**锛坄docs/brand/discussion-8-draft.md`锛夛細Brand 鑷富鍐崇瓥 Discussion #8锛堝厛鍋氬悗璇达級

---

## [5.6.0] 鈥?2026-03-10

> **鍗氬瑙嗚涓撻」 馃帹 鈥?闃呰浣撻獙鍏ㄩ潰鎻愬崌锛堟枃绔犳帓鐗?/ 棣栭〉鏈€鏂?/ 瀹藉崱棣栨潯 / 浣滆€呯粺璁?/ 缁堢鏍囩椋庯級**

### Added

- **`src/styles/prose.css`** 鈥?鍏ㄥ眬鏂囩珷鎺掔増鏍峰紡
  - 琛岄珮 1.8锛屾钀介棿璺?1.2em锛宍#161b22` 浠ｇ爜鍧楄儗鏅?+ 鍦嗚 + 鍐呰竟璺?  - 缁堢椋庢牸寮曠敤鍧楋紙`鉂痐 褰╄壊宸﹁竟妗?+ 鏂滀綋鏂囧瓧锛?  - 琛ㄦ牸 / 鏈夊簭鏃犲簭鍒楄〃 / 鍥剧墖 / 姘村钩鍒嗛殧绾?鍏ㄩ潰鏍峰紡鍖?- **`src/components/FeaturedCard.astro`** 鈥?鍗氬鍒楄〃瀹藉崱棣栨潯
  - 娓愬彉椤惰竟锛坅ccent 鑹茬嚎鏉★級+ `featured` 寰界珷
  - 澶у瓧鍙锋爣棰?+ 浣滆€呬俊鎭?+ 瀹屾暣鎽樿灞曠ず
  - 鍗氬鍒楄〃绗竴绡囪涓?featured 灞曠ず
- **`src/components/LatestPosts.astro`** 鈥?棣栭〉鏈€鏂板崥鏂囧尯鍧?  - 浣嶇疆锛歅rojects 涓?Contact 涔嬮棿锛屽睍绀烘渶鏂?3 绡?  - 缁堢鍛戒护琛岄鏍?header锛坄$ ls posts --latest`锛?  - 鐐瑰嚮鏍囬鐩撮摼鍗氭枃璇︽儏
- **`featured` frontmatter 瀛楁** 鈥?content schema 鏂板 `featured?: boolean`
- **BlogCard author chip** 鈥?鏂板 `role` 瀛楁锛坅ccent 鑹?路 mono 瀛椾綋锛夛紝浣滆€呰韩浠芥爣璇嗘洿娓呮櫚
- **鏍囩浜戠粓绔鏍?* 鈥?`$` 鍓嶇紑缁胯壊 + hover 鏃惰鏁版暟瀛楅珮浜负 accent 鑹?- **浣滆€呰鎯呴〉璐＄尞缁熻闈㈡澘** 鈥?鏂囩珷鎬绘暟澶ф暟瀛?+ contentType 姘村钩杩涘害鏉★紙鍥涜壊鍒嗗竷锛?
### Build

- `astro check`锛? errors 路 0 warnings 路 0 hints
- `npm run build`锛?5 椤垫瀯寤烘垚鍔?
---

## [5.5.0] 鈥?2026-03-01

> **鎴愮啛閲岀▼纰?馃幆 鈥?璇昏€呬綋楠屽叏闆?+ E2E 娴嬭瘯淇濋殰 + 瀵瑰浼犳挱灏辩华**

鏈増鏈槸 v5.x 璺嚎鐨勯噷绋嬬瀹ｅ憡鐗堛€倂5.1鈥搗5.4 鍥涗釜 Sprint 鐨勬妧鏈壙璇哄叏閮ㄥ厬鐜帮紝鏍囧織鐫€椤圭洰浠庛€屽揩閫熸惌寤洪樁娈点€嶈繘鍏ャ€屽彲鎸佺画缁存姢闃舵銆嶃€?
### 閲岀▼纰戞潯浠堕獙璇?
| 鏉′欢 | 鍏戠幇鐗堟湰 | 鐘舵€?|
|------|---------|------|
| 璇昏€呭彲瀹屾暣娑堣垂涓€绡囨枃绔狅紙ToC + 璇勮 + 闃呰杩涘害锛?| v5.2.0 | 鉁?|
| 鏂囩珷鍙湪绀句氦缃戠粶浜х敓鍥炲搷锛圤G 鍥?+ UTM 鍒嗕韩锛?| v5.3.0 | 鉁?|
| 娴嬭瘯瑕嗙洊鏈夊疄璐ㄤ繚闅滐紙Playwright 22 E2E tests锛?| v5.4.0 | 鉁?|
| `astro check` 鎸佺画 0 errors锛坴5.0鈫抳5.4 鍏ㄧ▼锛?| 鍏ㄧ▼缁存寔 | 鉁?|

### Added

- **閲岀▼纰戝崥鏂?* `v5-milestone-retrospective-2026-03-01.mdx`锛坢eeting 绫诲瀷锛孊rain 缃插悕锛?  - Brain 瑙嗚鐨?v4鈫抳5 鏃呯▼澶嶇洏锛氭暟瀛楃洏鐐广€佸洓涓?Sprint 灞傛鍒嗘瀽銆丄I-native 鍋ュ悍搴﹁嚜璇?- **Code Reviewer 瀹℃煡鎶ュ憡** `docs/reviews/v5.5.0-review.md`
  - 缁煎悎璇勫垎 39/40锛圓PPROVED锛夛紝瑕嗙洊鍏淮搴﹀叏闈㈠鏌?- **Profile README CI badges**锛坄njueeRay-profile/README.md`锛?  - E2E Tests workflow badge锛坄e2e.yml` 鐘舵€侊級
  - Deploy workflow badge锛坄deploy.yml` 鐘舵€侊級
  - Astro 5.18 badge + Playwright badge

### Notes

- **寰呯敤鎴锋搷浣?*锛欱rand 澶栭儴鐪熷疄浜掑姩锛圙itHub Discussions 棣栧彂甯栵級锛寁5.5 閲岀▼纰戝敮涓€鏈嚜鍔ㄦ弧瓒崇殑鏉′欢

---

## [5.4.0] 鈥?2026-03-01

> **E2E 娴嬭瘯 Sprint 鈥?Playwright 瑕嗙洊棣栭〉 / 鍗氬 / 瀵艰埅 / a11y锛?2 tests锛岄浂鍩虹璧锋锛?*

### Added

- **`playwright.config.ts`** 鈥?E2E 娴嬭瘯閰嶇疆
  - 涓や釜 Project锛歚chromium-desktop`锛圖esktop Chrome锛? `mobile-safari`锛坕Phone 13锛?  - `webServer` 鍙屾ā寮忥細鏈湴 `npm run dev` / CI `npm run preview`锛坆uild 鍚庯級
  - `reuseExistingServer: !process.env.CI`锛孋I 寮哄埗閲嶆柊鏋勫缓
- **`e2e/home.spec.ts`**锛? tests锛?  - 椤甸潰鏍囬鍖归厤 `/Ray Huang/`
  - Nav 鍖呭惈 Blog + Team 閾炬帴
  - Hero `#main-content` 鍙
  - ThemeToggle 鎸夐挳瀛樺湪锛坄aria-label="Toggle theme"`锛?- **`e2e/blog.spec.ts`**锛? tests锛?  - 鍗氬鍒楄〃锛氭枃绔犲崱鐗囨覆鏌?/ "鍏ㄩ儴" Filter Tab 榛樿婵€娲?/ insight tab 鐐瑰嚮杩囨护 / 鏍囬閾炬帴鍙烦杞?  - 鏂囩珷璇︽儏锛坄brain-first-post`锛夛細h1 / ReadingProgress `.reading-progress` / ShareLinks / OG image meta
- **`e2e/navigation.spec.ts`**锛? tests锛?  - 鐐瑰嚮 Blog / Team 閾炬帴璺敱璺宠浆
  - 涓婚鍒囨崲锛歚data-theme` 灞炴€?`dark 鈫?light 鈫?dark`
  - 绉诲姩绔?hamburger锛歝lick 鈫?`aria-expanded="true"`锛屽啀 click 鈫?`"false"`
- **`e2e/accessibility.spec.ts`**锛? tests锛?  - `html[lang]` 闈炵┖ / `.skip-link[href="#main-content"]` 瀛樺湪 / `main#main-content` 瀛樺湪 / `nav[aria-label]`
  - `/404` 璺敱杩斿洖 404 鐘舵€佷笖鏈夊唴瀹?  - Team 椤?`ol[aria-label="鍥㈤槦鍗氭枃鍔ㄦ€佹祦"]` 鍙锛孴ags 椤?`ul[aria-label="鏍囩浜?]` 鍙
- **`.github/workflows/e2e.yml`**
  - 瑙﹀彂锛歚push/pull_request` 鈫?`main`
  - CI 浠呰窇 `chromium-desktop`锛堣妭鐪?CI 鏃堕棿锛夛紝澶辫触鏃朵笂浼?`playwright-report` artifact锛堜繚鐣?7 澶╋級
  - 鏋勫缓缂撳瓨澶嶇敤 `.astro/` 鐩綍
- **`package.json`** 鏂板涓夋潯鑴氭湰锛歚test:e2e` / `test:e2e:ui` / `test:e2e:ci`

### Build
- `astro check`锛? errors 路 0 warnings 路 0 hints
- `npm run build`锛?8 椤垫瀯寤烘垚鍔?
---

## [5.3.0] 鈥?2026-03-01

> **瀵瑰浼犳挱 Sprint 鈥?OG 灏侀潰鍥捐嚜鍔ㄧ敓鎴?+ UTM 鍒嗕韩閾炬帴 + Brand 棣栧彂 Discussion 鑽夌**

### Added

- **OG 灏侀潰鍥捐嚜鍔ㄧ敓鎴?*锛坄src/pages/og/[...slug].png.ts`锛?  - `satori`锛圚TML/CSS 鈫?SVG锛岀函 JS锛屾棤 native 浜岃繘鍒朵緷璧栵級+ `@resvg/resvg-js`锛圫VG 鈫?PNG锛學ASM锛?  - `@fontsource/jetbrains-mono` 鏈湴瀛椾綋鏂囦欢锛屾瀯寤烘椂鏃犻渶缃戠粶璇锋眰
  - 鏆楄壊缁堢椋庢牸璁捐锛?200脳630锛宮acOS 绐楀彛瑁呴グ鐐?+ `>` 鎻愮ず绗?+ 鏍囬 + tags + 椤佃剼
  - `getStaticPaths` 涓?16 绡囧崥鏂囧悇鐢熸垚 `/og/<slug>.png`锛堟瀯寤烘椂闈欐€佺敓鎴愶級
  - `BaseLayout.astro` `ogImage` prop 鎺ュ叆锛孴witter Card 鍗囩骇涓?`summary_large_image`
- **`ShareLinks.astro` 鍒嗕韩缁勪欢**
  - 涓€閿鍒跺甫 UTM 鍙傛暟鐨勬枃绔犻摼鎺ワ紙`utm_source=copy&utm_campaign=blog`锛?  - GitHub Discussions 鏂板缓璁ㄨ鎸夐挳锛堥濉枃绔犳爣棰?+ UTM 閾炬帴锛?  - 缁堢椋庢牸鐣岄潰锛坄$ share --post`锛夛紝浣嶇疆鍦?author-card 鍚庛€丟iscus 鍓?- **Brand 棣栧彂 Discussion 鑽夌**锛坄docs/brand/first-discussion-draft.md`锛?  - 甯栧瓙 1锛氶鍙戞椂鍒?鈥?AI Agent 鍥㈤槦鏋勫缓 GitHub Profile锛圓nnouncements 鍒嗙被锛?  - 甯栧瓙 2锛歄G 灏侀潰鍥炬妧鏈繁搴﹀垎浜紙Tech Deep-dives锛屼竴鍛ㄥ悗鍙戝竷锛?  - 鍖呭惈鍙戝竷娓呭崟鍜?Discussions 鍒嗙被鍒涘缓鎸囧紩

---

## [5.2.0] 鈥?2026-03-01

> **璇昏€呬綋楠?Sprint 鈥?ToC + Giscus + ReadingProgress 婵€娲?+ 鐩稿叧鏂囩珷鎺ㄨ崘**

### Added

- **鐩稿叧鏂囩珷鎺ㄨ崘**锛坄pages/blog/[...slug].astro`锛?  - 鍩轰簬鍏变韩 tag 浜ら泦鏁伴噺璇勫垎锛宲ubDate 闄嶅簭鍏滃簳锛屾渶澶氬睍绀?3 绡?  - 缁堢椋庢牸鍗＄墖锛氭枃绔犳爣棰橈紙閾炬帴锛? 鍙戝竷鏃ユ湡 + 鍏变韩 tag 褰╄壊寰界珷
  - CSS 绫伙細`.related-posts`銆乣.related-link`銆乣.related-tag` 绛?  - 浣嶇疆锛歛uthor-card 涔嬪悗銆丟iscus 璇勮涔嬪墠

### Confirmed Integrated

- **`ReadingProgress.astro`** 鈥?椤堕儴鍥哄畾婊氬姩杩涘害鏉★紝`astro:after-swap` 鏀寔 ClientRouter锛堝凡鍐呯疆锛寁5.2.0 纭鍏ㄥ眬婵€娲伙級
- **`TableOfContents.astro`** 鈥?鍙充晶鍥哄畾鐩綍鏍忥紝鈮?280px 鑷姩鏄剧ず锛孖ntersectionObserver 褰撳墠鏍囬楂樹寒锛堝凡鍐呯疆锛寁5.2.0 纭婵€娲伙級
- **`Giscus.astro`** 鈥?GitHub Discussions 璇勮绯荤粺锛坄dark_dimmed` 涓婚锛宺epo: `njueeRay/njueeray.github.io`锛夛紙宸插唴缃紝v5.2.0 纭婵€娲伙級

---

## [5.1.0] 鈥?2026-03-01

> **鎶€鏈€烘竻鐞?Sprint 鈥?Content Layer API 杩佺Щ**
> 涓ら」浠诲姟浜や粯锛欳ontent Layer API (`loader: glob()`) + `profile-designer.yaml` 琛ュ厖

### Changed

- **`src/content/config.ts` 鈥?Content Layer API 杩佺Щ**
  - `type: 'content'` 鈫?`loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/blog' })`
  - 鏂板 `import { glob } from 'astro/loaders'`
- **`src/pages/blog/[...slug].astro`**
  - `await post.render()` 鈫?`await render(post)`锛坄render` 鍑芥暟浠?`astro:content` 瀵煎叆锛?  - Content Layer API 鍏ュ彛 `params: { slug: post.id }`锛堝師 `post.slug`锛?- **鍏ㄧ珯 `post.slug` 鈫?`post.id`锛堝叡 9 澶勶級**
  - `pages/blog/[...slug].astro`锛坧arams + postUrl锛?  - `pages/blog/index.astro`锛圔logCard slug prop锛?  - `pages/blog/tags/[tag].astro`锛堟枃绔犻摼鎺?href锛?  - `pages/blog/authors/[author].astro`锛堟枃绔犻摼鎺?href锛?  - `pages/rss.xml.ts`锛圧SS link 瀛楁锛?  - `pages/team.astro`锛坙atestPost map + activityFeed锛?
### Fixed

- `src/content/authors/profile-designer.yaml` 鈥?鏂板缂哄け鏂囦欢锛堟秷闄ゆ瀯寤鸿鍛?`Entry authors 鈫?profile-designer was not found`锛?
### Compatibility

- `authors` 闆嗗悎淇濇寔 `type: 'data'`锛堟暟鎹泦鍚堟棤闇€杩佺Щ锛?- `post.id` 鍊间笌鍘?`post.slug` 瀹屽叏鐩稿悓锛坓lob loader 榛樿浠ユ枃浠跺悕鍘绘墿灞曞悕浣滀负 id锛?- `astro check`: **0 errors 路 0 warnings 路 0 hints**
- `npm run build`: **57 椤垫瀯寤烘垚鍔燂紝exit code 0**

---

## [5.0.0] 鈥?2026-03-01

> **鏋舵瀯鍗囩骇 鈥?Astro 5 杩佺Щ锛?.16 鈫?5.18锛?*
> 瑙﹀彂鏉′欢婊¤冻锛圫-6 鍙鎬ф姤鍛?鉁咃級锛涜縼绉诲畬鎴愶細0 errors 路 0 warnings 路 0 hints 路 57 椤垫瀯寤烘棤璇?
### Changed

- **Astro 4.16.18 鈫?5.18.0 鍗囩骇**
  - 鏇存柊 `package.json`锛宍astro@^5.18.0`
  - `ViewTransitions` 缁勪欢搴熷純 鈫?鏀圭敤 `ClientRouter`锛坄import { ClientRouter } from 'astro:transitions'`锛?  - `BaseLayout.astro` 涓?`<ViewTransitions />` 鈫?`<ClientRouter />`
- **@astrojs/mdx 3.1.9 鈫?4.3.13 鍗囩骇**
  - 鍏煎 Astro 5锛屾棤 API 鐮村潖鎬у彉鏇?- **JSON-LD script 淇**
  - 鍚睘鎬?`type="application/ld+json"` 鐨?`<script>` 鍧楀湪 Astro 5 椤绘樉寮忓姞 `is:inline`
  - `BaseLayout.astro` JSON-LD 娉ㄥ叆宸叉洿鏂?
### Fixed

- `GitTimeline.astro` 鈥?绉婚櫎鏈娇鐢ㄧ殑 `index` 鍙傛暟锛坄events.map((event, index)` 鈫?`events.map((event)`锛?- `blog/authors/[author].astro` 鈥?绉婚櫎鏈娇鐢ㄧ殑 `getEntry` 瀵煎叆锛坄astro check` hint 淇锛?
### Compatibility

- Legacy `type: 'content'` 闆嗗悎鍦?Astro 5 缁х画鍏煎锛堢洿鑷?Astro 6锛?- Content Layer API (`loader: glob()`) 姝ｅ紡杩佺Щ鎺ㄨ繜鑷?v5.1.0
- `astro check` 缁撴灉锛?*0 errors 路 0 warnings 路 0 hints**
- `npm run build` 缁撴灉锛?*57 椤垫瀯寤烘垚鍔燂紝exit code 0**

---

## [4.5.0] 鈥?2026-03-01

> **SEO & 鎬ц兘 Sprint 鈥?JSON-LD / hreflang / Lighthouse CI / axe-core CI / Astro 5 璋冪爺**
> 鍏」浠诲姟浜や粯锛歋-1 JSON-LD 路 S-2 hreflang 路 S-3 Lighthouse CI 路 S-4 axe-core CI 路 S-5 鏋勫缓缂撳瓨 路 S-6 Astro 5 鎶ュ憡

### Added

- **S-1 JSON-LD 缁撴瀯鍖栨暟鎹紙P1锛?*
  - `BaseLayout.astro` 鈥?娣诲姞 `jsonLd` prop锛屾敮鎸佷紶鍏ュ崟涓垨鏁扮粍 JSON-LD 瀵硅薄
    鑷姩娉ㄥ叆 `<script type="application/ld+json">` 鍒?`<head>`
  - `index.astro` 鈥?娉ㄥ叆 `Person` + `WebSite` schema锛堝惈 `sameAs` GitHub URL銆乣knowsAbout` 鎶€鑳芥暟缁勶級
  - `[...slug].astro` 鈥?娉ㄥ叆 `BlogPosting` schema锛坄headline` / `datePublished` / `dateModified` / `author` / `keywords`锛?    Agent 浣滆€呬娇鐢?`SoftwareApplication` 绫诲瀷锛屼汉绫讳綔鑰呬娇鐢?`Person` 绫诲瀷
- **S-2 hreflang 鍙岃鏍囩锛圥2锛?*
  - `BaseLayout.astro` 鈥?娣诲姞 `hreflangLinks` prop锛屾覆鏌?`<link rel="alternate" hreflang>` 鏍囩
  - `[...slug].astro` 鈥?鍙岃鏂囩珷锛坄bilingual: true`锛夎嚜鍔ㄧ敓鎴?`zh` / `en` / `x-default` 涓夋潯 hreflang
- **S-3 Lighthouse CI锛圥1锛?*
  - `.github/workflows/lighthouse-ci.yml` 鈥?`treosh/lighthouse-ci-action@v12`
    鏈€浣庡垎鏁伴槇鍊硷細accessibility 鈮?0.90锛坋rror锛夈€乻eo 鈮?0.90锛坋rror锛夈€乸erformance 鈮?0.85锛坵arn锛?  - `.lighthouserc.json` 鈥?Lighthouse CI 閰嶇疆鏂囦欢锛坄staticDistDir` 妯″紡锛屾棤闇€鍚姩鏈嶅姟鍣級
  - 浜х墿涓婁紶鑷?`temporary-public-storage`锛孭R 鍐呭彲鐩存帴鏌ョ湅鎶ュ憡閾炬帴
- **S-4 axe-core CI锛圥2锛?*
  - `.github/workflows/accessibility.yml` 鈥?鏋勫缓鍚庡惎鍔?`serve` 闈欐€佹湇鍔★紝`@axe-core/cli` 鎵弿棣栭〉銆佸崥瀹㈠垪琛ㄣ€乼eam 椤?  - `--exit` flag锛氬彂鐜?violation 鏃?CI 澶辫触
- **S-5 鏋勫缓缂撳瓨浼樺寲锛圥2锛?*
  - `deploy.yml` 鈥?鏂板 `actions/cache@v4` 缂撳瓨 `.astro/` 澧為噺鏋勫缓鐩綍
  - `lighthouse-ci.yml` / `accessibility.yml` 鈥?鍚屾娣诲姞 `.astro` 缂撳瓨姝ラ
  - 缂撳瓨閿細`astro-${{ hashFiles('src/**','public/**','astro.config.mjs','package-lock.json') }}`
  - 棰勬湡鏁堟灉锛氬閲忛儴缃叉瀯寤烘椂闂村噺灏?~40%
- **S-6 Astro 5 杩佺Щ鍙鎬ф姤鍛婏紙P1锛?*
  - `docs/research/astro-v5-feasibility-2026.md` 鈥?Researcher 瀹屾暣鎶ュ憡
    缁撹锛氣渽 杩佺Щ鍙锛屽伐浣滈噺绾﹀崐澶╋紝寤鸿绾冲叆 v5.0.0
    鏍稿績渚濊禆鍏煎鎬х煩闃?+ 杩佺Щ璺緞 + 椋庨櫓璇勪及

---

## [4.4.0] 鈥?2026-03-01

> **浣撻獙绮句慨 Sprint 鈥?a11y / 鍗氬寰氦浜?/ Hero 鎵撳瓧鍔ㄧ敾 / 鍥㈤槦鍔ㄦ€佸**
> 鍥涢」鍔熻兘浠诲姟鍏ㄩ儴浜や粯锛歎-1 鍗氬鍗＄墖寰氦浜?路 U-2 Hero 澧炲己 路 U-3 a11y 鍩虹锛圥1锛壜?U-4 鍥㈤槦鍔ㄦ€佸

### Added

- **U-3 a11y 鍩虹锛圥1锛?*
  - `BaseLayout.astro` 鈥?椤堕儴娣诲姞 `skip-to-content` 璺宠浆閾炬帴锛堥敭鐩?灞忓箷闃呰鍣ㄥ弸濂斤級
  - `BaseLayout.astro` 鈥?`<slot />` 鍖呰９ `<main id="main-content" tabindex="-1">` 璇箟鍖栦富鍐呭鍖哄煙
  - `Nav.astro` 鈥?`<nav>` 鍏冪礌娣诲姞 `aria-label="Main navigation"`
  - `Nav.astro` 鈥?鎼滅储鎸夐挳娣诲姞 `aria-label="鎼滅储 (Ctrl+K)"`
  - `global.css` 鈥?`.skip-link` 鏍峰紡锛堥殣钘忔€?+ 鑱氱劍鏃舵诞鐜板湪 nav 涓嬫柟锛?  - `global.css` 鈥?`:focus-visible` 鍏ㄥ眬 2px accent 杈规 + `:focus:not(:focus-visible)` 鍘婚櫎榧犳爣鐐瑰嚮杞粨
- **U-1 鍗氬鍗＄墖寰氦浜?*
  - `BlogCard.astro` 鈥?contentType 鍥炬爣鍖呰９ `<span class="type-icon">`锛孋SS `@keyframes breathe` 鍛煎惛鍔ㄧ敾锛?.8s锛?  - `BlogCard.astro` 鈥?hover 鍗囩骇锛歚box-shadow 0 8px 30px rgba(88,166,255,0.1)` + `will-change: transform`
  - `BlogCard.astro` 鈥?`<script>` 娣诲姞 3D 閫忚鍊炬枩鏁堟灉锛坄perspective(700px) rotateX/Y` 榧犳爣杩借釜锛?  - 鍏ㄩ儴鍔ㄦ晥閬靛畧 `prefers-reduced-motion`
- **U-2 棣栭〉 Hero 澧炲己**
  - `Hero.astro` 鈥?CSS `@keyframes term-reveal` 閫愯鎵撳瓧鏈烘彮绀哄姩鐢伙紙opacity + X 鍋忕Щ锛?  - `Hero.astro` 鈥?`<script>` 鎸夎鏁拌嚜鍔ㄨ绠?`animation-delay`锛?.3s 璧锋锛屾瘡琛?0.2s 闂撮殧锛?  - Hero CTA 鎸夐挳寤惰繜璺熼殢鏈鍔ㄧ敾鍚庡嚭鐜?  - 閬靛畧 `prefers-reduced-motion`
- **U-4 鍥㈤槦鍔ㄦ€佸**
  - `team.astro` 鈥?鏂板銆屽洟闃熷姩鎬併€峴ection锛坄#activity`锛夛紝灞曠ず鍏ㄧ珯鏈€鏂?12 绡囧崥鏂囨椿鍔ㄦ祦
  - Git log 椋庢牸缁堢甯冨眬锛氫綔鑰?emoji + displayName + `published` + 鏂囩珷鏍囬閾炬帴 + 鏃ユ湡
  - 鏁版嵁鏉ヨ嚜 `getCollection('blog')` + `teamMembers` 鏈湴鏄犲皠锛屾棤澶栭儴 API 渚濊禆
  - `typeIconMap` 涓?contentType 鍖归厤鐢ㄩ€斿浘鏍囷紙馃挕/鈿?鉁嶏笍/馃摑锛?
---

## [4.3.0] 鈥?2026-03-01

### Added

- **GitHub Discussions 绀惧尯涓婄嚎** 鈥?Announcements / Team Insights / AI-native Journey 涓変釜鑷畾涔夊垎绫?+ 3 绡囬鍙戝笘
- **4 涓?Good First Issues** 鍒涘缓锛?1-#4锛夛細缁勪欢鎸囧崡缈昏瘧銆佽璁″喅绛栨洿鏂般€丄gent 閫熸煡鍗°€佺粍浠跺仴搴风洃鎺?- **README 鐫€闄嗛〉澧炲己** 鈥?Preview 鍖哄潡銆丼tar History 鍥捐〃銆丆ontributors 澶村儚鍒楄〃銆佸弻 CI badge锛坢arkdown-lint + link-check锛夈€丷oadmap 鎵╁睍鑷?v4.5.0
- **`docs/governance/release-sop.md`** 鈥?鐗堟湰鍙戝竷鏍囧噯鎿嶄綔娴佺▼锛堜粠浠ｇ爜鍐荤粨鍒?Release 鐨勫畬鏁存楠わ級
- **`docs/strategy/brand-release-template.md`** 鈥?Brand 鐗堟湰鍙戝竷鍗氭枃妯℃澘锛圵HY > WHAT 鍙欎簨鍘熷垯锛?- `profile-designer-first-post.mdx` (member-essay) 鈥?Profile Designer 棣栧彂鍗氭枃
- `ai-native-person-summit-2026-02-26.mdx` (meeting) 鈥?AI-native Person 鎬濇兂宄颁細绾疄
- `free-brainstorm-2026-02-26.mdx` (meeting) 鈥?v4.0.0 鍙戝竷鍚庡叏鍛樿嚜鐢变氦娴佷細
- `team-evolution-design-2026-02-27.mdx` (meeting) 鈥?/team 椤甸潰 Git Graph 璁捐浼?
### Fixed

- **CI markdown-lint 鍏ㄩ潰淇**锛?82 errors 鈫?0 errors
  - 鏂板 `.markdownlint-cli2.jsonc` 浣跨敤鍘熺敓 `ignores` 鏈哄埗锛堟浛浠ｄ笉宸ヤ綔鐨?`.markdownlintignore`锛?  - 绂佺敤涓庨」鐩揣鍑戞枃妗ｉ鏍煎啿绐佺殑 4 鏉¤鍒欙細MD022/MD028/MD031/MD032
  - 淇 11 澶?MD034 瑁?URL锛坄component-guide.md` + `bug_report.md`锛?  - Workflow 瑙﹀彂鏉′欢鎵╁睍鍒?`.jsonc` 閰嶇疆鏂囦欢鍙樻洿
- **BlogCard 宓屽 `<a>` 淇**锛圵-01锛夆€?鏀圭敤 stretched-link 妯″紡锛屾秷闄ら潪娉曞祵濂?HTML
- **姹夊牎鑿滃崟鐒︾偣绠＄悊**锛圵-02锛夆€?娣诲姞 Escape 鍏抽棴 + Tab 鐒︾偣寰幆 + 寮€鍚椂鑷姩鑱氱劍

---

## [4.2.0] 鈥?2026-03-01

> **宸ョ▼璐ㄩ噺 Sprint 鈥?CSS 缁熶竴 / 缁勪欢鎷嗗垎 / 鍝嶅簲寮?/ CI 淇**
> code-reviewer: `APPROVED WITH NOTES`锛?6/40锛岃 `docs/reviews/v4.2.0-review.md`锛?
### Added

- `src/styles/global.css` 鈥?鍏ㄥ眬 CSS 鍙橀噺 + 璁捐浠ょ墝 + 鍩虹閲嶇疆锛堜粠 BaseLayout 鎻愬彇锛?- `src/data/content-types.ts` 鈥?鍗氬鍐呭绫诲瀷鍏变韩閰嶇疆锛坱ypeConfig / ContentType 绫诲瀷瀵煎嚭锛?- `src/components/BlogCard.astro` 鈥?鍗氬鍒楄〃鍗＄墖缁勪欢锛堝惈 type-badge銆乤uthor-chip銆乼ags锛?- `src/components/FilterTabs.astro` 鈥?鍗氬绛涢€夋爣绛炬爮缁勪欢锛堝惈 is:inline 瀹㈡埛绔繃婊ら€昏緫锛?- `tsconfig.json` 鏂板 `@styles/*` 璺緞鍒悕

### Changed

- `BaseLayout.astro`锛氱Щ闄?120 琛屽唴鑱?CSS锛屾敼涓?`import '../styles/global.css'`锛涚Щ闄ゆ湭浣跨敤鐨?ThemeToggle import
- `blog/index.astro`锛氫粠 346 琛岄噸鏋勮嚦 ~90 琛岋紙鎻愬彇 BlogCard + FilterTabs + 鍏变韩閰嶇疆鍚庯級
- `Nav.astro`锛氭柊澧炵Щ鍔ㄧ hamburger 鑿滃崟锛堚墹768px 鎶樺彔瀵艰埅锛夛紝鏇挎崲鍘熸湁浠呯缉瀛楀彿鐨?480px 鏂偣
- `FilterTabs.astro`锛氱Щ鍔ㄧ 鈮?80px 姘村钩婊氬姩锛坄overflow-x: auto` + `flex-wrap: nowrap`锛?- 鍏ㄥ眬 CSS 鍙橀噺鏂板锛歚--color-purple`, `--color-orange`, `--color-pink`, `--color-red`, `--space-*` 灏哄害銆乣--max-w`, `--max-w-wide`, `--nav-h`, `--radius-*`
- 缁勪欢涓‖缂栫爜鑹插€兼浛鎹负 CSS 鍙橀噺寮曠敤锛堝 `#bc8cff` 鈫?`var(--color-purple)`锛?
### Fixed

- `.markdownlint.jsonc`锛氱鐢?MD036/MD040/MD060锛堜笌椤圭洰椋庢牸鍐茬獊鐨勮鍒欙級
- `.github/workflows/link-check.yml`锛氭帓闄?modelcontextprotocol.io锛?04锛?- `docs/governance/PLAYBOOK-CHANGELOG.md`/`team-playbook.md`/`build-in-public-channels-2026.md`锛氫慨澶?MD022/MD032/MD034/MD012 鏍煎紡闂

---

## [4.1.0] 鈥?2026-02-28

> **鍥㈤槦鍝佺墝鍖?+ 鍐呭鏋舵瀯 + AI-native 璁ょ煡浣撶郴**  
> **Playbook 鐗堟湰**锛歅laybook v2.1锛堣 docs/governance/PLAYBOOK-CHANGELOG.md锛? 
> code-reviewer: `APPROVED`锛堝洖椤炬€у鏌ワ紝瑙?`docs/reviews/v4.1.0-review.md`锛?
### Added

#### 鍥㈤槦鎵╁睍
- `.github/agents/brand.agent.md` 鈥?Brand Agent 姝ｅ紡鍔犲叆鍥㈤槦锛堝搧鐗岃繍钀?+ Build in Public + 鍐呭鍙戝竷绛栫暐锛?- `.github/agents/knowledge/` 鈥?搂14 L2 鐭ヨ瘑搴撴寮忚惤鍦帮紙brain / pm / dev / researcher / code-reviewer 鍚勪竴浠?patterns.md + README 绱㈠紩锛?
#### 鍗氬鍐呭鐢熸€侊紙njueeray.github.io锛?- 澶氫綔鑰呯郴缁燂細7 涓?author YAML + `/blog/authors/[agent]` 椤甸潰璺敱
- 12 绡囧崥鏂囧彂甯冿細7 绡?Agent 棣栧彂 + 2 绡囦細璁邯瀹?+ Brand 瑙傚療鎶ュ憡 + AI-native 鑼冨紡鍙岃闀挎枃 + 鎶€鏈暀绋?- `LangToggle.astro` 鈥?涓嫳鏂囧弻璇垏鎹㈢粍浠讹紙localStorage 鎸佷箙鍖栵紝ViewTransitions 鍏煎锛?- `content/config.ts` 鈥?Blog schema 鏂板 `bilingual: boolean` + `contentType` 鏋氫妇瀛楁

#### 鍗氬鍐呭鏋舵瀯
- `contentType` 鍥涚被鍒嗙被浣撶郴锛歩nsight锛堟€濇兂绗旇锛? technical锛堟妧鏈疄褰曪級/ member-essay锛堟垚鍛橀殢绗旓級/ meeting锛堜細璁邯瀹烇級
- `blog/index.astro` Filter Tab 鈥?鍓嶇绛涢€?+ URL hash 娣遍摼鎺?+ 鍐呭绫诲瀷褰╄壊寰界珷 + 宸﹁竟妗嗛鑹插尯鍒?- `team.astro` 鎴愬憳鍗＄墖鍗囩骇 鈥?灞曠ず姣忎綅鎴愬憳鏈€鏂板崥鏂囨爣棰橈紙getCollection 鏄犲皠锛?
#### 鍥㈤槦杩涘寲鍙鍖?- `/team` 椤甸潰 鈥?Git Graph 椋庢牸鍨傜洿鏃堕棿绾匡紙15 涓噷绋嬬 + 5 鑹茶妭鐐?+ 婊氬姩娓愭樉鍔ㄧ敾锛?- `src/data/team-evolution.ts` 鈥?鏁版嵁椹卞姩锛氭柊浜嬩欢鍙渶杩藉姞鏁扮粍
- `src/components/GitTimeline.astro` 鈥?504 琛屽畬鏁寸粍浠讹紙Playbook 妗ｆ + 鎴愬憳 Grid锛?- Nav 鏂板 "team" 瀵艰埅閾炬帴

#### 鏂囨。涓庤鍒?- `docs/meetings/2026-02-28-v5-roadmap-planning.md` 鈥?V5 璺嚎鍥惧叏浣撹鍒掍細璁紙澧為噺鐗堟湰鍝插 + v4.1鈫抳4.5 璺嚎鍥撅級
- `docs/meetings/2026-02-28-blog-team-page-design-session.md` 鈥?Blog 鍐呭鏋舵瀯璁捐浼?- `docs/meetings/2026-02-28-profile-fixes-and-action-items.md` 鈥?宸ヤ綔浼氳瘽绾
- `docs/meetings/2026-02-27-brand-welcome-all-hands.md` 鈥?Brand 娆㈣繋鍏ㄥ憳浼氳绾
- `docs/meetings/2026-02-27-all-hands-strategic.md` 鈥?鍏ㄤ綋鎴樼暐浼氳绾
- `docs/meetings/2026-02-26-free-brainstorm.md` 鈥?鍥㈤槦鑷敱鎬濇兂浜ゆ祦浼?- `docs/meetings/2026-02-26-ai-native-person-summit.md` 鈥?AI-native 鑼冨紡娣卞害宄颁細
- `docs/meetings/2026-02-26-playbook-reread-alignment.md` 鈥?Playbook 閲嶈瀵归綈浼?- `docs/research/build-in-public-channels-2026.md` 鈥?Build in Public 娓犻亾閫夊瀷璋冪爺
- `docs/strategy/brand-content-checklist.md` 鈥?鍗氭枃鍏淮搴﹀唴瀹瑰鏌ユ竻鍗?- `docs/strategy/brand-discussions-plan.md` 鈥?GitHub Discussions 棣栨壒鍙戝竷璁″垝
- `docs/reviews/v4.1.0-review.md` 鈥?v4.1.0 鍥為【鎬у鏌ユ姤鍛?
### Changed
- `.github/copilot-instructions.md` 鈥?鍚屾 Brand Agent銆佺煡璇嗗簱銆乂5 璺嚎鍥俱€佺増鏈鍒掕〃銆佸洟闃熻繘鍖栬褰曘€乄orktree 瑙勮寖
- `README.md` 鈥?鍏ㄩ潰鏇存柊鑷?v4.0.0+ 鐘舵€侊紙Agent 璺緞淇 + 鍔熻兘浜偣琛ュ厖 + Roadmap 鍚屾锛?- `BaseLayout.astro` 鈥?`data-lang` 灞炴€ч┍鍔ㄥ弻璇?CSS 鏄剧ず鎺у埗

### Fixed
- `njueeray.github.io` ThemeToggle 鈥?淇 `astro:after-swap` 閲嶅鐩戝惉鍣紙`window._themeListenerBound` 闃查噸锛?- `njueeray.github.io` ThemeToggle 鈥?棣栨璁块棶榛樿娣辫壊妯″紡锛堜笉鍐嶈窡闅忕郴缁熷亸濂斤級
- `.github/workflows/link-check.yml` 鈥?鏂板 wakatime / shields.io / hooj0.github.io / 鍗犱綅绗︽帓闄よ鍒?- `njueeRay/njueeRay` README 鈥?capsule-render fontSize 70鈫?0锛宒escAlignY 55鈫?3锛堟枃瀛楅伄鎸′慨澶嶏級
- `njueeRay/njueeRay` README 鈥?Tech Stack 鎵╁睍鑷?20 鍥炬爣锛宍perline=10` 鍙岃甯冨眬
- `njueeRay/njueeRay` README 鈥?Trophy 鏀逛负 `<picture>` 鍏冪礌锛坉ark/light 鍒嗙涓婚锛?- `njueeRay/njueeRay` README 鈥?3D Contribution Graph 澧炲姞 light 妯″紡 SVG锛坓reen-animate锛?- `njueeRay/njueeRay` README 鈥?Featured pin cards `cache_seconds=86400`
- GitHub Release v4.0.0 body 淇锛圲TF-8 PATCH锛?
### Playbook 鍗囩骇 (v2.0 鈫?v2.1)
- `team-playbook.md` 搂0 鈥?AI-native 鍝插绔嬪満绔犺妭
- `team-playbook.md` 搂3.3 鈥?璁ょ煡娓呮櫚搴﹀師鐞嗚ˉ鍏?- `team-playbook.md` 搂6 鈥?涓冪淮搴︹啋鍏淮搴︼紙鏂板 AI-native 鍋ュ悍搴︼級
- `team-playbook.md` 搂15.3/15.4 鈥?Release UTF-8 缂栫爜瑙勮寖淇
- 6 涓?Agent 鏂囦欢鏂板 `## AI-native 宸ヤ綔鍝插` 澹版槑
- `copilot-instructions.md` 鏂板 `## 鍝插閿氱偣 鈥?AI-native person`

---

## [4.0.0] 鈥?2026-02-26

> **涓夊眰鐗堟湰浣撶郴鐙珛鍖栵紙Playbook v2.0锛? Astro 绔欑偣浣撻獙娣卞寲**  
> **Playbook 鐗堟湰**锛歅laybook v2.0锛堣 docs/governance/PLAYBOOK-CHANGELOG.md锛? 
> code-reviewer: `APPROVED`

### Added

#### Phase V 鈥?鐗堟湰浣撶郴鐙珛鍖栵紙Playbook v2.0锛?- `docs/governance/PLAYBOOK-CHANGELOG.md` 鈥?鐙珛 L2 Playbook 鍙樻洿鏃ュ織锛岃В鑰﹂」鐩増鏈?- 涓夊眰鐗堟湰浣撶郴瑙勮寖锛圠1 Project / L2 Playbook / L3 Agent锛夊啓鍏?`team-playbook.md` 搂18
- 6 涓?Agent 鏂囦欢鍏ㄩ儴鏂板 `agentVersion: v1.0` 鍏冩暟鎹?- `copilot-instructions.md` 鏂板鐗堟湰鎬昏琛?+ 鍥㈤槦鑳藉姏蹇収鍗?- `team-playbook.md` 搂13.3 鎷涘嫙鍐崇瓥鏍?+ 搂17.3 鍐峰惎鍔ㄩ樁娈?3 鑳藉姏璇勪及 + 闄勫綍 C Agent 蹇収鍗℃牸寮?
#### Phase W 鈥?Astro 绔欑偣浣撻獙娣卞寲锛坣jueeray.github.io锛?- **W-1 Pagefind 鍏ㄧ珯鎼滅储** 鈥?`Search.astro` 鎼滅储寮圭獥 + Ctrl+K 蹇嵎閿?+ Nav 鎼滅储鎸夐挳
- **W-2 鏆楄壊/浜壊涓婚鍒囨崲** 鈥?`ThemeToggle.astro` + localStorage 鎸佷箙鍖?+ 绯荤粺鍋忓ソ璺熼殢 + `:root[data-theme="light"]` CSS 鍙橀噺
- **W-3 闃呰杩涘害鏉?* 鈥?`ReadingProgress.astro`锛屽崥瀹㈡枃绔犻《閮?3px 寮鸿皟鑹茶繘搴︽潯
- **W-4 鍗氬鐩綍 TOC** 鈥?`TableOfContents.astro`锛屽彸渚ц竟鏍?+ IntersectionObserver 楂樹寒 + 骞虫粦婊氬姩
- **W-5 Giscus 璇勮绯荤粺** 鈥?`Giscus.astro`锛岀粦瀹?njueeray.github.io GitHub Discussions (Announcements)锛屾敮鎸佷富棰樿仈鍔紱GitHub Discussions 宸插惎鐢紝Repo ID 宸查厤缃?
### Docs
- `docs/meetings/2026-02-26-v4-planning.md` 鈥?V4.0 鍏ㄤ綋瑙勫垝浼氳绾锛堜笁灞傜増鏈綋绯诲喅璁?+ Phase V/W/P 鎵ц璁″垝锛?- `docs/governance/design-decisions.md` 鈥?琛ュ綍 V3.0 SEO/鏍囩鍐崇瓥 + V4.0 绔欑偣澧炲己 + 鐗堟湰浣撶郴璁捐鍐崇瓥

---

## [3.0.0] 鈥?2026-02-26

> **SEO 鍦板熀 + Blog 鏍囩绯荤粺 + Profile 鏂扮粍浠?+ Playbook 鍙Щ妞嶅寲**
> code-reviewer: `APPROVED`

### Added

#### V3.0 Phase X 鈥?Astro 绔欑偣 SEO 鍦板熀
- `njueeray.github.io` 瀹夎 `@astrojs/sitemap@3.2.1` 鈫?`sitemap-index.xml` 鑷姩鐢熸垚
- `njueeray.github.io` 瀹夎 `@astrojs/rss` 鈫?`src/pages/rss.xml.ts`锛屽彲璁㈤槄 Feed锛堣瑷€ `zh-cn`锛?- `BaseLayout.astro` 鏂板 `ogImage` prop锛堝彲閫夛級锛屾潯浠舵€ф敞鍏?canonical / OG / Twitter Card meta tags
- 棣栭〉 `index.astro` 琛ュ厖鐙珛 description锛汧ooter 娣诲姞 RSS SVG 鍥炬爣鍏ュ彛
- `src/pages/404.astro` 鑷畾涔夌粓绔鏍?404 椤甸潰锛堝惈 鈫?Home / Blog 蹇嵎鎸夐挳锛?
#### V3.0 Phase Y 鈥?Blog 鏍囩绯荤粺
- `src/pages/blog/tags/index.astro` 鏍囩浜戦〉闈紙棰戞椹卞姩瀛楀彿娓愬彉锛宑ount badge锛?- `src/pages/blog/tags/[tag].astro` 鏍囩杩囨护椤甸潰锛? 鏉￠潤鎬佽矾鐢辫嚜鍔ㄧ敓鎴愶級
- `blog/index.astro` 鏂囩珷鍗＄墖缁撴瀯閲嶆瀯锛歵ag 浠庣埗绾?`<a>` 鍐呰縼鍑猴紝鍙樹负鐙珛 `<a>` 閾炬帴
- `[slug].astro` 鏂囩珷椤?tag pill 鍏ㄩ儴鏀逛负鍙偣鍑婚摼鎺?+ 銆屽叏閮ㄦ爣绛?鈫掋€嶅叆鍙?
#### V3.0 Phase Z 鈥?Profile README 鏂扮粍浠?- `njueeRay-profile` `.github/workflows/3d-contrib.yml` 鈥?姣忔棩 UTC 18:00 鑷姩鏇存柊 3D 璐＄尞鍥?SVG锛堟帹閫佸埌 `output` 鍒嗘敮锛?- `njueeRay-profile` README 鏂板 `## 馃弳 Achievements` 鍖哄潡 鈥?github-profile-trophy锛坉arkhub, 1脳6锛?- `njueeRay-profile` README 鎻掑叆 3D 璐＄尞鍥?`<details>` 鎶樺彔鍖哄潡锛坣ight-rainbow 涓婚 SVG锛?- `njueeRay-profile` README Connect 鍖烘坊鍔?Blog RSS Feed 璁㈤槄 badge

#### Playbook 娣卞寲 鈥?team-playbook.md
- 鏂板 搂12 鏂板洟闃熸帴鎵嬪崗璁紙鍥涢樁娈垫祦绋嬶細闈欓粯闃呰 鈫?瀵归綈浼氳 鈫?鐘舵€佹姤鍛?鈫?鍥㈤槦閫傞厤锛?- 鏂板 搂13 鍥㈤槦鑷富杩涘寲锛圔rain 浣滀负鏋舵瀯甯堬紝鑷富鎷涘嫙/鏀归€?鍋滅敤 Agent锛?- 鏂板 搂4.5 Emoji Commit 鍊¤锛?5 绉嶆槧灏勮〃锛?- 鏂板 搂5.4 鍥㈤槦鑷富鐗堟湰鍐崇瓥鏉冿紙PM 鍙戠増淇″彿 + Brain 鎻愭鏍煎紡锛?- 鏂板 搂14 Agent 缁忛獙娌夋穩鏈哄埗锛圠1/L2/L3 涓夊眰鐭ヨ瘑浣撶郴锛?- 鏂板 搂15 GitHub API 鎿嶄綔瑙勮寖锛堣法骞冲彴 Token 鎻愬彇锛孭owerShell + Bash锛?- 鏂板 搂16 寮€婧愰」鐩搧鐗屽寲瑙勮寖
- 鏂板 搂17 Playbook 瀹氬埗鎸囧崡锛堥浂涓婁笅鏂囧喎鍚姩鍗忚锛?- 闄勫綍 B 鎵╁厖 3 鏉℃柊鍙嶆ā寮?- `docs/meetings/2026-02-26-v3-release-review.md` V3.0 鍙戝竷鍓嶇粓瀹′細璁邯瑕?- `.github/copilot-instructions.md` 鏂板 Brain 鑷富鏉冮檺 + 鍥㈤槦杩涘寲璁板綍鍖哄潡

### Changed
- **Playbook 椤圭洰鏃犲叧鍖栭噸鏋勶紙Breaking锛夛細**
  - 娓呴櫎鍏ㄩ儴 OpenProfile 鐗瑰畾寮曠敤锛埪?.4/搂4.3/搂4.4/搂7/搂11锛?  - 搂4.3 Scope 鏀逛负閫氱敤 + 椤圭洰鐗瑰畾鐢?Brain 瀹氬埗
  - 搂4.5 Emoji 琛ㄥ幓閲嶏紝鍚箟鍒楀紩鐢?搂4.2
  - 搂9.2 docs/ 瀛愭枃浠跺す鍚嶆敼涓烘帹鑽愮ず渚?  - 搂9.5 棣栨 commit 妯℃澘鏀逛负閫氱敤
  - 搂15.2 琛ュ厖 macOS/Linux Bash 绛夋晥鍛戒护
  - 搂15.4 绮剧畝锛屾牳蹇冩楠ゅ紩鐢?搂5.2
  - 搂16 鍝佺墝鍖栬瑙夎瑷€鏀逛负鐢?Brain 鏍规嵁椤圭洰瀹氫綅鍐冲畾
  - 搂16.5 "Built with Copilot" badge 鐢卞繀閫夋敼涓哄彲閫?  - 灏鹃儴淇璁板綍绮剧畝涓虹増鏈彿 + 鏃ユ湡锛屽巻鍙蹭慨璁㈣縼鍏?CHANGELOG
- Playbook 鐗堟湰鏍囪瘑鏇存柊
- `copilot-instructions.md` 杩唬鐘舵€佹洿鏂?
### Fixed
- `OG/Twitter meta tags`锛歚og:image` 鏀逛负鏉′欢鎬ц緭鍑猴紝绉婚櫎涓嶅瓨鍦ㄧ殑 `/og-default.png` 榛樿鍊硷紙閬垮厤鍏ㄧ珯 OG 鍥剧墖 404锛?- `3d-contrib.yml`锛歸orkflow 鎺ㄩ€佺洰鏍囦粠 `main` 淇涓?`output` 鍒嗘敮锛屼笌 README 涓殑 SVG URL 璺緞淇濇寔涓€鑷?
---

## [2.0.0] 鈥?2026-02-25

### Added
- Profile README 鍖哄潡椤哄簭閲嶇粍锛圴2.0 鏂伴『搴忥細鍙欎簨鑺傚椹卞姩锛?- Profile README `<picture>` 鍙屾ā鍏煎锛堟殫/浜級锛欻eader / Footer / Stats / Streak / Activity Graph / Skill Icons / Featured / 璐＄尞铔?- Profile README JSON 鑷堪鎵╁睍鑷?12 瀛楁 + 鑻辨枃鍙欎簨娈?- Profile README Typing SVG 鏂囨鏀逛负涓汉韬唤鏍囩锛? 琛岋級
- Profile README WakaTime 鏀逛负 `<details>` 鎶樺彔鍖哄潡锛岄檮 fallback 璇存槑
- Profile README 鏂板 馃 Connect with Me 鍖哄潡锛圥ortfolio + GitHub + OpenProfile badge锛?- Profile README 鏂板椤甸潰娴忚璁℃暟鍣紙komarev.com锛?- Profile README 鏂板涓夊 capsule-render 娓愬彉鍒嗛殧绾?- Astro 绔欑偣鏂板鍥哄畾瀵艰埅鏍忥紙Nav.astro锛屾瘺鐜荤拑鏁堟灉锛?- Astro 绔欑偣鏂板椤佃剼锛團ooter.astro锛岀粓绔?echo 椋庢牸锛?- Astro 绔欑偣鎺ュ叆 ViewTransitions锛堥〉闈㈠垏鎹㈠姩鐢伙級
- Astro 绔欑偣鏂板 Blog 绯荤粺锛圕ontent Collections + @astrojs/mdx@3 + 2 绡囬鍙戞枃绔狅級
- GitHub Actions锛歭ink-check.yml锛坙ychee 閾炬帴鍙揪鎬ф鏌ワ級
- GitHub Actions锛歮arkdown-lint.yml锛圖avidAnson/markdownlint-cli2-action锛?- `.editorconfig` 缁熶竴缂栬緫鍣ㄧ缉杩涜鑼?- `.markdownlint.jsonc` Markdown 鏍煎紡瑙勮寖閰嶇疆
- `.gitattributes` 寮哄埗 LF 琛屽熬锛堥槻 Windows CRLF 姹℃煋锛?- Agent 鍥㈤槦 V2.0 閲嶆瀯锛氭柊澧?`brain`锛堟垬鐣ュ崗璋冿級+ `pm`锛堥」鐩鐞嗭級瑙掕壊
- Agent 鍥㈤槦 V2.0 閲嶆瀯锛歚content-writer` 鈫?`dev`锛堝叏鏍堥€氱敤瀹炵幇锛?- Agent 鍥㈤槦 V2.0 閲嶆瀯锛歚qa-reviewer` 鈫?`code-reviewer`锛堜竷缁村害璐ㄩ噺闂ㄧ锛?- 鏂板 `docs/governance/team-playbook.md`锛堝彲璺ㄩ」鐩鐢ㄧ殑鍥㈤槦鏂规硶璁烘墜鍐岋級
- 鏂板 `docs/meetings/2026-02-25-retrospective.md`锛堝鐩樹細璁?#003 绾锛?
### Changed
- Astro 绔欑偣 Projects 鍖哄潡锛氱Щ闄?MediaCrawler锛屾浛鎹负 wechat_article_exporter
- `copilot-instructions.md` Agent 鍥㈤槦琛ㄦ牸鍚屾涓?V2.0 浜旇鑹叉灦鏋?- `docs/governance/agent-workflow.md` 鏇存柊涓?Brain/PM/Dev/Researcher/CodeReviewer 鎷撴墤
- CHANGELOG `[Unreleased]` 鎷嗗垎锛氶噸鍛藉悕涓?`[1.0.0]`锛屽惎鐢ㄧ増鏈姣旈摼鎺?
---

## [1.0.0] 鈥?2026-02-25

### Added
- 鍒濆鍖栭」鐩洰褰曠粨鏋?- 鍒涘缓 `.github/copilot-instructions.md` 涓绘寚浠ゆ枃浠?- 鍒涘缓 `.github/agents/` 涓撻」 Agent 鍥㈤槦锛坧rofile-designer銆乨ev銆乺esearcher銆乧ode-reviewer锛?- 鍒涘缓 `.vscode/` 宸ュ叿闆嗗拰 MCP 閰嶇疆
- 鍒涘缓 `docs/governance/design-decisions.md` 璁捐鍐崇瓥鏃ュ織
- 娣诲姞寮€婧愬伐绋嬭鑼冩枃浠讹紙CONTRIBUTING.md銆丆HANGELOG.md銆丩ICENSE锛?- 娣诲姞 GitHub Issue 妯℃澘鍜?PR 妯℃澘
- 鎺ㄩ€?`njueeRay/OpenProfile` 浠撳簱锛圓I-Native 宸ヤ綔娴佸紑婧愭ā鏉匡級
- 鎺ㄩ€?`njueeRay/njueeray.github.io` 浠撳簱锛圓stro 4.x 涓汉绠€鍘嗙珯鐐癸級
- 娣诲姞 `docs/meetings/2026-02-25-kickoff.md` 鍚姩浼氳绾
- Profile README 鎺ュ叆 WakaTime锛坅nmol098/waka-readme-stats锛?- Profile README 鎺ュ叆 Contribution Snake锛圥latane/snk锛?- Profile README 鎺ュ叆 Activity Graph锛坓ithub-readme-activity-graph锛?- Astro 绔欑偣 About 鍖哄潡濉叆 LLM Engineer 鍙欎簨鏂囨
- Astro 绔欑偣 Projects 鍖哄潡濉叆 3 涓湡瀹為」鐩暟鎹?
### Changed
- Profile README Stats/Streak 涓婚缁熶竴涓?`github_dark_dimmed` / `github-dark-blue`锛堣В鍐虫挒鑹查棶棰橈級
- Profile README Featured锛歁ediaCrawler 鈫?wechat_article_exporter
- Astro 绔欑偣寮鸿皟鑹茬粺涓€涓?`#58a6ff`锛堜笌 Profile README 鍝佺墝涓€鑷达級
- Hero 缁勪欢浼樺寲锛氭坊鍔犳妧鏈爤鏍囩銆亃sh 椋庢牸鎻愮ず绗︺€丟itHub 鍥炬爣鎸夐挳
- Projects 缁勪欢锛歠ork 鏍囩浣跨敤榛勮壊宸紓鍖栨牱寮?
### Fixed
- Astro 鐗堟湰浠?5.x 闄嶇骇鑷?4.16.18锛堣В鍐?`ohash@^2.0.11` 渚濊禆缂哄け闂锛?- OpenProfile git 鏍圭洰褰曚慨澶嶏紙浠庣埗鐩綍绉诲姩鍒扮嫭绔嬩粨搴擄級
- Profile README git.io 鐭摼淇 鈫?鐩存帴浣跨敤瀹屾暣 URL

### Docs
- 鍏ㄩ噺鍚屾 6 浠借繃鏃舵枃妗ｏ紙design-decisions銆乵eeting minutes銆乤gent-workflow銆乧omponent-guide銆丷EADME銆丆ONTRIBUTING锛?- copilot-instructions.md 璁捐閫夋嫨鍚屾鑷冲疄闄呯姸鎬?- CHANGELOG 鐗堟湰瑙勫垝琛ㄤ慨姝?
---

## 鐗堟湰瑙勫垝

| 鐗堟湰 | 鐩爣 | 鐘舵€?|
|------|------|------|
| v0.1.0 | 椤圭洰鍒濆鍖栵細鐩綍缁撴瀯 + Agent 閰嶇疆 | 鉁?瀹屾垚 |
| v0.2.0 | 棣栫増 README锛氬熀纭€淇℃伅 + Stats 缁勪欢 | 鉁?瀹屾垚 |
| v0.3.0 | 瑙嗚鍗囩骇锛欻eader 鍔ㄧ敾 + 鎶€鏈爤鍥炬爣 | 鉁?瀹屾垚 |
| v0.4.0 | 鍔ㄦ€佹暟鎹細WakaTime + Activity Graph + 璐＄尞铔?| 鉁?瀹屾垚 |
| v1.0.0 | 杩唬涓€瀹屾垚锛氬叏缁勪欢涓婄嚎 + 鏂囨。鍚屾 + 寮€婧愬彂甯?| 鉁?瀹屾垚 |
| **v2.0.0** | **鍙欎簨閲嶆瀯 + 娴呰壊鍏煎 + Astro 澶氶〉 + CI + Agent 鍥㈤槦閲嶆瀯** | 鉁?瀹屾垚 |
| **v3.0.0** | **SEO 鍦板熀 + Blog 鏍囩绯荤粺 + Profile 鏂扮粍浠?+ Playbook 鍙Щ妞嶅寲** | 鉁?瀹屾垚 |
| **v4.0.0** | **涓夊眰鐗堟湰浣撶郴鐙珛鍖?+ Astro 绔欑偣浣撻獙娣卞寲** | 鉁?瀹屾垚 |
| **v4.1.0** | **鍥㈤槦鍝佺墝鍖?+ 鍐呭鏋舵瀯** | 鉁?瀹屾垚 |
| v4.2.0 | 宸ョ▼璐ㄩ噺 Sprint 鈥?CSS 缁熶竴 / 缁勪欢鎷嗗垎 / 鍝嶅簲寮?| 鉁?瀹屾垚 |
| v4.3.0 | 绀惧尯棣栧彂 Sprint 鈥?Discussions / README 鐫€闄嗛〉 / Good First Issues | 鉁?瀹屾垚 |
| v4.4.0 | 浣撻獙绮句慨 Sprint 鈥?寰氦浜?/ 棣栭〉澧炲己 / a11y / 鍥㈤槦鍔ㄦ€佸 | 猬?瑙勫垝涓?|
| v4.5.0 | SEO & 鎬ц兘 Sprint 鈥?JSON-LD / Lighthouse CI / Astro 5 璋冪爺 | 猬?瑙勫垝涓?|
| **v5.0.0** | **鏋舵瀯鎬у崌绾?鈥?Astro 5 杩佺Щ锛堥棬妲涜Е鍙戯級** | 猬?杩滄湡 |

---

[Unreleased]: https://github.com/njueeRay/OpenProfile/compare/v4.3.0...HEAD
[4.3.0]: https://github.com/njueeRay/OpenProfile/compare/v4.2.0...v4.3.0
[4.2.0]: https://github.com/njueeRay/OpenProfile/compare/v4.1.0...v4.2.0
[4.1.0]: https://github.com/njueeRay/OpenProfile/compare/v4.0.0...v4.1.0
[4.0.0]: https://github.com/njueeRay/OpenProfile/compare/v3.0.0...v4.0.0
[3.0.0]: https://github.com/njueeRay/OpenProfile/compare/v2.0.0...v3.0.0
[2.0.0]: https://github.com/njueeRay/OpenProfile/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/njueeRay/OpenProfile/releases/tag/v1.0.0

