package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO(){
		try{
			String dbURL ="jdbc:mysql://apicket.com:3306/gy2589"; /*"jdbc:mysql://localhost/gy2589";*/
			String dbID ="gy2589";
			String dbPassword = "asap789456!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e){
			e.printStackTrace();
		}
	}
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
	
	
	
	public int getNext(){
		String SQL = "SELECT boardNo FROM BOARD ORDER BY boardNo DESC";
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
	
	public int write(String userID,String bbsTitle,String bbsContent,String playName,String playGrade){
		String SQL = "INSERT INTO BOARD VALUES(?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, bbsTitle);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			pstmt.setString(7, playName);
			pstmt.setString(8, playGrade);
			
			return pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1;
		}
	
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "SELECT * FROM BOARD WHERE boardNo < ? AND boardStatus = 1 ORDER BY boardNo DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()){
				Bbs bbs = new Bbs();
				bbs.setBbsNo(rs.getInt(1));
				bbs.setUserID(rs.getString(2));
				bbs.setBbsTitle(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setPlayName(rs.getString(7));
				bbs.setPlayGrade(rs.getString(8));
				
				list.add(bbs);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber){
		String SQL = "SELECT * FROM BOARD WHERE boardNo < ? AND boardStatus = 1";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			if (rs.next()){
				System.out.println(pageNumber);
				return true;
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	public Bbs getBbs(int bbsID){
		String SQL = "SELECT * FROM BOARD WHERE boardNo =?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,bbsID);
			rs = pstmt.executeQuery();
				if (rs.next()){
					Bbs bbs = new Bbs();
					bbs.setBbsNo(rs.getInt(1));
					bbs.setUserID(rs.getString(2));
					bbs.setBbsTitle(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					bbs.setPlayName(rs.getString(7));
					bbs.setPlayGrade(rs.getString(8));
					return bbs;
				}
		} catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public int update(int bbsID, String bbsTitle, String bbsContent){
		String SQL = "UPDATE BOARD SET boardTitle = ?, boardContent = ? WHERE boardNo = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			
			return pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int bbsID){
		String SQL = "UPDATE BOARD SET boardStatus = 0 WHERE boardNo = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	//기능
		public ArrayList<Bbs> getBoard(String searchType,String search,int pageNumber){
			ArrayList<Bbs> boardList = null;	
			String sql = "";
			try{
				if(searchType.equals("제목")){
				sql = "SELECT boardNo, userId, boardTitle, writeDate, boardContent, playName, playGrade FROM BOARD "
						+ "WHERE boardTitle LIKE ? AND boardStatus = 1 ORDER BY boardNo DESC LIMIT " + pageNumber * 5 +", " + pageNumber * 5 + 6; 
					
				}else if(searchType.equals("내용")){
					sql = "SELECT boardNo, userId, boardTitle, writeDate, boardContent, playName, playGrade FROM BOARD "
							+ "WHERE boardContent LIKE ? AND boardStatus = 1 ORDER BY boardNo DESC LIMIT " + pageNumber * 5 +", " + pageNumber * 5 + 6; 	
				}
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + search + "%");
				rs = pstmt.executeQuery();
				
				boardList = new ArrayList<Bbs>();
				
				while (rs.next()){
					Bbs bbs = new Bbs();
					bbs.setBbsNo(rs.getInt(1));
					bbs.setUserID(rs.getString(2));
					bbs.setBbsTitle(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setPlayName(rs.getString(6));
					bbs.setPlayGrade(rs.getString(7));
		            
					boardList.add(bbs);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return boardList;
		}
		
	public ArrayList<Bbs> getBoardAdmin(String searchType,String search,int pageNumber){
		ArrayList<Bbs> boardList = null;	
		String sql = "";
		try{
			if(searchType.equals("제목")){
			sql = "SELECT boardNo, userId, boardTitle, writeDate, boardContent, playName, playGrade,boardStatus FROM BOARD WHERE boardTitle LIKE ? ORDER BY boardNo DESC LIMIT " + pageNumber * 5 +", " + pageNumber * 5 + 6; 
				
			}else if(searchType.equals("내용")){
				sql = "SELECT boardNo, userId, boardTitle, writeDate, boardContent, playName, playGrade,boardStatus FROM BOARD WHERE boardContent LIKE ? ORDER BY boardNo DESC LIMIT " + pageNumber * 5 +", " + pageNumber * 5 + 6; 	
			}
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			
			boardList = new ArrayList<Bbs>();
			
			while (rs.next()){
				Bbs bbs = new Bbs();
				bbs.setBbsNo(rs.getInt(1));
				bbs.setUserID(rs.getString(2));
				bbs.setBbsTitle(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setPlayName(rs.getString(6));
				bbs.setPlayGrade(rs.getString(7));
				bbs.setBbsAvailable(rs.getInt(8));
	            
				boardList.add(bbs);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return boardList;
	}
	
	//별점
	public Bbs getGrade(String playName){
		String SQL = "SELECT p.playImg, p.playName,p.playNo, AVG(b.playGrade) FROM BOARD b JOIN PLAY p WHERE p.playNo=? GROUP BY p.playName;";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,playName);
			rs = pstmt.executeQuery();
				if (rs.next()){
					Bbs bbs = new Bbs();
					bbs.setPlayName(rs.getString(1));
					bbs.setAvgGrade(rs.getString(2));
					return bbs;
				}
		} catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
