package PlaySchedule;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

public class PlayScheduleDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public PlayScheduleDAO(){
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
	//공연일정 테이블에서 극장 값 가져오기
	public Vector<PlaySchedule> getCinema(int playNo){
		Vector<PlaySchedule> v = new Vector<>();
		PlaySchedule bean = null;
		
		String sql = "SELECT * FROM PLAYSCHEDULE d join PLAY c on d.cinemaNo = c.cinemaNo and d.playNo = ? order by playNumber ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,playNo);
			rs = pstmt.executeQuery();
			
	        while(rs.next()) {
	        	bean = new PlaySchedule();
	        	bean.setNo(rs.getInt(1)); //프로그램번호
	        	bean.setDate(rs.getString(2)); //공연일자
	        	bean.setTime(rs.getString(3)); //공연시작시간
	        	bean.setPlayNo(rs.getInt(4)); //연극번호
	        	bean.setCinemaNo(rs.getInt(5)); //극장이름	
	        	v.add(bean);
	        }
	        conn.close();
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	    return v;//데이터 저장빈 객체 cinema 리턴
	}
	
	public PlaySchedule getOneSch(int no) {
		
		PlaySchedule bean = new PlaySchedule();
		String sql = "select * from PLAYSCHEDULE where playNo = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setNo(rs.getInt(1));
				bean.setDate(rs.getString(2));
				bean.setTime(rs.getString(3));
				bean.setPlayNo(rs.getInt(4));
				bean.setCinemaNo(rs.getInt(5));
			}
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	public PlaySchedule getDatech(String date, int playNo) {
		
		PlaySchedule bean = new PlaySchedule();
		String sql = "SELECT * FROM PLAYSCHEDULE WHERE playDate = ? AND playNo=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,date);
			pstmt.setInt(2,playNo);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setNo(rs.getInt(1));
				bean.setDate(rs.getString(2));
				bean.setTime(rs.getString(3));
				bean.setPlayNo(rs.getInt(4));
				bean.setCinemaNo(rs.getInt(5));
			}
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	//지난 회차의 시간은 선택 못하게
	public PlaySchedule getTime(int playNo,String time,String playDate) {
		
		PlaySchedule bean = new PlaySchedule();
		String sql = "SELECT * FROM PLAYSCHEDULE WHERE CURTIME() < ? AND playNo = ? AND playNumber = ? AND  playDate = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,time);
			pstmt.setInt(2,playNo);
			pstmt.setString(3,time);
			pstmt.setString(4,playDate);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setNo(rs.getInt(1));
				bean.setDate(rs.getString(2));
				bean.setTime(rs.getString(3));
				bean.setPlayNo(rs.getInt(4));
				bean.setCinemaNo(rs.getInt(5));
			}
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	
	public ArrayList<PlaySchedule> getPlaySchedule(int playNo,String playDate){
		ArrayList<PlaySchedule> v = new ArrayList<>();
		PlaySchedule bean = null;
		
		String sql = "SELECT * FROM PLAYSCHEDULE WHERE playNo=? AND playDate=? ORDER BY playNumber";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,playNo);
			pstmt.setString(2,playDate);
			rs = pstmt.executeQuery();
			
