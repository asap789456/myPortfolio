# ★ APicket
### A play(단 하나의 연극) + Ticket(표)

###### 프로젝트 설명 : 기존의 문화생활 카테고리를 통합 제공하는 소셜커머스가 아닌 연극전문사이트에서 최신 연극정보와 실시간 예매순위를 확인하고 싶은 고객, 가까운 극장정보와 상영정보를 한눈에 보고 싶은 고객, 번호표 형식의 선착순 자리배치가 아닌 내가 직접 좌석을 선택할 수 있는 20 30대 층을 겨냥한 사이트

### 사용자
<div>
<img src="https://user-images.githubusercontent.com/28374739/78770594-ba58f180-79c9-11ea-9e30-61eec98bc9af.PNG" width="45%">
<img src="https://user-images.githubusercontent.com/28374739/78770577-b62cd400-79c9-11ea-93f2-5fc929c27b19.PNG" position="relative" width="45%" top="-100px;">
  회원가입을 한 후에 로그인 하고 연극 예매 시작! (회원가입 시 모든 칸이 입력되지 않으면 회원가입이 되지 않아요.)
</div>





























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
