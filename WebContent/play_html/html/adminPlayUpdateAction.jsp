<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@page import="play_seat.PlaySeatDAO"%>
<%@page import="play_seat.PlaySeat"%>
<%@page import="play.*"%>
<jsp:useBean id="play" class="play.PlayListBean">
	<jsp:setProperty name="play" property="*" />
</jsp:useBean>

<%
	/* 연극의 정보 수정을 처리하는 jsp */
	request.setCharacterEncoding("utf-8");
	/* S석 가격과 R석 가격을 이 전 페이지에서 값을 받아옴 */
	int Sprice = Integer.parseInt(request.getParameter("Sprice"));
	int Rprice = Integer.parseInt(request.getParameter("Rprice"));
	int no = Integer.parseInt(request.getParameter("no"));
	
	/* 한글이 제대로 입력되지 않아 써준것 */
	String name = request.getParameter("name");
	name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
	play.setName(name);
	String info = request.getParameter("info");
	info = new String(info.getBytes("ISO-8859-1"), "UTF-8");
	play.setInfo(info);
	/* ----------------------- */
	
	/* S석 가격을 업데이트 해줌 */
	PlaySeatDAO pseat = new PlaySeatDAO();
	boolean pdeao = pseat.updateSSeatUpdate(Sprice, no,no);
	
	/* R석 가격을 업데이트 해줌 */
	PlaySeatDAO pseat1 = new PlaySeatDAO();
	boolean pdeao1 = pseat1.updateRSeatUpdate(Rprice, no,no);
	
	PlayDAO manager = new PlayDAO();
	boolean check = manager.updatePlayAdmin(play);  
	
	/* 이 전 페이지에서 빠짐없이 입력됐다면 정보변경에 성공*/
	if(check == true && pdeao == true && pdeao1 == true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 변경에 성공했습니다.')");
		script.println("location.href = 'adminPlay.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보 변경에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
