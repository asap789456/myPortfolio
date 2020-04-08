<%@page import="play_seat.PlaySeatDAO"%>
<%@page import="play_seat.PlaySeat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="play.*"%>
<%@page import="PlaySchedule.*"%>
<%@page import="user.*"%>
<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>APicket - Booking step 3</title>
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
    
        <!-- Custom -->
        <link href="css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="js/external/modernizr.custom.js"></script>
</head>
<style type="text/css">
.sits-price--cheap3:before {
    background-color: #ffd564;
}
.sits-price--cheap4:before {
    background-color: #fe505a;
}
</style> 
<script type="text/javascript">
function fnc_open(){
	if (confirm("선택한 좌석을 예매 하시겠습니까?") == true){    //확인
		document.frm.action = "book3-buyAction.jsp"; 
		document.frm.submit();
	}else{   //취소
	    return;
	}
}
</script>
<body>
<jsp:useBean id="rbean" class="play_seat.PlaySeat">
	<jsp:setProperty name="rbean" property="*" />
</jsp:useBean>
<%
	/* 선택된 예매 정보들을 확인하는 페이지 */
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	userID = (String) session.getAttribute("userID"); //아이디
	int playNo = Integer.parseInt(request.getParameter("playNo")); //연극 번호
	int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo")); 
	String playDate = request.getParameter("playDate"); // 연극예매 날짜
	String time = request.getParameter("time");	
	String seat = request.getParameter("seat"); // 선택한 좌석

	//연극일정에 대한 정보를 얻어옴
	PlayScheduleDAO psdao2 = new PlayScheduleDAO();
	PlaySchedule bean2 = psdao2.getOneSch(playNo);
	
	PlayDAO pdao = new PlayDAO();
	//연극 하나에 대한 정보를 얻어옴
	PlayListBean bean = pdao.getOnePlay(playNo);
	
	UserDAO userDAO = new UserDAO(); //USERDAO 안에 있는 함수?사용하기위해 이름이 manager인 객체생성
	User userBean = userDAO.getMember(userID); //USER에 있는 변수사용 (bean 생성) getMember()는 UserDAO에 있는 함수
	
	ArrayList<PlaySeat> seatList  = new ArrayList<PlaySeat>();
	seatList = new PlaySeatDAO().getSeatPrice(cinemaNo);
	/* s석과 r석의 가격과 총 합계 */
	int vip = 0;
	int general = 0;
	int vipTotal = 0;
	int generalTotal = 0;
	for(int i = 0; i < 2; i++){
		PlaySeat psbean = seatList.get(0);
		PlaySeat psbean1 = seatList.get(1);
		general = psbean.getSeatPrice();
		vip = psbean1.getSeatPrice();		
	}
	String[] str = seat.split(", ");
	int sum = 0;
	int seatPrice = 0;
	String Result = "";
	PlaySeatDAO seatGrade= new PlaySeatDAO();
	
	PlayScheduleDAO pshdao2 = new PlayScheduleDAO();
	ArrayList<PlaySchedule> array = pshdao2.getPlaySchedule(playNo,playDate);
	/* 선택된 좌석의 수 만큼 loop 돌아감 */
	for(int i = 0; i < str.length; i++) {
		Result += str[i].substring(0, 2) + ", ";
		/* 선택된 좌석이 s석이라면  */
		if(str[i].trim().contains("S")){
			/* s석중에서 회차가 조조회차라면 5프로 할인 적용*/
			if(time.equals(array.get(0).getTime())){
				seatPrice = (int)(vip*0.95);
				sum += seatPrice;
				vipTotal++;
			}else{
				/* 조조가 아니라면 기본 가격으로 */
				seatPrice = vip;
				sum += seatPrice;
				vipTotal++;
			}
		/* 선택된 좌석이 r석이라면  */
		}else if(str[i].trim().contains("R")){
			/* r석중에서 회차가 조조회차라면 5프로 할인 적용*/
			if(time.equals(array.get(0).getTime())){
				seatPrice = (int)(general*0.95);
				sum += seatPrice;
				generalTotal++;
			}else{
				seatPrice = general;
				sum += seatPrice;
				generalTotal++;
			}	
		}
	}
