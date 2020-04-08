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
	<!-- 관리자 페이지 - db에 insert할 극장의 정보를 입력 -->
	<div class="wrapper">
	<jsp:include page="admin_common_top.jsp" flush="false" />

    <section class="container">
    	<div class="col-sm-12">
		    <h2 class="page-heading">관리자: 극장관리</h2>        	    
	        <div class="row">
	        	<div class="col-md-12">
	            	<div class="card">
	            		<div class="card-header"> <strong>극장등록</strong> </div>
			             	<div class="card-body">
			             		<form method="post" action="adminTheaterInsertAction.jsp" >		             		
					                 
					                 <!-- 이미지 -->
					                 <div class="form-group row">
					                   	<label class="col-md-3 col-form-label" for="text-input">이미지</label>
					                    <div class="col-md-9">
					                    <!-- 우선은 text 타입으로 지정! (file, imgae 타입이 따로 있긴 함.) -->
					                      
											극장 이미지:<input type="file" name="TImg"></p>
    
					                    </div>
					                  </div>	
					                  
					                 <div class="form-group row">
					                   	<label class="col-md-3 col-form-label" for="text-input">극장주소</label>
					                    <div class="col-md-9">
					                      <input class="form-control" id="text-input" type="text" name="TAdress"  placeholder="극장주소">
					                    </div>
					                  </div>						                  
					            
						              <div class="form-group row">
						                  <label class="col-md-3 col-form-label" for="text-input">극장이름</label>
						                   <div class="col-md-9">
						                     <input class="form-control" id="text-input" type="text" name="TName"  placeholder="극장이름">
						                   </div>
						               </div>						                  
					                  					                  
					                  <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="text-input">전화번호</label>
					                    <div class="col-md-9">
					                      <input class="form-control" id="text-input" type="text" name="TTell"  placeholder="전화번호">
					                    </div>
					                  </div>					                  					                  			              				            
					                  					                  					                  
					                  <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="date-input">극장사이트</label>
					                    <div class="col-md-9">
					                      <input class="form-control" id="date-input" type="text" name="TSite"  placeholder="극장사이트">
					                    </div>
					                  </div>  					                  
					                  
					                  
					                  <div class="form-group row">
					                    <label class="col-md-3 col-form-label" for="date-input">좌석수</label>
					                    <div class="col-md-9"> 
					                     <!-- 좌석수는 number로 지정, 후에 문제시 text로 교체 -->
					                      <input class="form-control" id="date-input" type="number" name="TSeat"  placeholder="좌석수">
					                    </div>
					                  </div> 
					           
					                  
					                  <div>	                  
					                  	<input type="submit"  value="등록"/>
										<INPUT TYPE="button"  name="btnQuery" value="조 회" ONCLICK="document.location.href='adminTheaterSelect.jsp'">
									</div>	
			             		</form>
			                
			                  </div>
			               </div>
			            </div>
			         </div>
		</div>
	</section>
</body>

















