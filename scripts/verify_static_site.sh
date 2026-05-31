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

require_file "index.html"
require_file "assets/css/styles.css"
require_file "assets/fonts/NanumSquare_acL.ttf"
require_file "assets/fonts/NanumSquare_acR.ttf"
require_file "assets/fonts/NanumSquare_acB.ttf"
require_file "assets/fonts/NanumSquare_acEB.ttf"
require_file "assets/fonts/SourceCodePro-VariableFont_wght.ttf"
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
require_text "assets/css/styles.css" "overflow-wrap: anywhere;"
require_text "assets/css/styles.css" "min-width: 0;"
require_text "assets/css/styles.css" "font-size: clamp("
require_text "assets/css/styles.css" "width: calc(100% - 32px);"

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
