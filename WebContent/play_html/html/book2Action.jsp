<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
window.onload = function(){
	document.frm.submit();
}
</script>
<body>

<%
	/* 좌석 선택 후 처리되는 페이지 */
	request.setCharacterEncoding("utf-8"); 
	String seat = request.getParameter("seat");
	/* 선택된 좌석이 없을 경우 이 전 페이지로 되돌아감 */
	if(seat == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('좌석 선택 후 예약이 가능합니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	int playNo = Integer.parseInt(request.getParameter("playNo")); //연극 번호
	int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo")); //극장번호 
	String playDate = request.getParameter("playDate"); // 연극예매 날짜
	String time = request.getParameter("time"); // 선택한 회차
	/* 선택된 좌석이 있다면 같이 넘어온 값들과 함께 book3-buy.jsp페이지로 값이 넘어감 */
	if(seat != null){
%>
<form id='film-and-time frm' name="frm" class="booking-form" method='post' action='book3-buy.jsp'>
	<input type="hidden" name="playDate" value="<%=playDate%>">
	<input type="hidden" name="playNo" value="<%=playNo%>">
	<input type='hidden' name='seat'value="<%=seat%>">
	<input type='hidden' name='cinemaNo' value="<%=cinemaNo%>">
	<input type='hidden' name='time' value="<%=time%>">
</form>
<%
	}
%>