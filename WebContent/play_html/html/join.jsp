<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket - Join</title>
        <meta name="description" content="A Template by Gozha.net">
        <meta name="keywords" content="HTML, CSS, JavaScript">
        <meta name="author" content="Gozha.net">
    
    <!-- Mobile Specific Metas-->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">
    
    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,700' rel='stylesheet' type='text/css'>
        <!-- Open Sans -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:800italic' rel='stylesheet' type='text/css'>
    
    <!-- Stylesheets -->

        <!-- Mobile menu -->
        <link href="css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="css/external/jquery.selectbox.css" rel="stylesheet" />

    
        <!-- Custom -->
        <link href="css/style.css?v=1" rel="stylesheet" />
        <link href="join/join.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>

		
		
<script type="text/javascript">
    
        // 회원가입 화면의 입력값들을 검사한다.
        function checkValue()
        {
            var form = document.userinput;
       		var NO_SPECIAL=/[^a-zA-Z0-9]/i; 
            if(!form.userID.value.trim()){
                alert("아이디를 입력하세요.");
                return false;
            }
            if(NO_SPECIAL.test(form.userID.value)){
            	alert("아이디에 특수문자 및 공백,한글사용이 불가합니다.");
            }
            
            if(form.idDuplication.value != "idCheck"){
                alert("아이디 중복체크를 해주세요.");
                return false;
            }
            
            if(!form.userPassword.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }

            if(!form.userPassword.value != !form.userPassword2.value){
            	alert("비밀번호가 같지않습니다.");
                return false;
            }
            
            if(!form.userName.value){
                alert("이름을 입력하세요.");
                return false;
            }
            if(!form.userPhone.value){
                alert("전화번호를 입력하세요.");
                return false;
            }
            if(!form.userBirthday.value){
                alert("생년월일을 입력하세요.");
                return false;
            }
      
            if(!form.userEmail.value){
                alert("메일 주소를 입력하세요.");
                return false;
            }
            if(!form.address.value()){
                alert("주소를 입력하세요");
                return false;
            }


        }
        
        // 취소 버튼 클릭시 첫화면으로 이동
        function goFirstForm() {
            location.href="index.jsp";
        }    
        
        // 아이디 중복체크 화면open
        function openConfirmid(inputid){
        	var id =inputid.userID.value;
        	var NO_SPECIAL=/[^a-zA-Z0-9]/i; 
        	
        	if (id.trim() == ""){
        		alert("아이디를 입력하세요");
        		return;
        	} 
        	if(NO_SPECIAL.test(id)){
            	alert("아이디에 특수문자 및 공백,한글사용이 불가합니다.");
            	return;
            }
            url = "confirmid.jsp?userID=" + inputid.userID.value;
            window.open(url,
                    "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
        }
 
        function inputIdChk(){
            document.userInfo.idDuplication.value ="idUncheck";
        }
        
</script>

</head>

<body>
    <div class="wrapper">
        <jsp:include page="common_screen_top.jsp" flush="false" />
        
		<div class="join_container">
			<form action="joinAction.jsp" method="post" name="userinput" onsubmit="return checkValue()">
				<div class="join_row">
			      <h4 class="a">회원가입</h4>
			      <div class="input-group input-group-icon">
			      	<div class="id-col-third">
				       <input type="text" placeholder="아이디" name="userID"/>
				    </div>
				    <div class="id-col-third">
				        <input type="button" name="confirm_id" value="중복확인" onclick="openConfirmid(this.form)">    
					</div>
						<input type="hidden" name="idDuplication" value="idUncheck" > <%--이거는 화면에서 안보이는거니깐 신경 ㄴㄴ --%>
			        <div class="input-icon"><i class="fa fa-user"></i></div>
			      </div>
			      <div class="input-group input-group-icon">
			        <input type="password" placeholder="비밀번호" name="userPassword"/>
			        <div class="input-icon"><i class="fa fa-key"></i></div>
			      </div>
			      <div class="input-group input-group-icon">
			        <input type="text" placeholder="이름" name = "userName"/>
			        <div class="input-icon"><i class="fa fa-user"></i></div>
			      </div>
			      <div class="input-group input-group-icon">
			        <input type="email" placeholder="이메일" name = "userEmail"/>
			        <div class="input-icon"><i class="fa fa-envelope"></i></div>
			      </div>
			      <div class="input-group input-group-icon">
			        <input type="tel" placeholder="전화번호" name = "userPhone"/>
			        <div class="input-icon"><i class="fa fa-phone"></i></div>
			      </div>
			      
			      <div class="input-group input-group-icon">
			        <input type="text" placeholder="주소" name="userAddress"/>
			        <div class="input-icon"><i class="fa fa-map-marker"></i></div>
			      </div>
			
			
			    </div>
			    <div class="row">
			      <div class="col-half ">
			        <h4>생년월일</h4>
			        <div class="input-group">
			          <div class="col-third">
			            <input type="text" placeholder="YYYY - MM - DD" name="userBirth"/>
			            
			          </div>
			        </div>
			      </div>
			      <div class="col-half">
			        <h4>성별</h4>
			        <div class="input-group">
			          <input type="radio" name="userSex" value=0 id="gender-male"/>
			          <label for="gender-male">남자</label>
			          <input type="radio" name="userSex" value=1 id="gender-female"/>
			          <label for="gender-female">여자</label>
			        </div>
			      </div>
			    </div>
			

			   <input type="submit" class='button' value="가입하기" />
			</form>
		</div>
		
	
	
                
        <jsp:include page="common_screen_bottom.jsp" flush="false" />


    </div>

   	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Slider Revolution core JavaScript files -->
        <script type="text/javascript" src="revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="revolution/js/jquery.themepunch.revolution.min.js"></script>

        <!-- Slider Revolution extension scripts. --> 
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="revolution/js/extensions/revolution.extension.video.min.js"></script>

        <!-- Mobile menu -->
        <script src="js/jquery.mobile.menu.js"></script>
         
        
        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>

        <!-- Twitter feed -->
        <script src="js/external/twitterfeed.js"></script>

        <!-- Custom -->
        <script src="js/custom.js"></script>
		
	      <script type="text/javascript">
              $(document).ready(function() {
                init_Home();
              });
		    </script>

</body>
</html>
