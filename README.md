# banderoom

URL: http://jjezen.cafe24.com/banderoom

## 프로젝트 개요

### 기획 의도
1. Banderoom
    > Band + room: 공간 대여와 팀원 모집, 소통이 필요한 음악인들을 위한 사이트<br>
2. 상세
    > **공간 예약**<br>
    > 밴드나 댄스팀처럼 연습 공간을 피룡로 하는 사람들과 그 공간을 제공해 주는 호스트를 위한 중개 사이트<br>
    > **팀원 모집**<br>
    > 함께 활동할 사람을 구하고 싶은 팀을 위한 팀원 모집 시스템<br>
    > **커뮤니티**<br>
    > 공연 홍보 게시판, 악기 중고 거래 게시판, 자유게시판 등 다양한 게시판을 제공하는 커뮤니티의 장<br>
3. 목적
    > **공간 예약관리 시스템**을 통해 사용자가 공간을 예약하고 호스트가 예약을 관리하는 것이 쉽고 편리하게 이루어짐<br>
    > **팀원 모집 시스템, 커뮤니티 기능** 등 편리한 서비스 이용으로 사이트 이용 인원 증가<br>
    > 지금까지 배웠던 모든 것을 활용해 팀으로 웹 서비스를 구현해보고자 함<br>
    > 다양한 API를 익히고 활용<br>

<br>

### 개발 기간
2022.04.11 ~ 2022.06.08

<br>

### 개발 인원
팀: 일조 (4명)

<br>

### 개발 환경
<img height="24px" src="https://img.shields.io/badge/JDK 1.8-007396?style=flat-square&logo=Java&logoColor=white"/> <img height="24px" src="https://img.shields.io/badge/Spring Framework-6DB33F?style=flat-square&logo=Spring&logoColor=white"/><br>
<img height="24px" src="https://img.shields.io/badge/Apache Tomcat v8.5-F8DC75?style=flat-square&logo=Apache Tomcat&logoColor=black"/> <img height="24px" src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/>
<br><br>

### 개발 언어
<img height="24px" src="https://img.shields.io/badge/Java-007396?style=flat-square&logo=Java&logoColor=white"/> <img height="24px" src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white"/> <img height="24px" src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=black"/> <img height="24px" src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=CSS3&logoColor=white"/>
<br><br>

### 개발 도구
<img height="24px" src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=flat-square&logo=Eclipse IDE&logoColor=white"/> <img height="24px" src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=flat-square&logo=Visual Studio Code&logoColor=white"/> <img height="24px" src="https://img.shields.io/badge/Adobe Photoshop-31A8FF?style=flat-square&logo=Adobe Photoshop&logoColor=white"/>
<br><br>

### 활용 기술과 API
`AJAX`&nbsp;&nbsp;`jQuery`&nbsp;&nbsp;`Summernote`&nbsp;&nbsp;`Javamail`&nbsp;&nbsp;<br>
`myBatis`&nbsp;&nbsp;`kakao 로그인 / 지도 / 주소찾기`<br>
`Ncloud sms`&nbsp;&nbsp;`ImgScalr`&nbsp;&nbsp;`moment.js`<br>
`air datepicker`&nbsp;&nbsp;`channel.io`

## 프로젝트 구현

### 구현 기능 (본인이 구현한 기능에 ⭐표시)
- 회원가입 / 로그인 / 비밀번호 찾기 (⭐ 전체)
  - 공간 예약용 호스트 사용자와 일반 사용자 회원가입 별도 페이지와 DB로 관리
  - 회원 가입시 이메일 인증과 휴대폰 인증
  - 카카오 계정으로 회원가입 및 로그인
  - 프로필 사진 업로드 및 기본 사진으로 초기화 가능
  - 닉네임 / 비밀번호 등 중복 체크와 유효성 체크
  - 비밀번호 찾기는 이메일 인증을 통해 비밀번호 변경으로 구현

<br>

