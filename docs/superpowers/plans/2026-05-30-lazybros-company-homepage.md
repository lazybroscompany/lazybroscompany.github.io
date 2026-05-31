# LazyBros Company Homepage Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a static GitHub Pages homepage for LazyBros Company with a light-mode company introduction, app policy hub, and a readable `주차기록` privacy policy page.

**Architecture:** Keep the repository no-build and static. `index.html` owns page content, `assets/css/styles.css` owns shared visual system styles, `assets/fonts/` stores copied LazyBros font files, and `lazyparking/privacy_policy.html` provides a readable HTML conversion of the existing text policy while preserving `privacy_policy.txt`.

**Tech Stack:** Static HTML, CSS custom properties, local fonts, shell-based content verification, GitHub Pages.

---

## Files

- Create: `/Users/kunheekim/Lazybros/home/index.html`
- Create: `/Users/kunheekim/Lazybros/home/assets/css/styles.css`
- Create: `/Users/kunheekim/Lazybros/home/lazyparking/privacy_policy.html`
- Create: `/Users/kunheekim/Lazybros/home/scripts/verify_static_site.sh`
- Create: `/Users/kunheekim/Lazybros/home/.gitignore`
- Copy: `/Users/kunheekim/Lazybros/design-components/design-components-all/font/paybooc *.ttf` to `/Users/kunheekim/Lazybros/home/assets/fonts/`
- Preserve: `/Users/kunheekim/Lazybros/home/app-ads.txt`
- Preserve: `/Users/kunheekim/Lazybros/home/google04098259f4b4bb7a.html`
- Preserve: `/Users/kunheekim/Lazybros/home/lazyparking/privacy_policy.txt`

## Task 1: Static Verification Script

**Files:**
- Create: `scripts/verify_static_site.sh`

- [ ] **Step 1: Write the failing verification script**

Create `scripts/verify_static_site.sh`:

```bash
#!/usr/bin/env bash
set -euo pipefail

require_file() {
  local path="$1"
  if [[ ! -f "$path" ]]; then
    echo "Missing required file: $path" >&2
    exit 1
  fi
}

require_text() {
  local path="$1"
  local text="$2"
  if ! grep -Fq "$text" "$path"; then
    echo "Missing required text in $path: $text" >&2
    exit 1
  fi
}

require_absent() {
  local path="$1"
  local text="$2"
  if grep -Fq "$text" "$path"; then
    echo "Unexpected text in $path: $text" >&2
    exit 1
  fi
}

require_file "index.html"
require_file "assets/css/styles.css"
require_file "assets/fonts/paybooc-Light.ttf"
require_file "assets/fonts/paybooc-Medium.ttf"
require_file "assets/fonts/paybooc-Bold.ttf"
require_file "assets/fonts/paybooc-ExtraBold.ttf"
require_file "lazyparking/privacy_policy.txt"
require_file "lazyparking/privacy_policy.html"
require_file "app-ads.txt"
require_file "google04098259f4b4bb7a.html"

require_text "index.html" '<html lang="ko">'
require_text "index.html" "LazyBros Company"
require_text "index.html" "생활 속 작은 불편을 가볍고 똑똑한 앱으로 바꿉니다."
require_text "index.html" "주차기록"
require_text "index.html" "lazyparking/privacy_policy.html"
require_text "index.html" "LazyBros Company | lazybroscompany@gmail.com"
require_text "index.html" "Copyright(c) 2026 LazyBros company All rights reserved"
require_text "index.html" 'id="company"'
require_text "index.html" 'id="policies"'
require_text "index.html" 'href="app-ads.txt"'
require_absent "index.html" "terms.html"

require_text "assets/css/styles.css" "--lb-bg: #ffffff;"
require_text "assets/css/styles.css" "--lb-card: #e9e9e9;"
require_text "assets/css/styles.css" "--lb-orange: #ff7518;"
require_text "assets/css/styles.css" "@font-face"
require_text "assets/css/styles.css" "@media (max-width: 760px)"

require_text "lazyparking/privacy_policy.html" '<html lang="ko">'
require_text "lazyparking/privacy_policy.html" "개인정보처리방침"
require_text "lazyparking/privacy_policy.html" "시행일: 2025년 5월 18일"
require_text "lazyparking/privacy_policy.html" "위치 정보 (GPS)"
require_text "lazyparking/privacy_policy.html" "카메라 접근 권한"
require_text "lazyparking/privacy_policy.html" "사진 및 미디어"
require_text "lazyparking/privacy_policy.html" "Google AdMob"
require_text "lazyparking/privacy_policy.html" "https://policies.google.com/privacy"
require_text "lazyparking/privacy_policy.html" "회사 서버로 전송되지 않음"
require_text "lazyparking/privacy_policy.html" "lazybroscompany@gmail.com"

echo "Static site verification passed."
```

