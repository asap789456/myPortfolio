<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Vector" %>
<%@page import="play.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- ������ ���̽��� �����Ͽ� �ֽż� ���� 3�븸 �ѷ��ִ� �����͸� ������ -->

<%
	PlayDAO pdao = new PlayDAO();
	Vector<PlayListBean> v  = pdao.getSelectPlay();
%>

<table width="1000">
	<tr height="240">
	
<% 	for(int i = 0; i < v.size(); i++) {
	PlayListBean bean = v.get(i);
%>
		<td width="330" align="center">
		<img alt="" src="images/play/<%=bean.getImg() %>" width="300" height="220">
		
		<p> ���ظ��� <%=bean.getName() %>
		</td>
<%
	}
%>
		
</table>




</body>
</html>