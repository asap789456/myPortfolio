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
    


<style type="text/css">

.sits-price--cheap3:before {
    background-color: #ffd564;
}
.sits-price--cheap4:before {
    background-color: #fe505a;
}

</style> 
<script type="text/javascript">
function s_open(){
	if (confirm("선택한 좌석을 S석으로 변경하시겠습니까?") == true){    //확인
		document.frm.action = "SGradeAction.jsp"; 
		document.frm.submit();
	}else{   //취소
	    return;
	}
}

function r_open(){
	if (confirm("선택한 좌석을 R석으로 변경하시겠습니까?") == true){    //확인
		document.frm.action = "RGradeAction.jsp"; 
		document.frm.submit();
	}else{   //취소
	    return;
	}
}
</script> 
  
</head>
<body>
<%
	/* 선택한 좌석을 s석 또는 r석으로 변경하기 위한 페이지 */
	int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo")); // 연극 예매 극장
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
%>
<div class="wrapper place-wrapper">
	<jsp:include page="admin_common_top.jsp" flush="false" />
	<!-- Main content -->
	<div class="place-form-area">
		<section class="container">
			<div class="order-container">
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
						<!--<li class="sits-state sits-state--not">예약된 좌석</li>
						<li class="sits-state sits-state--your">선택한 좌석</li>-->
						<li>등급을 변경 할 좌석을 선택해주세요.</li>
						
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
							                            
							                            
                     <!-- 좌석 선택해서 값 저장 -->                                          
                     <%    
                        ArrayList<PlaySeat> seatList  = new ArrayList<PlaySeat>();
                        seatList = new PlaySeatDAO().getAllSeat(cinemaNo);
                        
                        int s = 0;
                        for(int i = 0; i < seatList.size(); i++) {
                           PlaySeat bean2 = seatList.get(i);
                           s++;
                           if(bean2.getSeatGrade().contains("S")){
                     %>
                              <span name=<%=bean2.getSeatName()%> class="sits__place sits-price--cheap4" data-place='<%=bean2.getSeatName()%>'><%=bean2.getSeatName().substring(0, 2) %></span>
                     <%
                           } else if(bean2.getSeatGrade().contains("R")){
                     %>
                              <span name=<%=bean2.getSeatName()%> class="sits__place sits-price--cheap3" data-place='<%=bean2.getSeatName()%>'><%=bean2.getSeatName().substring(0,2) %></span>
                           
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

	<input type='hidden' name='seat' class="choosen-sits">
	<input type='hidden' name='cinemaNo' value="<%=cinemaNo%>">

	<div style="position: relative; top:-170px;" class="booking-pagination booking-pagination--margin">
		<a href='#' onclick="s_open()"class="btn btn-md btn--danger">S석으로 변경</a> 
		<a href="#" onclick="r_open()" class="btn btn-md btn--warning play_btn">R석으로 변경</a>
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
