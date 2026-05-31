# LazyBros Company Homepage Design

Date: 2026-05-30
Status: Approved design direction, awaiting implementation plan
Target repository: `/Users/kunheekim/Lazybros/home`
Target public URL: `https://lazybroscompany.github.io/home/`

## 1. Summary

LazyBros needs a public GitHub Pages homepage that serves two roles at once:

1. A main company homepage for LazyBros Company.
2. A stable app policy and terms hub for Google Play Store app submissions.

The approved direction is the "balanced hub" structure: the first viewport introduces LazyBros as a company while immediately making app policies discoverable. The visual direction references Start Bootstrap Landing Page's simple landing-page flow, but the final site should use LazyBros' own design system language from `design-components-all`, especially the light theme.

The first app to include is `주차기록`. Its current policy source is:

- `/Users/kunheekim/Lazybros/home/lazyparking/privacy_policy.txt`

The homepage must include `주차기록` as the first app card and expose the key privacy topics from that policy.

## 2. Goals

The site must:

- Explain who LazyBros Company is.
- Provide a clear policy center for every app operated by LazyBros.
- Support Google Play Store review needs by providing stable, public, app-specific policy URLs.
- Include `주차기록` and its current privacy policy content.
- Be easy to extend when more LazyBros apps are added.
- Use a white and orange light-mode visual system based on `design-components-all`.
- Preserve the required company identity and copyright text:
  - `LazyBros Company | lazybroscompany@gmail.com`
  - `Copyright(c) 2026 LazyBros company All rights reserved`

## 3. Non-goals

This first version will not include:

- User accounts, admin dashboards, or CMS editing.
- A backend server.
- Analytics or tracking.
- Contact forms that transmit data.
- Complex animations or heavy JavaScript.
- Dark mode as the default visual direction.

Dark mode may be added later, but the approved design for this homepage is light mode first.

## 4. References

### Start Bootstrap Landing Page

Use as structural inspiration only:

- Top navigation with brand and section links.
- First-screen hero with a clear headline and call-to-action.
- Feature cards below the hero.
- Clean section rhythm.
- Simple footer.

Do not copy the template verbatim. The homepage should look like LazyBros, not a stock Bootstrap page.

### LazyBros Design System

Reference files:

- `/Users/kunheekim/Lazybros/design-components/design-components-all/WORK_INSTRUCTION.md`
- `/Users/kunheekim/Lazybros/design-components/design-components-all/tokens.js`
- `/Users/kunheekim/Lazybros/design-components/design-components-all/theme.jsx`
- `/Users/kunheekim/Lazybros/design-components/design-components-all/demo.html`

Use the light theme as the visual base:

- Background: `#ffffff`
- Card: `#e9e9e9`
- Card hover: `#d9d9d9`
- Card active: `#cfcfcf`
- Border: `#e9e9e9`
- Border hover: `#d0d0d0`
- Text primary: `#1b1b1b`
- Text sub: `#464545`
- Text muted: `#8a8a8a`
- Text dim: `#c0c0c0`
- Accent orange: `#ff7518`
- Accent dim / danger orange: `#f54703`

Use the design system spacing and shape conventions:

- 8px spacing grid.
- 14px default border radius.
- 10px smaller radius for compact internal elements.
- 20px large radius only for larger framed surfaces.
- Orange is the only primary accent color.

## 5. Approved Visual Direction

The approved mockup is B: "company introduction + app policy hub balanced layout."

Color direction:

- White background.
- Light gray cards.
- Orange primary actions and status accents.
- Black and charcoal text for hierarchy.
- No dark charcoal page background for the main homepage.

Tone:

- Clear, trustworthy, and practical.
- Friendly enough for a small app company, but structured enough for policy review.
- Minimal, not decorative.
- Information-dense but still breathable.

The first screen should make these points obvious:

- This is LazyBros Company.
- LazyBros makes small useful mobile apps.
- This site is also the official place for app policies and terms.
- `주차기록` is currently available and has policy details.

## 6. Information Architecture

### Main homepage

Recommended file:

- `/Users/kunheekim/Lazybros/home/index.html`

Recommended sections:

1. Header navigation
2. Hero: company introduction and policy-hub positioning
3. Featured app card: `주차기록`
4. Company focus cards
5. App policy center
6. Footer

### App-specific policy pages

Recommended URL pattern:

- `/home/<app-slug>/privacy_policy.html`
- `/home/<app-slug>/terms.html`

For the first app:

- Existing plain text policy: `/home/lazyparking/privacy_policy.txt`
- New readable HTML policy page: `/home/lazyparking/privacy_policy.html`
- Terms page URL reserved for approved terms text: `/home/lazyparking/terms.html`

The existing `.txt` policy should be preserved for compatibility. The HTML page should be the user-friendly version linked from the homepage and suitable for Google Play policy URLs.

The app-specific folder model must support separate terms for each app. For `주차기록`, legal terms text has not been provided yet, so the first implementation must not invent a terms document. The homepage should expose the privacy policy now and keep the app folder/URL convention ready for a future approved `terms.html`.

