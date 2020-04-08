<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!doctype html>
<html>
<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>show schedule</title>
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

<style type="text/css">

.btn-date {
	width: 80px;
	background-color: #f8585b;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	margin: 0;
}

.btn-date:hover {
	background-color: #4c4145;
}

.btn-date:visited {
	color: white;
	background-color: #4c4145;
}
<!---->
.tab-content{
	padding-left: 0px;
	
}
.tab-pane active{
	margin-top: -px;
}
  
.choose-indector {
  margin-left:2px;
  position: relative;
  z-index: 13;
  width: 100%;
  background-color: #4c4145;
  color: #ffffff;
  font-size: 13px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  padding: 6px 21px 7px;
  cursor: pointer;
}
.choose-indector:before {
	margin-left:2px;
  content: "\f077";
  font: 13px "FontAwesome";
  color: #ffffff;
  position: absolute;
  top: 8px;
  right: 21px;
}

.page-heading{
	margin-top: 1px;
}

</style>
</head>

<body>
	<div class="wrapper">
		<jsp:include page="common_screen_top.jsp" flush="false" />


		<!-- 메인 -->
		<section class="container">
			<div class="order-container">
				<div class="order">
					<img class="order__images" alt='' src="images/tickets.png">
					<p class="order__title">
						상영시간표 <br>
						<span class="order__descript">연극 상영 날짜와 시간을 확인하세요!</span>
					</p>

				</div>
			</div>


			<h2 class="page-heading heading--outcontainer">극장을 선택해주세요.</h2>
		</section>

		<!-- 스크롤링 되는 포스터들 -->
		<div class="choose-film">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					
					<!--First Slide-->
				
						<div class="swiper-slide" data-film='대명문화광장'>
							<a href = " showSchedule2.jsp">
								<div class="film-images">
										<img alt='' src="images/cinema/대명문화공장.jpg">
								</div>
							</a>
							<p class="choose-film__title" align="center">대명문화광장</p>
						</div>
					
					<!--Second Slide-->
					<div class="swiper-slide" data-film='아트원씨어터'>
						<a href = " showSchedule3.jsp">
							<div class="film-images">
								<img alt='' src=images/cinema/아트원씨어터.jpg>
							</div>
						</a>
						<p class="choose-film__title" align="center">행복극장</p>
					</div>

					<!--Third Slide-->
					<div class="swiper-slide" data-film='열린극장'>
						<a href = " showSchedule4.jsp">
							<div class="film-images">
								<img alt='' src="images/cinema/열린극장.jpg">
							</div>
						</a>
						<p class="choose-film__title" align="center">파랑새극장</p>
					</div>

					<!--Four Slide-->
					<div class="swiper-slide" data-film='유니플렉스'>
						<a href = " showSchedule5.jsp">
							<div class="film-images">
								<img alt='' src="images/cinema/유니플렉스.jpg">
							</div>
						</a>
						<p class="choose-film__title" align="center">바탕골소극장</p>
					</div>

					<!--Five Slide-->
					<div class="swiper-slide" data-film='콘텐츠박스'>
						<a href = " showSchedule6.jsp">
							<div class="film-images">
								<img alt='' src="images/cinema/콘텐츠박스.jpg">
							</div>
						</a>
						<p class="choose-film__title" align="center">상상극장</p>
					</div>

					<!--Six Slide-->
					<div class="swiper-slide" data-film='파랑새극장'>
						<a href = " showSchedule7.jsp">
							<div class="film-images">
								<img alt='' src="images/cinema/파랑새극장.jpg">
							</div>
						</a>
						<p class="choose-film__title" align="center">대학로극장</p>
					</div>

					<!--Seven Slide-->
					<div class="swiper-slide" data-film='한성아트홀'>
						<a href = " showSchedule7.jsp">
							<div class="film-images">
								<img alt='' src="images/cinema/한성아트홀.jpg">
							</div>
						<p class="choose-film__title" align="center">동양극장</p>
					</div>

				</div>
			</div>
		</div>

		<section class="container">
			<div>
				<div class="choose-indector choose-indector--film">
					<strong>Choosen: </strong><span class="choosen-area"></span>
				</div>
			</div>
		</section>
			<br>
		
	</div>
</div>
</div>
	<hr style="border: soild 10px gray">

<  <jsp:include page="common_screen_bottom.jsp" flush="false" />


	<!-- JavaScript-->
	<script type="text/javascript">
	
	$('#myTab a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show')
		})
	</script>

	<!-- jQuery 3.1.1-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
	<!-- Migrate -->
	<script src="js/external/jquery-migrate-1.2.1.min.js"></script>
	<!-- jQuery UI -->
	<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<!-- Bootstrap 3-->
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

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