%>
<div class="wrapper">
<jsp:include page="common_screen_top.jsp" flush="false" />
	
	<form id='film-and-time frm' name="frm" class="booking-form" method='post'>      
        <!-- Main content -->
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="images/tickets.png">
                    <p class="order__title">Book a ticket <br><span class="order__descript">좌석 정보를 확인 해주세요.</span></p>           
                </div>
            <div class="col-sm-12">
                <div class="checkout-wrapper">
                    <h2 class="page-heading">가격</h2>
                    <ul class="book-result">
                        <li class="book-result__item">선택한 좌석: <span class="book-result__count booking-ticket"><%=Result %></span></li>
						<li class="book-result__item">총 금액: <span class="book-result__count booking-cost"><%=sum %>원</span></li>
                    </ul>
                    
				<div class="choose-sits" >
					<div class="choose-sits__info" style="position:relative; top: -50px; left: -418px; margin-bottom: -50px;">
						<ul>
						<% 
						int saleVip = 0;
						int saleGeneral = 0;
						/* 만약 조조 회차일 경우에는 5프로 할인 적용된 가격이 보이게 함  */
						if(time.equals(array.get(0).getTime())){
							saleVip = (int)(vip * 0.95);
					 		saleGeneral = (int)(general * 0.95);
						%>
							S석 &nbsp;<li class="sits-price sits-price--cheap4"><del><%=vip%></del>&nbsp;<%=saleVip%>원  &nbsp; &nbsp; <%=vipTotal %>매를 선택하셨습니다.</li><br/><br/>
							R석 &nbsp;<li class="sits-price sits-price--cheap3"> <%=general%>원&nbsp;<%=saleGeneral%>원  &nbsp; &nbsp; <%=generalTotal%>매를 선택하셨습니다.</li>
						<%
						}else{ 
						%>
							S석 &nbsp;<li class="sits-price sits-price--cheap4"><%=vip%>원  &nbsp; &nbsp; <%=vipTotal %>매를 선택하셨습니다.</li><br/><br/>
							R석 &nbsp;<li class="sits-price sits-price--cheap3"> <%=general%>원  &nbsp; &nbsp; <%=generalTotal%>매를 선택하셨습니다.</li>
						<%} %>
						</ul>
					</div>
				</div>
				
                <h2 class="page-heading">결제 방법</h2>
				<div>
					<strong>입금자명</strong> &nbsp;&nbsp;&nbsp;<%=userBean.getUserName() %>
					<ul>
						<li>
							<strong>입금은행</strong> &nbsp; 
							<select id="bankaccount" name="bankaccount" fw-filter="" fw-label="무통장 입금은행" fw-msg="" >
								<option value="1">기업은행: 181-106582-04-015 (주)APICKET</option>
								<option value="2">국민은행: 506537-04-000438 (주)APICKET</option>
								<option value="3">농협중앙회: 391-0080-4113-01 (주)APICKET</option>
								<option value="4">우체국: 401562-02-201373 (주)APICKET</option>
							</select>
						</li>
					</ul>
				</div>
				</div>			                    
				<h2 class="page-heading">결제 정보</h2>
              	<form id='contact-info' method='post' novalidate="" class="form contact-info">
                   <p class="reservation-message">결제정보를 확인해주세요. 해당 회원의 이메일 주소로 구매하신 티켓정보가 발송됩니다. 만약 5분이내로 전송이 되지 않았다면  고객센터로 문의 바랍니다.<br>
                  	 ※5일 이내 미입금 시 자동취소 됩니다. 입금하신 금액과 입금자명이 다르거나 주문취소 후 입금하신 경우에는 자동으로 입금확인이 불가능합니다.<br>
		   		※ 모바일뱅킹,인터넷뱅킹으로 이체하실 경우, 받는 통장메모or표시에 입금자명을 기재 해주세요.</p>
                   </p>
               </form>
			</div>       
 </div>	               
			<div class="order">
                <input type="hidden" name="playDate" value="<%=playDate%>"> <!-- 예매날짜 -->
				<input type="hidden" name="playNo" value="<%=playNo%>"> <!-- 연극번호 -->
				<input type="hidden" name="price" value="<%=bean.getPrice()%>"> <!-- 연극가격 -->
				<input type='hidden' name='seat' value="<%=seat%>" class="choosen-sits">
				<input type="hidden" name="playDate" value="<%=bean2.getDate()%>"> <!-- 연극공연일자 -->
				<input type="hidden" name="cinemaNo" value="<%=cinemaNo%>"> <!-- 극장번호 -->
				<input type="hidden" name="time" value="<%=time%>"> <!-- 극장번호 -->
				<input type="hidden" name="sum" value="<%=sum%>"> <!-- 총가격 -->
					
				<div class="booking-pagination booking-pagination--margin">
					<a href="book1.jsp" class="booking-pagination__prev">
						<span class="arrow__text arrow--prev">그 전 단계</span>
						<span class="arrow__info">예매하기</span>
					</a>
				<br><br>
                	 <a href="#" onclick="fnc_open()" class="btn btn-md btn--warning btn--wide">결제</a>
                </div>
                <br>
            </div>
        </section>
	<div class="clearfix"></div>
	<div class="clearfix"></div>
	</form>
</div>

	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
        <!-- Swiper slider -->
        <script src="js/external/idangerous.swiper.min.js"></script>

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