## 7. Page Content Design

### Header

Brand:

- Logo mark: `KakaoTalk_Photo_2026-05-31-14-16-55 004.png` from `design-components-all/Lazybros_image`, reused for the header mark, browser tab icon, and mobile home screen icons.
- Text: `LazyBros Company`

Navigation:

- Company
- Policies
- Contact

The shared header stays fixed at the top while scrolling on both the homepage and app policy pages. Anchor links include enough scroll offset so section titles remain visible below the header.

Behavior:

- On a static single page, nav items can use anchor links.
- No dropdown is required for version 1.

### Hero

Purpose:

- Make the company identity and policy-hub role clear immediately.

Proposed headline:

> 생활 속 작은 불편을 가볍고 똑똑한 앱으로 바꿉니다.

Supporting copy:

> LazyBros는 모바일 앱을 만들고 운영하는 작은 제품 회사입니다. 이곳에서는 회사 소개와 함께 Google Play 등록에 필요한 앱별 개인정보처리방침, 서비스 약관, 광고 안내를 한곳에서 확인할 수 있습니다.

Primary CTA:

- `앱 정책 보기`
- Anchor target: `#policies`

Secondary CTA:

- `회사 소개`
- Anchor target: `#company`

### Hero app preview

Purpose:

- Show `주차기록` immediately as a real app and policy example.

Content:

- App name: `주차기록`
- Status badge: `Active`
- Description: 위치 기반 주차 정보와 사진 기록을 기기 내에 안전하게 저장하는 앱
- Policy bullets:
  - 개인정보처리방침: 위치 / 카메라 / 사진 권한 안내
  - 광고 안내: Google AdMob 및 맞춤형 광고 거부
  - 보관 원칙: 회사 서버 전송 없음, 앱 삭제 시 함께 삭제

### Company section

Purpose:

- Provide enough company context without becoming a long marketing page.

Cards:

1. Small useful apps
   - 주차, 생활 기록, 알림처럼 사용자의 작은 순간을 더 편하게 만드는 앱을 만듭니다.
2. Privacy-first notices
   - 앱마다 어떤 권한을 왜 쓰는지, 어디에 저장되는지 쉽게 확인할 수 있게 관리합니다.
3. Simple support
   - 문의는 `lazybroscompany@gmail.com` 한 곳에서 받고, 앱별 공지와 정책 링크를 연결합니다.

### App policy center

Purpose:

- Be the authoritative index for all LazyBros app policy documents.

Initial featured app card:

- App: `주차기록`
- Slug: `lazyparking`
- Summary: 위치 기반 주차 정보 서비스, 사진 촬영 및 갤러리 불러오기, AdMob 광고 안내 포함
- Main actions: `개인정보처리방침`, `권한 안내`
- Target: `/home/lazyparking/privacy_policy.html`

Scalable app directory:

- Keep the orange featured app card for the primary or latest app.
- Add a compact app directory beside or below the featured card.
- Include app search, state/category filters, visible app count, app status, category, update date, and direct policy actions.
- For `주차기록`, expose `개인정보`, `권한 안내`, and `광고 안내` links from the directory row.

### Contact

- Show `LazyBros Company` with the adjacent tagline `Lazy doesn't mean Stupid`.
- Align the tagline so its right edge visually tracks with the contact description line on desktop.
- Keep `lazybroscompany@gmail.com` as the primary mail action.

### Footer

Required content:

- `LazyBros Company | lazybroscompany@gmail.com`
- `Copyright(c) 2026 LazyBros company All rights reserved`

No secondary footer links are shown. App policy and `app-ads.txt` access remain available from their purpose-built sections and direct file paths.

## 8. 주차기록 Privacy Policy Content Requirements

The `주차기록` privacy page must include the current policy from `lazyparking/privacy_policy.txt` in full or in a faithful HTML conversion.

Important policy facts to preserve:

- Policy title: `개인정보처리방침`
- Effective date: `2025년 5월 18일`
- Company name: `레이지브로즈`
- App name: `주차기록`
- Contact email: `lazybroscompany@gmail.com`

Processing purposes:

- 위치 기반 주차 정보 서비스 제공
- 카메라 및 사진을 통한 주차 기록 기능 제공
- 서비스 개선 및 맞춤형 광고 제공

Processed data categories:

- 위치 정보 (GPS)
- 카메라 접근 권한
- 사진 및 미디어 접근 권한

Retention/storage principle:

- 위치 정보는 서비스 이용 중에만 처리되며 앱 삭제 시 함께 삭제됩니다.
- 사진 및 카메라 정보는 기기 내에만 저장되며 회사 서버로 전송되지 않습니다.

Third-party and ads:

- Google AdMob is used for advertising.
- Google LLC may collect device identifiers such as advertising ID for ad optimization.
- Include Google privacy policy URL: `https://policies.google.com/privacy`
- Explain that users can reset the advertising ID or opt out of personalized ads in device settings.

Data subject rights:

- 처리 현황 통지 및 열람 요구
- 정정 요구
- 삭제 요구
- 처리 정지 요구

Security:

