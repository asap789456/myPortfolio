<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.*" %>    
<%@page import="java.sql.*" %>
<%@page import="java.util.Vector" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.net.URLEncoder" %>

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

        <!-- Mobile menu -->
        <link href="css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="css/external/jquery.selectbox.css" rel="stylesheet" />

    
        <!-- Custom -->
        <link href="css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
	
	<!-- 테이블 CSS가져온거!!!!!!!!!!!!!!!!!! -->
        <link rel="stylesheet" type="text/css" href="css/table.css">
<style>
*{
	padding:0;
	text-decoration: none;
	list-style: none;
	font-family: Verdana;
}
div#bar{

	background: #FAEBD4;
	margin-left: 65px;
	font-size: 13px;
	line-height: 45px;
	text-indent: 30px;

}
table thead tr td{
	text-align: center;
	padding: 9px;
	line-height:20px;
	font-size:14px;

}
.table{
	margin: 0 auto;
	width: 1100px;
	margin-left:-0px;
}
.write{
	border:1px solid #fdcb58;
	padding:8px;
	border-radius:4px;
	colot:#fff;
	float:right;
	cursor:pointer;
	background-color:#fdcb58;
	margin-right:20px;
	margin-top:-19px;
}
#view{
	padding-left: 40px;


}
tr.bar{
	 height: 5px;
	 width: 1080px; 
	 background-color: #e3e3e3;
	 font-weight:bold;
	 border-radius:30px;
}

h2 {
  color: #4c4145;
  font-size: 27px;
  font-family: 'aleoregular', sans-serif;
  margin-top: 70px;
  margin-bottom: 23px;
}

hr{
	width: 1080px;
	color: #f0f0f0;
	border: thin solid;
	margin-top: 5px;
}
.paginatioon--full {
  padding-right: 10;
}
.pagination {
  padding-right: 330px;
  display: block;
  margin-top: -32px;
}
.booking-pagination {
  text-align: center;
  margin-top: 57px;
  margin-bottom: 90px;
}
.booking-pagination .booking-pagination__prev {
  display: inline-block;
  padding: 6px 14px;
  background: none;
  border: none;
  box-shadow: none;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-transition: 0.4s;
  -o-transition: 0.4s;
  transition: 0.4s;
}
.booking-pagination .booking-pagination__prev:hover {
  color: #ffffff;
  background-color: #fe505a;
}
.booking-pagination .booking-pagination__prev:hover .arrow__text {
  color: #ffffff;
  border-color: #ffffff;
}
.booking-pagination .booking-pagination__prev:hover .arrow__text:before {
  color: #ffffff;
}
.booking-pagination .booking-pagination__prev:hover .arrow__info {
  color: #ffffff;
}
.booking-pagination .booking-pagination__next {
  display: inline-block;
  padding: 6px 14px;
  background: none;
  border: none;
  box-shadow: none;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-transition: 0.4s;
  -o-transition: 0.4s;
  transition: 0.4s;

}
.booking-pagination .booking-pagination__next:hover {
  color: #ffffff;
  background-color: #fe505a;
}
.booking-pagination .booking-pagination__next:hover .arrow__text {
  color: #ffffff;
  border-color: #ffffff;
}
.booking-pagination .booking-pagination__next:hover .arrow__text:before {
  color: #ffffff;
}
.booking-pagination .booking-pagination__next:hover .arrow__info {
  color: #ffffff;
}
</style>		
</head>

