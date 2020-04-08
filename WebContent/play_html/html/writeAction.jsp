<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="bbs" class = "bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="*" />
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<script>

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시판</title>
</head>
<body>
	<% 
	//여러개의 user 타입 데이터를 저장할 리스트 생성
	//ArrayList<Bbs> list = (ArrayList<Bbs>)session.getAttribute("list");
	/* 
		String MovieName = request.getParameter("bbsMovie");
		
 */

 		String playName = request.getParameter("playName");
		playName = new String(playName.getBytes("ISO-8859-1"), "UTF-8");
		
		String bbsTitle = request.getParameter("bbsTitle");
		bbsTitle = new String(bbsTitle.getBytes("ISO-8859-1"), "UTF-8");
		
		String bbsContent = request.getParameter("bbsContent");
		bbsContent = new String(bbsContent.getBytes("ISO-8859-1"), "UTF-8");
		
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}

		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null || bbs.getPlayName() == null ||bbs.getPlayGrade() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 부분이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			BbsDAO bbsDAO = new BbsDAO();
			
			int result = bbsDAO.write(userID, bbsTitle, bbsContent, playName, bbs.getPlayGrade());
				
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");
			}	

		} //else 끝나는 부분
		
		
	%>
</body>
</html>
