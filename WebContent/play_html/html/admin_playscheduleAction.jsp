<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="PlaySchedule.PlayScheduleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="playschedule" class="PlaySchedule.PlaySchedule">
	<jsp:setProperty name="playschedule" property="*" />
</jsp:useBean>
<%
	
	String playDate = request.getParameter("playDate");
	System.out.println(playDate);
	
	PlayScheduleDAO manager = new PlayScheduleDAO();
	int check = manager.insertScheduleAdmin(playschedule); 
	playschedule.setDate(playDate);
	
	if(check == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 입력에 성공했습니다.')");
		script.println("location.href = 'adminPlay.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 변경에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