<body>
<% 
	request.setCharacterEncoding("UTF-8");
	/*-------------------------검색기능을 위해 바꾼곳--------------------------*/
	String searchType = "이름";
	String search = "";
	int pageNumber = 0;
	
	if (request.getParameter("pageNumber") != null){
		try{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	if(request.getParameter("searchType") != null){
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search") != null){
		search = request.getParameter("search");
	}
	/*-------------------------------------------------------------------------*/
	UserDAO udao = new UserDAO();
	Vector<User> v  = udao.selectUserAdmin(); //전체 리스트 가져오기(Vector 이용)
%>
<div class="wrapper">
     <jsp:include page="admin_common_top.jsp" flush="false" />
	<div class="search-wrapper">
		<div class="container container--add">
			<form action="./adminMemberSelect.jsp" id='search-form' method='get' class="search">
				<input type="text" class="search__field" placeholder="검색" name="search">
				<select name="searchType" id="search-sort" class="search__sort" tabindex="0">
					<option value="이름" selected='selected'>이름</option>
					<option value="아이디" <%if(searchType.equals("아이디")) out.println("selected"); %>>아이디</option>
				</select>
				<button type='submit' class="btn btn-md btn--danger search__button">검색하기</button>
			</form>
		</div>
	</div>
        
	<section class="container">
		<div class="col-sm-12">
		<h2 class="page-heading">회원조회</h2>
			<form method="post" name="memForm" action="adminMemberUpdate.jsp">
				<div id="tables">	
					<table cellpadding="0" cellspacing="0" class="type07" border="1">
					  	<thead>
					  		<tr class="bar">
								<th scope="cols" class="strong" width="auto">아이디</th>
								<th style="width: 80px;" scope="cols">고객명</th>
								<th scope="cols">핸드폰번호</th>
								<th scope="cols">이메일</th>
								<th style="width: 100px;" scope="cols">생년월일</th>
								<th scope="cols">성별</th>
								<!-- <th scope="cols">주소</th> -->
								<th style="width: 100px;" scope="cols">회원가입일자</th>
								<th scope="cols">회원상태</th>	
							
							</tr>  
					<%
						ArrayList<User> userList = new ArrayList<User>();
						userList = new UserDAO().getUser(searchType, search,pageNumber);
						if(userList != null )
							for(int i = 0; i < userList.size(); i++){
								if(i == 5) break;
								User bean = userList.get(i);		
					%>
							<tr>
								<td width="10px;" align="right"><a href="adminMemberUpdate.jsp?userID=<%=bean.getUserID()%>"><strong><%=bean.getUserID()%></strong></a></td>
								<td ><%=bean.getUserName()%></td>
								<td><%=bean.getUserPhone()%></td>
								<td><%=bean.getUserEmail()%></td>
								<td><%=bean.getUserBirth()%></td>
							<%
								if(bean.getUserSex() == 0){
							%>
								<td>남자</td>
							<% 
								} else {
							%>
								<td>여자</td>
							<%
								}
							%>
								<%-- <td><%=bean.getUserAddress()%></td> --%>
								<td><%=bean.getUserJoinDate()%></td>
							<%
								if(bean.getUserAvailable() == 1){
							%>
								<td>가입</td>
							<% 
								} else {
							%>
								<td>탈퇴</td>
							<%
								}
							%>
							</tr>	
					<%		
						}
					%>	
					  	</thead>
					</table>
					<hr>
					<table  class="type07" border="1">
						<tr><td></td></tr>
					</table>
				</div>
			</form>	
			<div align="center">
				<div class="pagination paginatioon--full">
				
					<%
						if(pageNumber <= 0) {
					%>
							<a class="pagination__prev">이전</a>
					<%
						} else { 
					%>
						<a href="./adminMemberSelect.jsp?searchType=<%=URLEncoder.encode(searchType,"UTF-8") %>
						&search=<%=URLEncoder.encode(search,"UTF-8") %>
						&pageNumber=<%=pageNumber - 1 %>" class="pagination__prev">이전</a>
					<%
						}
					
						if(userList.size() < 6) {
					%>
							<a class="pagination__next">다음</a>
					<%
						} else { 
					%>
							<a href="./adminMemberSelect.jsp?searchType=<%=URLEncoder.encode(searchType,"UTF-8") %>
							&search=<%=URLEncoder.encode(search,"UTF-8") %>
							&pageNumber=<%=pageNumber + 1 %>" class="pagination__next">다음</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</section>
</div>
  <jsp:include page="admin_bottom.jsp" flush="false" />
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