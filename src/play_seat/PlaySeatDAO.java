package play_seat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import play.PlayListBean;

public class PlaySeatDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	public PlaySeatDAO(){
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

	/*---------------------------���� ����--------------------------------*/
	
	
	public ArrayList<PlaySeat> getAllSeat(int cinemaNo){
		ArrayList<PlaySeat> v = new ArrayList<>();
		String sql = "SELECT s.seatNo,s.available,c.cinemaNo,s.seatGrade FROM SEAT s JOIN CINEMA c WHERE s.cinemaNo= c.cinemaNo AND c.cinemaNo = ? ORDER BY s.seatNo ASC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cinemaNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				//�����͸� ������ �� Ŭ���� ����
				PlaySeat bean = new PlaySeat();
				bean.setSeatName(rs.getString(1)); //�¼��̸�
				bean.setSeatAvailable(rs.getInt(2));
				bean.setCinemaNo(rs.getInt(3));    //�����ȣ
				bean.setSeatGrade(rs.getString(4));
				//���Ϳ� �� Ŭ������ ����
				v.add(bean);	
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	public ArrayList<PlaySeat> getSeatPrice(int cinemaNo){
		ArrayList<PlaySeat> v = new ArrayList<>();
		String sql = "SELECT price FROM SEAT WHERE cinemaNo=? GROUP BY price";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,cinemaNo);
			rs = pstmt.executeQuery();
			while(rs.next()){
				PlaySeat bean = new PlaySeat();
				bean.setSeatPrice(rs.getInt(1));
				
				v.add(bean);	
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	//S�� ���� ����
	public boolean updateSSeatUpdate(int Sprice,int playNo,int cinemaNo){
		String SQL = "UPDATE SEAT SET price = ? WHERE playNo = ? AND cinemaNo = ? AND (seatNo LIKE 'A%' OR seatNo LIKE 'B%') ";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Sprice);
			pstmt.setInt(2, playNo);
			pstmt.setInt(3, cinemaNo);
			pstmt.executeUpdate();
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	//R�� ���� ����
	public boolean updateRSeatUpdate(int Rprice,int playNo,int cinemaNo){
		String SQL = "UPDATE SEAT SET price = ? WHERE playNo = ? AND cinemaNo = ? AND (seatNo LIKE 'C%' OR seatNo LIKE 'D%' OR seatNo LIKE 'E%' OR seatNo LIKE 'F%')";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Rprice);
			pstmt.setInt(2, playNo);
			pstmt.setInt(3, cinemaNo);
			pstmt.executeUpdate();
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//�¼� �ϳ� �� ��� ���̰�
	public PlaySeat getOneSeatGrade(String seatName,int playNo){
		PlaySeat seat = null;
		String sql = "SELECT seatNo,available,cinemaNo,seatGrade FROM SEAT WHERE seatNo=? AND playNo=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,seatName);
			pstmt.setInt(2,playNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				//�����͸� ������ �� Ŭ���� ����
				seat = new PlaySeat();
				seat.setSeatName(rs.getString(1)); //�¼��̸�
				seat.setSeatAvailable(rs.getInt(2));
				seat.setCinemaNo(rs.getInt(3));    //�����ȣ
				seat.setSeatGrade(rs.getString(4));
	
			}
		} catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    }
		return seat;
	}
	
	//R������ ��� ����
	public boolean updateRGrade(String seatName1,String seatName2,int cinemaNo){
		String SQL = "UPDATE SEAT SET seatNo = ? '--R' WHERE seatNo = ? AND cinemaNo = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seatName1);
			pstmt.setString(2, seatName2);
			pstmt.setInt(3, cinemaNo);
			pstmt.executeUpdate();
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	//R������ ��� ����
	public boolean updateRGrade2(String seatName1,int cinemaNo){
		String SQL = "UPDATE SEAT SET seatGrade='R' WHERE seatNo = ? AND cinemaNo = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seatName1);
			pstmt.setInt(2, cinemaNo);
			pstmt.executeUpdate();
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	//S������ ��� ����
	public boolean updateSGrade(String seatName1,String seatName2,int cinemaNo){
		String SQL = "UPDATE SEAT SET seatNo = ? '--S' WHERE seatNo = ? AND cinemaNo = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seatName1);
			pstmt.setString(2, seatName2);
			pstmt.setInt(3, cinemaNo);
			pstmt.executeUpdate();
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	//R������ ��� ����
	public boolean updateSGrade2(String seatName1,int cinemaNo){
		String SQL = "UPDATE SEAT SET seatGrade='S' WHERE seatNo = ? AND cinemaNo = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seatName1);
			pstmt.setInt(2, cinemaNo);
			pstmt.executeUpdate();
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
