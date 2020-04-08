<%@page import="admin_res.adminDTO"%>
<%@page import="admin_res.adminDAO"%>
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
<body>
	<%
		String userID = request.getParameter("userID");
		int playNo = Integer.parseInt(request.getParameter("playNo"));
		
		adminDAO adao = new adminDAO();
		ArrayList<adminDTO> seatList = adao.selectSeat(playNo, userID);
		
		String a0 = request.getParameter("a0");
		String a1 = request.getParameter("a1"); 
		
    %>
<div class="wrapper place-wrapper">
	<!-- Main content -->
	<div class="place-form-area">
		<section class="container">
			<div class="order-container">
				<div class="order">
					<img class="order__images" alt='' src="images/tickets.png">
					<p class="order__title">Book a ticket <br><span class="order__descript">and have fun movie time</span></p>
					<div class="order__control"></div>
				</div>
			</div>
		                <!-- ◆다음주 추가<div class="order-step-area">
		                    <div class="order-step first--step order-step--disable ">1. What &amp; Where &amp; When</div>
		                    <div class="order-step second--step">2. Choose a sit</div>
		                </div>-->
		            
			<div class="choose-sits">

			
				<div class="choose-sits__info">
					<ul>
						<li class="sits-state sits-state--not">예약된 좌석</li>
						<li class="sits-state sits-state--your">선택한 좌석</li>
					</ul>
				</div>
			           
				<div class="col-sm-12 col-lg-10 col-lg-offset-1">
					<div class="sits-area hidden-xs">
						<div class="sits-anchor">screen</div>
						<br>
						<div class="sits">
							<aside class="sits__line">
								<span class="sits__indecator">A</span>
								<span class="sits__indecator">B</span>
								<span class="sits__indecator">C</span>
								<span class="sits__indecator">D</span>
								<span class="sits__indecator">E</span>
							</aside>
						                  
							<div class="sits__row">             
							<!-- 좌석 선택 -->      
							<%
								ArrayList<PlaySeat> seatList2  = new ArrayList<PlaySeat>();
								seatList2 = new PlaySeatDAO().getAllSeat(playNo);
								
								int b = 0;
						    	for(int i = 0; i < seatList2.size(); i++){
						    		PlaySeat bean2 = seatList2.get(i);
						    		b++;
									if(a0.equals(bean2.getSeatName())){
							%>
										<span name=<%=bean2.getSeatName().substring(0, 2)%> class="sits__place sits-price--cheap" data-place='<%=bean2.getSeatName()%>'><%=bean2.getSeatName().substring(0, 2) %></span>
							<%
									} else if(a1.equals(bean2.getSeatName())){						
							%>
										<span name=<%=bean2.getSeatName().substring(0, 2)%> class="sits__place sits-price--cheap" data-place='<%=bean2.getSeatName()%>'><%=bean2.getSeatName().substring(0, 2) %></span>
							<%
									} else{
							%>
										<span name=<%=bean2.getSeatName().substring(0, 2)%> class="sits__place sits-price--cheap sits-state--not" data-place='<%=bean2.getSeatName()%>'><%=bean2.getSeatName().substring(0, 2) %></span>
							<%
									} // else 닫는 괄호
									if(b%9 == 0){
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
								<div class="checked-result"></div>
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
							    <span class="sits__indecator">10</span>
							</footer>
						</div>
					</div>
				</div>                
			</div>
		</section>
	</div>
</div>

  <jsp:include page="admin_bottom.jsp" flush="false" />
<div class="clearfix"></div>
    
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
