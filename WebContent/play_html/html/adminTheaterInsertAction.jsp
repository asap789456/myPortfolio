<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!-- 관리자 페이지 - 이전페이지에서 입력한 극장의 정보를 입력받아 db에 저장하기 위해 처리되는 페이지 -->

<script >
   function display_alert() {
      alert("극장정보가 등록 되었습니다!.");
   }
</script>
<!-- 극장이미지, 극장사이트, 극장이름, 극장전화번호, 극장주소, 좌석수  -->
<%
	request.setCharacterEncoding("utf-8");
	
	try {
			
			String szTImg  = null;
			String szTSite = null;
			String szTName = null;
			String szTTell = null;
			String szTAdress = null;
			String szTSeat   = null;
			
		    
			szTImg  = request.getParameter("TImg");
			szTSite = request.getParameter("TSite");
			szTName = request.getParameter("TName");
			szTTell = request.getParameter("TTell");
			szTAdress = request.getParameter("TAdress");
			szTSeat   = request.getParameter("TSeat");

		    /*--------jdbc를 통해 database  연결 하기-------*/
				Class.forName("com.mysql.jdbc.Driver");
		    Connection conn = DriverManager.getConnection 
	   		("jdbc:mysql://localhost/gy2589?useSSL=false&serverTimezone=UTC","gy2589","asap789456!");
		    if(conn != null)
		    {
		 	    System.out.println("DB 연결  : success" + "<br>");
		    }else{
		 	    System.out.println("DB 연결  : fail" + "<br>");
		    };
				java.sql.PreparedStatement stat = conn.prepareStatement("insert into CINEMA(cinemaImg, cinemaSiteAddress, cinemaName, cinemaPhone, cinemaAddress, cinemaSeatQuantity) "+
						                                 " values(?,?,?,?,?,?); ");
				
				stat.setString(1,szTImg);
				stat.setString(2,szTSite);
				stat.setString(3,szTName);
				stat.setString(4,szTTell);
				stat.setString(5,szTAdress);
				stat.setString(6,szTSeat);
				
				stat.executeUpdate();
				//conn.commit();
				stat.close();
				conn.close();
				response.sendRedirect("adminTheaterSelect.jsp");
		}
	catch (Exception e) {
		out.println(e);	} %>