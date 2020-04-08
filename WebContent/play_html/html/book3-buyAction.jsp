<%@page import="PlaySchedule.PlaySchedule"%>
<%@page import="PlaySchedule.PlayScheduleDAO"%>
<%@page import="play_seat.PlaySeatDAO"%>
<%@page import="play_seat.PlaySeat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "play.*" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
window.onload = function(){
	document.frm.submit();
}
</script>
</head>
<body>
<!-- useBean을 이용해  PlayReserveBean 자바 클래스에서 선언한 변수들에 값 지정-->
<jsp:useBean id="rbean" class="play.PlayReserveBean">
	<jsp:setProperty name="rbean" property="*" />
</jsp:useBean>
	<%
		/* boo3-buy.jsp화면 이후 처리되는 페이지 */
		String userID = (String)session.getAttribute("userID"); //예매한 아이디
		rbean.setUserID(userID);

		int playNo = Integer.parseInt(request.getParameter("playNo")); //선택한 연극번호
		int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo")); //선택한 극장번호
		int sum = Integer.parseInt(request.getParameter("sum")); //좌석의 총 합계
		int bank = Integer.parseInt(request.getParameter("bankaccount")); //선택한 무통장 은행
		String playDate = request.getParameter("playDate"); //선택한 연극 날짜
		String seat = request.getParameter("seat"); //선택한 좌석
		String time = request.getParameter("time"); //선택한 회차
		int seatPrice = 0; // 좌석 하나의 가격
		PlayDAO pdao = new PlayDAO();
		PlayListBean bean = pdao.getOnePlay(playNo);
		
		ArrayList<PlaySeat> seatList  = new ArrayList<PlaySeat>();
		seatList = new PlaySeatDAO().getSeatPrice(cinemaNo);
		int vip = 0;
		int general = 0;
		/* s석과 r석의 가격 */
		for(int i = 0; i < 2; i++){
			PlaySeat psbean = seatList.get(0);
			PlaySeat psbean1 = seatList.get(1);
			general = psbean.getSeatPrice();
			vip = psbean1.getSeatPrice();		
		}		
		PlayScheduleDAO pshdao2 = new PlayScheduleDAO();
		ArrayList<PlaySchedule> array = pshdao2.getPlaySchedule(playNo,playDate);

		String[] str = seat.split(", "); 
		/* 선택한 좌석의 수만큼 loop 돌아감 */
		for(int i = 0; i < str.length; i++) {
	        String TempSeat = str[i];
			//-----------------------------------------------------------------------------------
			/* 선택된 좌석이 s석이라면  */
			if(TempSeat.contains("S")){
				/* 조조 회차일 경우 5프로 할인 적용 */
				if(time.equals(array.get(0).getTime())){
					rbean.setSeat(TempSeat);
					seatPrice = (int)(vip * 0.95);
					System.out.println(seatPrice);
					rbean.setPrice(seatPrice);
				}else{
					System.out.println(TempSeat);
					rbean.setSeat(TempSeat);
					seatPrice = vip;
					rbean.setPrice(seatPrice);
				}
				/* 선택된 좌석이 r석이라면  */
			}else if(TempSeat.contains("R")){
				/* 조조 회차일 경우 5프로 할인 적용 */
				if(time.equals(array.get(0).getTime())){
					rbean.setSeat(TempSeat);
					seatPrice = (int)(general * 0.95);
					System.out.println(seatPrice);
					rbean.setPrice(seatPrice);
				}else{
					System.out.println(TempSeat);
					rbean.setSeat(TempSeat);
					seatPrice = general;
					rbean.setPrice(seatPrice);
				}
			}
			PlayDAO pdao2 = new PlayDAO();
			pdao2.setReservePlay(rbean);
			
			PlayDAO pdao3 = new PlayDAO();
			pdao3.ReservationOneUpdate(TempSeat,cinemaNo,playNo);
			//-----------------------------------------------------------------------------------
		} //for문 닫음
	%>
	<form name="frm" method='post' action="book-final.jsp">
	<%
	/* 선택한 은행 */
	if(bank == 1){
	%>
		<input type="hidden" name="bank" value="기업은행: 181-106582-04-015 (주)APICKET"> <!-- 연극번호 -->
	<%	
	}else if(bank == 2){
	%>
		<input type="hidden" name="bank" value="국민은행: 506537-04-000438 (주)APICKET"> <!-- 연극번호 -->
	<%	
	}else if(bank == 3){
	%>
		<input type="hidden" name="bank" value="농협중앙회: 391-0080-4113-01 (주)APICKET"> <!-- 연극번호 -->
	<%}else if(bank == 4){
	%>
		<input type="hidden" name="bank" value="우체국: 401562-02-201373 (주)APICKET"> <!-- 연극번호 -->
	<%	
	}
	%>
		<input type="hidden" name="playNo" value="<%=playNo%>"> <!-- 연극번호 -->
		<input type="hidden" name="cinemaNo" value="<%=cinemaNo%>"> <!-- 극장번호 -->
		<input type="hidden" name="playDate" value="<%=playDate%>"> <!-- 예매일자 -->
		<input type="hidden" name="sum" value="<%=sum%>"> <!-- 연극가격 -->
		<input type="hidden" name="seat" value="<%=seat%>"> <!-- 연극번호 -->
		<input type="hidden" name="time" value="<%=time%>"> <!-- 연극번호 -->
	</form>
</body>
</html>
