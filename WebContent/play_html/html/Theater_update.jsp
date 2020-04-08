
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cinema.*" %>    
<%@page import="java.sql.*" %>
<%@page import="java.util.Vector" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.net.URLEncoder" %>
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
	<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
<style type="text/css">
.nav{
	margin-left: 40%;
}
th{
	text-align: center;
}

.btn-default{
	margin-left: 3px;
}

.Cloum{
	width: 100px;
	background: #e9e9e9;
}

</style><script>
function goDelete(){
	document.TheForm.action="Theater_delete.jsp";
	document.TheForm.submit();
}
function goUpdate(){
	document.TheForm.action="Theater_update_action.jsp";
	document.TheForm.submit();
}
</script>
</head>

<!----------------------------------------------------------------------->
<body>
<jsp:useBean id="cinema" class="cinema.Cinema">
	<jsp:setProperty name="cinema" property="*" />
</jsp:useBean>
  
<% 
	request.setCharacterEncoding("UTF-8");
	
	int CinemaNo = Integer.parseInt(request.getParameter("CinemaNo")); //member_select.jsp에 <input> name이 userID인 값을 갖고와서 userID에 저장
	CinemaDAO manager = new CinemaDAO(); //USERDAO 안에 있는 함수?사용하기위해 이름이 manager인 객체생성
	Cinema bean = manager.getCinemaNo(CinemaNo); //USER에 있는 변수사용 (bean 생성) getMember()는 UserDAO에 있는 함수
%>  
 
<!----------------------------------------------------------------------->  
<jsp:include page="admin_common_top.jsp" flush="false" />
<form name="TheForm"  method="post" >
<h3 align="center">관리자 : 연극관리</h3>
<table class = "Ttable" border="">
<tr>  </tr>  

   
<tr>  	
<!-- 번호 -->
<th class="TNO" colspan ="1" rowspan="2"><%=bean.getCinemaNo()%></th>

<!-- 이미지 -->
<td colspan ="2" rowspan="2" width="10%">
	<input type="text" width="auto" height="110px" name="TImg" value="<%=bean.getCinemaImg()%>"/>
</td>

<!-- 극장주소 --> 
<td align="center" class="Cloum" >극장주소:</td>
<td align="left" class="value" colspan="2" class="TAdress">
	<input type = "text" name="TAdress" size="35px" value="<%=bean.getCinemaAddress()%>"/>
</td>

<!-- 극장이름 -->
<td class="Cloum"  align="center">극장이름:</td>
<td align="left" class="value">
	<input type="text" name="TName" value="<%=bean.getCinemaName()%>"/>
</td>   

<!-- 남는 칸-->
<td></td>
<td></td>

</tr>

<tr>

<!-- 전화번호 -->
<td align="center" class="Cloum">전화번호:</td>
<td align="left"  class="tell" colspan="2"> 
 	<input type="text" name="TTell" size="35px" value="<%=bean.getCinemaPhone()%>"/>
</td> 
 
<!-- 사이트 -->
<td align="center" class="Cloum">극장 사이트: </td>
<td align="left"  class="value">
	<input type="text" name="TSite" value="<%=bean.getSiteAddress()%>"/>
</td>

<!-- 좌석수 -->
<td align="center" class="Cloum" class="sit">좌석수:</td>
<td align="left"  class="value" width="20px">
	<input type="text" name="TSeat" value="<%=bean.getCinemaSeat()%>"/>
</td>

</tr>       

</table>

<center>
		<input type="hidden" width="auto" height="110px" name="CinemaNo" value="<%=bean.getCinemaNo()%>"/>

		<input type="submit" class="btn btn-default" value="등록" onclick="goUpdate()" />
		<input type="submit" class="btn btn-default" value="삭제" onclick="goDelete()" />
		
</center>
</form>
</body>

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
         <!-- Select -->
        <script src="js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Stars rate -->
        <script src="js/external/jquery.raty.js"></script>
        
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

