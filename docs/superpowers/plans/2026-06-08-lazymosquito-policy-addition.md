# 모기퇴치 앱 정책 추가 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add the `모기퇴치` app notice and policy content to the LazyBros homepage without changing unrelated site behavior.

**Architecture:** Keep the existing static HTML/CSS structure. Add a new `lazymosquito` app folder with a preserved plain-text notice and an HTML policy page that reuses the existing legal-page layout, then add one new row to the homepage policy directory.

**Tech Stack:** Static HTML, CSS, Bash verification script, GitHub Pages.

---

### Task 1: Add Verification Coverage

**Files:**
- Modify: `/Users/kunheekim/Lazybros/home/scripts/verify_static_site.sh`

- [ ] **Step 1: Add failing checks for the new app**

Add required checks for:

```bash
require_file "lazymosquito/customer_notice_ko.txt"
require_file "lazymosquito/privacy_policy.html"
require_text "index.html" "모기퇴치"
require_text "index.html" "lazymosquito/privacy_policy.html"
require_text "index.html" "2개 앱"
require_text "lazymosquito/privacy_policy.html" "모기퇴치 이용약관 및 개인정보 처리방침"
require_text "lazymosquito/privacy_policy.html" "com.lazybros.lazymosquito"
```

- [ ] **Step 2: Verify red**

Run:

```bash
bash scripts/verify_static_site.sh
```

Expected: fails because `lazymosquito/customer_notice_ko.txt` does not exist yet.

### Task 2: Add Source Notice and HTML Policy Page

**Files:**
- Create: `/Users/kunheekim/Lazybros/home/lazymosquito/customer_notice_ko.txt`
- Create: `/Users/kunheekim/Lazybros/home/lazymosquito/privacy_policy.html`

- [ ] **Step 1: Copy the source notice**

Copy:

```bash
cp /Users/kunheekim/Lazybros/lazymosquito_customer_notice_ko.txt /Users/kunheekim/Lazybros/home/lazymosquito/customer_notice_ko.txt
```

- [ ] **Step 2: Add the readable HTML page**

Create `privacy_policy.html` with the same header, footer, legal layout, icon links, and navigation pattern as `lazyparking/privacy_policy.html`. Use these section ids:

```text
terms
service-notice
privacy
audio-cache
permissions
data-deletion
ads
contact
```

- [ ] **Step 3: Verify the new page content**

Run:

```bash
bash scripts/verify_static_site.sh
```

Expected: still fails until homepage links are added.

### Task 3: Add 모기퇴치 to Homepage Policy Directory

**Files:**
- Modify: `/Users/kunheekim/Lazybros/home/index.html`

- [ ] **Step 1: Update policy stats**

Change policy stats to:

```html
<span>전체 <strong data-policy-count>2개 앱</strong></span>
<span>운영 중 <strong>2</strong></span>
<span>최근 업데이트 <strong>2026.06.08</strong></span>
```

- [ ] **Step 2: Add the 모기퇴치 row**

Add a second `policy-app-row` with:

```html
data-status="active"
data-categories="tools ads permissions terms privacy deletion"
```

Actions:

```html
<a class="primary" href="lazymosquito/privacy_policy.html#terms">약관</a>
<a href="lazymosquito/privacy_policy.html#privacy">개인정보</a>
<a href="lazymosquito/privacy_policy.html#permissions">권한 안내</a>
<a href="lazymosquito/privacy_policy.html#data-deletion">데이터 삭제</a>
```

- [ ] **Step 3: Verify green**

Run:

```bash
bash scripts/verify_static_site.sh
git diff --check
```

Expected: both commands pass.

### Task 4: Local Preview

**Files:**
- No source edits.

- [ ] **Step 1: Start a local server**

Run:

```bash
python3 -m http.server 8080
```

- [ ] **Step 2: Check local pages**

Open:

```text
http://localhost:8080/index.html#policies
http://localhost:8080/lazymosquito/privacy_policy.html
```

- [ ] **Step 3: Stop the local server after verification**

Stop the preview server once checks are done.

### Task 5: Final Review

**Files:**
- Review all changed files with `git diff --stat` and `git status --short --branch --ignored`.

- [ ] **Step 1: Confirm scope**

Expected changed files:

```text
docs/superpowers/plans/2026-06-08-lazymosquito-policy-addition.md
docs/superpowers/specs/2026-06-08-lazymosquito-policy-addition-design.md
index.html
lazymosquito/customer_notice_ko.txt
lazymosquito/privacy_policy.html
scripts/verify_static_site.sh
```

- [ ] **Step 2: Report result**

Report verification output and preview URLs. Do not push unless the user asks for deployment.
