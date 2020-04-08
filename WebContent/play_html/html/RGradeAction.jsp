<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="play_seat.PlaySeatDAO"%>
<%@page import="play_seat.PlaySeat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<jsp:useBean id="rbean" class="play_seat.PlaySeat">
	<jsp:setProperty name="rbean" property="*" />
</jsp:useBean>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo")); 
	String seat = request.getParameter("seat");
	
	String[] str = seat.split(", "); 
	for(int i = 0; i < str.length; i++) {
        String TempSeat1 = str[i].substring(0, 2);
        String TempSeat2 = str[i];
		System.out.println(TempSeat1);
        System.out.println(TempSeat2);
		
		PlaySeatDAO dao = new PlaySeatDAO();
		dao.updateRGrade2(TempSeat2,cinemaNo);
		dao.updateRGrade(TempSeat1,TempSeat2,cinemaNo);
		
	}
	response.sendRedirect("adminSeatGradeUpdate.jsp?cinemaNo="+cinemaNo);
%>

