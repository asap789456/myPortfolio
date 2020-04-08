package play;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import admin_res.adminDTO;
import play_seat.PlaySeat;
import user.User;

public class PlayDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public PlayDAO(){
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
	
	//번호
	public int getNext(){
		String SQL = "SELECT playNo FROM PLAY ORDER BY playNo DESC";
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
	//날짜
	public String getDate(){
		String SQL = "SELECT NOW()";
	try{
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		if (rs.next()){
			return rs.getString(1);
		}
	} catch(Exception e){
		e.printStackTrace();
	}
	return "";
	}
	// 연극 최신순으로 6개 보여주기
	public Vector<PlayListBean> getSelectPlay(){
		Vector<PlayListBean> v = new Vector<>();
		String sql = "SELECT * FROM PLAY ORDER BY playNo DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			//쿼리 실행후 결과를 result 타입으로 리턴
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()){
				
				PlayListBean bean = new PlayListBean();
				bean.setNo(rs.getInt(1));
				bean.setGrade(rs.getInt(2));
				bean.setName(rs.getString(3));
				bean.setPrice(rs.getInt(4));
				bean.setTime(rs.getString(5));
				bean.setSday(rs.getString(6));
				bean.setEday(rs.getString(7));
				bean.setInfo(rs.getString(8));
				bean.setVideo(rs.getString(9));
				bean.setImg(rs.getString(10));
				//벡터에 빈 클래스를 저장
				v.add(bean);
				count ++;
				if(count > 5)break;
				// 4개만 벡터에 저장
				
			}
			conn.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
		
	}
	
