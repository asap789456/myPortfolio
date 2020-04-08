<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.*" %>
<%@ page import="play.*" %>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<html>
<head> 
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket - 글쓰기</title>
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
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
    <!-- Stylesheets -->
        <!-- jQuery UI -->
        <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

        <!-- Mobile menu -->
        <link href="css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="css/external/jquery.selectbox.css" rel="stylesheet" />
        <!-- Swiper slider -->
        <link href="css/external/idangerous.swiper.css" rel="stylesheet" /> 
    
        <!-- Custom -->
        <link href="css/style.css?v=1" rel="stylesheet" />

		<!-- 부트스트랩 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
    
<style type="text/css">
.MovieSelect{
	position: relative;
}
.MGrade{
	position: relative;
	margin-top: 7px;
	margin-bottom: 7px;
}
.dropdown-toggle{
	width:700px;
}
</style>
</head>

<body>
<%
 		
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = 'loginForm.jsp'");
		script.println("</script>");
	}
	else{
%>
<div class="wrapper">
	<jsp:include page="common_screen_top.jsp" flush="false" />

   <!-- Main content -->
   <section class="container">
       <h2 class="page-heading heading--outcontainer">리뷰 작성</h2>
   </section>    
   
   <form class="form row" method = "post" action="writeAction.jsp">      
   <div class="contact-form-wrapper">
       <div class="container">
           <div class="col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
                   <p class="form__title">리뷰작성</p>
                    <div class="col-sm-12">

		<div class ="MovieSelect">					
		<select size="1" name=playName class="btn btn-default dropdown-toggle">
			<option value="" selected>연극선택</option>
			<%  
				PlayDAO pdao = new PlayDAO();
				Vector<PlayListBean> v  = pdao.getAllPlay();
				for(int i = 0; i < v.size(); i++) {
					PlayListBean bean = v.get(i);
				%>
					<option value=<%=bean.getName() %>><%= bean.getName() %></option>
				<%
					}
				%>
							</select>
							</div>	
		 
							<div class ="MGrade">
								<select name="playGrade" class="btn btn-default dropdown-toggle">
								<option value="1" selected>평점선택</option>
								<option value="5">★★★★★</option>
								<option value="4">★★★★☆</option>
								<option value="3">★★★☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="1">★☆☆☆☆</option>
								
								
								</select>
							</div>
                        </div>
                        <div class="col-sm-12">
                            <input type='text' placeholder='Title' name='bbsTitle' class="form__name" />
                        </div>
                        <div class="col-sm-12">
                            <textarea placeholder="Message" name="bbsContent" class="form__message"></textarea>
                        </div>
 
 
                        <input type="submit" class='btn btn-md btn--danger' value="등록하기">
                       	<a href="bbs.jsp" class='btn btn-md btn--danger'>목록으로</button></a>

                </div>
            </div>
        </div>

</form>

<jsp:include page="common_screen_bottom.jsp" flush="false" />

</div>
<%
	}
%> 
	<!-- JavaScript-->
        <!-- jQuerys 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Mobile menu -->
        <script src="js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="js/external/jquery.selectbox-0.2.min.js"></script>

        <!--*** Google map  ***-->
        <script src="https://maps.google.com/maps/api/js?sensor=true"></script> 
        <!--*** Google map infobox  ***-->
        <script src="js/external/infobox.js"></script>

        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>

        <!-- Custom -->
        <script src="js/custom.js"></script> 
		
		<script type="text/javascript">
            $(document).ready(function() {
                init_Contact ();
            });
		</script>

</body>
</html>
 
