<%@page import="cinema.Cinema"%>
<%@page import="cinema.CinemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.Vector" %>
<%@page import="play.*" %>
<%@page import="PlaySchedule.*"%>
<%@page import="genre.*"%>
<!doctype html>
<html>
<head> 
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket - Single cinema</title>
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

<body class="single-cin">
<%
   int no = Integer.parseInt(request.getParameter("no"));
   //데이터베이스에 접근
   CinemaDAO pdao = new CinemaDAO();
   //연극 테이블에 있는 극장 전체에 대한 정보를 얻어옴
   Cinema bean = pdao.getOneCinema(no);
   
   CinemaDAO pdao2 = new CinemaDAO();
   //연극 테이블에 있는 극장의 하나에 대한 정보를 얻어옴
   Vector<Cinema> v = pdao2.getAllCinema();
   
   PlayDAO pdao3 = new PlayDAO();
   PlayListBean bean3  = pdao3.getPlayCinema(no);
   
   PlayScheduleDAO psdao = new PlayScheduleDAO();
   Vector<PlaySchedule> v2  = psdao.getCinema(no);
   
   GenreDAO gdao = new GenreDAO();
   Genre gBean = gdao.getOneGenre(no);

%>

    <div class="wrapper">

       <jsp:include page="common_screen_top.jsp" flush="false" />
        <!-- Main content -->
        <section class="cinema-container">
            <div class="cinema cinema--full">
                <p class="cinema__title"><%=bean.getCinemaName() %></p>
                <div class="cinema__rating"><%=bean.getCinemaName() %></div>
                <div class="cinema__gallery">
                    <div class="swiper-container">
                      <div class="swiper-wrapper">

<%    for(int i = 0; i < v.size(); i++) {
   Cinema bean2 = v.get(i);
%>                     
                          <!--First Slide-->
                          <a href="single-cinema.jsp?no=<%=bean2.getCinemaNo()%>">
                          <div class="swiper-slide">
                             <img alt='' src="images/cinema/<%=bean2.getCinemaImg()%>">
                          </div>
                          </a>
<%} %>             
                      </div>
                    </div>
                </div>
                <div class="cinema__info">
                    <p class="cinema__info-item"><strong>주소:</strong> <%=bean.getCinemaAddress()%> </p>
                    <p class="cinema__info-item"><strong>전화번호:</strong> <%=bean.getCinemaPhone()%></p>
                    <p class="cinema__info-item"><strong>웹사이트 주소:</strong> <a href="<%=bean.getSiteAddress()%> "><%=bean.getSiteAddress()%></a></p>
                </div>
            </div>



            <div class="tabs tabs--horisontal">
                      <!-- Nav tabs -->
                      <div class="container">
                          <ul class="nav nav-tabs" id="hTab">
                            <li><a href="#movie1" data-toggle="tab">연극</a></li>
                            <li class="active"><a href="#map1" data-toggle="tab">지도</a></li>
                          </ul>
                      </div>

                      <!-- Tab panes -->
                      <div class="tab-content">
                            <div class="tab-pane" id="movie1">
                                <div class="container">
                                    <div class="movie-time-wrap">

                                    <div class="datepicker">
                                      <span class="datepicker__marker"><i class="fa fa-calendar"></i>Date</span>
                                      <input type="text" id="datepicker" value='18/11/2019' class="datepicker__input">
                                    </div>

                                    <div class="clearfix"></div>

                                    <div class="col-sm-6">
                                        
                                            <!-- Movie variant with time -->
                                            <div class="movie movie--time">
                                                <div class="row">
                                                    <div class="col-sm-6 col-md-5">
                                                        <div class="movie__images">
                                                            <span class="movie__rating"><%=bean3.getGrade() %>세</span>
                                                            <img alt='' src="images/play/<%=bean3.getImg()%>">
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6 col-md-7">
                                                        <a href='#' class="movie__title"><%=bean3.getName() %></a>

                                                        <p class="movie__time"><%=bean3.getTime() %></p>

                                                        <p class="movie__option"><a href="#"><%=gBean.getGenreName() %></a></p>
                                                        <p class="movie__option"><a href="#"><%=bean3.getSday() %> ~ <%=bean3.getEday() %></a></p>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <!-- Movie variant with time -->
                                        </div>

                                        <div class="clearfix"></div>

                                    </div>
                                </div>
                            </div>

                     <div class="tab-pane active" id="map1">
                                    <div id='cinema-map' class="map"></div>
                            </div>
                      </div>
            </div>

        </section>
        
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

        <!-- Mobile menu -->
        <script src="js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Swiper slider -->
        <script src="js/external/idangerous.swiper.min.js"></script>

        <!-- Share buttons -->
        <script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-525fd5e9061e7ef0"></script>

        <!--*** Google map  ***-->
        <script src="https://maps.google.com/maps/api/js?sensor=true"></script> 
        <!--*** Google map infobox  ***-->
        <script src="js/external/infobox.js"></script>

        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>

        <!-- Custom -->
        <script src="js/custom.js"></script> 
      
      <script type="text/javascript">
            $(document).ready(function() {
                init_Cinema();
            });
      </script>
      
      <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDg358azUWOwe1VRgCMW2weU44XRX20vz0&callback=initMap">
         </script>

</body>
</html>