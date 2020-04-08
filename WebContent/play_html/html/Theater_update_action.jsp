<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<head>

</head>
<body>
	
<%

request.setCharacterEncoding("utf-8");
	
	String TNo= request.getParameter("TNo");
	String TImg= request.getParameter("TImg");
	String TName= request.getParameter("TName");
	String TAdress= request.getParameter("TAdress");
	String TTell= request.getParameter("TTell");
	String TSite= request.getParameter("TSite");
	String TSeat= request.getParameter("TSeat");

	
try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://apicket.com:3306/gy2589?useSSL=false&serverTimezone=UTC","gy2589","asap789456!");
	    if(conn != null){
	 	    System.out.println("DB 연결  : success" + "<br>");
	    }else{
	 	    System.out.println("DB 연결  : fail" + "<br>");
	    };
	    
	  
		PreparedStatement pstmt= conn.prepareStatement( "update CINEMA set cinemaImg=?, cinemaName=?, cinemaAddress=?, cinemaPhone=?, cinemaSiteAddress=?, cinemaSeatQuantity=?"
				+ " where cinemaName = ? ");
		int n = 0;
//update 극장 set 극장이미지=?, 극장이름=?, 극장주소=?, 극장전화번호=?, 극장사이트=?, 좌석수=?  where 극장번호 =? 
		pstmt.setString(1, TImg);
		pstmt.setString(2, TName);
		pstmt.setString(3, TAdress);
		pstmt.setString(4, TTell);
		pstmt.setString(5, TSite);
		pstmt.setString(6, TSeat);
		pstmt.setString(7, TName);
		pstmt.executeUpdate();
		
		
		//conn.commit();
		pstmt.close();
		conn.close();
		//response.sendRedirect("member_select.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}	

%>

<script type = "text/javascript">
alert('극장정보 수정이 완료되었습니다.'); 
location.href="Theater_select.jsp";

</script>

</body>
</html>