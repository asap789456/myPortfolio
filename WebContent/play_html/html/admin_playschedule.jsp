<%@page import="cinema.Cinema"%>
<%@page import="cinema.CinemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="play.PlayListBean" %>    
<%@page import="play.PlayDAO" %> 
<%@page import="java.sql.*" %>
<%@page import="java.util.Vector" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.net.URLEncoder" %>
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
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
  
    <!-- jQuery UI --> 
        <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

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
<%
	int playNo = Integer.parseInt(request.getParameter("playNo"));

	PlayDAO pdao = new PlayDAO();
	PlayListBean bean = pdao.getOnePlay(playNo);
	
	PlayDAO pdao3 = new PlayDAO();
	PlayListBean pbean = pdao3.getPlayCinema(playNo);
%>
	<div class="wrapper">
	<jsp:include page="admin_common_top.jsp" flush="false" />

    <section class="container">
    	<div class="col-sm-12">
		    <h2 class="page-heading">연극스케줄관리</h2>        	    
	        <div class="row">
	        	<div class="col-md-12">
	            	<div class="card">
	            		<div class="card-header"> <strong>연극회차등록</strong> </div>
			             	<div class="card-body">
			             		<form method="post" action="admin_playscheduleAction.jsp" >		             		
					                 <div class="form-group row">
					                 	<label class="col-md-3 col-form-label" for="text-input">연극명</label>
					                    <select size="1" name="playNo" class="form-control" style="width: 100px;">
											<option value="<%=bean.getNo() %>" selected><%=bean.getName() %></option>
												<%  
												PlayDAO pdao2 = new PlayDAO();
												Vector<PlayListBean> v  = pdao2.getAllPlay();
													//배열 리스트 BbsMovie 객체 생성, 값들을 다 불러와!
													for(int i = 0; i < v.size(); i++) {
														PlayListBean bean2 = v.get(i);
												%>
														<option value=<%=bean2.getNo()%>><%=bean2.getName()%></option>
												<%
													}
												%>
										</select>
					                  </div>	
					                  
					                 <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="text-input">극장</label>
					                    <select size="1" name="cinemaNo" class="form-control" style="width: 100px;">
											<option value="" selected><%=pbean.getCinemaName() %></option>
												<%  
													CinemaDAO cdao = new CinemaDAO();
													Vector<Cinema> cv  = cdao.getAllCinema();
													//배열 리스트 BbsMovie 객체 생성, 값들을 다 불러와!
													for(int i = 0; i < cv.size(); i++) {
														Cinema cbean = cv.get(i);
												%>
														<option value=<%=cbean.getCinemaNo() %>><%=cbean.getCinemaName()%></option>
												<%
													}
												%>
										</select>
					                  </div>					                  

					                  <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="date-input">공연일자</label>
					                    <div class="col-md-3">
					                      <input class="form-control" id="date-input" type="date" name="date" placeholder="공연일자">
					                    </div>
					                  </div> 			                  
					                  					                  
					                  <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="text-input">공연회차시간</label>
					                    <div class="col-md-9">
					                      <input class="form-control" id="text-input" type="text" name="time"  placeholder="공연회차">
					                    </div>
					                  </div>					                  					                  			              				            

					                  
					                  <div>	                  
					                  	<input type="submit" value="등록"/>
										<input type="button" name="btnQuery" value="조 회" ONCLICK="document.location.href='adminPlay.jsp'">
									</div>	
			             		</form>
			                
			                  </div>
			               </div>
			            </div>
			         </div>
		</div>
	</section>
</body>

















