<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Vector"%>
<%@page import="play.*"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.net.URLEncoder" %>

<!doctype html>
<html>
<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>APicket_Booking step 1</title>
<meta name="description" content="A Template by Gozha.net">
<meta name="keywords" content="HTML, CSS, JavaScript">
<meta name="author" content="Gozha.net">

<!-- Mobile Specific Metas-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="telephone=no" name="format-detection">

<!-- Fonts -->
<!-- Font awesome - icon font -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Roboto -->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700'
	rel='stylesheet' type='text/css'>


<!-- jQuery UI -->
<link
	href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet">

<!-- Mobile menu -->
<link href="css/gozha-nav.css" rel="stylesheet" />

<!-- Select -->
<link href="css/external/jquery.selectbox.css" rel="stylesheet" />

<!-- Swiper slider -->
<link href="css/external/idangerous.swiper.css" rel="stylesheet" />

<!-- Custom -->
<link href="css/style.css?v=1" rel="stylesheet" />

<!-- Modernizr -->
<script src="js/external/modernizr.custom.js"></script>
</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	/*-------------------------검색기능을 위해 바꾼곳--------------------------*/
	String searchType = "연극명";
	String search = "";
	if(request.getParameter("searchType") != null){
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search") != null){
		search = request.getParameter("search");
	}
	/*-------------------------------------------------------------------------*/

	PlayDAO pdao = new PlayDAO();
	Vector<PlayListBean> v  = pdao.getSelectPlay2();
	
	PlayDAO pdao2 = new PlayDAO();
	Vector<PlayListBean> v2  = pdao2.getAllPlay();
%>
	<div class="wrapper">
		<jsp:include page="admin_common_top.jsp" flush="false" />


        <!-- *********************검색기능을 위해 바꾼곳********************** -->
        <div class="search-wrapper">
            <div class="container container--add">
                <form action="./adminPlay.jsp" id='search-form' method='get' class="search">
                    <input type="text" name="search" class="search__field" placeholder="검색">
                    <select name="searchType" id="search-sort" class="search__sort" tabindex="0">
						<option value="연극명">연극명</option>
						<option value="관람등급" <%if(searchType.equals("관람등급")) out.println("selected"); %>>관람등급</option>
                    </select>
                  
                    <button type='submit' class="btn btn-md btn--danger search__button">검색</button>
                </form>
            </div>
        </div>
<!-- *********************************************************************** -->

		<!-- Main content -->
		<section class="container">
			<div class="col-sm-12">
				<h2 class="page-heading">연극 조회</h2>
				<div class="cinema-wrap">
					<div class="row">
						<!-- *********************검색기능을 위해 바꾼곳********************** -->
						<%
							ArrayList<PlayListBean> playList = new ArrayList<PlayListBean>();
							playList = new PlayDAO().getPlay(searchType, search);
							if(playList != null )
								for(int j = 0; j < playList.size(); j++){
									PlayListBean bean = playList.get(j);		
						%>		
						<div class="col-xs-6 col-sm-3 cinema-item name ing">
							<div class="cinema">
								<a href='adminPlayUpdate.jsp?playNo=<%=bean.getNo()%>'
									class="cinema__images"> <img alt=''
									src="images/play/<%=bean.getImg()%>"> <span
									class="cinema-rating"><%=bean.getGrade() %>세</span>
								</a>
								<div style="padding-top: 10px;">
									<p><%=bean.getName()%></p>
									<a href='adminPlayUpdate.jsp?playNo=<%=bean.getNo()%>'
										class="btn btn-md btn--warning play_btn">수정하기</a> <a
										href="adminPlayDelete.jsp?playNo=<%=bean.getNo()%>"
										class="btn btn-md btn--danger">삭제하기</a> <br /> <br /> <br />
								</div>
							</div>
						</div>
						<%
							} 
						%>						
<%-- 						<%
							} 
						%> --%>
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