- 공간 예약 시스템 (⭐ 전체)
  - 공간 등록
    - 호스트가 공간을 등록 신청하면 관리자가 승인 / 거부하도록 구현
    - 공간 등록 시 사진 업로드
  - 공간 예약
    - 공간 사용자는 등록된 공간 목록에서 선택해 자세한 내용을 확인하고 날짜 / 시간 선택 후 예약 가능
  - 공간 검색
    - 지역 / 분류 등 여러 가지 필터를 통해 쉽게 공간을 찾을 수 있도록 함
    - 현재 목록에 표시된 공간들을 지도에서 한 눈에 확인 가능
  - 공간 상세
    - 공간의 기본 정보와 사진, 지도 등 여러 정보를 쉽게 확인 가능
    - 상세 페이지에 Q&A와 후기 섹션을 포함
  - 예약 내역 관리
    - 사용자
      - 자신이 현재 예약중인 항목과 이전에 예약했던 내역들을 한 눈에 확인
    - 호스트
      - 자신의 공간 관리 페이지에서 공간 별 예약 내역을 확인 및 취소 가능
  - 포인트 제도
    - 결제 금액의 일부만큼 포인트가 적립되고, 적립한 포인트를 이후 결제시 사용 가능
    - 포인트 내역 페이지에서 증감 내역 확인
  - 정산 금액 확인
    - 호스트는 자신이 등록한 공간들의 월 별 정산 내역을 확인 가능

<br>

- 팀원 모집 시스템
  - 일반 회원들끼리 팀원을 모집하거나 모집 중인 팀에 지원할 수 있음
  - 팀원 모집
    - 모집 글 등록 시 장르 등 대분류와 파트 등 소분류를 선택하여 각각 인원을 모집하도록 구현
    - 선택한 분류 (댄스팀, 밴드 등) 에 따라 선택 가능한 장르가 달라지며, 선택한 장르에 따라 선택 가능한 파트가 달라짐. 직접 입력도 가능
  - 팀원으로 지원
    - 팀원 모집시 등록한 여러 조건을 각각 선택으로 검색하거나, 검색어를 통해 통합 검색도 가능
  - 지원 목록 확인
    - 자신이 모집 등록한 팀의 지원자 목록을 확인 가능
  - 내 글 목록
    - 자신이 작성한 모집글과 지원서를 모두 확인 가능

<br>

- 커뮤니티 기능
  - 게시판
    - 공지사항 / 자유게시판 / 공연 홍보 게시판 / 중고거래 등 다양한 게시판 제공
    - 각 게시판의 글 등록 / 수정 / 상세 페이지는 하나의 JSP에서 모두 처리하도록 구현
    - 글 작성은 summernote 에디터를 이용해 사진 등 업로드 가능⭐
    - 댓글과 대댓글에 사진 업로드 가능⭐
    - 자유게시판
      - 일반적인 목록으로 표시하며, 추천수 상위 글 3개를 상단 노출
    - 홍보 게시판
      - 게시판의 성격에 따라 사진이 포함된 카드형 목록으로 표시
      - 게시글에 등록한 첫 번째 사진이 썸네일로 등록되도록 함
    - 중고 거래 게시판
      - 기본적으로 홍보 게시판과 동일하나 거래 상태를 추가적으로 표시
  - 미니 프로필
    - 사이트 어디서나 닉네임을 눌러 미니 프로필 팝업
  - 1:1 쪽지 기능
    - 미니 프로필을 통해 회원 간 1:1 쪽지를 주고받을 수 있음
    - 쪽지함에서 메시지들을 통합 관리 가능
    - 읽지 않은 쪽지 강조 표시⭐
  - 신고 기능
    - 미니 프로필을 통해 비매너 유저를 신고할 수 있음

<br>

- 관리자 기능
  - 1:1 문의
    - 1:1 문의용 채팅 버튼을 항상 배치하여 사용자들이 쉽게 관리자와 소통 가능하도록 함⭐
  - 공간 관리
    - 관리자는 등록된 모든 공간을 조회하고 등록 승인 / 거부 등 관리가 가능⭐
  - 신고 회원 관리
    - 비매너 신고를 받은 사용자들의 목록을 확인하고 글쓰기 권한을 차단하거나 멤버 추방 가능
  - 모든 회원 관리
    - 일반 회원 / 호스트 회원의 모든 목록 확인
    - 회원 별 상세 정보 페이지에서 정보 확인 및 차단 / 추방 가능⭐

<br><br>

### ER Diagram

<img src="https://user-images.githubusercontent.com/46345154/174518295-493b60a5-e59c-4d14-b7a1-dade58f528c5.png">

<span style="color: orange">공간 예약 시스템</span>,
<span style="color: lightgreen">팀원 모집 시스템</span>,
<span style="color: violet">커뮤니티 기능</span>,
<span style="color: gray">기타 기능</span> 별로 색상 표시
