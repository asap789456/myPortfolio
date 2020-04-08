<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="play_seat.PlaySeatDAO"%>
<%@page import="play_seat.PlaySeat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cinema.Cinema"%>
<%@page import="cinema.CinemaDAO"%>
<%@page import="genre.Genre"%>
<%@page import="genre.GenreDAO"%>
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
<script>
function goUpdate(){
	document.frm.submit();
}
</script>
<style>
#margin{
	margin-right: 3px;
	padding-right: 3px;
}
</style>
</head>
<body>

<!-- Header section -->
    <div class="wrapper">
    	<jsp:include page="admin_common_top.jsp" flush="false" />
    	
<form method="post" id="frm" name="frm" action="adminTheaterUpdateAction.jsp">
        <!-- Main content -->
        <br>
        <br>
        <br>
        <section class="container">
            <div class="col-sm-12">
                <div class="movie">
                    <h2 class="page-heading">8월 퀴즈 이벤트</h2>
                    
                    <div class="movie__info">
                        <div class="col-sm-4 col-md-3 movie-mobile">
                            <div class="movie__images"><%-- 
                                <span class="movie__rating"><%=bean.getGrade() %></span> --%>
                                <img alt='' src="images/gallery/thumb/Event1.png" />
                            </div>
                           </div>

                        <div class="col-sm-8">
                        	
                        	<p class="movie__option"><strong>이벤트 제목: </strong><input class="btn btn-default" id="text-input" type="text" name="cinemaName" placeholder="8월 퀴즈 이벤트"></p>
                            <p class="movie__option"><strong>이벤트 기간: </strong><input class="btn btn-default" id="text-input" type="text" name="cinemaAddress"  placeholder="2019.01.05~2019.09"></p>
                            <p id ="margin"class="movie__option"><strong>포스터: </strong>&nbsp;<input class="btn btn-default" id="text-input" type="file" name="siteAddress"  placeholder="images/gallery/thumb/Event1.png"></p>
                           
                           
							</div>
                            <div class="movie__btns movie__btns--full">

                                <a href="adminEventSelect.jsp" class="btn btn-md btn--warning">수정완료</a><br/>
                                <a href="" class="btn btn-md btn--danger">삭제하기</a>
                            </div>
                            
                        </div>
                    </div>
                    
                   <div class="clearfix"></div>
                    
                   

                </div>

            </div>
         
        </section>
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
