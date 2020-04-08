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
<jsp:useBean id="rbean" class="play.PlayReserveBean">
	<jsp:setProperty name="rbean" property="*" />
</jsp:useBean>
	<%
		String userID = (String)session.getAttribute("userID");
		rbean.setUserID(userID);

		int playNo = Integer.parseInt(request.getParameter("playNo"));
		int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo"));
		int sum = Integer.parseInt(request.getParameter("sum"));
		String playDate = request.getParameter("playDate");
		String seat = request.getParameter("seat");
		String time = request.getParameter("time");
		
		int seatPrice = 0;
		PlayDAO pdao = new PlayDAO();
		PlayListBean bean = pdao.getOnePlay(playNo);
		
		ArrayList<PlaySeat> seatList  = new ArrayList<PlaySeat>();
		seatList = new PlaySeatDAO().getSeatPrice(cinemaNo);
		int vip = 0;
		int general = 0;
		for(int i = 0; i < 2; i++){
			PlaySeat psbean = seatList.get(0);
			PlaySeat psbean1 = seatList.get(1);
			general = psbean.getSeatPrice();
			vip = psbean1.getSeatPrice();
			
		}
		
		String[] str = seat.split(", "); 
		for(int i = 0; i < str.length; i++) {
			System.out.println("-------------"+str[i] + "\t"); //배열의 0번지부터 마지막 번지까지 탭문자를두어 출력합니다.	
	        String TempSeat = str[i];
			//-----------------------------------------------------------------------------------
			
			if(TempSeat.contains("S")){
				System.out.println(TempSeat);
				rbean.setSeat(TempSeat);
				seatPrice = vip;
				rbean.setPrice(seatPrice);
			}else if(TempSeat.contains("R")){
				rbean.setSeat(TempSeat);
				seatPrice = general;
				rbean.setPrice(seatPrice);
			}
			PlayDAO pdao2 = new PlayDAO();
			pdao2.setReservePlay(rbean);
			
			PlayDAO pdao3 = new PlayDAO();
			pdao3.ReservationOneUpdate(TempSeat,cinemaNo,playNo);
			//-----------------------------------------------------------------------------------
		} //for문 닫음
		/* response.sendRedirect("book-final.jsp"); */
		///f(result == -1){
		///	PrintWriter script = response.getWriter();
		///	script.println("<script>");
		///	script.println("alert('예매에 실패했습니다')");
		///	script.println("history.back()");
		///	script.println("</script>");
		///else{
		///	PrintWriter script = response.getWriter();
		///	script.println("<script>");
		///	script.println("location.href = 'book-final.jsp'");
		///	script.println("</script>");
		///
	%>
	<form name="frm" method='post' action="admin_book-final.jsp">
		<input type="hidden" name="playNo" value="<%=playNo%>"> <!-- 연극번호 -->
		<input type="hidden" name="cinemaNo" value="<%=cinemaNo%>"> <!-- 극장번호 -->
		<input type="hidden" name="playDate" value="<%=playDate%>"> <!-- 예매일자 -->
		<input type="hidden" name="sum" value="<%=sum%>"> <!-- 연극가격 -->
		<input type="hidden" name="seat" value="<%=seat%>"> <!-- 연극번호 -->
		<input type="hidden" name="time" value="<%=time%>"> <!-- 연극번호 -->
	</form>
</body>
</html>
