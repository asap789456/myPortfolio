<%@page import="play.PlayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@page import="cinema.*"%>
<jsp:useBean id="cinema" class="cinema.Cinema">
	<jsp:setProperty name="cinema" property="*" />
</jsp:useBean>
<%
	/* 관리자 페이지 - 연극 수정을 하면 처리되는 페이지 */
	request.setCharacterEncoding("utf-8");
	int cinemaNo = Integer.parseInt(request.getParameter("cinemaNo"));
	
	/* 이 부분은 값이 한글이 깨지는것을 변환 */
	String cinemaName = request.getParameter("cinemaName");
	cinemaName = new String(cinemaName.getBytes("ISO-8859-1"), "UTF-8");
	cinema.setCinemaName(cinemaName); 
		
	String cinemaAddress = request.getParameter("cinemaAddress");
	cinemaAddress = new String(cinemaAddress.getBytes("ISO-8859-1"), "UTF-8");
	cinema.setCinemaAddress(cinemaAddress); 
	
	String siteAddress = request.getParameter("siteAddress");
	siteAddress = new String(siteAddress.getBytes("ISO-8859-1"), "UTF-8");
	cinema.setSiteAddress(siteAddress); 
	/* ----------------------- */
	
	CinemaDAO manager = new CinemaDAO();
	boolean check = manager.updateCinemaAdmin(cinema);  
	
	if(check == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 변경에 성공했습니다.')");
		script.println("location.href = 'adminTheaterSelect.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 변경에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
