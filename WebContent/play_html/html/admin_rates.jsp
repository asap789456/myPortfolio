<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.Vector" %>

<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket 관리자</title>
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
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,700' rel='stylesheet' type='text/css'>
        <!-- Open Sans -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:800italic' rel='stylesheet' type='text/css'>
    
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


    <div class="wrapper">
        <jsp:include page="admin_common_top.jsp" flush="false" />
		
		
       <!-- Main content -->
        <section class="container">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-12">
                        <h2 class="page-heading">예매율</h2>

                        <div class="rates-wrapper rates--full">
                            
                            <table>
                                <colgroup class="col-width-lg">
                                <colgroup class="col-width">
                                <colgroup class="col-width-sm">
                                <colgroup class="col-width">

                                <tr class="rates rates--top">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">1. 늘근도둑 이야기</a></td>
                                    <td class="rates__vote">50</td>
                                    <td class="rates__result">5.0</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                <tr class="rates rates--top">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">2. 쉬어대트너스</a></td>
                                    <td class="rates__vote">49</td>
                                    <td class="rates__result">5.0</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                <tr class="rates rates--top">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">3. 라이어</a></td>
                                    <td class="rates__vote">43</td>
                                    <td class="rates__result">4.9</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">4. 옥탑방 고양이</a></td>
                                    <td class="rates__vote">41</td>
                                    <td class="rates__result">4.9</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">5. 작업의 정성</a></td>
                                    <td class="rates__vote">39</td>
                                    <td class="rates__result">4.8</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">6. 톡톡</a></td>
                                    <td class="rates__vote">37</td>
                                    <td class="rates__result">4.7</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">7. 오펀스 </a></td>
                                    <td class="rates__vote">34</td>
                                    <td class="rates__result">4.7</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">8. 오백</a></td>
                                    <td class="rates__vote">31</td>
                                    <td class="rates__result">4.6</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">9. 헤르츠</a></td>
                                    <td class="rates__vote">29</td>
                                    <td class="rates__result">4.6</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">10. 맨 오브 라만차</a></td>
                                    <td class="rates__vote">28</td>
                                    <td class="rates__result">4.6</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">11. 레베카</a></td>
                                    <td class="rates__vote">25</td>
                                    <td class="rates__result">4.4</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">12. 히스토리</a></td>
                                    <td class="rates__vote">21</td>
                                    <td class="rates__result">4.4</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">13. 킬롤로지</a></td>
                                    <td class="rates__vote">20</td>
                                    <td class="rates__result">4.4</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">14. 롱넘버13</a></td>
                                    <td class="rates__vote">18</td>
                                    <td class="rates__result">4.4</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">15. 운빨로맨스</a></td>
                                    <td class="rates__vote">16</td>
                                    <td class="rates__result">4.3</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                                 <tr class="rates">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">16. 극적인 하룻밤</a></td>
                                    <td class="rates__vote">13</td>
                                    <td class="rates__result">4.3</td>
                                    <td class="rates__stars"><div class="score"></div></td>
                                </tr>

                            </table>
                        </div>

                        <div class="pagination paginatioon--full coloum-wrapper">
                            <a href='#' class="pagination__prev">prev</a>
                            <a href='#' class="pagination__next">next</a>
                        </div>    
                    </div>

                </div>
            </div>
        </section>		
		
		<jsp:include page="admin_bottom.jsp" flush="false" />
       
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
