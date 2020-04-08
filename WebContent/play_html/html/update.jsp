<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<!DOCTYPE html>
<html>
 <head>
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
        <link href="css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="css/external/jquery.selectbox.css" rel="stylesheet" />

    
        <!-- Custom -->
        <link href="css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>


 <meta charset="utf-8">
 <style type="text/css">

.border{
	border:1px solid #eee; 
	background-color: #eee;
}

table{
	width: 960px;
}
a{
	text-decoration: none;
	list-style: none;
	color:#000;
}
#td td input{
	border:1px solid #fdcb58;
	padding:5px;
	border-radius:4px;
	colot:#fff;
	cursor:pointer;
	background-color:#fdcb58;
}
 </style>
 <title>게시판</title>
 </head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = 'loginForm.jsp'");
		script.println("</script>");
	}
	int bbsNo = 0;
	
	if(request.getParameter("bbsNo") != null){
		bbsNo = Integer.parseInt(request.getParameter("bbsNo"));
	}
	if(bbsNo == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsNo);
	if (!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
%>
<div class="wrapper">
	<jsp:include page="common_screen_top.jsp" flush="false" />

<form method = "post" action="updateAction.jsp?bbsNo=<%=bbsNo %>">
 <div align="center">
		<table style="text-align: left;">

				<tr>
					<td style="width: 10px;">No.<%=bbs.getBbsNo() %></td>
					<td><input size="50" maxlength="100" name="bbsTitle" value="<%= bbs.getBbsTitle()%>"></td>
					<td style="width: 10px;"><%= bbs.getUserID() %></td>
					<tr><td class = "border" colspan="6"></td></tr>			
				</tr>
		</table>
		<table>
				<tr>
					<td>작성일자 <%= bbs.getBbsDate() %></td>
				</tr>

				<tr>
					<td><textarea cols="130" rows="18" name="bbsContent"><%= bbs.getBbsContent()%></textarea></td>	
				</tr>		
	<tr id="td">
		<td style="float: right;"><input type=submit value="글수정"></td>
       	<td><a href="bbs.jsp"><input type=button value="exit"></a></td>
    </tr>
	</table>
	</div>
 </form>
 	<jsp:include page="common_screen_bottom.jsp" flush="false" />
 	</div>
</body> 


</html>



	

