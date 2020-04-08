<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
<link rel="stylesheet" href="style.css"/>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMovie</title>
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
        <link href="../css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="../css/external/jquery.selectbox.css" rel="stylesheet" />

    
        <!-- Custom -->
        <link href="../css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="../js/external/modernizr.custom.js"></script>

	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
    /*-- 인증된 사용자 영역을 처리하는 버튼들 ---*/
    //[회원 정보 변경]버튼을 클릭하면 자동실행
    $("#update").click(function(){//[회원정보수정]버튼 클릭
        //회원정보를 수정 및 회원 탈퇴를 위한 modify.jsp 페이지 요청
        location.href = "modify/modifyForm.jsp";
    });
    $("#delete").click(function(){//[회원정보수정]버튼 클릭
	        //회원정보를 수정 및 회원 탈퇴를 위한 modify.jsp 페이지 요청
	        location.href = "delete/deleteForm.jsp";
	    });
	
	
    
    //[로그아웃]버튼을 클릭하면 자동실행
    //logout.jsp페이지를 생행
    $("#logout").click(function(){//[회원정보수정]버튼 클릭
        $.ajax({
           type: "POST",
           url: "logout.jsp",
           success: function(data){
           location.href = "../index.jsp";
           }
        });
    });
 });
</script>
</head>
<body>
<%
		String userID = null;
		String userName = (String) session.getAttribute("userName");
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
%>
<%
		if (userID != null) {
%>
    <div class="wrapper">
        <jsp:include page="common_screen_top.jsp" flush="false" />
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
        <div id="status">
		     <ul>
				<li><b><%= userID %></b>님이 로그인 하셨습니다.</li>
				<li class="label2"><button id="logout">로그아웃</button>
		 			<button id="update">회원 정보 변경</button></li>
					<button id="delete">탈퇴</button></li>
			 </ul>
	  	</div>
        
        <jsp:include page="../common_screen_bottom.jsp" flush="false" />

    </div>
  
<%		
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = '../loginForm.jsp'");
		script.println("</script>");
	}
%>
<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Slider Revolution core JavaScript files -->
        <script type="text/javascript" src="../revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="../revolution/js/jquery.themepunch.revolution.min.js"></script>

        <!-- Slider Revolution extension scripts. --> 
        <script type="text/javascript" src="../revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensions/revolution.extension.video.min.js"></script>

        <!-- Mobile menu -->
        <script src="../js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="../js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Stars rate -->
        <script src="../js/external/jquery.raty.js"></script>
        
        <!-- Form element -->
        <script src="../js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="../js/form.js"></script>

        <!-- Twitter feed -->
        <script src="../js/external/twitterfeed.js"></script>

        <!-- Custom -->
        <script src="../js/custom.js"></script>
		
	      <script type="text/javascript">
              $(document).ready(function() {
                init_Home();
              });
		    </script>

</body>
</html>


