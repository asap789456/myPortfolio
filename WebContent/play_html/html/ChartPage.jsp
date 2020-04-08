<%@page import="org.w3c.dom.CDATASection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="play.*"%>
<%@page import="user.*"%>
<%@page import="cinema.*"%>
<%@page import="java.util.Vector"%>
<!doctype html>
<html>
<head>

	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>ATOZ</title>
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
        <link href="mypage/style.css?v=1" rel="stylesheet" />
		
        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>

	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
	.page-heading{
		padding-top: 15px;
	}
	
	.tab-content{
		width: 1500px;
		margin-left:13% !important; 
		z-index: 1;
	}
	.tab-pane{
		padding-left: 30px;
		z-index: 1;
	}
	<!--탭-->
	#vTab{
		margin-left: 14px !important; 
		margin-right: 10px !important; 
		z-index: 6;
	}
	
	.content-wrapper{
		width: 100%;
		z-index: 1;
	}
	
</style>
<script>
$(document).ready(function(){
    /*-- 인증된 사용자 영역을 처리하는 버튼들 ---*/
    //[회원 정보 변경]버튼을 클릭하면 자동실행
    //!!!$("#update").click(function(){//[회원정보수정]버튼 클릭
        //회원정보를 수정 및 회원 탈퇴를 위한 modify.jsp 페이지 요청
        //!!!location.href = "member/modify/modifyForm.jsp";
    //!!!});
    $("#delete").click(function(){//[회원정보수정]버튼 클릭
	        //회원정보를 수정 및 회원 탈퇴를 위한 modify.jsp 페이지 요청
	        location.href = "member/delete/deleteForm.jsp";
	    });
	
	
    
    //[로그아웃]버튼을 클릭하면 자동실행
    //logout.jsp페이지를 생행
    $("#logout").click(function(){//[회원정보수정]버튼 클릭
        $.ajax({
           type: "POST",
           url: "logout.jsp",
           success: function(data){
           location.href = "index.jsp";
           }
        });
    });
 });
</script>
</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	// [수정]버튼 클릭 시 수정폼에 입력한 값을  modifyPro.jsp 실행
	$("#modifyProcess").click(function() {
	var query = {
		userID : $("#userID").val(),
		userPassword : $("#userPassword").val(),
		userName : $("#userName").val(),
		userEmail : $("#userEmail").val(),
		userPhone : $("#userPhone").val()
	};
	$.ajax({
		type : "post",
		url : "member/modify/modifyPro.jsp",
		data : query,
		success : function(data) {
		data = data.trim();
		if(data == "true") {//정보수정 성공
		alert("회원정보가 수정되었습니다.");
		window.location.href = "mypage.jsp";
	} else {
		alert("정보 변경에 실패하였습니다.");
			}
		}
	});
	});

	// [취소]버튼 클릭 시 index.jsp로 이동
	$("#cancel").click(function() {
	window.location.href = "mypage.jsp";
	});
	});
</script>

    <div class="wrapper">
    	<jsp:include page="admin_common_top.jsp" flush="false" />
    	
        <!-- Main content -->
      
         
            
                
                    <h2 class="page-heading">매출현황</h2>
                    
        
                    
	                <!-- Vertical tabs -->
	                <div class="col-sm-9">
	                    <div class="tabs tabs--vertical">
	                      	<!-- Nav tabs -->
	                      	<ul class="nav nav-tabs" id="vTab">
	                        	<li><a href="#movie2" data-toggle="tab">연극_매출현황</a></li>
	                        	<li><a href="ChartPage2.jsp">월_매출현황</a></li>
	                        	<li class="active"><a href="#comment2" data-toggle="tab">일_매출현황</a></li>
	                        	
	                      	</ul>
	
	                      		<!-- Tab panes -->
	                      	<div class="tab-content">
	                      	
		                        <div class="tab-pane" id="movie2">
		                        	<div id="status">	
										<div>
											<div>
													<jsp:include page="Chart_play.jsp"></jsp:include>	
												
											</div>
										</div>
									</div>                   	
		                        </div>
		                        
		             
		                        
		                       <div class="tab-pane active" id="comment2">	                   
		                        <div class="statusd">
									<!-- 컨텐츠 내용 -->
		                        	<div class="content-wrapper">										
											<!-- chart 페이지 정보를 가져옴 -->
											<jsp:include page="Chart_date.jsp"></jsp:include>							
									</div>
								</div>      		                        	
		                       </div>
							</div>
							
		                      
							</div>
						</div>
					</div>
				</div>

			</div>
            
        </section>


		
		
 <jsp:include page="admin_bottom.jsp" flush="false" />
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