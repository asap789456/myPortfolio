<%@page import="admin_res.adminDAO"%>
<%@page import="admin_res.adminDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMovie - Rates</title>
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
	int playNo = Integer.parseInt(request.getParameter("playNo"));
	System.out.println(playNo);
	adminDAO adao = new adminDAO();
	ArrayList<adminDTO> resList = adao.selectResUser(playNo);

%>
	<div class="wrapper">
		<jsp:include page="admin_common_top.jsp" flush="false" />
        
        <!-- Search bar -->
<!--         <div class="search-wrapper">
            <div class="container container--add">
                <form id='search-form' method='get' class="search">
                    <input type="text" class="search__field" placeholder="Search">
                    <select name="sorting_item" id="search-sort" class="search__sort" tabindex="0">
                        <option value="1" selected='selected'>By title</option>
                        <option value="2">By year</option>
                        <option value="3">By producer</option>
                        <option value="4">By title</option>
                        <option value="5">By year</option>
                    </select>
                    <button type='submit' class="btn btn-md btn--danger search__button">search a movie</button>
                </form>
            </div>
        </div> -->
        
        <!-- Main content -->
        <section class="container">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-12">
                        <h2 class="page-heading">예매관리</h2>

                        <div class="rates-wrapper rates--full">
                            
                            <table>
                                <colgroup class="col-width-lg">
                                <!-- <colgroup class="col-width"> -->
                                <!-- <colgroup class="col-width-sm"> -->
                                <!-- <colgroup class="col-width"> -->

                                <tr class="rates rates--top">
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">회원명</a></td>
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">공연일</a></td>
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">공연시간</a></td>
                                    <td class="rates__obj"><a href="#" class="rates__obj-name">좌석</a></td>
                                    <td class="rates__result">결제금액</td>
                                </tr>
                                <%
                                	for(int i = 0; i < resList.size(); i++){
                                		adminDTO abean = resList.get(i);
                                %>
                                <tr class="rates">
                                    <td class="rates__obj"><a href="userIdSelectAction.jsp?playNo=<%=playNo%>&userID=<%=abean.getUserID()%>"><%=abean.getUserID()%></a></td>
                                    <td class="rates__obj"><%=abean.getPlayDate()%></td>
                                    <td class="rates__obj"><%=abean.getTime()%></td>
                                    <td class="rates__obj"><%=abean.getSeatNo()%></td>
                                    <td class="rates__result"><%=abean.getSumTotal()%></td>
                                </tr>
                                <%
                                	}
                                %>
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
        
        <div class="clearfix"></div>

        <footer class="footer-wrapper">
            <section class="container">
               
            </section>
        </footer>
    </div>

  <jsp:include page="admin_bottom.jsp" flush="false" />
    <!-- open/close -->
        <div class="overlay overlay-hugeinc">
            
            <section class="container">



            </section>
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
