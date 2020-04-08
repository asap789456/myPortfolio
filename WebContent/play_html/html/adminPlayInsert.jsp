<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="genre.Genre"%>
<%@page import="genre.GenreDAO"%>
<%@page import="cinema.Cinema"%>
<%@page import="cinema.CinemaDAO"%>
<%@page import="play.PlayListBean"%>
<%@page import="play.PlayDAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<head>
<!-- Modernizr -->
<script src="js/external/modernizr.custom.js"></script>
<link rel="stylesheet" type="text/css" href="admin_play/style.min.css">
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>APicket_Booking step 1</title>
<meta name="description" content="A Template by Gozha.net">
<meta name="keywords" content="HTML, CSS, JavaScript">
<meta name="author" content="Gozha.net">
<!-- Mobile Specific Metas-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="telephone=no" name="format-detection">
<!-- Fonts -->
<!-- Font awesome - icon font -->
<link
href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
rel="stylesheet">
<!-- Roboto -->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700'
rel='stylesheet' type='text/css'>
<!-- jQuery UI -->
<link
href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"
rel="stylesheet">
<!-- Mobile menu -->
<link href="css/gozha-nav.css" rel="stylesheet" />
<!-- Select -->
<link href="css/external/jquery.selectbox.css" rel="stylesheet" />
<!-- Swiper slider -->
<link href="css/external/idangerous.swiper.css" rel="stylesheet" />
<!-- Custom -->
<link href="css/style.css?v=1" rel="stylesheet" />
<!-- Modernizr -->
<script src="js/external/modernizr.custom.js"></script>
</head>
<body>
<!-- 연극의 정보를 입력하는 페이지 -->
<div class="wrapper">
<jsp:include page="admin_common_top.jsp" flush="false" />
<section class="container">
<div class="col-sm-12">
<h2 class="page-heading">연극관리</h2>
<div class="row">
<div class="col-md-12">
<div class="card">
<div class="card-header">
<strong>연극등록</strong>
</div>
<div class="card-body">
<!-- 폼을 이용해 adminPlayInsertAction.jsp으로 값을 보낸다 -->
<form method="post" action="adminPlayInsertAction.jsp">
<div class="form-group row">
<label class="col-md-3 col-form-label" for="text-input">연극명</label>
<div class="col-md-9">
<!-- input으로 연극명을 전송(name) -->
<input class="form-control" id="text-input" type="text"
name="name" placeholder="연극명">
</div>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="text-input">장르</label>
<!-- select으로 연극의 장르를 선택해 전송(genre) -->
<select size="1" name="genre"
class="btn btn-default dropdown-toggle">
<option value="" selected>장르선택</option>
<!-- 장르 db를 이용해 모든 장르를 불러와서 선택할 수 있게함 -->
<%
GenreDAO gdao2 = new GenreDAO();
Vector<Genre> gv = gdao2.getAllGenre();
//배열 리스트 BbsMovie 객체 생성, 값들을 다 불러와!
for (int i = 0; i < gv.size(); i++) {
Genre gbean2 = gv.get(i);
%>
<option value=<%=gbean2.getGenreNo()%>><%=gbean2.getGenreName()%></option>
<%
}
%>
</select>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="text-input">관람등급</label>
<div class="col-md-9">
<!-- input으로 연극의 관람등급을 입력해 전송(grade) -->
<input class="form-control" id="text-input" type="text"
name="grade" placeholder="관람등급">
</div>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="text-input">S석가격</label>
<div class="col-md-9">
<!-- input으로 연극의 S석 가격을 입력해 전송(Sprice) -->
<input class="form-control" id="text-input" type="text"
name="Sprice" placeholder="가격">
</div>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="text-input">R석가격</label>
<div class="col-md-9">
<!-- input으로 연극의 R석 가격을 입력해 전송(Rprice) -->
<input class="form-control" id="text-input" type="text"
name="Rprice" placeholder="가격">
</div>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="text-input">상영시간</label>
<div class="col-md-9">
<!-- input으로 연극의 상연시간을 입력해 전송(time) -->
<input class="form-control" id="text-input" type="text"
name="time" placeholder="상영시간">
</div>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="date-input">공연시작일</label>
<div class="col-md-9">
<input class="form-control" id="date-input" type="date"
name="sday" placeholder="공연시작일">
</div>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="date-input">공연종료일</label>
<div class="col-md-9">
<input class="form-control" id="date-input" type="date"
name="eday" placeholder="공연종료">
</div>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="textarea-input">연극내용</label>
<div class="col-md-9">
<input class="form-control" id="text-input" type="textarea"
name="info" placeholder="Text">
</div>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="text-input">트레일러</label>
<div class="col-md-9">
<input class="form-control" id="text-input" type="text"
name="video" placeholder="Text">
</div>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="text-input">포스터</label>
<div class="col-md-9">
포스터 파일명:<input type="file" name="img">
</div>
</div>
<div class="form-group row">
<label class="col-md-3 col-form-label" for="text-input">극장</label>
<select size="1" name="cinemaNo" class="form-control"
style="width: 100px;">
<option value="" selected>극장선택</option>
<%
CinemaDAO cdao = new CinemaDAO();
Vector<Cinema> cv = cdao.getAllCinema();
//배열 리스트 BbsMovie 객체 생성, 값들을 다 불러와!
for (int i = 0; i < cv.size(); i++) {
Cinema cbean = cv.get(i);
%>
<option value=<%=cbean.getCinemaNo()%>><%=cbean.getCinemaName()%></option>
<%
}
%>
</select>
</div>
<div>
<input type="submit" value="등록" /> <input TYPE="button"
name="btnQuery" value="조 회"
ONCLICK="document.location.href='adminPlay.jsp'">
</div>
</form>
</div>
</div>
</div>
</div>
</div>
</section>
</div>
</body>