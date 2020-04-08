<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="play.*"%>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="play" class="play.PlayListBean">
	<jsp:setProperty name="play" property="*" />
</jsp:useBean>
<%
	/* 관리자가 입력한 연극의 정보를 db에 넣기위한 처리 페이지 */
	/* 연극 db를 불러옴 */
	PlayDAO manager = new PlayDAO();
	int check = manager.insertPlayAdmin(play);  //(user)는 위에 jsp:userBean에 설정된 속성 전부 
	/* 연극의 내용이 제대로 입력되었다면 정보입력에 성공했다고 창을 띄움 */
	if(check == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 입력에 성공했습니다.')");
		script.println("location.href = 'adminPlay.jsp'");
		script.println("</script>");
		/* 연극의 내용이 제대로 입력되지 않았다면 정보입력에 실패했다고 창을 띄움 */
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 변경에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
