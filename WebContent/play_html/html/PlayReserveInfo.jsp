<%@page import="play.*" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));

	//�����ͺ��̽��� ����
	PlayDAO pdao = new PlayDAO();
	//���� �ϳ��� ���� ������ ����
	PlayListBean bean = pdao.getOnePlay(no);
%>
<form action="book1.jsp?center=book1_time.jsp">
	<table>
		<tr>
		<td>
		<font> <%=bean.getName() %></font>
		<img alt="" src="images/play/<%=bean.getImg() %>">
		</td>
		
		<tr>
			<%=bean.getTime() %>
		<input type="submit" value="d">
		
	</table>
</form>
</body>
</html>