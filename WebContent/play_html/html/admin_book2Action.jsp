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
	String seat = request.getParameter("seat");
	System.out.println(seat);
	if(seat == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('좌석 선택 후 예약이 가능합니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	request.setCharacterEncoding("UTF-8"); 
	int playNo = Integer.parseInt(request.getParameter("playNo")); //연극 번호
	int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo")); 
	String playDate = request.getParameter("playDate"); // 연극예매 날짜
	String time = request.getParameter("time"); // 선택한 좌석
	if(seat != null){
%>
<form id='film-and-time frm' name="frm" class="booking-form" method='post' action='admin_book3-buy.jsp'>
	<input type="hidden" name="playDate" value="<%=playDate%>">
	<input type="hidden" name="playNo" value="<%=playNo%>">
	<input type='hidden' name='seat'value="<%=seat%>">
	<input type='hidden' name='cinemaNo' value="<%=cinemaNo%>">
	<input type='hidden' name='time' value="<%=time%>">
</form>
<%
	}
%>