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

</head>
<script type="text/javascript">
function fnc_open(){
	document.frm.submit();
}
</script>
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
	
	PlayScheduleDAO psdao = new PlayScheduleDAO();
	ArrayList<PlaySchedule> v  = psdao.getPlaySchedule(playNo, playDate);
	
	PlayScheduleDAO shdao = new PlayScheduleDAO();
	boolean shbean = shdao.getOneDate(playNo, playDate);
 	Date t1 = newFormat.parse(today);
	Date t2 = newFormat.parse(playDate);
	if(t2.getDate() < t1.getDate()){ 
%>
		<script>
			alert("지난 날짜는 선택이 불가능합니다.");
			location.href = "admin_book1_time2.jsp?no=<%=playNo%>";
		</script>
<%
	}

%>
<div class="wrapper place-wrapper">
<jsp:include page="admin_common_top.jsp" flush="false" />
<br>
<br>
	<div>    
		<div style= "position: relative; top:30px; left:290px;" align="left" class="film-images">
			<img alt='포스터' src="images/play/<%=bean.getImg() %>" style="width: 20%;">
		</div>
	<br>
	</div>
	<form method="post" id="frm" name="frm" action="admin_book2.jsp">
		<section class="container">
        	<div style="position: relative; top: -168px; left:500px;" class="col-sm-12">
                <div style="position: relative; top:-60px; left: 0px; z-index: 1000;" class="movie__btns movie__btns--full">
					<a href="admin_book1_time2.jsp?no=<%=bean.getNo()%>" class="btn btn-md btn--warning">날짜 재선택</a>
				</div>
                <h2 style="position: relative; top:-70px;" class="page-heading">회차 선택</h2>

                <div style="position: relative; top:-70px;" class="time-select time-select--wide"> <!-- 제목과 시간대 사이 거리조절 클래스 -->
					 <div style="width: 550px;height: 100px;" class="time-select__group group--first">
                        
                        <%
                        	if(shbean == false){
                        %>
                            	<p align="center" style="padding-top: 38px;">해당 날짜에 선택할 수 있는 회차가 없습니다.</p>
                        <%
                        	}else{
                        	
                        %>                        
                            <div class="col-sm-3">
                                <p class="time-select__place"><%=bean.getCinemaName() %></p>
                            </div>
                            <ul class="col-sm-6 items-wrap">
							<% 	
								for(int i = 0; i < v.size(); i++) {
									PlaySchedule bean2 = v.get(i);
							%>       
									<input id=<%=bean2.getTime()%> type="radio" name="time" value=<%=bean2.getTime()%>>
									<label for=<%=bean2.getTime()%> value=<%=bean2.getTime()%> class="time-select__item"><%=bean2.getTime().substring(0,5) %></label>
							
							<%                           
								} 
                        	}
							%>
                            </ul>
                        </div>

            	</div>
            </div>
		</section>
            
        <div class="clearfix"></div>
        
            <div style="position: relative; top:-200px;" class="booking-pagination">
                    <a href="admin_book1.jsp" class="booking-pagination__prev">
                        <span class="arrow__text arrow--prev">전 단계</span>
                        <span class="arrow__info">영화 예매</span>
                    </a>
                    
					<input type="hidden" name="playNo" value="<%=bean.getNo()%>">
					<input type="hidden" name="cinemaNo" value="<%=bean.getCinemaNo()%>"> 
					<input type="hidden" id="datepicker" value=<%=playD%> name="playDate" class="datepicker__input">
                           
                    <a href="#" onclick="fnc_open()" class="booking-pagination__next">
                   		<span class="arrow__text arrow--next">다음 단계</span>
                        <span class="arrow__info">좌석 선택</span>
					</a>
                   		
            </div>
            
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









