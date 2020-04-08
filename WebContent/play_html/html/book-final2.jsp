<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter" %>
<%@page import="java.util.Vector"%>
<%@page import="util.SHA256"%>
<%@page import="util.Gmail"%>
<%@page import="play.*"%>
<%@page import="user.*"%>
<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket - Booking final</title>
        <meta name="description" content="A Template by Gozha.net">
        <meta name="keywords" content="HTML, CSS, JavaScript">
        <meta name="author" content="Gozha.net">
    
    <!-- Mobile Specific Metas-->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">
    
    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Mono font -->
        <link href='http://fonts.googleapis.com/css?family=PT+Mono' rel='stylesheet' type='text/css'>
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
    <!-- Stylesheets -->
    <!-- jQuery UI --> 
        <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

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
	/* 이메일에 보낸 링크를 눌렀을 때 보여지는 티켓의 내용 */
	request.setCharacterEncoding("utf-8");
	/* 이 아래 변수들은 전부 book-final.jsp에서 넘겨받은 값들 */
	String userID = request.getParameter("userID");
	String seat = request.getParameter("seat");
	int sum = Integer.parseInt(request.getParameter("sum"));
	int playNo = Integer.parseInt(request.getParameter("playNo"));
	int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo"));
	String playDate = request.getParameter("playDate");
	String time = request.getParameter("time");
	
	PlayDAO pdao = new PlayDAO();
	PlayListBean bean = pdao.getPlayCinema(playNo);

	UserDAO userDAO = new UserDAO(); //USERDAO 안에 있는 함수?사용하기위해 이름이 manager인 객체생성
	User userBean = userDAO.getMember(userID); //USER에 있는 변수사용 (bean 생성) getMember()는 UserDAO에 있는 함수
	
%>	
    <div class="wrapper place-wrapper">            
        <!-- Main content -->
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="images/tickets.png">
                    <p class="order__title">Thank you <br><span class="order__descript">예매하신 정보를 확인해주세요.</span></p>
                </div>
                
                <div class="ticket">
                    <div class="ticket-position">
                        <div class="ticket__indecator indecator--pre"><div class="indecator-text pre--text">online ticket</div> </div>
                        <div class="ticket__inner">

                            <div class="ticket-secondary">
                                <span class="ticket__item">회원이름 <strong class="ticket__number"><%=userBean.getUserName()%></strong></span>
                                <span class="ticket__item ticket__date"><%=playDate%></span>
                                <span class="ticket__item ticket__time"><%=time.substring(0, 5)%></span>
                                <span class="ticket__item">극장 이름: <span class="ticket__cinema"><%=bean.getCinemaName() %></span></span>
                                <span class="ticket__item">극장 주소: <span class="ticket__hall"><%=bean.getCinemaAddress() %></span></span>
                                <span class="ticket__item ticket__price">총 가격: <strong class="ticket__cost"><%=sum%></strong></span>
                            </div>

                            <div class="ticket-primery">
                            	<span class="ticket__item ticket__item--primery ticket__film">연극명:<br><strong class="ticket__movie"><%=bean.getName()%></strong></span>
                                <span class="ticket__item ticket__item--primery">좌석: <span class="ticket__place"><%=seat%></span></span>
                            </div>


                        </div>
                        <div class="ticket__indecator indecator--post"><div class="indecator-text post--text">online ticket</div></div>
                    </div>
                </div>


               <div class="ticket-control">
                    <a href="play_list.jsp" class="watchlist list--download">연극 리스트</a>
                    <a href="mypage.jsp" class="watchlist list--print">예매내역 확인</a>
                </div>

            </div>
        </section>
        
        <div class="clearfix"></div>
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

        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>
		
        <!-- Custom -->
        <script src="js/custom.js"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                $('.top-scroll').parent().find('.top-scroll').remove();
                init_Home();
            });
        </script>

</body>
</html>
