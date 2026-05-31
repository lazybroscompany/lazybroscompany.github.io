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
  if ! grep -Fq -- "$text" "$path"; then
    echo "Missing required text in $path: $text" >&2
    exit 1
  fi
}

require_absent() {
  local path="$1"
  local text="$2"
  if grep -Fq -- "$text" "$path"; then
    echo "Unexpected text in $path: $text" >&2
    exit 1
  fi
}

require_sha256() {
  local path="$1"
  local expected="$2"
  local actual
  actual="$(shasum -a 256 "$path" | awk '{print $1}')"
  if [[ "$actual" != "$expected" ]]; then
    echo "Unexpected sha256 for $path: $actual" >&2
    exit 1
  fi
}

require_file "index.html"
require_file "assets/css/styles.css"
require_file "assets/fonts/paybooc-Light.ttf"
require_file "assets/fonts/paybooc-Medium.ttf"
require_file "assets/fonts/paybooc-Bold.ttf"
require_file "assets/fonts/paybooc-ExtraBold.ttf"
require_file "assets/icons/lazybros-glasses-logo.png"
require_file "assets/icons/lazybros-policy-logo.png"
require_file "assets/icons/favicon-32.png"
require_file "assets/icons/apple-touch-icon.png"
require_file "assets/icons/icon-192.png"
require_file "assets/icons/icon-512.png"
require_file "manifest.webmanifest"
require_file "lazyparking/privacy_policy.txt"
require_file "lazyparking/privacy_policy.html"
require_file "app-ads.txt"
require_file "google04098259f4b4bb7a.html"

require_sha256 "assets/icons/lazybros-glasses-logo.png" "e10dbcedca8422ee21058ff66e3ce8fa92fb64f24336057366af0222e84e303c"
require_sha256 "assets/icons/lazybros-policy-logo.png" "4af5fdcdfef6ee4547220bbb9b8dd4976243b4a12d54d1ec085504c95b5ee7ce"

require_text "index.html" '<html lang="ko">'
require_text "index.html" "LazyBros Company"
require_text "index.html" 'rel="icon"'
require_text "index.html" 'rel="apple-touch-icon"'
require_text "index.html" 'rel="manifest"'
require_text "index.html" "assets/icons/favicon-32.png?v=004"
require_text "index.html" "assets/icons/apple-touch-icon.png?v=004"
require_text "index.html" "manifest.webmanifest?v=004"
require_text "index.html" "assets/icons/lazybros-glasses-logo.png?v=004"
require_text "index.html" "assets/icons/lazybros-policy-logo.png?v=003"
require_absent "index.html" 'class="hero-logo"'
require_text "index.html" "생활 속 작은 불편을 가볍고 똑똑한 앱으로 바꿉니다."
require_text "index.html" "주차기록"
require_text "index.html" 'class="policy-directory"'
require_text "index.html" 'data-policy-search'
require_text "index.html" 'data-policy-filter="all"'
require_text "index.html" 'data-policy-app'
require_text "index.html" 'data-policy-count'
require_text "index.html" 'data-policy-empty'
require_text "index.html" "전체 앱 정책 목록"
require_text "index.html" "최근 업데이트: 2025.05.18"
require_text "index.html" "광고 안내"
require_text "index.html" "filterPolicyApps"
require_text "index.html" "lazyparking/privacy_policy.html"
require_text "index.html" "LazyBros Company | lazybroscompany@gmail.com"
require_text "index.html" "Lazy doesn't mean Stupid"
require_text "index.html" 'class="contact-copy"'
require_text "index.html" 'class="contact-title-row"'
require_text "index.html" "Copyright(c) 2026 LazyBros company All rights reserved"
require_text "index.html" 'id="company"'
require_text "index.html" 'id="policies"'
require_absent "index.html" 'href="#apps"'
require_absent "index.html" 'class="footer-links"'
require_absent "index.html" 'href="app-ads.txt"'
require_absent "index.html" "terms.html"

require_text "assets/css/styles.css" "--lb-bg: #ffffff;"
require_text "assets/css/styles.css" "--lb-card: #e9e9e9;"
require_text "assets/css/styles.css" "--lb-orange: #ff7518;"
require_text "assets/css/styles.css" "--lb-header-height: 72px;"
require_text "assets/css/styles.css" "@font-face"
require_text "assets/css/styles.css" 'font-family: "Paybooc";'
require_text "assets/css/styles.css" "paybooc-Light.ttf"
require_text "assets/css/styles.css" "paybooc-Medium.ttf"
require_text "assets/css/styles.css" "paybooc-Bold.ttf"
require_text "assets/css/styles.css" "paybooc-ExtraBold.ttf"
require_absent "assets/css/styles.css" "SourceCodePro"
require_absent "assets/css/styles.css" "NanumSquare"
require_text "assets/css/styles.css" "@media (max-width: 760px)"
require_text "assets/css/styles.css" "overflow-wrap: anywhere;"
require_text "assets/css/styles.css" "min-width: 0;"
require_text "assets/css/styles.css" "font-size: clamp("
require_text "assets/css/styles.css" "width: calc(100% - 32px);"
require_text "assets/css/styles.css" "scroll-padding-top: calc(var(--lb-header-height) + 24px);"
require_text "assets/css/styles.css" "scroll-margin-top: calc(var(--lb-header-height) + 24px);"
require_text "assets/css/styles.css" ".site-header"
require_text "assets/css/styles.css" "position: sticky;"
require_text "assets/css/styles.css" "z-index: 100;"
require_text "assets/css/styles.css" ".brand-mark img"
require_absent "assets/css/styles.css" ".hero-logo"
require_text "assets/css/styles.css" "margin: 0 0 18px;"
require_text "assets/css/styles.css" ".policy-directory"
require_text "assets/css/styles.css" ".policy-toolbar"
require_text "assets/css/styles.css" ".policy-app-row"
require_text "assets/css/styles.css" ".policy-actions"
require_text "assets/css/styles.css" ".policy-empty"
require_text "assets/css/styles.css" ".contact-tagline"
require_text "assets/css/styles.css" "justify-content: space-between;"

require_text "manifest.webmanifest" '"name": "LazyBros Company"'
require_text "manifest.webmanifest" '"icons"'
require_text "manifest.webmanifest" "assets/icons/icon-192.png?v=004"
require_text "manifest.webmanifest" "assets/icons/icon-512.png?v=004"

require_text "lazyparking/privacy_policy.html" '<html lang="ko">'
require_text "lazyparking/privacy_policy.html" 'rel="icon"'
require_text "lazyparking/privacy_policy.html" 'rel="apple-touch-icon"'
require_text "lazyparking/privacy_policy.html" 'rel="manifest"'
require_text "lazyparking/privacy_policy.html" "../assets/icons/favicon-32.png?v=004"
require_text "lazyparking/privacy_policy.html" "../assets/icons/apple-touch-icon.png?v=004"
require_text "lazyparking/privacy_policy.html" "../manifest.webmanifest?v=004"
require_text "lazyparking/privacy_policy.html" "../assets/icons/lazybros-glasses-logo.png?v=004"
require_text "lazyparking/privacy_policy.html" "../index.html#company"
require_text "lazyparking/privacy_policy.html" "../index.html#policies"
require_text "lazyparking/privacy_policy.html" "../index.html#contact"
require_absent "lazyparking/privacy_policy.html" "Text version"
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
