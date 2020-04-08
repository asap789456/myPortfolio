<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE>
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
        
        <link rel="stylesheet" type="text/css" href="bbs/bbsLayout.css"> 
</head>
<body>
	<!-- 사용자 페이지 - 리뷰 전체 리스트를 불러와서 화면에서 보여주는 페이지  -->
	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}

		/*-------------------------검색기능을 위해 바꾼곳--------------------------*/
		String searchType = "제목";
		String search = "";
		int pageNumber = 0;
		/* 페이징 처리를 위해 pageNumber를 이용 */
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
	%>
	
<div class="wrapper">
	<jsp:include page="common_screen_top.jsp" flush="false" />
	<div class="search-wrapper">
		<div class="container container--add">
			<!-- 현재 페이지에 값을 넘겨주어 검색을 가능하게 함  -->
			<form action="./bbs.jsp" id='search-form' method='get' class="search">
				<input type="text" class="search__field" placeholder="검색" name="search">
				<select name="searchType" id="search-sort" class="search__sort" tabindex="0">
					<!-- 검색 기준을 제목과 내용으로 함 -->
					<option value="제목" selected='selected'>제목</option>
					<option value="내용" <%if(searchType.equals("내용")) out.println("selected"); %>>내용</option>
				</select>
				<button type='submit' class="btn btn-md btn--danger search__button">검색하기</button>
			</form>
		</div>
	</div>

	<section class="container">
		<div class="col-sm-12">
		<h2 class="page-heading">리뷰</h2>
		
			<div id="tables">	
				<table cellpadding="0" cellspacing="0" class="table">
					<thead>
						<tr class="bar">
							<td style="width: 10px;">No.</td>
							<td style="width: 70px;">제목</td>
							<td style="width: 20px;">회원명</td>
							<td style="width: 20px;">선택한 연극</td>
							<td style="width: 20px;">별점</td>
							<td style="width: 10px;">등록일자</td>
						</tr>
					<%
					/* db값을 불러와 리스트로 보여준다 */
					ArrayList<Bbs> boardList = new ArrayList<Bbs>();
					boardList = new BbsDAO().getBoard(searchType, search, pageNumber);	
					if(boardList != null )
						for(int i = 0; i < boardList.size(); i++){
							if(i == 5) break;
							Bbs bean = boardList.get(i);
					%>
						<tr>
							<td><%= bean.getBbsNo() %></td>
							<td style="text-align:left;"><a href="view.jsp?bbsNo=<%= bean.getBbsNo() %>"><%= bean.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
							<td><%= bean.getUserID() %></td>
							<td><%= bean.getPlayName() %></td>
							<td><%= bean.getPlayGrade() %></td>
							<td><%= bean.getBbsDate().substring(0,4) +"."+ bean.getBbsDate().substring(5,7) + "." + bean.getBbsDate().substring(8,10) %></td>
						</tr>
					<%
						}
					%>
					</thead>
				</table>
				<hr>
				<table class="table" id="table">
					<tr>
						<td colspan="4" height="5"></td>
					</tr>
					<tr>	
						<td><a href="write.jsp"><input class="write" type=submit value="글쓰기"></a></td>
					</tr>
				</table>
			</div>
			
			<div align="center">
				<div class="pagination paginatioon--full">
					<!-- 페이징 처리 -->
					<%
						/* 페이지 번호가 0보다 작을경우 이전 표시만 나타나게 함  */
						if(pageNumber <= 0) {
					%>
							<a class="pagination__prev">이전</a>
					<%
						} else { 
					%>
							<a href="./bbs.jsp?searchType=<%=URLEncoder.encode(searchType,"UTF-8") %>
							&search=<%=URLEncoder.encode(search,"UTF-8") %>
							&pageNumber=<%=pageNumber - 1 %>" class="pagination__prev">이전</a>
					<%
						}
					%>
					
					<%
						if(boardList.size() < 6) {
					%>
							<a class="pagination__next">다음</a>
					<%
						} else { 
					%>
							<a href="./bbs.jsp?searchType=<%=URLEncoder.encode(searchType,"UTF-8") %>
							&search=<%=URLEncoder.encode(search,"UTF-8") %>
							&pageNumber=<%=pageNumber + 1 %>" class="pagination__next">다음</a>
					<%
						}
					%>
				</div>
			</div>
		</div>	
	</section>     
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
