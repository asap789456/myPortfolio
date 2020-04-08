<%@page import="java.text.DateFormat"%>
<%@page import="PlaySchedule.PlaySchedule"%>
<%@page import="PlaySchedule.PlayScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="play_seat.*"%>
<%@page import="play.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket_Booking2</title>
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
    
    <!-- Stylesheets -->

        <!-- Mobile menu -->
        <link href="css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="css/external/jquery.selectbox.css" rel="stylesheet" />
    
        <!-- Custom -->  
        <link href="css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
    
<script type="text/javascript">
function fnc_open(){
	document.frm.action = "admin_book2Action.jsp"; 
	document.frm.submit();
}
</script> 

<style type="text/css">

.sits-price--cheap3:before {
    background-color: #ffd564;
}
.sits-price--cheap4:before {
    background-color: #fe505a;
}

</style>   
</head>
<body>
<%
	int playNo = Integer.parseInt(request.getParameter("playNo")); //연극 번호	
	// 연극예매 날짜
	String playD = request.getParameter("playDate"); // ex) 11/01/2019(MM/dd/yyyy)

	DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date Tdate = new Date();
	String today = sdFormat.format(Tdate);
	SimpleDateFormat fm = new SimpleDateFormat("MM/dd/yyyy", Locale.US);
	
	SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.US);
	Date to = fm.parse(playD);
	String playDate = newFormat.format(to);
	
	int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo")); // 연극 예매 극장
	//연극 테이블
	PlayDAO pdao = new PlayDAO();
	//연극 하나에 대한 정보를 얻어옴
	PlayListBean bean = pdao.getPlayCinema(playNo);

	
	//좌석 가격
	ArrayList<PlaySeat> seatprice  = new ArrayList<PlaySeat>();
	seatprice = new PlaySeatDAO().getSeatPrice(cinemaNo);
	int vip = 0;
	int general = 0;
	for(int i = 0; i < 2; i++){
		PlaySeat psbean = seatprice.get(0);
		PlaySeat psbean1 = seatprice.get(1);
		vip = psbean.getSeatPrice();
		general = psbean1.getSeatPrice();
		
	}

	//아이디 가져오기
	String userID = (String)session.getAttribute("userID");
	if(userID == null){
%>
		<script>
			alert("로그인 후 예약이 가능합니다.");
			location.href = "loginForm.jsp";
		</script>
<%
	}
	
	String time = request.getParameter("time");
	if(time == null){
%>
		<script>
			alert("회차 선택 후 예약이 가능합니다.");
			location.href = "admin_book1_time_2.jsp?no=<%=playNo%>";
		</script>
<%
	}
	
	
	//지난 회차 선택불가
	PlayScheduleDAO pshdao = new PlayScheduleDAO();
	PlaySchedule timebean = pshdao.getTime(playNo, time,playDate);
	
	PlayScheduleDAO manager = new PlayScheduleDAO();
	boolean check = manager.AdminselectNot(time, playNo);
	Date t1 = newFormat.parse(today);
	Date t2 = newFormat.parse(playDate);
	if(check == true){
%>
		<script>
			alert("공연이 시작하여 예매가 불가능합니다 ");
			location.href = "book1_time2.jsp?no=<%=playNo%>";
		</script>
<%		
	} else if(t1.getDate() > t2.getDate()){
		if(timebean.getTime() == null){
			%>
					<script>
						alert("이미 지난 날짜 또는 지난 회차입니다.");
						location.href = "book1_time2.jsp?no=<%=playNo%>";
					</script>
			<%
		}
	}
 	
%>

