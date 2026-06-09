# 모기퇴치 앱 정책 추가 상세 설계

## 1. 목적

`lazymosquito_customer_notice_ko.txt`의 내용을 LazyBros 홈페이지에 반영해 `주차기록`에 이어 두 번째 앱인 `모기퇴치`의 앱 설명, 이용약관, 개인정보 처리방침, 앱 권한 안내, 데이터 삭제 안내를 공개한다.

이 변경의 목적은 다음과 같다.

- Google Play Store 제출 및 심사에 사용할 수 있는 안정적인 앱별 고지 URL을 제공한다.
- 기존 `주차기록` 정책 센터 구조를 유지하면서 앱이 추가되는 패턴을 검증한다.
- 사용자가 앱별 정책 목록에서 `모기퇴치`를 검색하고 필요한 고지 페이지로 이동할 수 있게 한다.
- 다른 홈페이지 기능, 디자인 톤, 내비게이션, 기존 주차기록 정책 페이지 동작은 변경하지 않는다.

## 2. 입력 자료

원본 문서:

- `/Users/kunheekim/Lazybros/lazymosquito_customer_notice_ko.txt`

원본 문서의 핵심 메타데이터:

- 문서 제목: `모기퇴치 이용약관 및 개인정보 처리방침`
- 시행일: `2026년 6월 8일`
- 공고일자: `2026년 6월 8일`
- 회사명: `레이지브로즈`
- 앱 이름: `모기퇴치`
- 패키지명: `com.lazybros.lazymosquito`
- 이메일: `lazybroscompany@gmail.com`

원본 문서의 주요 섹션:

- 서비스 이용약관
- 개인정보 처리방침
- 앱 권한 안내
- 데이터 삭제 안내
- 개인정보처리방침의 변경
- 문의처

## 3. 범위

### 포함

- `모기퇴치`용 앱 폴더를 홈페이지 저장소 안에 추가한다.
- 원문 고지 텍스트를 앱 폴더 안에 보존한다.
- 읽기 쉬운 HTML 고지 페이지를 추가한다.
- 홈의 `앱별 정책 센터` 목록에 `모기퇴치` 앱 행을 추가한다.
- 검색, 필터, 앱 개수 표시가 앱 2개 기준으로 정상 동작하게 한다.
- 검증 스크립트에 `모기퇴치` 관련 파일과 핵심 문구 확인을 추가한다.

### 제외

- 상단 헤더, 고정 메뉴, Contact 카드, Footer, 로고, 폰트, 색상 체계는 변경하지 않는다.
- `주차기록` 대표 앱 카드는 유지한다.
- `주차기록` 상세 정책 페이지 내용은 변경하지 않는다.
- 새로운 JavaScript 기능이나 빌드 도구는 추가하지 않는다.
- 원문에 없는 별도 약관, 마케팅 문구, 효능 보증 문구를 만들지 않는다.

## 4. URL 및 파일 구조

추가할 파일:

```text
home/
  lazymosquito/
    customer_notice_ko.txt
    privacy_policy.html
```

공개 URL:

- HTML 고지 페이지: `https://lazybros.github.io/home/lazymosquito/privacy_policy.html`
- 원문 텍스트: `https://lazybros.github.io/home/lazymosquito/customer_notice_ko.txt`

`privacy_policy.html`이라는 파일명을 쓰는 이유:

- 기존 `주차기록`의 공개 정책 URL이 `lazyparking/privacy_policy.html`이다.
- Google Play의 개인정보처리방침 URL로 사용하기 쉽다.
- 문서 제목과 본문에서는 원문 성격을 살려 `이용약관 및 개인정보 처리방침`으로 표시한다.

## 5. 홈 정책 센터 설계

### 대표 카드

대표 앱 카드는 기존처럼 `주차기록`을 유지한다. 이번 변경은 앱 목록 확장 검증이 목적이므로 대표 앱 선택 정책은 바꾸지 않는다.

