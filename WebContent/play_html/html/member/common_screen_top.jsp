<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html>
<head>
</head>
<body>


        <!-- Header section -->
        <header class="header-wrapper header-wrapper--home">
            <div class="container">
                <!-- Logo link-->
                <a href='../index.jsp' class="logo">
                    <img alt='logo' src="../images/logo.png">
                </a>
                
                <!-- Main website navigation-->
                <nav id="navigation-box">
                    <!-- Toggle for mobile menu mode -->
                    <a href="#" id="navigation-toggle">
                        <span class="menu-icon">
                            <span class="icon-toggle" role="button" aria-label="Toggle Navigation">
                              <span class="lines"></span>
                            </span>
                        </span>
                    </a>
                    
                    <!-- Link navigation -->
                    <ul id="navigation">
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="#">연극</a>
                            <ul>
                                <li class="menu__nav-item"><a href="#">연극차트</a></li>
                                <li class="menu__nav-item"><a href="#">예고편</a></li>
                                <li class="menu__nav-item"><a href="#">추천</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="../page-elements.html">예매</a>
                            <ul>
                                <li class="menu__nav-item"><a href="typography.html">예매하기</a></li>
                                <li class="menu__nav-item"><a href="page-elements.html">상영시간표</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="../page-elements.html">리뷰</a>
                            <ul>
                                <li class="menu__nav-item"><a href="book1.html">리뷰</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="../gallery-four.html">극장</a>
                            <ul>
                                <li class="menu__nav-item"><a href="gallery-four.html">극장소개</a></li>
                                <li class="menu__nav-item"><a href="gallery-three.html">위치</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="../news-left.html">이벤트</a>
                            <ul>
                                <li class="menu__nav-item"><a href="news-left.html">진행된이벤트</a></li>
                                <li class="menu__nav-item"><a href="news-right.html">마감된이벤트</a></li>
                                <li class="menu__nav-item"><a href="news-full.html">당첨자발표</a></li>
                            </ul>
                        </li>
                        <!-- <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="#">Mega menu</a>
                               <ul class="mega-menu container">
                                    <li class="col-md-3 mega-menu__coloum">
                                        <h4 class="mega-menu__heading">Now in the cinema</h4>
                                         <ul class="mega-menu__list">
                                            <li class="mega-menu__nav-item"><a href="#">The Counselor</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Bad Grandpa</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Blue Is the Warmest Color</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Capital</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Spinning Plates</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Bastards</a></li>
                                          </ul>
                                      </li>
                                        
                                      <li class="col-md-3 mega-menu__coloum mega-menu__coloum--outheading">
                                          <ul class="mega-menu__list">
                                            <li class="mega-menu__nav-item"><a href="#">Gravity</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Captain Phillips</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Carrie</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Cloudy with a Chance of Meatballs 2</a></li>
                                          </ul>
                                      </li>
                                      
                                      <li class="col-md-3 mega-menu__coloum">
                                        <h4 class="mega-menu__heading">Ending soon</h4>
                                          <ul class="mega-menu__list">
                                            <li class="mega-menu__nav-item"><a href="#">Escape Plan</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Rush</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Prisoners</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Enough Said</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">The Fifth Estate</a></li>
                                            <li class="mega-menu__nav-item"><a href="#">Runner Runner</a></li>
                                          </ul>
                                      </li>
                                    
                                      <li class="col-md-3 mega-menu__coloum mega-menu__coloum--outheading">
                                          <ul class="mega-menu__list">
                                            <li class="mega-menu__nav-item"><a href="#">Insidious: Chapter 2</a></li>
                                          </ul>
                                      </li>
                               </ul>
                        </li> -->
                    </ul>
                </nav>
                <%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
%>

<%
		if (userID == null) {
%>		
	<div class="control-panel">
                    <div class="auth auth--home">
                    	<div class="auth__show1">
                        	<a href="../loginForm.jsp" class="btn btn-md btn--warning btn--book  btn--sign btn--singin1 btn-after-not">로그인</a>
          
						</div>
                    </div>
    </div>

<%		
	} else{
%>
	<div class="control-panel">
                    <div class="auth auth--home">
                      <div class="auth__show">
                        
                      </div>
                      <a href="#" class="btn btn--sign btn--singin">
                          me
                      </a>
                        <ul class="auth__function">
                            <li><a href="#" class="auth__function-item">Watchlist</a></li>
                            <li><a href="#" class="auth__function-item">Booked tickets</a></li>
                            <li><a href="#" class="auth__function-item">Discussion</a></li>
                            <li><a href="main.jsp" class="auth__function-item">Settings</a></li>
                            <li><a href="../logout.jsp" class="auth__function-item">Logout</a></li>
                        </ul>

                    </div>
                    <a href="#" class="btn btn-md btn--warning btn--book btn-control--home login-window">Book a ticket</a>
                </div>
<%	
	}
%>
                <!-- Additional header buttons / Auth and direct link to booking-->
                <!--<div class="control-panel">
                    <div class="auth auth--home">
                      <div class="auth__show">
                        
                      </div>
                      <a href="#" class="btn btn--sign btn--singin">
                          me
                      </a>
                        <ul class="auth__function">
                            <li><a href="#" class="auth__function-item">Watchlist</a></li>
                            <li><a href="#" class="auth__function-item">Booked tickets</a></li>
                            <li><a href="#" class="auth__function-item">Discussion</a></li>
                            <li><a href="#" class="auth__function-item">Settings</a></li>
                        </ul>

                    </div>
                    <a href="#" class="btn btn-md btn--warning btn--book btn-control--home login-window">Book a ticket</a>
                </div>-->

            </div>
        </header>
    
</body>
</html>
