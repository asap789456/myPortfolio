<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.*"%>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User">
	<jsp:setProperty name="user" property="*" />
</jsp:useBean>
<%
	UserDAO manager = new UserDAO();
	boolean check = manager.updateUserAdmin(user);  //(user)는 위에 jsp:userBean에 설정된 속성 전부 

	if(check == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 변경에 성공했습니다.')");
		script.println("location.href = 'adminMemberSelect.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 변경에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
