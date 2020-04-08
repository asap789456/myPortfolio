<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

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
#td td a{
	border:1px solid #fdcb58;
	padding:5px;
	border-radius:4px;
	colot:#fff;
	cursor:pointer;
	background-color:#fdcb58;
}

.table-bordered{
	margin-left: 5%;
	width: 70%;
}

.button{

}

 </style>
 <title>게시판</title>
 </head>
 <body>
		<%
			String userID = null;
			if (session.getAttribute("userID")!= null){
				userID = (String) session.getAttribute("userID");
			}
			int bbsNo = 0;
			
			if (request.getParameter("bbsNo")!=null){
				bbsNo = Integer.parseInt(request.getParameter("bbsNo"));
			}
			if (bbsNo == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");
			}
			Bbs bbs = new BbsDAO().getBbs(bbsNo);
		%>
<div class="wrapper">
	<jsp:include page="common_screen_top.jsp" flush="false" />


<div align="center">
		<table style="text-align: left;" border="1" class="table table-bordered">

				<tr>
					<td colspan="2" style="width: 50px;">No.<%=bbs.getBbsNo() %></td>
					<td colspan="3" style="width: 300px;"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>		
					<td style="width: 50px;"><%= bbs.getUserID() %></td>
				</tr>
				
				</tr>		

				<tr>
					<td colspan="2">작성일</td><td colspan="5"> <%= bbs.getBbsDate() %></td>
				</tr>

				<tr>
					<td colspan="5" rowspan="4">
						<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
					</td>	
				</tr>		
			
			
				<tr id="td" style="float: right;">
		<td><a href = "bbs.jsp" class="btn btn-primary">목록</a></td>
		<%
			if(userID != null && userID.equals(bbs.getUserID())){
		%>
			<td><a style="float: right;" href = "update.jsp?bbsNo=<%= bbsNo %>" class="btn btn-primary">수정</a></td>
			<td><a onclick="return confirm('삭제하시겠습니까?')" href = "deleteAction.jsp?bbsNo=<%= bbsNo %>" class="btn btn-primary">삭제</a></td>
		<%
			}
		%>
		</tr>
	</table>
	</div>




	<jsp:include page="common_screen_bottom.jsp" flush="false" />
</div>
</body> 


</html>



	

