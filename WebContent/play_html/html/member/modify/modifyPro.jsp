<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="user.User">
	<jsp:setProperty name="user" property="*" />
	
</jsp:useBean>
<%
	UserDAO manager = new UserDAO();
	boolean check = manager.updateMember(user);

	out.println(check);
%>
