<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html> 
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMovie - Movie page</title>
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
        <!-- Magnific-popup -->
        <link href="css/external/magnific-popup.css" rel="stylesheet" />

    
        <!-- Custom -->
        <link href="css/event.css" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
    
    
</head>

<body>
    <div class="wrapper">
    
                <jsp:include page="common_screen_top.jsp" flush="false" />
        <!-- Banner -->


        <!-- Header section -->

        
        <!-- Search bar -->
   
        
        <!-- Main content -->
        <section class="container">
            <div class="col-sm-12">
                <div class="movie">
                    <h2 class="page-heading">Snow Piercer | 설국열차</h2>
                    
                    <div class="movie__info">
                        <div class="col-sm-4 col-md-3 movie-mobile">
                            <div class="movie__images">
                                <span class="movie__rating">5.0</span>
                                <img alt='' src="images/gallery/large/item-1.jpg">
                            </div>
                        </div>

                        <div class="col-sm-8 col-md-9">
                            <p class="movie__time"><b>169 min</b></p>

                            <p class="movie__option"><strong>Country: </strong><a href="#">Korea</a></p>
                            <p class="movie__option"><strong>Year: </strong><a href="#">2012</a></p>
                            <p class="movie__option"><strong>Category: </strong><a href="#">Adventure</a>, <a href="#">Action</a></p>
                            <p class="movie__option"><strong>Release date: </strong>December 12, 2012</p>
                            <p class="movie__option"><strong>Director: </strong><a href="#">Peter Jackson</a></p>
                            <p class="movie__option"><strong>Actors: </strong><a href="#">고아성</a>, <a href="#">송강호</a>, <a href="#">Graham McTavish</a>, <a href="#">Cate Blanchett</a></p>
                            <p class="movie__option"><strong>Age restriction: </strong><a href="#">13</a></p>
          
                        </div>
                    </div>
                    


</div>
</section>
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

        <!-- Stars rate -->
        <script src="js/external/jquery.raty.js"></script>
        <!-- Swiper slider -->
        <script src="js/external/idangerous.swiper.min.js"></script>
        <!-- Magnific-popup -->
        <script src="js/external/jquery.magnific-popup.min.js"></script> 

        <!--*** Google map  ***-->
        <script src="https://maps.google.com/maps/api/js?sensor=true"></script> 
        <!--*** Google map infobox  ***-->
        <script src="js/external/infobox.js"></script> 

        <!-- Share buttons -->
        <script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-525fd5e9061e7ef0"></script>

        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>

        <!-- Custom -->
        <script src="js/custom.js"></script>
		
		<script type="text/javascript">
            $(document).ready(function() {
                init_MoviePage();
                 init_MoviePageFull();
            });
		</script>

</body>
</html>