- [ ] **Step 2: Run verification to confirm RED**

Run: `bash scripts/verify_static_site.sh`

Expected: `FAIL` with `Missing required file: index.html`.

## Task 2: Shared CSS and Fonts

**Files:**
- Create: `assets/css/styles.css`
- Copy: `assets/fonts/*.ttf`

- [ ] **Step 1: Copy approved LazyBros fonts**

Run:

```bash
cp "/Users/kunheekim/Lazybros/design-components/design-components-all/font/paybooc Light.ttf" assets/fonts/paybooc-Light.ttf
cp "/Users/kunheekim/Lazybros/design-components/design-components-all/font/paybooc Medium.ttf" assets/fonts/paybooc-Medium.ttf
cp "/Users/kunheekim/Lazybros/design-components/design-components-all/font/paybooc Bold.ttf" assets/fonts/paybooc-Bold.ttf
cp "/Users/kunheekim/Lazybros/design-components/design-components-all/font/paybooc ExtraBold.ttf" assets/fonts/paybooc-ExtraBold.ttf
```

- [ ] **Step 2: Create CSS token and layout system**

Create `assets/css/styles.css` with:

```css
@font-face {
  font-family: "Paybooc";
  src: url("../fonts/paybooc-Light.ttf") format("truetype");
  font-weight: 300;
  font-style: normal;
  font-display: swap;
}

@font-face {
  font-family: "Paybooc";
  src: url("../fonts/paybooc-Medium.ttf") format("truetype");
  font-weight: 400;
  font-style: normal;
  font-display: swap;
}

@font-face {
  font-family: "Paybooc";
  src: url("../fonts/paybooc-Medium.ttf") format("truetype");
  font-weight: 500;
  font-style: normal;
  font-display: swap;
}

@font-face {
  font-family: "Paybooc";
  src: url("../fonts/paybooc-Bold.ttf") format("truetype");
  font-weight: 700;
  font-style: normal;
  font-display: swap;
}

@font-face {
  font-family: "Paybooc";
  src: url("../fonts/paybooc-ExtraBold.ttf") format("truetype");
  font-weight: 800;
  font-style: normal;
  font-display: swap;
}

:root {
  --lb-bg: #ffffff;
  --lb-card: #e9e9e9;
  --lb-card-hover: #d9d9d9;
  --lb-card-active: #cfcfcf;
  --lb-border: #e9e9e9;
  --lb-border-hover: #d0d0d0;
  --lb-divider: #e9e9e9;
  --lb-text: #1b1b1b;
  --lb-text-sub: #464545;
  --lb-text-muted: #8a8a8a;
  --lb-text-dim: #c0c0c0;
  --lb-orange: #ff7518;
  --lb-orange-dim: #f54703;
  --lb-orange-soft: rgba(255,117,24,0.12);
  --lb-shadow: 0 2px 12px rgba(0,0,0,0.06), 0 1px 3px rgba(0,0,0,0.04);
}
```

Then add responsive layout classes for header, hero, cards, policy grids, legal pages, and `@media (max-width: 760px)`.

## Task 3: Homepage HTML

**Files:**
- Create: `index.html`

- [ ] **Step 1: Create homepage**

Create `index.html` using semantic static HTML:

