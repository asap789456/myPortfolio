<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="play.PlayListBean" %>    
<%@page import="play.PlayDAO" %> 
<%@page import="java.sql.*" %>
<%@page import="java.util.Vector" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.net.URLEncoder" %>
<head>
        <link rel="stylesheet" type="text/css" href="admin_play/style.min.css">
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

        

<style type="text/css">
.nav{
	margin-left: 40%;
}
th{
	text-align: center;
}

.btn-default{
	margin-left: 3px;
}

.Cloum{
	width: 100px;
	background: #e9e9e9;
}

</style>
</head>
<body>
	<div class="wrapper">
	<jsp:include page="admin_common_top.jsp" flush="false" />

    <section class="container">
    	<div class="col-sm-12">
		    <h2 class="page-heading">관리자: 이벤트 등록</h2>        	    
	        <div class="row">
	        	<div class="col-md-12">
	            	<div class="card">
	            		<div class="card-header"> <strong>이벤트 등록</strong> </div>
			             	<div class="card-body">
			             		<form method="post" action="adminTheaterInsertAction.jsp" >		             		
					                 
					                 <!-- 이미지 -->
					                 <div class="form-group row">
					                   	<label class="col-md-3 col-form-label" for="text-input">포스터</label>
					                    <div class="col-md-9">
					                    	  포스터 파일명:<input type="file" name="eventImg">
					                    </div>
					                  </div>	
					                  
					                 <div class="form-group row">
					                   	<label class="col-md-3 col-form-label" for="text-input">이벤트 제목</label>
					                    <div class="col-md-9">
					                      <input class="form-control" id="text-input" type="text" name="eventTitle"  placeholder="이벤트제목">
					                    </div>
					                  </div>						                  
					            
						                <div class="form-group row">
					                   	<label class="col-md-3 col-form-label" for="text-input">이벤트 시작날짜</label>
					                    <div class="col-md-9">
					                      <input class="form-control" id="date-input" type="date" name="eventSday"  placeholder="이벤트 시작날찌">
					                    </div>
					                    
					                    <label class="col-md-3 col-form-label" for="text-input">이벤트 종료날짜</label>
					                    <div class="col-md-9">
					                      <input class="form-control" id="date-input" type="date" name="eventEday"  placeholder="이벤트 종료날찌">
					                    </div>
					                    
					                  </div>							                  
					                  					                  
					                  
					                  <div>	                  
					                  	<input type="submit"  value="등록"/>
										<INPUT TYPE="button"  name="btnQuery" value="조 회" ONCLICK="document.location.href='adminEventSelect.jsp'">
									</div>	
			             		</form>
			                
			                  </div>
			               </div>
			            </div>
			         </div>
		</div>
	</section>
</body>

















