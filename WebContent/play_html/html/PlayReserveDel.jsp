<%@page import="play.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
<%
	String userID = request.getParameter("userID");
	int playNo = Integer.parseInt(request.getParameter("no"));
	String seat = request.getParameter("seat");
	String date = request.getParameter("date");
	int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo"));
	PlayDAO pdao = new PlayDAO();
	pdao.playRemoveReserve(userID,playNo,seat,date);
	
	PlayDAO pdao2 = new PlayDAO();
	pdao2.ReservationZeroUpdate(seat,cinemaNo,playNo);
	response.sendRedirect("mypage.jsp");
%>
</body>
</html>