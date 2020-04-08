<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="user.UserDAO"
    %>
<%
	request.setCharacterEncoding("utf-8");
	String userID = (String)session.getAttribute("userID");
	String userPassword = request.getParameter("userPassword");
	
	UserDAO manager = new UserDAO();
	boolean check = manager.deleteMember(userID, userPassword);
	if(check)
		session.invalidate();
	
	out.println(check);
%>