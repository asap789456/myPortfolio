<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket-Event</title>
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
        <link href="css/event.css" rel="stylesheet" />
        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
    
    
</head>

<body>
    <div class="wrapper">
            <jsp:include page="admin_common_top.jsp" flush="false" />

       
       
        <!-- Main content -->
        <section class="container">
            <div class="col-sm-12">
                <h2 class="page-heading">이벤트 조회</h2>
                
                <div class="row">
                <div class="gallery-wrapper">
                
                <!-- 이벤트 이미지1 -->
                    <div class="col-sm-4 col-md-3">
                        <div class="gallery-item">
                            <a href='images/gallery/thumb/Event1.png' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="images/gallery/thumb/Event1.png">
                            </a>
                            <a href='adminEventUpdate.jsp' class="gallery-item__descript gallery-item--photo-link2">
                              
                                <p class="gallery-item__name">8월 퀴즈 이벤트</p>
                            </a>
                        </div>
                    </div>

                <!-- 이벤트 이미지2 -->
                    <div class="col-sm-4 col-md-3">
                        <div class="gallery-item">
                            <a href='adminEventUpdate.jsp' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="images/gallery/thumb/Event2.png">
                            </a>
                            <a href='images/gallery/large/Event2.png' class="gallery-item__descript gallery-item--photo-link">
                              
                                <p class="gallery-item__name">수험생 할인혜택</p>
                               
                            </a>
                        </div>
                    </div>
                    
                <!-- 이벤트 이미지3 -->                    
                    <div class="col-sm-4 col-md-3">
                        <div class="gallery-item">
                            <a href='images/gallery/thumb/Event3.jpg' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="images/gallery/thumb/Event3.jpg">
                            </a>
                            <a href='images/gallery/large/Event3.jpg' class="gallery-item__descript gallery-item--photo-link">
                              
                                <p class="gallery-item__name">1+1 추첨 이벤트</p>
                               
                            </a>
                        </div>
                    </div>
                <!-- 이벤트 이미지4 -->                    
                    <div class="col-sm-4 col-md-3">
                        <div class="gallery-item">
                            <a href='images/gallery/thumb/Event4.jpg' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="images/gallery/thumb/Event4.jpg">
                            </a>
                            <a href='images/gallery/large/Event4.jpg' class="gallery-item__descript gallery-item--photo-link">
                              
                                <p class="gallery-item__name">문화의날 연극할인이벤트</p>
                               
                            </a>
                        </div>
                    </div>

                <!-- 이벤트 이미지5 -->
                    <div class="col-sm-4 col-md-3">
                        <div class="gallery-item">
                            <a href='images/gallery/thumb/Event5.png' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="images/gallery/thumb/Event5.png">
                            </a>
                            <a href='images/gallery/large/Event5.png' class="gallery-item__descript gallery-item--photo-link">
                              
                                <p class="gallery-item__name">골드빈X커피X연극 이벤트</p>
                              
                            </a>
                        </div>
                    </div>

                <!-- 이벤트 이미지6 -->
                    <div class="col-sm-4 col-md-3">
                        <div class="gallery-item">
                            <a href='images/gallery/thumb/Event6.png' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="images/gallery/thumb/Event6.png">
                            </a>
                            <a href='images/gallery/large/Event6.png' class="gallery-item__descript gallery-item--photo-link">
                              
                                <p class="gallery-item__name">더데빌 초대 이벤트</p>
                                
                            </a>
                        </div>
                    </div>
              	
              	 <!-- 이벤트 이미지7 -->                    
                    <div class="col-sm-4 col-md-3">
                        <div class="gallery-item">
                            <a href='images/gallery/thumb/Event7.png' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="images/gallery/thumb/Event7.png">
                            </a>
                            <a href='images/gallery/large/Event8.PNG' class="gallery-item__descript gallery-item--photo-link">
                              
                                <p class="gallery-item__name">레베카 무료초대 이벤트</p>
                               
                            </a>
                        </div>
                    </div>                     
                                                                                
                  <!-- 이벤트 이미지8 -->                    
                    <div class="col-sm-4 col-md-3">
                        <div class="gallery-item">
                            <a href='images/gallery/thumb/Event8.PNG' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="images/gallery/thumb/Event8.PNG">
                            </a>
                            <a href='images/gallery/large/Event8.PNG' class="gallery-item__descript gallery-item--photo-link">
                              
                                <p class="gallery-item__name">앙리할아버지와 나 리뷰 이벤트</p>
                               
                            </a>
                        </div>
                    </div>     
                    
                   <!-- 이벤트 이미지8 -->                    
                    <div class="col-sm-4 col-md-3">
                        <div class="gallery-item">
                            <a href='images/gallery/thumb/Event9.PNG' class="gallery-item__image gallery-item--photo">
                                <img alt='' src="images/gallery/thumb/Event9.PNG">
                            </a>
                            <a href='images/gallery/large/Event9.PNG' class="gallery-item__descript gallery-item--photo-link">
                              
                                <p class="gallery-item__name">아이언 레이디 티켓증정 이벤트</p>
                                
                            </a>
                        </div>
                    </div>     
                </div>
                </div>
    

                <div class="pagination paginatioon--full">
                    <a href='#' class="pagination__prev">prev</a>
                    <a href='#' class="pagination__next">next</a>
                </div>
            </div>

        </section>
                <jsp:include page="common_screen_bottom.jsp" flush="false" />
        <div class="clearfix">
 
        </div>

  </div>

    <!-- open/close -->
        <div class="overlay overlay-hugeinc">
            
            <section class="container">

                <div class="col-sm-4 col-sm-offset-4">
                    <button type="button" class="overlay-close">Close</button>
                    <form id="login-form" class="login" method='get' novalidate=''>
                        <p class="login__title">sign in <br><span class="login-edition">welcome to A.Movie</span></p>

                        <div class="social social--colored">
                                <a href='#' class="social__variant fa fa-facebook"></a>
                                <a href='#' class="social__variant fa fa-twitter"></a>
                                <a href='#' class="social__variant fa fa-tumblr"></a>
                        </div>

                        <p class="login__tracker">or</p>
                        
                        <div class="field-wrap">
                        <input type='email' placeholder='Email' name='user-email' class="login__input">
                        <input type='password' placeholder='Password' name='user-password' class="login__input">

                        <input type='checkbox' id='#informed' class='login__check styled'>
                        <label for='#informed' class='login__check-info'>remember me</label>
                         </div>
                        
                        <div class="login__control">
                            <button type='submit' class="btn btn-md btn--warning btn--wider">sign in</button>
                            <a href="#" class="login__tracker form__tracker">Forgot password?</a>
                        </div>
                    </form>
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

        <!-- Magnific-popup -->
        <script src="js/external/jquery.magnific-popup.min.js"></script>

        <!-- Mobile menu -->
        <script src="js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="js/external/jquery.selectbox-0.2.min.js"></script>

        <!-- Form element -->
        <script src="js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="js/form.js"></script>

        <!-- Custom -->
        <script src="js/custom.js"></script>
		
		<script type="text/javascript">
            $(document).ready(function() {
                init_Gallery();
            });
		</script>

</body>
</html>