<div class="wrapper place-wrapper">
	<jsp:include page="admin_common_top.jsp" flush="false" />
	<!-- Main content -->
	<div class="place-form-area">
		<section class="container">
			<div class="order-container">
				<div class="order">
					<img class="order__images" alt='' src="images/tickets.png">
					<p class="order__title">좌석선택<br><span class="order__descript">한 좌석 이상 선택해주세요.</span></p>
					<div class="order__control"></div>
				</div>
			</div>
		            
			<div class="choose-sits">
				<div class="choose-sits__info choose-sits__info--first">
					<ul>
						<li class="sits-price marker--none"><strong>가격</strong></li>
						<li class="sits-price sits-price--cheap4"><%=general%>원</li>
						<li class="sits-price sits-price--cheap3"><%=vip%>원</li>
					</ul>
				</div>
			
				<div class="choose-sits__info">
					<ul>
						<li class="sits-state sits-state--not">예약된 좌석</li>
						<li class="sits-state sits-state--your">선택한 좌석</li>			
					</ul>
				</div>  
				<div class="col-sm-12 col-lg-10 col-lg-offset-1">
					<div class="sits-area hidden-xs">
						<div class="sits-anchor">무대</div>
						<br>
						<div class="sits">
							<aside class="sits__line">
								<span class="sits__indecator">A</span>
								<span class="sits__indecator">B</span>
								<span class="sits__indecator">C</span>
								<span class="sits__indecator">D</span>
								<span class="sits__indecator">E</span>
								<span class="sits__indecator">F</span>
							</aside>
						                  
							<div class="sits__row">
							                            
							                            
							<!-- 좌석 선택 -->                                          
							<% 	
								ArrayList<PlaySeat> seatList  = new ArrayList<PlaySeat>();
								seatList = new PlaySeatDAO().getAllSeat(cinemaNo);
								
								int s = 0;
								for(int i = 0; i < seatList.size(); i++) {
									PlaySeat bean2 = seatList.get(i);
									s++;
									if(bean2.getSeatAvailable() == 0 && bean2.getSeatGrade().contains("S")){
							%>
										<span name=<%=bean2.getSeatName()%> class="sits__place sits-price--cheap4" data-place='<%=bean2.getSeatName()%>'><%=bean2.getSeatName().substring(0, 2) %></span>
							<%
									} else if(bean2.getSeatAvailable() == 0 && bean2.getSeatGrade().contains("R")){
							%>
										<span name=<%=bean2.getSeatName()%> class="sits__place sits-price--cheap3" data-place='<%=bean2.getSeatName()%>'><%=bean2.getSeatName().substring(0, 2) %></span>
									
							<%		
									}else{
							%>
										<span name=<%=bean2.getSeatName()%> class="sits__place sits-price--cheap sits-state--not"><%=bean2.getSeatName().substring(0,2) %></span>
							<%
									} // else 닫는 괄호
									if(s%9 == 0){
							%>
							</div>
							<div class="sits__row">
							<%	
									}
								} //for 닫는 괄호
							%>
							
							</div>
										
							<aside class="sits__checked">
								<div class="checked-place"></div>
							</aside>
							                     
							<footer class="sits__number">
							    <span class="sits__indecator">1</span>
							    <span class="sits__indecator">2</span>
							    <span class="sits__indecator">3</span>
							    <span class="sits__indecator">4</span>
							    <span class="sits__indecator">5</span>
							    <span class="sits__indecator">6</span>
							    <span class="sits__indecator">7</span>
							    <span class="sits__indecator">8</span>
							    <span class="sits__indecator">9</span>
							</footer>
						</div>
					</div>
				</div>                
			</div>
		</section>
	</div>
</div>

<div class="clearfix"></div>
<form id='film-and-time frm' name="frm" class="booking-form" method='post'>

	<input type="hidden" name="playDate" value="<%=playDate%>">
	<input type="hidden" name="playNo" value="<%=playNo%>">
	<input type='hidden' name='seat' class="choosen-sits">
	<input type='hidden' name='cinemaNo' value="<%=cinemaNo%>">
	<input type='hidden' name='time' value="<%=time%>">

	<div class="booking-pagination booking-pagination--margin">
		<a href="admin_book1.jsp" class="booking-pagination__prev">
			<span class="arrow__text arrow--prev">전 단계</span>
			<span class="arrow__info">예매하기</span>
		</a>
		<a href="#" onclick="fnc_open()" class="booking-pagination__next">
			<span class="arrow__text arrow--next">다음단계</span>
			<span class="arrow__info">결제하기</span>
		</a>
	</div>
</form>
    
<div class="clearfix"></div>
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

        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>

        <!-- Custom -->
        <script src="js/custom.js"></script>
		
		<script type="text/javascript">
            $(document).ready(function() {
                init_BookingTwo();
                init_Home();
            });
		</script>

</body>
</html>
