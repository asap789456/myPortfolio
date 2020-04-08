<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="cinema.*"%>
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

        <!-- Mobile menu -->
        <link href="css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="css/external/jquery.selectbox.css" rel="stylesheet" />

    
        <!-- Custom -->
        <link href="css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
        <link rel="stylesheet" type="text/css" href="bbs/bbsLayout.css">    
        <!-- 테이블 CSS가져온거!!!!!!!!!!!!!!!!!! -->
        <link rel="stylesheet" type="text/css" href="css/table.css">

</head>

<body>
<% 
  /* 관리자 페이지 - 극장의 전체 리스트를 보여줌  */
  /*-------------------------검색기능을 위해 바꾼곳--------------------------*/
	String searchType = "극장명";
	String search = "";
	if(request.getParameter("searchType") != null){
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search") != null){
		search = request.getParameter("search");
	}
 /*-------------------------------------------------------------------------*/
	CinemaDAO pdao = new CinemaDAO();
	Vector<Cinema> v  = pdao.selectCinemaAdmin(); //전체 리스트 가져오기(Vector 이용)
%>
<div class="wrapper">
<jsp:include page="admin_common_top.jsp" flush="false" />

   <!-- 겁색 기능 -->
			<form action="./adminTheaterSelect.jsp" method="get"  id='search-form' class="search">
		        <div class="search-wrapper">
		            <div class="container container--add">
                    	<input type="text" class="search__field" name="search" placeholder="검색">
	                    <select name="searchType" id="search-sort" class="search__sort" tabindex="0">
	                        <option value="극장명" selected='selected'>극장명</option>
	                        <option value="주소" <%if(searchType.equals("주소")) out.println("selected"); %>>주소</option>
	                    </select>
	                    <button type='submit' class="btn btn-md btn--danger search__button">검색</button>
		            </div>
		        </div>
     		 </form>  
	<!-- Main content -->
		<section class="container">
			<div class="col-sm-12">
				<h2 class="page-heading">좌석 등급 관리자</h2>
				<div class="cinema-wrap">
					<div class="row">
						<!-- *********************검색기능********************** -->
						<%
							ArrayList<Cinema> cinemaList = new ArrayList<Cinema>();
							cinemaList = new CinemaDAO().getCinema(searchType, search);
							if(cinemaList != null )
								for(int j = 0; j < cinemaList.size(); j++){
									Cinema bean = cinemaList.get(j);		
						%>
		
						<div class="col-xs-6 col-sm-3 cinema-item name ing">
							<div class="cinema">
								<a href='adminSeatGradeUpdate.jsp?cinemaNo=<%=bean.getCinemaNo()%>'
									class="cinema__images"> <img alt=''
									src="images/cinema/<%=bean.getCinemaImg()%>"> <span
									class="cinema-rating"><%=bean.getCinemaSeat() %>좌석</span>
								</a>
								<div style="padding-top: 10px;">
									<p><%=bean.getCinemaName()%></p>

								</div>
							</div>
						</div>
						<%
							} 
						%>						
					</div>

				</div>
			</div>
		</section>

		<div class="clearfix"></div>

		<jsp:include page="common_screen_bottom.jsp" flush="false" />
	</div>

	<!-- JavaScript-->
	<!-- jQuery 3.1.1-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')
	</script>
	<!-- Migrate -->
	<script src="js/external/jquery-migrate-1.2.1.min.js"></script>
	<!-- jQuery UI -->
	<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<!-- Bootstrap 3-->
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

	<!-- Slider Revolution core JavaScript files -->
	<script type="text/javascript"
		src="revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript"
		src="revolution/js/jquery.themepunch.revolution.min.js"></script>


	<!-- Slider Revolution extension scripts. -->
	<script type="text/javascript"
		src="revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script type="text/javascript"
		src="revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script type="text/javascript"
		src="revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script type="text/javascript"
		src="revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript"
		src="revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script type="text/javascript"
		src="revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript"
		src="revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript"
		src="revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript"
		src="revolution/js/extensions/revolution.extension.video.min.js"></script>

	<!-- Mobile menu -->
	<script src="js/jquery.mobile.menu.js"></script>
	<!-- Select -->
	<script src="js/external/jquery.selectbox-0.2.min.js"></script>
	<!-- Swiper slider -->
	<script src="js/external/idangerous.swiper.min.js"></script>

	<!-- Form element -->
	<script src="js/external/form-element.js"></script>
	<!-- Form validation -->
	<script src="js/form.js"></script>

	<!-- Custom -->
	<script src="js/custom.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			init_BookingOne();
		});
	</script>
</body>
</html>
