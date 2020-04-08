<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.Vector" %>
<%@page import="play.*" %>
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

<body>
<%
	/* 예매시 선택할 수 있는 연극들을 나열 해놓은 페이지 */
	PlayDAO pdao = new PlayDAO();
	Vector<PlayListBean> v  = pdao.getAllPlay();
	
%>
   <div class="wrapper">
    	<jsp:include page="common_screen_top.jsp" flush="false" />
        <!-- Main content -->
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="images/tickets.png">
                    <p class="order__title">APICKET <br><span class="order__descript">연극을 선택해 주세요</span></p>
                </div>
            </div>
            <h2 class="page-heading heading--outcontainer">현재 공연작</h2>
        </section>     
        <!-- 스크롤링 되는 포스터들 -->
        <div class="choose-film">
            <div class="swiper-container">
              <div class="swiper-wrapper">
                  <!--First Slide-->
                  
<% 	
	for(int i = 0; i < v.size(); i++) {
		PlayListBean bean = v.get(i);
%>               
                  <div class="swiper-slide" data-film='The Fifth Estate'>
                  <!-- book1_time_2.jsp 에 no 값을 넘겨준다 --> 
					<a href="book1_time_2.jsp?no=<%=bean.getNo()%>">
                        <div class="film-images">
                            <img alt='' src="images/play/<%=bean.getImg() %>">
                        </div>
  		            </a>
                        <p class="choose-film__title" align="center"><%=bean.getName() %></p>
                  </div>
<%
	}
%>                                   	
              </div>
            </div>
        </div>

        <section class="container">
            <div class="col-sm-12">
                <div class="choose-indector choose-indector--film">
                    <strong>연극 선택: </strong><span class="choosen-area"></span>
                </div>
        </section>
        <div class="clearfix"></div>
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
        <!-- Swiper slider -->
        <script src="js/external/idangerous.swiper.min.js"></script>

        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>
		<!-- Twitter feed -->
        <script src="js/external/twitterfeed.js"></script>
        <!-- Custom -->
        <script src="js/custom.js"></script>
		
		<script type="text/javascript">
            $(document).ready(function() {
                init_BookingOne();
                init_Home();
            });
		</script>
</body>
</html>
