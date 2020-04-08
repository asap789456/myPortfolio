<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.Vector" %>
<%@page import="play.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.net.URLEncoder"%>


<!doctype html>
<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMovie - Trailers</title>
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
        <!-- Magnific-popup -->
        <link href="css/external/magnific-popup.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
    
    
</head>

<body>
<%

/*-------------------------검색기능을 위해 바꾼곳--------------------------*/
String searchType = "연극명";
String search = "";
/* int pageNumber = 0;

if (request.getParameter("pageNumber") != null){
   try{
      pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
   } catch(Exception e){
      e.printStackTrace();
   }
} */
if(request.getParameter("searchType") != null){
   searchType = request.getParameter("searchType");
}
if(request.getParameter("search") != null){
   search = request.getParameter("search");
}


/*-------------------------------------------------------------------------*/
   PlayDAO pdao = new PlayDAO();
   Vector<PlayListBean> v  = pdao.getSelectPlay2();
   
   PlayDAO pdao2 = new PlayDAO();
   Vector<PlayListBean> v2  = pdao2.getAllPlay();

%>
    <div class="wrapper">
       <jsp:include page="common_screen_top.jsp" flush="false" />
       
        <!-- *********************검색기능을 위해 바꾼곳********************** -->
        <div class="search-wrapper">
            <div class="container container--add">
                <form action="./play_trailer.jsp" id='search-form' method='get' class="search">
                    <input type="text" name="search" class="search__field" placeholder="검색">
                    <select name="searchType" id="search-sort" class="search__sort" tabindex="0">
                  <option value="연극명">연극명</option>
                  
                    </select>
                  
                    <button type='submit' class="btn btn-md btn--danger search__button">검색</button>
                </form>
            </div>
        </div>
<!-- *********************************************************************** -->       

        <!-- Main content -->
        <section class="container">
            <div class="col-sm-12">
                <h2 class="page-heading">예고편</h2>

                <div class="trailer-wrapper">
                  <!-- *********************검색기능을 위해 바꾼곳********************** -->
                  <%
                     ArrayList<PlayListBean> playList = new ArrayList<PlayListBean>();
                     playList = new PlayDAO().getPlay(searchType, search);
                     if(playList != null )
							for(int j = 0; j < 5; j++){
								PlayListBean bean = playList.get(j);   
                  %>
                  <!-- ************************************************************** -->      
                    <!-- Films trailers -->
                    <div class="trailer-block row">
                      
                        <div class="col-sm-4 col-md-3">
                       
                            <div class="trailer">
                                <p class="trailer__name"><%=bean.getName() %></p>
                                <p class="trailer__number">1 트레일러</p>
                            </div>
                        </div>

                        <div class="col-sm-4 col-md-3">
                            <a href='<%=bean.getVideo() %>' class="trailer-sample">
                                <img alt='' src="images/video/<%=bean.getVideoImg()%>">
                            </a>
                        </div>


                    </div>

            <%} %>
                    <!-- Films trailers -->

            </div>
            </div>

        </section>
        
        <div class="clearfix"></div>
      
      <jsp:include page="common_screen_bottom.jsp" flush="false" />
      
    </div>

            
            <jsp:include page="common_screen_bottom.jsp" flush="false" />
            


   <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Mobile menu -->
        <script src="js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Magnific-popup -->
        <script src="js/external/jquery.magnific-popup.min.js"></script>

        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>

        <!-- Custom -->
        <script src="js/custom.js"></script> 
      
      <script type="text/javascript">
            $(document).ready(function() {
                init_Trailer();
            });
      </script>

</body>
</html>