### 전체 앱 정책 목록

`모기퇴치`를 `주차기록` 아래에 두 번째 행으로 추가한다.

행 정보:

- 앱 이름: `모기퇴치`
- 상태: `운영 중`
- 카테고리: `생활 · 도구`
- 설명: `고주파 음파 재생, 주파수 프리셋, 파형 선택, 스윕 모드, 슬립 타이머를 제공하는 모기 퇴치 보조 앱`
- 최근 업데이트: `2026.06.08`
- 검색 키워드: `모기퇴치`, `고주파`, `음파`, `주파수`, `파형`, `스윕`, `슬립 타이머`, `AdMob`, `광고`, `권한`, `데이터 삭제`, `이용약관`, `개인정보 처리방침`

행 액션:

- `약관`: `lazymosquito/privacy_policy.html#terms`
- `개인정보`: `lazymosquito/privacy_policy.html#privacy`
- `권한 안내`: `lazymosquito/privacy_policy.html#permissions`
- `데이터 삭제`: `lazymosquito/privacy_policy.html#data-deletion`

정책 현황 표시:

- 전체 앱 수: `2개 앱`
- 운영 중: `2`
- 최근 업데이트: `2026.06.08`

검색 및 필터:

- 기존 검색 입력과 `전체`, `운영 중`, `기록`, `광고` 필터는 유지한다.
- `모기퇴치` 행의 `data-status`는 `active`로 둔다.
- `모기퇴치` 행의 `data-categories`에는 `tools ads permissions terms privacy deletion`을 둔다.
- 기존 필터 중 `운영 중`과 `광고`에서는 `모기퇴치`가 노출된다.
- `기록` 필터에서는 `주차기록`만 노출된다.
- 새로운 필터 버튼은 추가하지 않는다. 앱 2개 단계에서는 기존 필터 수를 유지해 UI 밀도를 늘리지 않는다.

## 6. 모기퇴치 상세 고지 페이지 설계

### 공통 레이아웃

기존 `lazyparking/privacy_policy.html`의 구조와 스타일을 재사용한다.

- 공통 상단 헤더: `LazyBros Company`, `Company`, `Policies`, `Contact`
- 좌측 또는 상단 보조 목차: 문서 주요 섹션 이동
- 본문 카드: 원문 고지를 읽기 쉬운 HTML 섹션으로 정리
- 하단 Footer: 기존 회사 정보와 저작권 문구 유지
- 원문 텍스트 링크: 상세 페이지 하단 보조 링크로 제공

### 페이지 메타데이터

HTML head:

- `lang="ko"`
- title: `모기퇴치 이용약관 및 개인정보 처리방침 | LazyBros Company`
- description: `LazyBros Company 모기퇴치 앱 이용약관, 개인정보 처리방침, 앱 권한 및 데이터 삭제 안내입니다.`
- favicon, apple-touch-icon, manifest, stylesheet 경로는 기존 앱 정책 페이지와 같은 상대 경로 패턴 사용

### 문서 히어로

표시 내용:

- eyebrow: `모기퇴치`
- h1: `이용약관 및 개인정보 처리방침`
- 날짜: `시행일: 2026년 6월 8일`

요약 카드:

- 앱은 고주파 음파 기반 모기 퇴치 보조 도구임을 명시한다.
- 모기 퇴치 효과를 보증하지 않는다는 주의사항을 포함한다.
- 이용자의 음성, 대화, 주변 소리를 녹음하지 않으며 회사 서버로 전송하지 않는다는 개인정보 핵심 원칙을 포함한다.

### 섹션 구성

목차와 본문 섹션 id:

- `#terms`: 서비스 이용약관
- `#service-notice`: 서비스 특성 및 주의사항
- `#privacy`: 개인정보 처리방침
- `#audio-cache`: 오디오 데이터 및 음원 캐시
- `#permissions`: 앱 권한 안내
- `#data-deletion`: 데이터 삭제 안내
- `#ads`: 광고 및 외부 플랫폼
- `#contact`: 문의처

