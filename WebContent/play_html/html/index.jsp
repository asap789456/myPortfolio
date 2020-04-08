<%@page import="bbs.Bbs"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="genre.Genre"%>
<%@page import="genre.GenreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.util.Vector" %>
<%@page import="play.*"%>
<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket</title>
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

		
	<style>
	#search{
		z-index: 1;
	}
	#movie-item{
		z-index: 1000;
	}
	</style>	
    
</head>

<body>
<!-- 데이터 베이스에 연결하여 최신순 연극 3대만 뿌려주는 데이터를 가져옴 -->

<%
	request.setCharacterEncoding("utf-8");
	PlayDAO pdao = new PlayDAO();
	Vector<PlayListBean> v  = pdao.getSelectPlay();
	
	PlayDAO pdao2 = new PlayDAO();
	Vector<PlayListBean> v2  = pdao2.getAllPlay();
%>

    <div class="wrapper">
        <jsp:include page="common_screen_top.jsp" flush="false" />
        <!-- Slider -->
        <div class="bannercontainer rev_slider_wrapper">
 
            <!-- the ID here will be used in the JavaScript below to initialize the slider -->
            <div id="rev_slider_1" class="banner rev_slider" style="display:none">
 
                <!-- BEGIN SLIDES LIST -->
                <ul>
                
                    <!-- SLIDE 1 -->
                    <li data-transition="fade" class="slide" data-title='Rush.'>
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="images/slides/slide_banner1.png">
                    </li>
 
                    <!-- SLIDE 2 -->
                    <li data-transition="fade" class="slide" data-title='Travel worldwide. Create trip film.'>
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="images/slides/slide_banner1.png">
                        
                        <div class="tp-caption slider-wrap-btn" 
                             data-x="center"
                             data-y="310" 
                             data-frames='[{
                               "delay":2800,
                               "speed":400,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             <a href="#" class="btn btn-md btn--danger btn--wide slider--btn">learn more</a>
                        </div>
                    </li>

                    <!-- SLIDE 3 -->
                    <li data-transition="fade" class="slide" data-title='Stop wishing. Start doing.'>
 
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="images/slides/slide_banner2.png">

                        <div class="tp-caption slider-wrap-btn" 
                            data-x="center" 
                            data-y="310" 
                            data-frames='[{
                               "delay":2500,
                               "speed":500,
                               "frame":"0",
                               "from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;",
                               "mask":"x:0px;y:[100%];s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            <a href="#" class="btn btn-md btn--danger slider--btn">check out play</a>
                        </div>
                    </li>

 
                </ul><!-- END SLIDES LIST -->
 
            </div><!-- END SLIDER CONTAINER -->
 
        </div><!-- END SLIDER CONTAINER WRAPPER -->
        <!--end slider -->
        
        
        <!-- Main content -->
        <section class="container">
            <div class="movie-best"><!-- style.css 7898,7875 -->
                 <div class="col-sm-10 col-sm-offset-1 movie-best__rating">오늘의 상영작 추천 </div>
                 <div class="col-sm-12 change--col">
<% 	
	for(int i = 0; i < v.size(); i++) {
		PlayListBean bean = v.get(i);
%>
                     <div class="movie-beta__item " id="movie-item">

                        <img alt='' src="images/play/<%=bean.getImg() %>">

                         <ul class="movie-beta__info">
                             <li>
                                <p class="movie__time"><%=bean.getTime() %>분</p>
                                <p><%=bean.getName() %></p>
                             </li>
                             <li class="last-block">
                                 <a href="play_list.jsp" class="slide__link">more</a>
                             </li>
                         </ul>
                     </div>
<%
	}
%><
                <div class="col-sm-10 col-sm-offset-1 movie-best__check">공연 중인 연극 알아보기</div>
            </div>
            <div class="clearfix"></div>

            <h2 id='target' class="page-heading heading--outcontainer">극장에서 만나보세요</h2>

            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-8 col-md-9">
                        <!-- Movie variant with time -->
                        
<% 	for(int i = 0; i < v2.size(); i++) {
	PlayListBean bean2 = v2.get(i);
	GenreDAO gdao = new GenreDAO();
	Genre gBean = gdao.getOneGenre(bean2.getNo());
%>                        
                            <div class="movie movie--test movie--test--dark movie--test--left">
                                <div class="movie__images">
                                    <a href="play_list_pages.jsp?no=<%=bean2.getNo() %>" class="movie-beta__link">
                                        <img alt='' src="images/play/<%=bean2.getImg()%>">
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='play_list.jsp' class="movie__title"><%=bean2.getName() %> </a>

                                    <p class="movie__time"><%=bean2.getTime() %></p>

                                    <p class="movie__option"><%=gBean.getGenreName() %></p>
                                    
                                    <div class="movie__rate">
                                        <div class="score" style="cursor: pointer;">
                                        	<p>관람가</p>
                                        	<input name="score" type="hidden">
                                        </div>
                                        <span class="movie__rating"><%=bean2.getGrade() %></span>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->
<%
	}
%>
                    </div>

                    
                </div>
            </div>

            <div class="col-sm-12">
                <h2 class="page-heading">이벤트</h2>

                <div class="col-sm-4 similar-wrap col--remove">
                    <div class="post post--preview post--preview--wide">
                        <div class="post__image">
                            <img alt='' src="images/client-photo/Event7.jpg">
                        </div>
                        <p class="post__date">기간| 2019.10.1 ~ 2019.10.31 </p>
                        <a href="event.jsp" class="post__title"> 레베카 무료초대 이벤트</a>
                        <a href="event.jsp" class="btn read-more post--btn">read more</a>
                    </div>
                </div>
                <div class="col-sm-4 similar-wrap col--remove">
                    <div class="post post--preview post--preview--wide">
                        <div class="post__image">
                            <img alt='' src="images/client-photo/Event8.jpg">
                            
                        </div>
                        <p class="post__date">기간| 2019.10.15 ~ 2019.11.31 </p>
                        <a href="event.jsp" class="post__title">앙리할아버지와 나 	이벤트</a>
                        <a href="event.jsp" class="btn read-more post--btn">read more</a>
                    </div>
                </div>
                <div class="col-sm-4 similar-wrap col--remove">
                    <div class="post post--preview post--preview--wide">
                        <div class="post__image">
                            <img alt='' src="images/client-photo/Event3.jpg">
                            
                        </div>
                        <p class="post__date">기간| 2019.10.20 ~ 2019.12.25 </p>
                        <a href="event.jsp" class="post__title">1+1 추첨 이벤트</a>
                        <a href="event.jsp" class="btn read-more post--btn">read more</a>
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