```html
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LazyBros Company</title>
  <meta name="description" content="LazyBros Company 공식 홈페이지와 앱별 개인정보처리방침 및 약관 안내 허브입니다.">
  <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
  <header class="site-header">
    <nav class="site-nav" aria-label="주요 메뉴">
      <a class="brand" href="#top" aria-label="LazyBros Company 홈">
        <span class="brand-mark">L</span>
        <span>LazyBros Company</span>
      </a>
      <div class="nav-links">
        <a href="#company">Company</a>
        <a href="#apps">Apps</a>
        <a href="#policies">Policies</a>
        <a href="#contact">Contact</a>
      </div>
    </nav>
  </header>

  <main id="top">
    <section class="hero" aria-labelledby="hero-title">
      <div class="hero-copy">
        <p class="eyebrow">Work smart, not hard</p>
        <h1 id="hero-title">생활 속 작은 불편을 가볍고 똑똑한 앱으로 바꿉니다.</h1>
        <p class="hero-text">LazyBros는 모바일 앱을 만들고 운영하는 작은 제품 회사입니다. 이곳에서는 회사 소개와 함께 Google Play 등록에 필요한 앱별 개인정보처리방침, 서비스 약관, 광고 안내를 한곳에서 확인할 수 있습니다.</p>
        <div class="hero-actions">
          <a class="button primary" href="#policies">앱 정책 보기</a>
          <a class="button secondary" href="#company">회사 소개</a>
        </div>
      </div>
      <aside class="hero-panel" aria-labelledby="featured-app-title">
        <p class="status-pill"><span></span> Policy hub</p>
        <article class="app-preview">
          <div class="card-title-row">
            <h2 id="featured-app-title">주차기록</h2>
            <span class="app-status">Active</span>
          </div>
          <p>위치 기반 주차 정보와 사진 기록을 기기 내에 안전하게 저장하는 앱</p>
          <ul class="feature-list">
            <li>개인정보처리방침 · 위치 / 카메라 / 사진 권한 안내</li>
            <li>광고 안내 · Google AdMob 및 맞춤형 광고 거부</li>
            <li>보관 원칙 · 회사 서버 전송 없음, 앱 삭제 시 함께 삭제</li>
          </ul>
        </article>
      </aside>
    </section>
  </main>
</body>
</html>
```

Then complete the same file with `company`, `apps`, `policies`, and `contact` sections plus required footer text.

## Task 4: 주차기록 Privacy Policy HTML

**Files:**
- Create: `lazyparking/privacy_policy.html`

- [ ] **Step 1: Convert the current text policy into HTML**

Create `lazyparking/privacy_policy.html` with:

```html
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>주차기록 개인정보처리방침 | LazyBros Company</title>
  <meta name="description" content="LazyBros Company 주차기록 앱 개인정보처리방침입니다.">
  <link rel="stylesheet" href="../assets/css/styles.css">
</head>
<body>
  <header class="site-header">
    <nav class="site-nav" aria-label="주요 메뉴">
      <a class="brand" href="../index.html">
        <span class="brand-mark">L</span>
        <span>LazyBros Company</span>
      </a>
      <div class="nav-links">
        <a href="../index.html#company">Company</a>
        <a href="../index.html#policies">Policies</a>
        <a href="privacy_policy.txt">Text version</a>
      </div>
    </nav>
  </header>
  <main class="legal-page">
    <article class="legal-document">
      <p class="eyebrow">주차기록</p>
      <h1>개인정보처리방침</h1>
      <p class="legal-date">시행일: 2025년 5월 18일</p>
    </article>
  </main>
</body>
</html>
```

Then add all policy articles from `lazyparking/privacy_policy.txt` faithfully.

## Task 5: Verify and Browser Check

**Files:**
- Create: `.gitignore`

- [ ] **Step 1: Ignore local brainstorming artifacts**

Create `.gitignore`:

```gitignore
.DS_Store
.superpowers/
```

- [ ] **Step 2: Run static verification**

Run: `bash scripts/verify_static_site.sh`

Expected: `Static site verification passed.`

- [ ] **Step 3: Run local server**

Run: `python3 -m http.server 8080`

Expected: local static site is available at `http://localhost:8080/`.

- [ ] **Step 4: Browser check desktop and mobile**

Open `http://localhost:8080/` and verify:

- Header and hero render.
- `주차기록` app card is visible.
- Policy button opens `lazyparking/privacy_policy.html`.
- Footer required strings are present.
- No text overlaps at desktop width.

Set mobile viewport around 390px wide and verify:

- Hero stacks into one column.
- Cards stack into one column.
- Navigation does not overlap.
- Buttons wrap cleanly.

## Self-review

- Spec coverage: homepage, app policy hub, `주차기록` privacy HTML, design-system light tokens, required footer strings, preservation of existing files, and responsive verification are covered.
- Placeholder scan: no `TBD`, `TODO`, or unowned legal terms page is included.
- Type/name consistency: file paths match the approved design spec and verification script.