본문 구성:

1. `서비스 이용약관`
   - 목적
   - 서비스의 내용
   - 이용자의 의무
   - 서비스 변경 및 중단
   - 책임 제한
   - 준거법 및 분쟁 해결

2. `서비스 특성 및 주의사항`
   - 보조 도구 성격
   - 효과 미보증
   - 일반적인 방충 조치 대체 아님
   - 청각 불편, 두통, 귀 울림, 청각 피로 가능성
   - 영유아, 어린이, 반려동물, 청각 민감자, 청각 질환자, 의료기기 사용자 주변 주의
   - 과도한 음량과 장시간 재생 주의
   - 배터리 소모 증가 가능성

3. `개인정보 처리방침`
   - 회원가입/로그인 없음
   - 이름, 이메일, 전화번호, 위치정보, 사진, 연락처 직접 수집 없음
   - 앱 이용 설정 정보
   - 재생 상태 정보
   - 오디오 캐시 정보
   - 광고 관련 정보
   - 오류 및 이용 환경 정보
   - 이용 목적
   - 보유 및 삭제
   - 제3자 제공 및 처리 위탁
   - 이용자의 권리
   - 안전성 확보조치

4. `오디오 데이터 및 음원 캐시`
   - 앱이 선택한 주파수, 음량, 파형 설정을 바탕으로 고주파 WAV 파일 생성 가능
   - 생성 음원은 기계적 음원 데이터이며 녹음 파일이 아님
   - 회사 서버로 전송하지 않음
   - 앱 삭제, 캐시 삭제, 운영체제 저장공간 정리 시 삭제 가능
   - 마이크 또는 녹음 권한 관련 안내 포함

5. `앱 권한 안내`
   - 인터넷 및 네트워크 상태
   - 광고 ID 및 광고 서비스
   - 오디오 설정
   - 파일 및 저장공간
   - 진동
   - 화면 꺼짐 방지, 백그라운드 또는 포그라운드 서비스
   - 마이크 또는 녹음 권한
   - 다른 앱 위에 표시 권한

6. `데이터 삭제 안내`
   - 앱 삭제
   - 단말기 설정에서 앱 저장공간 또는 캐시 삭제
   - 삭제 대상: 앱 이용 설정 정보, 재생 상태 정보, 고주파 WAV 음원 캐시, 임시 파일
   - 광고 관련 데이터는 광고 플랫폼 또는 운영체제 정책에 따름

7. `광고 및 외부 플랫폼`
   - Google AdMob 사용 가능
   - 광고 식별자, 기기정보, 네트워크 정보, 광고 노출 및 클릭 정보 처리 가능
   - Google 개인정보처리방침 URL: `https://policies.google.com/privacy`
   - 광고 ID 재설정 또는 맞춤형 광고 제한 안내

8. `문의처`
   - 회사명: `레이지브로즈`
   - 앱 이름: `모기퇴치`
   - 패키지명: `com.lazybros.lazymosquito`
   - 이메일: `lazybroscompany@gmail.com`
   - 공고일자: `2026년 6월 8일`

## 7. 원문 보존 원칙

- `lazymosquito_customer_notice_ko.txt`의 원문 문구를 삭제하거나 임의로 약화하지 않는다.
- HTML 페이지는 원문을 축약한 소개 문구와 구조화된 본문을 함께 제공할 수 있다.
- 법적 의미가 있는 문구, 주의사항, 책임 제한, 데이터 처리 범위, 권한 안내, 문의처는 빠짐없이 반영한다.
- `모기퇴치 효과 보증 없음`, `녹음 기능 없음`, `회사 서버 전송 없음`, `Google AdMob`, `데이터 삭제 방법`은 반드시 눈에 띄는 섹션에 포함한다.