	        while(rs.next()) {
	        	bean = new PlaySchedule();
	        	bean.setNo(rs.getInt(1)); //프로그램번호
	        	bean.setDate(rs.getString(2)); //공연일자
	        	bean.setTime(rs.getString(3)); //공연시작시간
	        	bean.setPlayNo(rs.getInt(4)); //연극번호
	        	bean.setCinemaNo(rs.getInt(5)); //극장이름	
	        	v.add(bean);
	        }
	        conn.close();
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	    return v;//데이터 저장빈 객체 cinema 리턴
	}
	
	//해당 날짜에 회차가 있는지 확인
	public boolean getOneDate(int playNo,String playDate) {
			
		PlaySchedule bean = new PlaySchedule();
		String sql = "SELECT * FROM PLAYSCHEDULE WHERE playNo = ? AND playDate=? GROUP BY playDate";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,playNo);
			pstmt.setString(2,playDate);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setNo(rs.getInt(1));
				bean.setDate(rs.getString(2));
				bean.setTime(rs.getString(3));
				bean.setPlayNo(rs.getInt(4));
				bean.setCinemaNo(rs.getInt(5));
				return true;
			}
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//10분 전후 회차는 선택 못함
	public boolean selectNot(String playNumber,int playNo){
		PlaySchedule bean = new PlaySchedule();
		String SQL = "SELECT * FROM PLAYSCHEDULE WHERE playNumber = ? AND CURTIME() < ? "
				+ "AND CURTIME() > DATE_SUB(playNumber, INTERVAL 20 MINUTE) AND playNo = ? AND playDate=CURDATE()";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, playNumber);
			pstmt.setString(2, playNumber);
			pstmt.setInt(3, playNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bean.setNo(rs.getInt(1));
				bean.setDate(rs.getString(2));
				bean.setTime(rs.getString(3));
				bean.setPlayNo(rs.getInt(4));
				bean.setCinemaNo(rs.getInt(5));
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
   public int getNext(){
	      String SQL = "SELECT playScheduleNo FROM PLAYSCHEDULE ORDER BY playScheduleNo DESC";
	   try{
	      PreparedStatement pstmt = conn.prepareStatement(SQL);
	      rs = pstmt.executeQuery();
	      if (rs.next()){
	         return rs.getInt(1) + 1;
	      }
	      return 1;
	   } catch(Exception e){
	      e.printStackTrace();
	   }
	   return -1; //데이터베이스 오류
	   }
	   
	   public int insertScheduleAdmin(PlaySchedule playschedule){
	      String SQL = "INSERT INTO PLAYSCHEDULE VALUES(?,?,?,?,?)";
	      try{
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setInt(1, getNext());
	         pstmt.setString(2, playschedule.getDate());
	         pstmt.setString(3, playschedule.getTime());
	         pstmt.setInt(4, playschedule.getPlayNo());
	         pstmt.setInt(5, playschedule.getCinemaNo());
	         pstmt.executeUpdate();
	         return 0;
	      }catch (Exception e) {
	         e.printStackTrace();
	      }
	      return -1;   
	      }
   //관리자1분전까지
   public boolean AdminselectNot(String playNumber,int playNo){
      PlaySchedule bean = new PlaySchedule();
      String SQL = "SELECT * FROM PLAYSCHEDULE WHERE playNumber = ? AND CURTIME() < ? "
            + "AND CURTIME() > DATE_SUB(playNumber, INTERVAL 1 MINUTE) AND playNo = ? AND playDate=CURDATE()";
      try{
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, playNumber);
         pstmt.setString(2, playNumber);
         pstmt.setInt(3, playNo);
         rs = pstmt.executeQuery();
         
         while(rs.next()){
            bean.setNo(rs.getInt(1));
            bean.setDate(rs.getString(2));
            bean.setTime(rs.getString(3));
            bean.setPlayNo(rs.getInt(4));
            bean.setCinemaNo(rs.getInt(5));
            return true;
         }
      }catch (Exception e) {
         e.printStackTrace();
      }
      return false;
   }
   
 //PLAY DELETE 관리자
 	public boolean deleteScheduleAdmin(int no){
 		String SQL = "SELECT * FROM PLAYSCHEDULE";
 		try{
 			pstmt = conn.prepareStatement(SQL);
 			rs = pstmt.executeQuery();
 			if(rs.next()) {
 				pstmt = conn.prepareStatement("DELETE FROM PLAYSCHEDULE WHERE playScheduleNo = ?");
 				pstmt.setInt(1,no);
 				pstmt.executeUpdate();
 				return true;
 			}
 		}catch (Exception e) {
 			e.printStackTrace();
 		}
 		return false;
 	}
}
