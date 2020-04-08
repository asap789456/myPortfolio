<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.Vector" %>
<%@page import="user.*" %>
<html>
<head>
	
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket</title>
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

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
		<link rel="stylesheet" type="text/css" href="admin_play/style.css">
        <link rel="stylesheet" type="text/css" href="admin_play/style.min.css">
	
	
</style>

<script>
function goDelete(){
	location.href="adminMemberSelect.jsp";
	
}
</script>
</head>

<body>
<jsp:useBean id="user" class="user.User">
	<jsp:setProperty name="user" property="*" />
</jsp:useBean>
<% 
	request.setCharacterEncoding("utf-8");
	String userID = request.getParameter("userID"); //member_select.jsp에 <input> name이 userID인 값을 갖고와서 userID에 저장
	UserDAO manager = new UserDAO(); //USERDAO 안에 있는 함수?사용하기위해 이름이 manager인 객체생성
	User bean = manager.getMember(userID); //USER에 있는 변수사용 (bean 생성) getMember()는 UserDAO에 있는 함수
%><body>
	<div class="wrapper">
	<jsp:include page="admin_common_top.jsp" flush="false" />

    <section class="container">
    	<div class="col-sm-12">
		    <h2 class="page-heading">관리자: 회원수정</h2>        	    
	        <div class="row">
	        	<div class="col-md-12">
	            	<div class="card">
	            		<div class="card-header"> <strong>회원수정</strong> </div>
			             	<div class="card-body">
			             		<form name="TheForm" method="post" action="adminMemberUpdateAction.jsp" >		             		
					                 
					                 <!-- 이미지  여기서부터 member로 고치면 됨!
					                 -->
					                 <div class="form-group row">
					                 <input class="form-control" id="text-input" type="hidden" name="userID" value="<%=bean.getUserID() %>"  placeholder="사용자ID" >
					                   	<label class="col-md-3 col-form-label" for="text-input">사용자명</label>
					                    <div class="col-md-9">
					                    <!-- 우선은 text 타입으로 지정! (file, imgae 타입이 따로 있긴 함.) -->
					                     
					                      <input class="form-control" id="text-input" type="text" name="userName"  value="<%=bean.getUserName()%>" placeholder="사용자이름" >
					                    </div>
					                  </div>	
					                  
					                 <div class="form-group row">
					                   	<label class="col-md-3 col-form-label" for="text-input">핸드폰번호</label>
					                    <div class="col-md-9">
					                      <input class="form-control" id="text-input" type="text" name="userPhone"  value="<%=bean.getUserPhone()%>"  placeholder="핸드폰번호" >
					                    </div>
					                  </div>						                  
					            
						              <div class="form-group row">
						                  <label class="col-md-3 col-form-label" for="text-input">이메일</label>
						                   <div class="col-md-9">
						                     <input class="form-control" id="text-input" type="text" name="userEmail"  value="<%=bean.getUserEmail()%>"  placeholder="이메일주소" >
						                   </div>
						               </div>						                  
					                  					                  
					                  <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="text-input">생년월일</label>
					                    <div class="col-md-9">
					                      <input class="form-control" id="text-input" type="text" name="userBirth"  value="<%=bean.getUserBirth()%>" placeholder="생년월일">
					                    </div>
					                  </div>					                  					                  			              				            
					                  					                  					                  
					                  <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="date-input">성별</label>
					                    <div class="col-md-9">
					                      <input class="form-control" id="date-input" type="text" name="userSex"  value="<%=bean.getUserSex()%>" placeholder="성별">
					                    </div>
					                  </div>  					                  
					                  
					                  
					                  <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="date-input">주소</label>
					                    <div class="col-md-9"> 
					                     <!-- 좌석수는 number로 지정, 후에 문제시 text로 교체 -->
					                      <input class="form-control" id="date-input" type="number" name="userAddress" value="<%=bean.getUserAddress()%>"  placeholder="주소">
					                    </div>
					                  </div> 
					           
					           			 <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="date-input">회원가입일자</label>
					                    <div class="col-md-9"> 
					                     <!-- 좌석수는 number로 지정, 후에 문제시 text로 교체 -->
					                      <input class="form-control" id="date-input" type="date" name="userJoinDate" value="<%=bean.getUserJoinDate()%>"  placeholder="가입일자">
					                    </div>
					                  </div> 
					         
					         			 <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="date-input">회원상태</label>
					                    <div class="col-md-9"> 
					                     <!-- 좌석수는 number로 지정, 후에 문제시 text로 교체 -->
					                      <input class="form-control" id="date-input" type="number" name="userAvailable" value="<%=bean.getUserAvailable()%>"  placeholder="회원상태">
					                    </div>
					                  </div> 
					         
					                  
					                  <div>	                  
				                       	<input type="submit"  value="수정"/>
					                  	<input type="button" onclick="goDelete()" value="조회"/>
									</div>	
			             		</form>
			                
			                  </div>
			               </div>
			            </div>
			         </div>
		</div>
	</section>
	
</body>
</html>