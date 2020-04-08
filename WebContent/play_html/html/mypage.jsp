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
        <title>마이페이지</title>
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
		<link rel="stylesheet" href="../style.css"/>
        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>

	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
	li{
		list-style: none;
	}
	
	.boxArea{
		background: white;
	
	}
	#button1{
		text-align: right;
	}
	
	.MemberUp{
		border-color: #969b9f;
		border-style: solid; 
	    border-collapse: collapse;
	}
	
	.Qna{
	  font: 13px 'Roboto', sans-serif;
	}
	
	.bold{
		font: 15px;
		color: #fe505a;
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
<%	
		request.setCharacterEncoding("UTF-8"); 
		String userID = (String)session.getAttribute("userID");
		
		PlayDAO pdao = new PlayDAO();
		Vector<PlayReserveBean> v = pdao.getAllReserve(userID);

		CinemaDAO cdao = new CinemaDAO();
		Cinema cinema = cdao.getReservationCinema(userID);
		
		UserDAO udao = new UserDAO();
		User user = udao.selectGrade(userID);
		
		UserDAO manager = new UserDAO();
		User user1 = manager.getMember(userID);	
%>
<%
		if (userID != null) {
%>
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
    	<jsp:include page="common_screen_top.jsp" flush="false" />
    	
        <!-- Main content -->
        <section class="container">
            <div class="overflow-wrapper">
                <div class="col-sm-12">
                
                    <h2 class="page-heading">마이페이지</h2>
                    
        
                    
	                <!-- Vertical tabs -->
	                <div class="col-sm-9">
	                    <div class="tabs tabs--vertical">
	                      	<!-- Nav tabs -->
	                      	<ul class="nav nav-tabs" id="vTab">
	                        	<li><a href="#movie2" data-toggle="tab">예매확인</a></li>
	                        	<li class="active"><a href="#comment2" data-toggle="tab">개인정보수정</a></li>
	                        	<!-- <li><a href="#map2" data-toggle="tab">문의내역</a></li> -->
	                      	</ul>
	
	                      		<!-- Tab panes -->
	                      	<div class="tab-content">
	                      	
		                        <div class="tab-pane" id="movie2">
		                        	<!-- <p>Sed ultrices vitae libero et sollicitudin. Etiam hendrerit sem ut ipsum malesuada, sit amet viverra quam lacinia. Nunc ut malesuada elit, et faucibus massa.</p> -->
									<div id="status">	
										<% for(int i=0; i < v.size(); i++){
											PlayReserveBean bean = v.get(i);	
										%>
										<div style="padding-bottom: 35px;">
											<img width="150px;" height="160px;" alt="연극이미지" src="images/play/<%=bean.getPlayImg() %>"></li>
											<div style="padding-left: 200px; margin-top: -150px;">
												<li style="font-size: 20px;"><%=bean.getPlayName() %></li>
												
												<li><%=cinema.getCinemaName() %></li>
												<li><%=bean.getSeat().substring(0, 2)%></li>
												<li><%=bean.getPlayDate()%></li>
												<li><%=bean.getPrice() %></li>
												<button class="btn btn-md btn--warning play_btn" onclick="location.href='PlayReserveDel.jsp?no=<%=bean.getPlayNo()%>&cinemaNo=<%=cinema.getCinemaNo()%>&date=<%=bean.getReservationDate()%>&seat=<%=bean.getSeat()%>&userID=<%=userID%>'">
												예매취소</button>

											</div>
										</div>

										<%
											}
										%>
									</div>
		                        	
		                        </div>
		                        
		                        <div class="tab-pane active" id="comment2">
		                        	<div id="status">
		                        		<ul>
		                        			<li style="font-weight: bold;"><%=user.getUserClass()%></li>
									      	<li><%=userID %>님</li>
										    <p>회원 정보를 변경하시겠습니까?</p>
										    <li class="label2"><button id="delete" class="btn btn-md btn--warning play_btn">탈퇴</button>
									        
									<!--  -->
									<button  class="btn btn-md btn--warning play_btn" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
									  회원정보변경
									</button></li>
								
									<div class="collapse" id="collapseExample">
									  <div class="well">
									    
								 <li><h3 class="center">회원 정보 수정</h3></li>
										<div id="regForm" class="boxArea">										
										 <table class="MemberUp" border="1">
										  
										   <tr>
										     <th>아이디: </th>
										     <td><%= user1.getUserID() %><input id="userID" name="userID" type="hidden" value="<%= user1.getUserID() %>"> </td>								      
										   </tr>  
										   
										   <tr>   
											 <th><label for="userPassword">비밀번호:</label></th>
										   	 <td> <input id="userPassword" name="userPassword" type="password" size="20" placeholder="6~16자 숫자/문자" maxlength="16"></td>
										    </tr>
										   
										    <tr> 
											  <th><label for="userName">이름:</label> </th>
											  <td> <%= user1.getUserName() %><input id="userName" name="userName" type="hidden" size="20" maxlength="10" value="<%= user1.getUserName() %>"></td>
										    </tr>
										    <tr>
												<th><label for="userEmail">이메일:</label></th>
											    <td><input id="userEmail" name="userEmail" type="text" size="30" maxlength="50" value="<%= user1.getUserEmail() %>"></td>											     
										    </tr>
										     <tr> 
											     <th><label for="userPhone">전화번호:</label></th>
											     <td><input id="userPhone" name="userPhone" type="tel" size="20" maxlength="20" value="<%= user1.getUserPhone() %>">
											      </li>
										     </tr> 
										      
										      <tr>
										      
											    <td colspan="3">  <li class="label2" id="button1"><button id="modifyProcess"  class="btn btn-default" >수정</button>
											          <button id="cancel"  class="btn btn-default">취소</button>
											      </li>
											      </td>
										   	</tr>
										   </ul>
										 </table>
										</div>
									  </div>
									</div>
										
									 
									   	</ul>
									</div>      		                        	
		                        </div>

		                        <!--<div class="tabPane" id="map2">
		                   
		                       	</div> -->
		                        
							</div>
						</div>
					</div>
				</div>

			</div>
            
        </section>


		
		<jsp:include page="common_screen_bottom.jsp" flush="false" />
    </div>		
<%		
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = 'loginForm.jsp'");
		script.println("</script>");
	}
%>
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