	//3개만 보여주기
	public Vector<PlayListBean> getSelectPlay2(){
		Vector<PlayListBean> v = new Vector<>();
		String sql = "SELECT * FROM PLAY ORDER BY playNo DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			//쿼리 실행후 결과를 result 타입으로 리턴
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()){
				PlayListBean bean = new PlayListBean();
				bean.setNo(rs.getInt(1));
				bean.setGrade(rs.getInt(2));
				bean.setName(rs.getString(3));
				bean.setPrice(rs.getInt(4));
				bean.setTime(rs.getString(5));
				bean.setSday(rs.getString(6));
				bean.setEday(rs.getString(7));
				bean.setInfo(rs.getString(8));
				bean.setVideo(rs.getString(9));
				bean.setImg(rs.getString(10));
				//벡터에 빈 클래스를 저장
				v.add(bean);
				count ++;
				if(count > 3)break;
				// 4개만 벡터에 저장
			}
			conn.close();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	//전체 연극 보여주기
	public Vector<PlayListBean> getAllPlay(){
		Vector<PlayListBean> v = new Vector<>();
		PlayListBean bean = null;
		
		String sql = "SELECT playNo,playGrade,playName,playPrice,playTime,playSday,playEday,playInfo,playVideo,playImg,cinemaNo FROM PLAY ";
		try {
			pstmt = conn.prepareStatement(sql);
			//쿼리 실행후 결과를 result 타입으로 리턴
			rs = pstmt.executeQuery();
			while(rs.next()){
				//데이터를 저장힐 빈 클래스 생성
				bean = new PlayListBean();
				bean.setNo(rs.getInt(1));
				bean.setGrade(rs.getInt(2));
				bean.setName(rs.getString(3));
				bean.setPrice(rs.getInt(4));
				bean.setTime(rs.getString(5));
				bean.setSday(rs.getString(6));
				bean.setEday(rs.getString(7));
				bean.setInfo(rs.getString(8));
				bean.setVideo(rs.getString(9));
				bean.setImg(rs.getString(10));
				bean.setCinemaNo(rs.getInt(11));
				//벡터에 빈 클래스를 저장
				v.add(bean);	
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//극장이 정해진 연극에 대해
	public PlayListBean getPlayCinema(int no) {
		PlayListBean bean = new PlayListBean();
		
		String sql = "select playNo,playGrade,playName,playPrice,playTime,playSday,playEday,playInfo,playVideo,playImg,p.cinemaNo,cinemaName,cinemaPhone,"
				+ "cinemaSiteAddress,cinemaAddress,cinemaSeatQuantity,cinemaImg from PLAY p join CINEMA c WHERE p.cinemaNo = c.cinemaNo and p.playNo = ?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setNo(rs.getInt(1));
				bean.setGrade(rs.getInt(2));
				bean.setName(rs.getString(3));
				bean.setPrice(rs.getInt(4));
				bean.setTime(rs.getString(5));
				bean.setSday(rs.getString(6));
				bean.setEday(rs.getString(7));
				bean.setInfo(rs.getString(8));
				bean.setVideo(rs.getString(9));
				bean.setImg(rs.getString(10));
				bean.setCinemaNo(rs.getInt(11));
				bean.setCinemaName(rs.getString(12));
				bean.setCinemaPhone(rs.getString(13));
				bean.setSiteAddress(rs.getString(14));
				bean.setCinemaAddress(rs.getString(15));
				bean.setCinemaSeat(rs.getInt(16));
				bean.setCinemaImg(rs.getString(17));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
		

	//하나의 연극 정보를 리턴하는 메소드
	public PlayListBean getOnePlay(int no) {
		PlayListBean bean = new PlayListBean();
		
		String sql = "SELECT playNo,playGrade,playName,playPrice,playTime,playSday,playEday,playInfo,playVideo,playImg,cinemaNo,genreNo FROM PLAY WHERE playNo = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setNo(rs.getInt(1));
				bean.setGrade(rs.getInt(2));
				bean.setName(rs.getString(3));
				bean.setPrice(rs.getInt(4));
				bean.setTime(rs.getString(5));
				bean.setSday(rs.getString(6));
				bean.setEday(rs.getString(7));
				bean.setInfo(rs.getString(8));
				bean.setVideo(rs.getString(9));
				bean.setImg(rs.getString(10));
				bean.setCinemaNo(rs.getInt(11));
				bean.setGenre(rs.getInt(12));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	// 하나의 예매 정보를 저장하는 메소드
	public void setReservePlay(PlayReserveBean bean) {
		String sql = "INSERT INTO RESERVATION(cinemaNo,playDate,seatNo,playNo,userID,reservationDate,price,time) VALUE(?,?,?,?,?,?,?,?) ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			//?에 값 대입
			pstmt.setInt(1, bean.getCinemaNo());
			pstmt.setString(2, bean.getPlayDate());
			pstmt.setString(3, bean.getSeat());
			pstmt.setInt(4, bean.getPlayNo());
			pstmt.setString(5, bean.getUserID());
			pstmt.setString(6, getDate());
			pstmt.setInt(7, bean.getPrice());
			pstmt.setString(8, bean.getTime());
			
			pstmt.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//공연_좌석테이블 좌석 예약여부 1로 수정 (예약된거)
	public int ReservationOneUpdate(String seatName,int cinemaNo,int playNo){
		String SQL = "UPDATE SEAT SET available = 1 WHERE seatNo = ? AND cinemaNo = ? AND playNo = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seatName);
			pstmt.setInt(2, cinemaNo);
			pstmt.setInt(3, playNo);
			
			return pstmt.executeUpdate();			
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	//공연_좌석테이블 좌석 예약여부 0으로 수정 (예약 안된거)
	public int ReservationZeroUpdate(String seatName,int cinemaNo,int playNo){
		String SQL = "UPDATE SEAT SET available = 0 WHERE seatNo = ? AND cinemaNo = ? AND playNo = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seatName);
			pstmt.setInt(2, cinemaNo);
			pstmt.setInt(3, playNo);

			return pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	//회원의 예매정보를 리턴하는 메소드
	public Vector<PlayReserveBean> getAllReserve(String userID) {
		Vector<PlayReserveBean> v = new Vector<>();
		PlayReserveBean bean = null;
		try {
			String sql = "SELECT * FROM RESERVATION r JOIN PLAY p WHERE userID = ? AND r.playNo = p.playNo";
			pstmt = conn.prepareStatement(sql);
			//?값 집어넣기
			pstmt.setString(1, userID);
			//결과리턴
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new PlayReserveBean();
				bean.setCinemaNo(rs.getInt(1));
				bean.setPlayDate(rs.getString(2));
				bean.setSeat(rs.getString(3));
				bean.setPlayNo(rs.getInt(4));
				bean.setUserID(rs.getString(5));
				bean.setReservationDate(rs.getString(6));
				bean.setPrice(rs.getInt(7));
				bean.setTime(rs.getString(8));
				
				bean.setPlayName(rs.getString(11));
				bean.setPlayImg(rs.getString(18));
				//빈 클래스를 벡터에 저장
				v.add(bean);
				
			}
			conn.close(); //while문 빠져나와서 conn 을 닫아 줘야함
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//예매내역 삭제
	public void playRemoveReserve(String userID, int playNo, String seat, String date) {
		try {
			String sql = "DELETE FROM RESERVATION WHERE userID = ? AND playNo = ? AND seatNo = ? AND reservationDate = ?"; 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userID);
			pstmt.setInt(2, playNo);
			pstmt.setString(3, seat);
			pstmt.setString(4, date);
			
			pstmt.executeUpdate();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	public ArrayList<PlayListBean> getPlay(String searchType,String search){

		ArrayList<PlayListBean> playList = null;
		String sql = "";
		try{
			if(searchType.equals("연극명")){
				sql = "SELECT playNo, playGrade, playName, playPrice, playTime, DATE_FORMAT(playSday, '%Y-%m-%d'), DATE_FORMAT(playEday, '%Y-%m-%d'), playInfo, playVideo, playImg, cinemaNo, playVideoImg FROM PLAY WHERE playName LIKE ? ORDER BY playName";
			}else if(searchType.equals("관람등급")){
				sql = "SELECT playNo, playGrade, playName, playPrice, playTime, DATE_FORMAT(playSday, '%Y-%m-%d'), DATE_FORMAT(playEday, '%Y-%m-%d'), playInfo, playVideo, playImg, cinemaNo, playVideoImg FROM PLAY WHERE playGrade LIKE ? ORDER BY playGrade";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			playList = new ArrayList<PlayListBean>();
					
			while (rs.next()){
				PlayListBean play = new PlayListBean();
	        	play.setNo(rs.getInt(1));
	        	play.setGrade(rs.getInt(2));
	        	play.setName(rs.getString(3));
	        	play.setPrice(rs.getInt(4));
	        	play.setTime(rs.getString(5));
	        	play.setSday(rs.getString(6));
	        	play.setEday(rs.getString(7));
	        	play.setInfo(rs.getString(8));
	        	play.setVideo(rs.getString(9));
	        	play.setImg(rs.getString(10));
	        	play.setCinemaNo(rs.getInt(11));
	        	play.setVideoImg(rs.getString(12));
	            playList.add(play);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return playList;
	}
	
	// 연극 최신순으로 6개 보여주기
	public ArrayList<PlayListBean> getT(){
		ArrayList<PlayListBean> v = new ArrayList<>();
		String sql = "SELECT SUM(price), p.playName FROM RESERVATION r JOIN PLAY p WHERE r.playNo = p.playNo GROUP BY r.playNo";
		try {
			pstmt = conn.prepareStatement(sql);
			//���� ������ ����� result Ÿ������ ����
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()){
				PlayListBean bean = new PlayListBean();
				bean.setTotal(rs.getInt(1));
				bean.setName(rs.getString(2));
				//���Ϳ� �� Ŭ������ ����
				v.add(bean);
				count ++;
				
				// 4���� ���Ϳ� ����
				
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
		
	}
	/*//관리자 좌석
	public int ReservationOneUpdate(String seatName,int cinemaNo,int playNo){
		String SQL = "UPDATE SEAT SET available = 1 WHERE seatNo = ? AND cinemaNo = ? AND playNo = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, seatName);
			pstmt.setInt(2, cinemaNo);
			pstmt.setInt(3, playNo);
			
			return pstmt.executeUpdate();			
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}*/
	//PLAY UPDATE 관리자
	public boolean updatePlayAdmin(PlayListBean play){
		String SQL = "UPDATE PLAY SET playGrade=?,playName=?, playTime=?, playSday=?, playEday=?, playInfo=?, "
				+ "cinemaNo=?, genreNo=?,playTime=?,playImg=?,playVideo=? WHERE playNo = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, play.getGrade());
			pstmt.setString(2, play.getName());
			pstmt.setString(3, play.getTime());
			pstmt.setString(4, play.getSday());
			pstmt.setString(5, play.getEday());
			pstmt.setString(6, play.getInfo());
			pstmt.setInt(7, play.getCinemaNo());
			pstmt.setInt(8, play.getGenre());
			pstmt.setString(9, play.getTime());
			pstmt.setString(10, play.getImg());
			pstmt.setString(11, play.getVideo());
			pstmt.setInt(12, play.getNo());
			pstmt.executeUpdate();
			return true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	//PLAY INSERT 관리자	
	public int insertPlayAdmin(PlayListBean play){
		String SQL = "INSERT INTO PLAY VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, play.getGrade());
			pstmt.setString(3, play.getName());
			pstmt.setInt(4, play.getPrice());
			pstmt.setString(5, play.getTime());
			pstmt.setString(6, play.getSday());
			pstmt.setString(7, play.getEday());
			pstmt.setString(8, play.getInfo());
			pstmt.setString(9, play.getVideo());
			pstmt.setString(10, play.getImg());
			pstmt.setInt(11, play.getCinemaNo());
			pstmt.setInt(12, play.getGenre());
			pstmt.executeUpdate();
			return 0;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	
		}
	
	//PLAY DELETE 관리자
	public boolean deletePlayAdmin(int playNo){
		String SQL = "SELECT * FROM PLAY";
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt = conn.prepareStatement("DELETE FROM PLAY WHERE playNo = ?");
				pstmt.setInt(1,playNo);
				pstmt.executeUpdate();
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
   public ArrayList<PlayListBean> getPlayT(String searchType,String search, int pageNumber){
	      ArrayList<PlayListBean> playList = null;
	      String sql = "";
      try{
         if(searchType.equals("연극명")){
            sql = "SELECT playNo, playGrade, playName, playPrice, playTime, DATE_FORMAT(playSday, '%Y-%m-%d'), DATE_FORMAT(playEday, '%Y-%m-%d'), playInfo, playVideo, playImg, cinemaNo, playVideoImg FROM PLAY WHERE playName LIKE ? ORDER BY playName DESC LIMIT " + pageNumber * 5 +", " + pageNumber * 5 + 6 ;       
         }else if(searchType.equals("관람등급")){
            sql = "SELECT playNo, playGrade, playName, playPrice, playTime, DATE_FORMAT(playSday, '%Y-%m-%d'), DATE_FORMAT(playEday, '%Y-%m-%d'), playInfo, playVideo, playImg, cinemaNo, playVideoImg FROM PLAY WHERE playGrade LIKE ? ORDER BY playGrade DESC LIMIT " + pageNumber * 5 +", " + pageNumber * 5 + 6;
         }
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, "%" + search + "%");
         rs = pstmt.executeQuery();
         playList = new ArrayList<PlayListBean>();
               
         while (rs.next()){
            PlayListBean play = new PlayListBean();
              play.setNo(rs.getInt(1));
              play.setGrade(rs.getInt(2));
              play.setName(rs.getString(3));
              play.setPrice(rs.getInt(4));
              play.setTime(rs.getString(5));
              play.setSday(rs.getString(6));
              play.setEday(rs.getString(7));
              play.setInfo(rs.getString(8));
              play.setVideo(rs.getString(9));
              play.setImg(rs.getString(10));
              play.setCinemaNo(rs.getInt(11));
              play.setVideoImg(rs.getString(12));
               playList.add(play);
         }
      }catch(Exception e){
         e.printStackTrace();
      }
      return playList;
   }
	

}