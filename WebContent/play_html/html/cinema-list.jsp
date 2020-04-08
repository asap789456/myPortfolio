<%@page import="cinema.Cinema"%>
<%@page import="cinema.CinemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.Vector" %>
<!doctype html>
<html>
<head> 
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APICKET - 극장</title>
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
    .cinema-title{
    	text-align: center;
    }
    </style>
</head>

<body>
    <div class="wrapper">
    	<jsp:include page="common_screen_top.jsp" flush="false" />
       
        
        <!-- Main content -->
        <section class="container">
            <div class="col-sm-12">
                <h2 class="page-heading">극장</h2>


	<div class="cinema-wrap">
<%
	CinemaDAO pdao = new CinemaDAO();
	Vector<Cinema> v  = pdao.getAllCinema();

	for(int i = 0; i < v.size(); i++){
		Cinema bean = v.get(i);
%>
	<div class="row">
		<div class="col-xs-6 col-sm-3 cinema-item popularity">
			<div class="cinema">
				<a href='single-cinema.jsp?no=<%=bean.getCinemaNo()%>' class="cinema__images">
					<img alt='' src="images/cinema/<%=bean.getCinemaImg()%>">
					<span class="cinema-rating">좌석수:<%=bean.getCinemaSeat() %></span>
				</a>
				<a href="#" class="cinema-title"><%=bean.getCinemaName()%></a>
			</div>
		</div>
	</div>		
			
<% } %>	     

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
        <!-- Stars rate -->
        <script src="js/external/jquery.raty.js"></script>
        
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
                init_Home();
              });
		    </script>

</body>
</html>