- Location and camera/photo data are stored and processed on device.
- Data is deleted when the app is deleted.

Policy changes:

- Changes are announced in-app 7 days before taking effect.

## 9. Technical Design

### Implementation style

Use a static GitHub Pages implementation.

Recommended files:

- `index.html`
- `assets/css/styles.css`
- `assets/fonts/paybooc-Light.ttf`
- `assets/fonts/paybooc-Medium.ttf`
- `assets/fonts/paybooc-Bold.ttf`
- `assets/fonts/paybooc-ExtraBold.ttf`
- `lazyparking/privacy_policy.html`

The site does not need a build step for version 1. A no-build static setup is easier to maintain and fits the current repository, which already contains static files.

### CSS architecture

Use CSS custom properties mirroring the LazyBros light theme tokens:

- `--lb-bg`
- `--lb-card`
- `--lb-card-hover`
- `--lb-border`
- `--lb-border-hover`
- `--lb-text`
- `--lb-text-sub`
- `--lb-text-muted`
- `--lb-orange`
- `--lb-orange-dim`
- `--lb-orange-soft`

Do not hardcode random colors outside the approved token set. The final CSS may define the token values once, then use variables everywhere.

### Font setup

Use `Paybooc` font-face behavior from the design system across the homepage and app policy pages:

- Light: weight 300.
- Medium: weights 400 and 500.
- Bold: weight 700.
- ExtraBold: weight 800.

If font file size or licensing becomes a concern, fall back to system fonts for version 1. However, the preferred implementation is to copy the existing design-system font files into `assets/fonts/`.

### Layout behavior

Desktop:

- Header: horizontal brand and nav.
- Hero: two-column layout, text left and app/policy preview right.
- Company cards: three columns.
- Policy center: one large featured app card plus a compact searchable app policy directory.

Mobile:

- Header: brand only or collapsed simple links.
- Hero stacks into one column.
- Cards become single-column.
- Buttons wrap instead of shrinking text.

### Accessibility

Minimum requirements:

- Use semantic HTML landmarks: `header`, `main`, `section`, `footer`.
- Use one `h1`.
- Use descriptive link text, especially for policy URLs.
- Ensure orange buttons have enough contrast by using white text.
- Do not rely on color alone for meaning.
- Keep focus states visible.
- Add `lang="ko"` to the document.

### External dependencies

Preferred:

- No JavaScript dependency.
- No external CDN required.

Acceptable:

- Bootstrap can be used as structural reference, but importing Bootstrap is not required.

Rationale:

- The repository is currently static and small.
- GitHub Pages can serve plain HTML/CSS directly.
- Avoiding a build step reduces maintenance work for future policy updates.

## 10. URL and Link Requirements

Expected public URLs after implementation:

- Company homepage: `https://lazybroscompany.github.io/home/`
- App ads file: `https://lazybroscompany.github.io/home/app-ads.txt`
- Google verification file: `https://lazybroscompany.github.io/home/google04098259f4b4bb7a.html`
- 주차기록 plain-text privacy policy: `https://lazybroscompany.github.io/home/lazyparking/privacy_policy.txt`
- 주차기록 HTML privacy policy: `https://lazybroscompany.github.io/home/lazyparking/privacy_policy.html`

The existing `app-ads.txt` and Google verification HTML file must remain available at their current paths.

## 11. Content Management Model

For each app, use a folder under the repository root:

```text
<app-slug>/
  privacy_policy.txt
  privacy_policy.html
  terms.html
```

The homepage should maintain a visible searchable list of apps and policy links. When adding a new app, update only:

- New app folder and policy files.
- The app directory row in `index.html`.

No database or CMS is needed.

## 12. Testing and Verification Plan

Before completion, verify:

- `index.html` opens locally and renders the homepage.
- `lazyparking/privacy_policy.html` opens locally and contains the full policy content.
- Footer includes both required company strings exactly.
- Links from homepage to policy page work.
- Existing files still exist:
  - `app-ads.txt`
  - `google04098259f4b4bb7a.html`
  - `lazyparking/privacy_policy.txt`
- Mobile layout does not overflow at narrow viewport width.
- Text does not overlap cards or buttons.

Suggested manual checks:

- Desktop viewport around 1280px wide.
- Mobile viewport around 390px wide.

Suggested command checks:

- `git status --short`
- Static file existence checks with `find`.
- Local browser verification through the in-app browser.

## 13. Implementation Notes

The design should not commit `.superpowers/` brainstorming mockups. Those are temporary visual collaboration artifacts.

The existing `.DS_Store` file is unrelated and should not be staged as part of this work.

When implementation begins, avoid modifying unrelated repository files. Preserve current policy text while adding a more readable HTML version.

## 14. Implementation Defaults

The approved design is clear enough to implement with these defaults:

- Use `KakaoTalk_Photo_2026-05-31-14-16-55 004.png` for the header logo, favicon, and mobile home screen icons.
- Do not publish a legal `terms.html` page until app-specific terms text is provided and approved.
- Copy the design-system paybooc font files into the homepage repository unless the file size causes a practical problem during implementation.
