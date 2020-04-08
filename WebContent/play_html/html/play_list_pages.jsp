<%@page import="play_seat.PlaySeatDAO"%>
<%@page import="play_seat.PlaySeat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="genre.Genre"%>
<%@page import="genre.GenreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="play.*" %>
<%@page import="java.util.Vector" %>
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
	int no = Integer.parseInt(request.getParameter("no"));
	//데이터베이스에 접근
	PlayDAO pdao = new PlayDAO();
	//연극 하나에 대한 정보를 얻어옴
	PlayListBean bean = pdao.getOnePlay(no);
	
	PlayDAO pdao2 = new PlayDAO();
	PlayListBean bean3  = pdao2.getPlayCinema(no);
	
	PlayScheduleDAO psdao = new PlayScheduleDAO();
	Vector<PlaySchedule> v  = psdao.getCinema(no);
	
	GenreDAO gdao = new GenreDAO();
	Genre gBean = gdao.getOneGenre(no);
	
	ArrayList<PlaySeat> seatList  = new ArrayList<PlaySeat>();
	seatList = new PlaySeatDAO().getSeatPrice(no);
	int vip = 0;
	int general = 0;
	for(int i = 0; i < 2; i++){
		PlaySeat psbean = seatList.get(1);
		PlaySeat psbean1 = seatList.get(0);
		vip = psbean.getSeatPrice();
		general = psbean1.getSeatPrice();
	}

%>
<!-- Header section -->
    <div class="wrapper">
    	<jsp:include page="common_screen_top.jsp" flush="false" />
    	
<form method="post" id="frm" name="frm" action="book2.jsp">

        <!-- Main content -->
        <br>
        <br>
        <br>
        <section class="container">
            <div class="col-sm-12">
                <div class="movie">
                    <h2 class="page-heading"><%=bean.getName() %></h2>
                    
                    <div class="movie__info">
                        <div class="col-sm-4 col-md-3 movie-mobile">
                            <div class="movie__images">
                                <span class="movie__rating">4.8</span>
                                <img alt='' src="images/play/<%=bean.getImg() %>" />
                            </div>
                        </div>

                        <div class="col-sm-8">
                        	<p class="movie__option"><strong>공연시간: </strong><%=bean.getTime() %></p>
                            <p class="movie__option"><strong>장르: </strong><%=gBean.getGenreName() %></p>
                            <p class="movie__option"><strong>관람 등급: </strong><%=bean.getGrade() %>세</p>
                            <p class="movie__option"><strong>공연 기간: </strong><%=bean.getSday() %> ~ <%=bean.getEday() %></p>
                            <p class="movie__option"><strong>S석 가격: </strong><%=vip%>원</p>
                            <p class="movie__option"><strong>R석 가격: </strong><%=general%>원</p>
                            <p class="movie__option"><strong>극장: </strong><a href="#"><%=bean3.getCinemaName() %> ( <%=bean3.getCinemaAddress() %> )</a></p>

                            <div class="movie__btns movie__btns--full">
                                <a href="book1_time_2.jsp?no=<%=bean.getNo()%>" class="btn btn-md btn--warning">예매하러가기</a>
                               <!-- <a href="#" class="watchlist">Add to wishlist</a> -->
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="clearfix"></div>
                    
                    <h2 class="page-heading">줄거리</h2>

                    <p class="movie__describe"><%=bean.getInfo() %></p>
                    
                    <h2 class="page-heading">스틸컷 &amp; 트레일러</h2>
                    
                    <div class="movie__media">
                        <div class="movie__media-switch">
                            <a href="#" class="watchlist list--photo" data-filter='media-photo'>4 photos</a>
                            <a href="#" class="watchlist list--video" data-filter='media-video'>2 videos</a>
                        </div>

                        <div class="swiper-container">
                          <div class="swiper-wrapper">
                              <!--First Slide-->
                              <div class="swiper-slide media-video">
                                <a href='https://www.youtube.com/watch?v=19CM8Cd1_pM' class="movie__media-item ">
                                     <img alt='' src="images/video/400x240video.png"/>
                                </a>
                              </div>
                              
                              <!--Second Slide-->
                              <div class="swiper-slide media-video">
                                <a href='https://www.youtube.com/watch?v=rxcEqA_kLus' class="movie__media-item">
                                    <img alt='' src="images/video/400x240video2.png">
                                </a>
                              </div>
                              
                              <!--Third Slide-->
                              <div class="swiper-slide media-photo"> 
                                    <a href='images/photo/400x240photo_big4.png' class="movie__media-item">
                                        <img alt='' src="images/photo/400x240photo4.png" >
                                     </a>
                              </div>                              
                              
                              <!--Four Slide-->
                              <div class="swiper-slide media-photo"> 
                                    <a href='images/photo/400x240photo_big.png' class="movie__media-item">
                                        <img alt='' src="images/photo/400x240photo.png">
                                     </a>
                              </div>

                              <!--Slide-->
                              <div class="swiper-slide media-photo"> 
                                    <a href='images/photo/400x240photo_big3.png' class="movie__media-item">
                                        <img alt='' src="images/photo/400x240photo3.png">
                                     </a>
                              </div>

                              <!--Slide-->
                              <div class="swiper-slide media-photo"> 
                                    <a href='images/photo/400x240photo_big2.png' class="movie__media-item">
                                        <img alt='' src="images/photo/400x240photo2.png">
                                     </a>
                              </div>
              
                          </div>
                        </div>

                    </div>

                </div>

            </div>

        </section>
<input type="hidden" name="no" value="<%=bean.getNo()%>"> 
</form>
        
        <div class="clearfix"></div>

		<jsp:include page="common_screen_bottom.jsp" flush="false" />
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
