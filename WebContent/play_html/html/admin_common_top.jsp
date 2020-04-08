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
                <a href='index.jsp' class="logo">
                    <img alt='logo' src="images/logo.png">
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
                            <a href="adminMemberSelect.jsp">회원</a>
                            <ul>
                            <li class="menu__nav-item"><a href="adminMemberSelect.jsp">회원 관리</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="#">예매</a>
                            <ul>
                                <li class="menu__nav-item"><a href="admin_book.jsp">예매 관리</a></li>
                                <li class="menu__nav-item"><a href="admin_book1.jsp">관리자 예매하기</a></li>
                                <li class="menu__nav-item"><a href="ChartPage.jsp">매출 현황</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="adminPlay.jsp">연극</a>
                           <ul>
                                <li class="menu__nav-item"><a href="adminPlay.jsp">연극 관리</a></li>
                                <li class="menu__nav-item"><a href="adminPlayInsert.jsp">연극 등록</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="adminTheaterSelect.jsp">극장</a>
                           <ul>
                                <li class="menu__nav-item"><a href="adminTheaterSelect.jsp">극장 관리</a></li>
                                <li class="menu__nav-item"><a href="adminTheaterInsert.jsp">극장 등록</a></li>
                                <li class="menu__nav-item"><a href="adminSeatGradeSelect.jsp">좌석 등급 관리</a></li>
                            </ul>
                        </li>
                        <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="Review.jsp">리뷰</a>
                            <ul>
                                <li class="menu__nav-item"><a href="Review.jsp">리뷰 관리</a></li>
                            </ul>
                        </li>
                       <li>
                            <span class="sub-nav-toggle plus"></span>
                            <a href="adminEventSelect.jsp">이벤트</a>
                            <ul>
                                <li class="menu__nav-item"><a href="adminEventSelect.jsp">이벤트 관리</a></li>
                                <li class="menu__nav-item"><a href="adminEventInsert.jsp">이벤트 등록</a></li>
                            </ul>
                        </li>
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
                        	<a href="join.jsp" class="btn btn1 btn-md btn--warning btn--sign btn--book btn--singin1 btn-after-not">회원가입</a>
          
						</div>
                    </div>
                    <div class="auth auth--home">
                    	<div class="auth__show1">
                        	<a href="loginForm.jsp" class="btn btn-md btn--warning btn--book btn--sign btn--singin1 btn-after-not">로그인</a>
          
						</div>
                    </div>
    </div>

<%
	}else if (userID.equals("admin")) {
%>
				<div class="control-panel">
                    <div class="auth auth--home">
                      <div class="auth__show">
                        
                      </div>
                      <a href="#" style="color:#b4b1b2;" class="btn btn--sign btn--singin">
                          <%=userID %> &nbsp; 님 
                      </a>
                        <ul class="auth__function">
                           	<li><a href=adminMemberSelect.jsp class="auth__function-item">회원</a></li>
                            <li><a href="admin_book.jsp" class="auth__function-item">예매</a></li>
                            <li><a href="adminPlay.jsp" class="auth__function-item">연극</a></li>
                            <li><a href="Review.jsp" class="auth__function-item">리뷰</a></li>
                            <li><a href="adminTheaterSelect.jsp" class="auth__function-item">극장</a></li>
                            <li><a href="admin_event.jsp" class="auth__function-item">이벤트</a></li>
                            <li><a href="logout.jsp" class="auth__function-item">로그아웃</a></li>
                        </ul>

                    </div>
                    
                </div>


<%		
	} else{
%>
	<div class="control-panel">
                    <div class="auth auth--home">
                      <div class="auth__show">
                        
                      </div>
                      <a href="#" style="color:#b4b1b2;" class="btn btn--sign btn--singin">
                          me
                      </a>
                        <ul class="auth__function">
                            <li><a href="mypage.jsp" class="auth__function-item">마이페이지</a></li>
                            <li><a href="logout.jsp" class="auth__function-item">로그아웃</a></li>
                        </ul>

                    </div>
                   
                </div>
<%	
	}
%>
            </div>
        </header>
    
</body>
</html>
