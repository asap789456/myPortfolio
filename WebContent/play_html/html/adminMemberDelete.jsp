<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.*"%>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User">
	<jsp:setProperty name="user" property="*" />
</jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String userID = request.getParameter("userID");
	UserDAO manager = new UserDAO();
	boolean check = manager.deleteUserAdmin(userID);
	
	if(check)
		session.invalidate();
	
	if(check == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 삭제에 성공했습니다.')");
		script.println("location.href = 'member_select.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 삭제에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>