<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
      <div class="clearfix"></div>
      	<footer class="footer-wrapper">
            <div class="container">
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><p class="nav-link_bold">회원</p></li>
                        <li><a href="adminMemberSelect.jsp" class="nav-link__item">전체 회원 조회</a></li>
                        <li><a href="adminMemberUpdate.jsp?userID=jaehwan0527" class="nav-link__item">회원 수정</a></li>   
                        <li><a href="adminMemberSelect.jsp" class="nav-link__item">회원 검색</a></li>          
                    </ul>
                </div>
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><p class="nav-link_bold">예매</p></li>
                        <li><a href="admin_book.jsp" class="nav-link__item">연극별 예매매수 조회</a></li>
                        <li><a href="userIdSelect.jsp?playNo=1" class="nav-link__item">연극예매 회원/정보조회</a></li>
                        <li><a href="userIdSelect.jsp?playNo=1" class="nav-link__item">회원별 구매 좌석 조회</a></li>
                    </ul>
                </div>
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><p class="nav-link_bold">연극</p></li>
                        <li><a href="adminPlay.jsp" class="nav-link__item">연극 검색</a></li>
                        <li><a href="adminPlayInsert.jsp" class="nav-link__item">연극 등록</a></li>
                        <li><a href="adminPlayUpdate.jsp?playNo=12" class="nav-link__item">연극 수정</a></li>    
                        <li><a href="adminPlayUpdate.jsp?playNo=12" class="nav-link__item">좌석가격 변경</a></li>
                        <li><a href="adminPlay.jsp" class="nav-link__item">연극 삭제</a></li>
                    </ul>
                </div>
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><p class="nav-link_bold">극장</p></li>
                        <li><a href="adminTheaterSelect.jsp" class="nav-link__item">극장 검색</a></li>                        
                        <li><a href="adminTheaterInsert.jsp" class="nav-link__item">극장 등록</a></li>                     
                        <li><a href="adminTheaterUpdate.jsp?cinemaNo=1" class="nav-link__item">극장 수정</a></li> 
                        <li><a href="adminTheaterUpdate.jsp?cinemaNo=1" class="nav-link__item">극장 삭제</a></li>
                        <li><a href="adminTheaterUpdate.jsp?cinemaNo=1" class="nav-link__item">좌석수변경</a></li>
                    </ul>
                </div>
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><p class="nav-link_bold">리뷰</p></li>
                        <li><a href="Review.jsp" class="nav-link__item">등록/삭제 조회</a></li>
                    	<li><a href="Review.jsp" class="nav-link__item">제목/내용별 검색</a></li>
                    	<li><a href="Review.jsp" class="nav-link__item">삭제</a></li>
                    </ul>
                </div>
                
                <div class="col-xs-4 col-md-2 footer-nav">
                    <ul class="nav-link">
                        <li><p class="nav-link_bold">매출</p></li>
                        <li><a href="ChartPage.jsp" class="nav-link__item">연극별 매출현황</a></li>
                        <li><a href="ChartPage2.jsp" class="nav-link__item">월별 매출현황</a></li>
                        <li><a href="ChartPage.jsp" class="nav-link__item">일별 매출현황</a></li>
                    </ul>
                    <br/>
                </div>
                
            </div>
        </footer>
</body>
</html>