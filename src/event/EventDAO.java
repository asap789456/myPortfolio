package event;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import admin_res.adminDTO;
import play.PlayListBean;
import play_seat.PlaySeat;
import user.User;

public class EventDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public EventDAO(){
		try{
			String dbURL ="jdbc:mysql://apicket.com:3306/gy2589"; /*"jdbc:mysql://localhost/gy2589";
*/			String dbID ="gy2589";
			String dbPassword = "asap789456!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	//번호
	public int getNext(){
		String SQL = "SELECT eventNo FROM EVENT ORDER BY eventNo DESC";
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
	
	//전체 연극 보여주기
	public Vector<Event> getAllEvent(){
		Vector<Event> v = new Vector<>();
		Event bean = null;
		
		String sql = "SELECT eventNo,eventName,eventSday,eventEday,eventImg FROM EVENT ";
		try {
			pstmt = conn.prepareStatement(sql);
			//쿼리 실행후 결과를 result 타입으로 리턴
			rs = pstmt.executeQuery();
			while(rs.next()){
				//데이터를 저장힐 빈 클래스 생성
				bean = new Event();
				bean.setEventNo(rs.getInt(1));
				bean.setEventName(rs.getString(2));
				bean.setEventSday(rs.getString(3));
				bean.setEventEday(rs.getString(4));
				bean.setEventImg(rs.getString(5));
				//벡터에 빈 클래스를 저장
				v.add(bean);	
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//하나의 연극 정보를 리턴하는 메소드
	public Event getOneEvent(int eventNo) {
		Event bean = new Event();
		
		String sql = "SELECT eventNo,eventName,eventSday,eventEday,eventImg FROM EVENT WHERE eventNo = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,eventNo);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setEventNo(rs.getInt(1));
				bean.setEventName(rs.getString(2));
				bean.setEventSday(rs.getString(3));
				bean.setEventEday(rs.getString(4));
				bean.setEventImg(rs.getString(5));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	//PLAY UPDATE 관리자
	public boolean updateEventAdmin(Event event){
		String SQL = "UPDATE EVENT SET eventNo=?,eventName=?,eventSday=?,eventEday=?,eventImg=? WHERE eventNo = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, event.getEventName());
			pstmt.setString(3, event.getEventSday());
			pstmt.setString(4, event.getEventEday());
			pstmt.setString(5, event.getEventImg());
			pstmt.executeUpdate();
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	//PLAY INSERT 관리자	
	public int insertEventAdmin(Event event){
		String SQL = "INSERT INTO EVENT VALUES(?,?,?,?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, event.getEventName());
			pstmt.setString(3, event.getEventSday());
			pstmt.setString(4, event.getEventEday());
			pstmt.setString(5, event.getEventImg());
			pstmt.executeUpdate();
			return 0;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	
		}
	
	//PLAY DELETE 관리자
	public boolean deleteEventAdmin(int evnetNo){
		String SQL = "SELECT * FROM EVNET";
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt = conn.prepareStatement("DELETE FROM EVNET WHERE evnetNo = ?");
				pstmt.setInt(1,evnetNo);
				pstmt.executeUpdate();
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public ArrayList<Event> getEvent(String searchType,String search){
		ArrayList<Event> eventList = null;
		String sql = "";
		try{
			if(searchType.equals("이벤트명")){
				sql = "SELECT eventNo,eventName,eventSday,eventEday,eventImg FROM EVENT WHERE eventName LIKE ? ORDER BY eventName";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			eventList = new ArrayList<Event>();
					
			while (rs.next()){
				Event bean = new Event();
				bean.setEventNo(rs.getInt(1));
				bean.setEventName(rs.getString(2));
				bean.setEventSday(rs.getString(3));
				bean.setEventEday(rs.getString(4));
				bean.setEventImg(rs.getString(5));
				eventList.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return eventList;
	}
	

}