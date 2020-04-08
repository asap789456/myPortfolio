# ★ APicket
### A play(단 하나의 연극) + Ticket(표)

###### 프로젝트 설명 : 기존의 문화생활 카테고리를 통합 제공하는 소셜커머스가 아닌 연극전문사이트에서 최신 연극정보와 실시간 예매순위를 확인하고 싶은 고객, 가까운 극장정보와 상영정보를 한눈에 보고 싶은 고객, 번호표 형식의 선착순 자리배치가 아닌 내가 직접 좌석을 선택할 수 있는 20 30대 층을 겨냥한 사이트


<img src="https://user-images.githubusercontent.com/28374739/78770548-add49900-79c9-11ea-9d5a-27bb43bbba06.PNG" height="400px">


### 사용자
###### ① 회원가입을 한 후에 로그인 하고 연극 예매 시작! (회원가입 시 모든 정보가 입력되지 않으면 회원가입이 되지 않는다.)
<div>
<img src="https://user-images.githubusercontent.com/28374739/78772109-36eccf80-79cc-11ea-8199-3d281faee4b9.png" width="45%">
<img src="https://user-images.githubusercontent.com/28374739/78772106-36543900-79cc-11ea-9723-9a860596e2e6.png" width="45%">
</div>

###### ② 연극 리스트 나열(약 15개의 연극들) - 예매하고 싶은 연극 선택(연극 리스트들이 스크롤링 되어 선택가능 하게 되어있다.)<br><br>
<div>
<img src="https://user-images.githubusercontent.com/28374739/78777784-22610500-79d5-11ea-8293-2d518236fe04.png" width="45%">
<img src="https://user-images.githubusercontent.com/28374739/78777788-23923200-79d5-11ea-868b-df03d745c3ba.png" width="45%">
</div>

###### ③ 연극을 보고 싶은 날짜 선택 - 오후 12시 전 예매는 조조할인 5% 적용(alert이용) - 좌석 선택 후 할인 된 가격 확인
<div>
<img src="https://user-images.githubusercontent.com/28374739/78778402-2d686500-79d6-11ea-8d23-88bc9c0fdb45.png" width="25%">
<img src="https://user-images.githubusercontent.com/28374739/78778405-2e999200-79d6-11ea-803a-8f0b77d7cd9c.png" width="33%">
<img src="https://user-images.githubusercontent.com/28374739/78778406-2e999200-79d6-11ea-8bf8-e8ef6fa2422a.png" width="33%">
</div>

###### ⑤ 티켓 확인(이 과정에서 회원가입 시 입력했던 @이메일 주소@ 로 티켓발송)
<img src="https://user-images.githubusercontent.com/28374739/78779455-f4c98b00-79d7-11ea-9b5e-9ed7f1942c96.PNG">

###### ⑥ 마이페이지에서 예매 된 연극의 정보 확인 가능 & 감상한 연극에 대해 별점을 주며 리뷰 작성 가능(별점으로 예매 순위를 구현해보려 했지만 아직 구현 못했다.)

<div>
<img src="https://user-images.githubusercontent.com/28374739/78779868-b08aba80-79d8-11ea-9625-b83f43ab5649.png" width="45%">
<img src="https://user-images.githubusercontent.com/28374739/78779864-aff22400-79d8-11ea-946e-515cdeed1445.png" width="45%">
</div>


### 관리자(사용자 계정이 아닌 관리자 계정을 이용!)
###### ① 연극 등록, 수정, 삭제가 가능하며, 연극에 대한 회차 등록이 가능(회차등록을 하고 등록된 회차를 확인할 수 있다.)
<img src="https://user-images.githubusercontent.com/28374739/78780849-39eebc80-79da-11ea-99ae-67ae1c760d66.png">

###### 관리자는 연극 마다 예매한 회원들의 수를 파악할 수 있다.
<img src="https://user-images.githubusercontent.com/28374739/78781367-16784180-79db-11ea-8f8a-29f204b1420f.png">

###### 관리자는 회원들의 정보를 확인 가능하고, 작성된 리뷰들을 삭제 할 수 있다(비난 or 욕설 난무하는 리뷰)
<img src="https://user-images.githubusercontent.com/28374739/78781779-d2d20780-79db-11ea-8655-c101ac42450d.png">



























###### 작동에 필요한 개발도구 : Eclipse, HeidiSQL, MYSQL

#### Eclipse 설치
###### cmd 창 실행 후 > <b>java -version </b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;              > <b>javac-version</b> 명령어를 입력하여 Java SE 설치되어있는지 확인 <br>
###### 만약 설치가 안되어있다면 오라클 사이트 접속 후 "Java SE Downloads" 클릭해 설치 - (저는 jdk1.8.0을 설치하였습니다.) 설치 된 jdk의 주소를 확인하고 자신의 컴퓨터 환경설정을 해줍니다. (PATH설정) <br><br>

#### 본격적으로 Eclipse를 설치
1. https://www.eclipse.org/ 에 접속하여 Eclipse를 다운로드
2. 설치되면 installer 화면 창에서 Eclipse IDE for Enterprise Java Developers을 선택 후 다운로드
3. 설치 성공

#### MYSQL을 설치
1. MYSQL 홈페이지에 접속
2. 화면 2번째 탭에 다운로드 탭 선택. 
3. 다운로드가 완료된 뒤, 설치파일 압축이 풀리면 첫번째 버튼을 누르고 Next 선택.
4. MYSQL은 ROOT계정과 user를 추가가능. DBMS 콘솔로도 추가가 가능하므로 ROOT 계정의 password를 입력 후, next 선택.
5. 설치가 완료되었는지 확인: 시작 > 모든 프로그램 > MYSQL > MYSQL 서버 > MYSQL 콘솔에 접속하면 콘솔화면이 출력.
