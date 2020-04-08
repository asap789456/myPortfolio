<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="play.*"%>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="play" class="play.PlayListBean">
	<jsp:setProperty name="play" property="*" />
</jsp:useBean>
<%	
	request.setCharacterEncoding("utf-8");
	int playNo = Integer.parseInt(request.getParameter("playNo"));
	PlayDAO manager = new PlayDAO();
	boolean check = manager.deletePlayAdmin(playNo);
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