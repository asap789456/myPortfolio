package admin_res;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import play_seat.PlaySeat;
import user.User;

public class adminDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public adminDAO(){
		try{
			String dbURL =/*"jdbc:mysql://apicket.com:3306/gy2589";*/ "jdbc:mysql://localhost/gy2589";
			String dbID ="gy2589";
			String dbPassword = "asap789456!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	//예매 관리자
   public ArrayList<adminDTO> selectResAdmin(){
	      ArrayList<adminDTO> v = new ArrayList<>();
	      adminDTO res = null;
	       String sql = "SELECT p.playNo, p.playName, COUNT(*),p.playImg, p.playSday, p.playEday FROM RESERVATION r JOIN PLAY p WHERE r.playNo = p.playNo GROUP BY r.playNo";
	       try {
	          pstmt = conn.prepareStatement(sql);
	           rs = pstmt.executeQuery();
	           while(rs.next()){
	              res = new adminDTO();
	              res.setPlayNo(rs.getInt(1));
	              res.setPlayName(rs.getString(2));
	              res.setTotal(rs.getInt(3));
	              res.setPlayImg(rs.getString(4));
	              res.setPlaySday(rs.getString(5));
	              res.setPlayEday(rs.getString(6));
	               v.add(res);
	           }
	           conn.close();
	       } catch(Exception ex) {
	           ex.printStackTrace();
	       } finally {
	           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	       }
	       return v;//������ ����� ��ü member ����
	   }
	
	//예매 관리자
   public ArrayList<adminDTO> selectResUser(int playNo){
      ArrayList<adminDTO> v = new ArrayList<>();
      adminDTO res = null;
       String sql = "SELECT userID,price, playDate, time, seatNo FROM RESERVATION WHERE playNo = ? ORDER BY playDate asc";
       try {
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, playNo);
           rs = pstmt.executeQuery();
           while(rs.next()){
              res = new adminDTO();//����������� ��ü����
              res.setUserID(rs.getString(1));
              res.setSumTotal(rs.getInt(2));
              res.setPlayDate(rs.getString(3));
              res.setTime(rs.getString(4));
              res.setSeatNo(rs.getString(5));
               v.add(res);
           }
           conn.close();
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
       return v;
	  }
	
	//예매 관리자
	public ArrayList<adminDTO> selectSeat(int playNo,String userID){
		ArrayList<adminDTO> v = new ArrayList<>();
		adminDTO res = null;
	    String sql = "SELECT seatNo FROM RESERVATION WHERE playNo = ? AND userID = ?";
	    try {
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setInt(1, playNo);
	    	pstmt.setString(2, userID);
	        rs = pstmt.executeQuery();
	        while(rs.next()){
	        	res = new adminDTO();//데이터저장빈 객체생성
	        	res.setSeatName(rs.getString(1));
	            v.add(res);
	        }
	        conn.close();
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    }
	    return v;//데이터 저장빈 객체 member 리턴
	}
}