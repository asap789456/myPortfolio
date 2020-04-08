<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cinema.*"%>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="cinema" class="cinema.Cinema">
	<jsp:setProperty name="cinema" property="*" />
</jsp:useBean>
<%
	/* 관리자 페이지 - 극장을 삭제하면 처리되는 페이지 */
	request.setCharacterEncoding("utf-8");

	/* 삭제할 극장의 번호를 입력 받아 극장 삭제 */
	int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo"));
	CinemaDAO manager = new CinemaDAO();
	boolean check = manager.deleteCinemaAdmin(cinemaNo);
	if(check)
		session.invalidate();
	
	if(check == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 삭제에 성공했습니다.')");
		script.println("location.href = 'adminTheaterSelect.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 삭제에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
