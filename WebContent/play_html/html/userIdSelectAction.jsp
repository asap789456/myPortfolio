<%@page import="admin_res.adminDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin_res.adminDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "play.*" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<script>

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- book3-buy.jsp 에서 값이 넘어온 페이지!! -->

<title></title>
<script type="text/javascript">
window.onload = function(){
	document.frm.submit();
}
</script>
</head>
<body>
<form name="frm" method='post' action="adminBook2.jsp">
	<%
		String userID = request.getParameter("userID");
		int playNo = Integer.parseInt(request.getParameter("playNo"));
		
		adminDAO adao = new adminDAO();
		ArrayList<adminDTO> seatList = adao.selectSeat(playNo, userID);
		
    	for(int i = 0; i < seatList.size(); i++){
    		adminDTO abean = seatList.get(i);
    		
    %>
    		<input type="hidden" name="a<%=i%>" value="<%=abean.getSeatName()%>"> <!-- 연극번호 -->
    		
    <%
    	}
    %>
    <input type="hidden" name="playNo" value="<%=playNo%>"> <!-- 예매일자 -->
    <input type="hidden" name="userID" value="<%=userID%>"> <!-- 예매일자 -->
 		<!-- for(int i = 0; i < str.length; i++) {
			System.out.println(str[i] + "\t"); //배열의 0번지부터 마지막 번지까지 탭문자를두어 출력합니다.	
	        String TempSeat = str[i];
			//-----------------------------------------------------------------------------------
			.setSeat(TempSeat);
			PlayDAO pdao = new PlayDAO();
			pdao.setReservePlay();
			
			PlayDAO pdao2 = new PlayDAO();
			pdao2.ReservationOneUpdate(TempSeat,,playNo);
			//-----------------------------------------------------------------------------------
		} */ //for문 닫음
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
		/// -->

<%-- 	<form name="frm" method='post' action="book-final.jsp">
		<input type="hidden" name="playNo" value="<%=playNo%>"> <!-- 연극번호 -->
		<input type="hidden" name="cinemaNo" value="<%=cinemaNo%>"> <!-- 극장번호 -->
		<input type="hidden" name="playDate" value="<%=playDate%>"> <!-- 예매일자 -->
		<input type="hidden" name="seat" value="<%=seat%>"> <!-- 연극번호 -->
		<input type="hidden" name="time" value="<%=time%>"> <!-- 연극시간 -->
		<input type="hidden" name="sum" value="<%=sum%>"> <!-- 총가격 --> --%>
</form>
</body>
</html>
