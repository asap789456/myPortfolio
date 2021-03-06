<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="play_seat.PlaySeatDAO"%>
<%@page import="play_seat.PlaySeat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cinema.Cinema"%>
<%@page import="cinema.CinemaDAO"%>
<%@page import="genre.Genre"%>
<%@page import="genre.GenreDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="play.*"%>
<%@page import="java.util.Vector"%>
<%@page import="PlaySchedule.*"%>
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
<script>
	function goUpdate() {
		document.frm.submit();
	}
	function fnc_open() {
		document.frm2.submit();
	}
</script>
</head>
<body>

	<jsp:useBean id="play" class="play.PlayListBean">
		<jsp:setProperty name="play" property="*" />
	</jsp:useBean>
	<%
		/* 연극 정보를 수정하는 페이지  */
		request.setCharacterEncoding("utf-8");
		/* 이 전 페이지에서 넘어온 playNo의 값을 request로 받아 playNo에 저장(int 값이므로 형 변환) */
		int playNo = Integer.parseInt(request.getParameter("playNo"));

		/* PlayDAO 에서 만든 getOnePlay를 이용해 해당 번호의 연극의 정보를 가져옴  */
		PlayDAO manager = new PlayDAO();
		PlayListBean bean = manager.getOnePlay(playNo);

		/* PlayDAO 에서 만든 getPlayCinema를 이용해 해당 번호의 연극이 상영하는 극장의 정보를 가져옴  */
		PlayDAO pdao2 = new PlayDAO();
		PlayListBean pbean = pdao2.getPlayCinema(playNo);

		/* GenreDAO 에서 만든 getOneGenre를 이용해 해당 번호의 연극 장르를 가져옴  */
		GenreDAO gdao = new GenreDAO();
		Genre gbean = gdao.getOneGenre(playNo);

		/* DateFormat를 이용해 날짜가 MM/dd/yyyy인 형식을  yyyy-MM-dd로 변환 */
		DateFormat sdFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date Tdate = new Date();
		String today = sdFormat.format(Tdate);

		SimpleDateFormat fm = new SimpleDateFormat("MM/dd/yyyy", Locale.US);
		SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
		Date to = fm.parse(today);
		String playDate = newFormat.format(to);

		PlayScheduleDAO psdao = new PlayScheduleDAO();
		Vector<PlaySchedule> v = psdao.getCinema(playNo);

		ArrayList<PlaySeat> seatList = new ArrayList<PlaySeat>();
		seatList = new PlaySeatDAO().getSeatPrice(playNo);

		/* S석과 R석 가격 지정해서 db에 저장 */
		int vip = 0;
		int general = 0;
		for (int i = 0; i < 2; i++) {
			PlaySeat psbean = seatList.get(1);
			PlaySeat psbean1 = seatList.get(0);
			vip = psbean.getSeatPrice();
			general = psbean1.getSeatPrice();
		}
	%>
	<!--관리자 계정에서 연극의 정보를 업데이트 하는 페이지 -->
	<div class="wrapper">
		<jsp:include page="admin_common_top.jsp" flush="false" />
		<!-- Main content -->
		<br> <br> <br>
		<section class="container">
			<div class="col-sm-12">
				<form method="post" id="frm" name="frm"
					action="adminPlayUpdateAction.jsp">
					<div class="movie">
						<h2 class="page-heading"><%=bean.getName()%></h2>

						<div class="movie__info">
							<div class="col-sm-4 col-md-3 movie-mobile">
								<div class="movie__images">
									<span class="movie__rating"><%=bean.getGrade()%></span> <img
										alt='' src="images/play/<%=bean.getImg()%>" />
								</div>
							</div>

							<div class="col-sm-8">
								<input name="no" type="hidden" value="<%=bean.getNo()%>">
								<p class="movie__option">
									<strong>연극명: </strong><input class="btn btn-default"
										id="text-input" type="text" name="name"
										value=<%=bean.getName()%> placeholder="이름">
								</p>
								<p class="movie__option">
									<strong>공연시간: </strong><input class="btn btn-default"
										id="text-input" type="text" name="time"
										value="<%=bean.getTime()%>" placeholder="공연시간">
								</p>

								<div>
									<p class="movie__option">
										<strong>장르: </strong> <select style="margin-left: 25px;"
											size="1" name="genre" class="btn btn-default dropdown-toggle">
											<option value=<%=bean.getGenre()%> selected>장르선택</option>
											<%
												GenreDAO gdao2 = new GenreDAO();
												Vector<Genre> gv = gdao2.getAllGenre();
												//배열 리스트 BbsMovie 객체 생성, 값들을 다 불러와!
												for (int i = 0; i < gv.size(); i++) {
													Genre gbean2 = gv.get(i);
											%>
											<option value=<%=gbean2.getGenreNo()%>><%=gbean2.getGenreName()%></option>
											<%
												}
											%>
										</select>
									</p>
								</div>
								<p class="movie__option">
									<strong>관람 등급: </strong><input class="btn btn-default"
										id="text-input" type="text" name="grade"
										value="<%=bean.getGrade()%>" placeholder="관람등급">
								</p>
								<p class="movie__option">
									<strong>공연 기간: </strong><input class="btn btn-default"
										id="text-input" type="date" name="sday"
										value="<%=bean.getSday()%>" placeholder="시작날짜"> ~ <input
										class="btn btn-default" id="text-input" type="date"
										name="eday" value="<%=bean.getEday()%>" placeholder="종료날짜">
								</p>
								<p class="movie__option">
									<strong>S석 가격: </strong><input class="btn btn-default"
										id="text-input" type="text" name="Sprice" value="<%=vip%>"
										placeholder="가격">
								</p>
								<p class="movie__option">
									<strong>R석 가격: </strong><input class="btn btn-default"
										id="text-input" type="text" name="Rprice" value="<%=general%>"
										placeholder="가격">
								</p>

								<div>
									<p class="movie__option">
										<strong>극장명: </strong> <select size="1"
											style="margin-left: 13px;" name="cinemaNo"
											class="btn btn-default dropdown-toggle">
											<option value="<%=bean.getCinemaNo()%>" selected><%=pbean.getCinemaName()%></option>
											<%
												CinemaDAO cdao = new CinemaDAO();
												Vector<Cinema> cv = cdao.getAllCinema();
												//배열 리스트 BbsMovie 객체 생성, 값들을 다 불러와!
												for (int i = 0; i < cv.size(); i++) {
													Cinema cbean = cv.get(i);
											%>
											<option value=<%=cbean.getCinemaNo()%>><%=cbean.getCinemaName()%></option>
											<%
												}
											%>
										</select>
									</p>
								</div>
								<div class="movie__btns movie__btns--full">

									<a onclick="goUpdate()" class="btn btn-md btn--warning">수정완료</a><br />
									<a href="adminPlay.jsp" class="btn btn-md btn--danger">연극조회</a><br />
									<a href="admin_playschedule.jsp?playNo=<%=pbean.getNo()%>"
										class="btn btn-md btn--success">회차등록</a>
								</div>
							</div>
						</div>

						<div class="clearfix"></div>
						<h2 class="page-heading">이미지</h2>
						<p class="movie__describe">
							포스터:<input type="file" name="img" value="<%=bean.getImg()%>">
						</p>

						<h2 class="page-heading">줄거리</h2>
						<p class="movie__describe">
							<input style="width: 500px;" name="info"
								value="<%=bean.getInfo()%>" placeholder="줄거리">
						</p>

						<h2 class="page-heading">트레일러</h2>
						<p class="movie__describe">
							<input style="width: 500px;" name="video"
								value="<%=bean.getVideo()%>" placeholder="트레일러">
						</p>

					</div>
				</form>
				<form method="post" id="frm" name="frm2"
					action="adminPlayUpdate2.jsp">
					<div style="position: relative;"col-sm-12">
						<h2 style="position: relative;" class="page-heading">공연일정</h2>

						<div style="position: relative;"
							class="choose-container choose-container--short">
							<div class="datepicker">
								<span class="datepicker__marker"><i
									class="fa fa-calendar"></i>날짜</span> <input type="text"
									id="datepicker" value=<%=today%> name="playDate"
									class="datepicker__input">
							</div>
							<div
								style="position: relative; top: -30px; left: 240px; z-index: 1000"
								class="movie__btns movie__btns--full">
								<input type="hidden" name="playNo" value="<%=bean.getNo()%>">
								<input type="hidden" name="playDate" value="<%=playDate%>">
								<input type="hidden" name="cinemaNo"
									value="<%=bean.getCinemaNo()%>"> <a href="#"
									onclick="fnc_open()" class="btn btn-md btn--success"
									style="width: 100px;">회차확인하기</a>
							</div>
						</div>

						<div style="position: relative;"
							class="time-select time-select--wide">
							<!-- 제목과 시간대 사이 거리조절 클래스 -->
							<div
								style="width: 550px; height: 100px; background-color: #f5f5f5">
								<!-- 회색 박스 오브젝트 -->
								<p align="center" style="padding-top: 38px;">회차확인하기 버튼을 누르세요</p>
							</div>
						</div>
					</div>
				</form>
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
