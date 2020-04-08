<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="play.*"%>
<%@page import="PlaySchedule.PlayScheduleDAO"%>

<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="playschedule" class="PlaySchedule.PlaySchedule">
	<jsp:setProperty name="playschedule" property="*" />
</jsp:useBean>
<%	
	/* 관리자가 연극 삭제를 할 때 - 연극 삭제를 처리하는 페이지 */
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	PlayScheduleDAO manager = new PlayScheduleDAO();
	boolean check = manager.deleteScheduleAdmin(no);
	if(check)
		session.invalidate();
	
	if(check == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 삭제에 성공했습니다.')");
		script.println("location.href = 'adminPlay.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 삭제에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>