## 8. 검증 설계

`scripts/verify_static_site.sh`에 다음 검증을 추가한다.

필수 파일:

- `lazymosquito/customer_notice_ko.txt`
- `lazymosquito/privacy_policy.html`

홈페이지 필수 문구 및 링크:

- `모기퇴치`
- `고주파 음파`
- `lazymosquito/privacy_policy.html`
- `lazymosquito/privacy_policy.html#terms`
- `lazymosquito/privacy_policy.html#privacy`
- `lazymosquito/privacy_policy.html#permissions`
- `lazymosquito/privacy_policy.html#data-deletion`
- `2개 앱`
- `2026.06.08`

모기퇴치 상세 페이지 필수 문구:

- `모기퇴치 이용약관 및 개인정보 처리방침`
- `시행일: 2026년 6월 8일`
- `com.lazybros.lazymosquito`
- `고주파 음파`
- `모기 퇴치 효과`
- `특정한 방충 효과를 보증하지 않습니다`
- `음성, 대화 또는 주변 소리를 녹음하는 기능을 제공하지 않습니다`
- `회사 서버로 전송하지 않습니다`
- `Google AdMob`
- `https://policies.google.com/privacy`
- `데이터 삭제 안내`
- `lazybroscompany@gmail.com`

기존 보존 검증:

- `주차기록` 정책 페이지 검증은 유지한다.
- 헤더 로고, favicon, Paybooc 폰트, sticky header 검증은 유지한다.
- `app-ads.txt`와 Google verification 파일 검증은 유지한다.

## 9. 접근성 및 반응형 고려

- 새 상세 페이지는 기존 `legal-page`, `legal-layout`, `legal-nav`, `legal-document`, `legal-section` 스타일을 그대로 사용한다.
- 긴 한국어 문장은 기존 `overflow-wrap`과 `word-break: keep-all` 규칙을 따른다.
- 섹션 id는 상단 sticky header에 가려지지 않도록 기존 `scroll-margin-top` 규칙을 활용한다.
- 액션 링크는 의미가 드러나는 텍스트를 사용한다.
- 앱 목록의 행 추가로 모바일에서 버튼이 늘어날 수 있으므로 기존 `policy-actions` 반응형 레이아웃을 재사용한다.

## 10. 구현 순서

1. 원문 텍스트를 `home/lazymosquito/customer_notice_ko.txt`로 복사한다.
2. `home/lazymosquito/privacy_policy.html`을 기존 정책 페이지 패턴으로 작성한다.
3. `index.html`의 정책 현황을 `2개 앱`, 운영 중 `2`, 최근 업데이트 `2026.06.08`로 갱신한다.
4. `index.html`의 정책 목록에 `모기퇴치` 행을 추가한다.
5. `scripts/verify_static_site.sh`에 새 파일과 핵심 문구 검증을 추가한다.
6. `bash scripts/verify_static_site.sh`를 실행한다.
7. `git diff --check`를 실행한다.
8. 로컬 서버에서 홈과 `lazymosquito/privacy_policy.html`을 확인한다.

## 11. 완료 기준

- 홈 정책 목록에 `주차기록`과 `모기퇴치`가 모두 표시된다.
- 정책 목록 검색에서 `모기퇴치`, `고주파`, `음파`, `AdMob`, `데이터 삭제`로 새 앱을 찾을 수 있다.
- `운영 중`과 `광고` 필터에서 `모기퇴치`가 표시된다.
- `기록` 필터에서는 기존처럼 `주차기록` 중심으로 표시된다.
- `모기퇴치` 상세 페이지가 공통 헤더, 공통 footer, Paybooc 폰트, sticky header 규칙을 유지한다.
- 원문 텍스트 파일이 공개 경로에 보존된다.
- 검증 스크립트와 diff check가 통과한다.
- 기존 `주차기록` 페이지와 홈의 기존 주요 기능은 변경되지 않는다.
