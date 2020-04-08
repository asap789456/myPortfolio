<%@page import="genre.Genre"%>
<%@page import="genre.GenreDAO"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="play.*"%>
<%@page import="java.util.Vector" %>
<%@page import="PlaySchedule.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
  
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

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
</head>
<script type="text/javascript">
function fnc_open(){
	document.frm.submit();
}
</script>
<style>
#one{
margin-left:  20px;
}
</style>
<body>
<%
	/* 예매 시 선택된 연극에 해당하는 정보를 보여주는 페이지 */
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	
	PlayDAO pdao = new PlayDAO();
	PlayListBean bean = pdao.getPlayCinema(no);
	GenreDAO gdao = new GenreDAO();
	Genre gBean = gdao.getOneGenre(no);
	
	/* 날짜 형 변환 */
	DateFormat sdFormat = new SimpleDateFormat("MM/dd/yyyy");
	Date Tdate = new Date();
	String today = sdFormat.format(Tdate);
	
	SimpleDateFormat fm = new SimpleDateFormat("MM/dd/yyyy", Locale.US);
	SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
	Date to = fm.parse(today);
	String playDate = newFormat.format(to);
	
	PlayScheduleDAO psdao = new PlayScheduleDAO();
	ArrayList<PlaySchedule> v  = psdao.getPlaySchedule(no, playDate);
%>
<div class="wrapper place-wrapper">
<jsp:include page="common_screen_top.jsp" flush="false" />
<br>
<br>
	<div>    
		<div style= "position: relative; top:30px; left:290px;" align="left" class="film-images">
			<img alt='포스터' src="images/play/<%=bean.getImg() %>" style="width: 20%;">
		</div>
	<br>
	</div>
	<form method="post" id="frm" name="frm" action="book1_time_3.jsp">
        <section class="container">
            <div style="position: relative; top: -290px; left:500px;" class="col-sm-12">
                <h2 style="position: relative; top:-30px;" class="page-heading">날짜 선택</h2>


                <div style="position: relative; top:-30px;" class="choose-container choose-container--short">
					<div class="datepicker">
						<span class="datepicker__marker"><i class="fa fa-calendar"></i>날짜</span>
						<input type="text" id="datepicker" value=<%=today%> name="playDate" class="datepicker__input">

                    </div>
                    <div style="position: relative; top:-30px; left: 240px; z-index: 1000" class="movie__btns movie__btns--full">
	                    <input type="hidden" name="playNo" value="<%=bean.getNo()%>">
						<input type="hidden" name="cinemaNo" value="<%=bean.getCinemaNo()%>"> 
                        <a href="#" onclick="fnc_open()" class="btn btn-md btn--warning">회차 확인하기</a>
                    </div>
                </div>

				<h2 style="position: relative; top:-70px;" class="page-heading">회차 선택</h2>
                <div style="position: relative; top:-70px;" class="time-select time-select--wide"> <!-- 제목과 시간대 사이 거리조절 클래스 -->
	                <div style="width: 700px;height:100px; background-color: #f5f5f5"> <!-- 회색 박스 오브젝트 -->
	                	<p align="center" style="padding-top: 38px;">관람하실 날짜 선택 후 '회차 확인하기' 버튼을 눌러주세요</p>
	                </div>
            	</div>
            </div>
            <div class="datepicker" style="position: relative; top: -350px; left:110px;">
	            <a class="datepicker__input" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
										  <span class="datepicker__marker">연극 줄거리</span>
				</a>
				<div class="collapse" id="collapseExample">
					<div class="well">
			<table id="imfo" >
				 		<tr> 
				 			<th width="20%">
				 			   <h2 style=" margin-left:20%; text-align: left" class="page-heading">상세정보</h2></th>
							<th><h2 style=" margin-left:13%; text-align: left" class="page-heading">줄거리</h2></th>
						</tr>	<div id="regForm" class="boxArea">								
						<tr> <td align="center">공연시간 : <%=bean.getTime() %></td>	
							<div id="regForm" class="boxArea">	
							<td rowspan="3" ><p  style="margin-left:13%"><%=bean.getInfo() %></p></td>
						</tr>						
						<tr>  <td align="center">장르 : <%=gBean.getGenreName()%></td></tr>
						<tr>  <td align="center"> <p style="color: red;">관람가:<%=bean.getGrade() %>세 이상 관람 가능</p></td></tr>	
					</div>
					</table>
				  </div>
				</div>
            </div>
		</section>           
        <div class="clearfix"></div>
        <div class="clearfix"></div>  
</form>
</div>
	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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