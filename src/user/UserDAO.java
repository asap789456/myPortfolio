package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

public class UserDAO {
    //LogonDBBean 전역 객체 생성 <- 한개의 객제만 생성해서 공유
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public UserDAO(){
		try{
			String dbURL ="jdbc:mysql://apicket.com:3306/gy2589"; /*"jdbc:mysql://localhost/gy2589";*/
			String dbID ="gy2589";
			String dbPassword = "asap789456!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (ClassNotFoundException cnfe){
			System.out.println("DB드라이버 로딩실패 :" +cnfe.toString());
		}catch (SQLException sqle) {
			System.out.println("DB 접속실패 : "+sqle.toString());
		}catch (Exception e) {
			System.out.println("Unkonwn error");
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
	
	public int login(String userID, String userPassword){
		String SQL = "SELECT userPassword FROM USER WHERE userID = ? AND userAvailable = 1";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()){
				if(rs.getString(1).equals(userPassword))
					return 1;
				else
					return 0;
				}
			return -1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(User user){
		String SQL = "INSERT INTO USER VALUES(?,?,?,?,?,?,?,?,?,?,?)"; //변경 
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserPhone());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setInt(6, user.getUserSex());
			pstmt.setString(7, user.getUserBirth());
			pstmt.setString(8, user.getUserAddress());
			pstmt.setInt(9, 1);
			pstmt.setString(10, getDate());
			pstmt.setInt(11, 1);

			return pstmt.executeUpdate(); 
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public int confirmId(String userID){
		int x = 0;
		try{
			pstmt = conn.prepareStatement("SELECT userID FROM USER WHERE userID = ? AND userAvailable = 1");
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next())
				x= -1;
			else
				x=1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	public boolean updateMember(User user){
		String SQL = "SELECT userPassword FROM USER WHERE userID = ? and userPassword = ? AND userAvailable = 1";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt = conn.prepareStatement("UPDATE USER SET userName = ?, userEmail = ?, userPhone = ? WHERE userID = ? AND userAvailable = 1");
				pstmt.setString(1, user.getUserName());
				pstmt.setString(2, user.getUserEmail());
				pstmt.setString(3, user.getUserPhone());
				pstmt.setString(4, user.getUserID());
				pstmt.executeUpdate();
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return false;
	}
	
	public User getMember(String userID){
	    User user = null;
	    try {
	        pstmt = conn.prepareStatement("SELECT userID,userPassword, userName, userPhone, userEmail,userBirth,userAddress,"
	        		+ "userSex,userJoinDate,userAvailable FROM USER WHERE userID = ?");
	        pstmt.setString(1, userID);
	        rs = pstmt.executeQuery();
	        if(rs.next()) {
	        	user = new User();//데이터저장빈 객체생성
	            user.setUserID(rs.getString(1));
	            user.setUserPassword(rs.getString(2));
	            user.setUserName(rs.getString(3));
	            user.setUserPhone(rs.getString(4));
	            user.setUserEmail(rs.getString(5));
	            user.setUserBirth(rs.getString(6));
	            user.setUserAddress(rs.getString(7));
	            user.setUserSex(rs.getInt(8));
	            user.setUserJoinDate(rs.getString(9));
	            user.setUserAvailable(rs.getInt(10));	            
	        }
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    }
	    return user;//데이터 저장빈 객체 member 리턴
	}
	
	public boolean deleteMember(String userID, String userPassword){
	    try{
	    	pstmt = conn.prepareStatement("update USER set userAvailable = 0 where userID = ? and userPassword = ?");
	    	pstmt.setString(1, userID);
	    	pstmt.setString(2, userPassword);
	    	int x = pstmt.executeUpdate();
	    	return x == 1;
	    }catch (Exception e) {
			e.printStackTrace();
		} finally{
			if (pstmt!=null) try {pstmt.close();} catch(SQLException e){}
			if (conn!=null) try {conn.close();} catch(SQLException e){}
		}
		return false;
	}
	
	public User selectGrade(String userID){
		String SQL = "select * from USER u join USERCLASS g where userID = ? and u.classNo = g.classNo";
		User user = null;
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user = new User();//데이터저장빈 객체생성
	            user.setUserClass(rs.getString(13));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return user;
	}

	/*--------------------------------------------------------여기서부터 관리자 DAO--------------------------------------------------------*/
	/*--------------------------------------------------------관리자 DAO--------------------------------------------------------*/
	/*--------------------------------------------------------관리자 DAO--------------------------------------------------------*/
	/*--------------------------------------------------------관리자 DAO--------------------------------------------------------*/
	
	//USER SELECT 관리자
	public Vector<User> selectUserAdmin(){
		Vector<User> v = new Vector<>();
	    User user = null;
	    String sql = "select userID, userName, userPassword, userPhone, userEmail, DATE_FORMAT(userBirth, '%Y-%m-%d'), userSex, userAddress, DATE_FORMAT(userJoinDate, '%Y-%m-%d'), userAvailable,classNo "+
                " from USER order by userID";
	    try {
	    	pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        while(rs.next()){ //DB안에서 위 sql을 실행시키면 나오는 데이터 순서
	        	user = new User();//데이터저장빈 객체생성
	            user.setUserID(rs.getString(1));
	            user.setUserName(rs.getString(2));
	            user.setUserPassword(rs.getString(3));
	            user.setUserPhone(rs.getString(4));
	            user.setUserEmail(rs.getString(5));
	            user.setUserBirth(rs.getString(6));
	            user.setUserSex(rs.getInt(7));
	            user.setUserAddress(rs.getString(8));
	            user.setUserJoinDate(rs.getString(9));
	            user.setUserAvailable(rs.getInt(10));
	            user.setUserClassNo(rs.getInt(11));
	            v.add(user);
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
	
	
	//USER UPDATE 관리자
	public boolean updateUserAdmin(User user){
		String SQL = "SELECT * FROM USER";
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt = conn.prepareStatement("UPDATE USER SET userName=?, userPhone=?, userEmail=?, userBirth=?, userAddress=?, userSex=?, userJoinDate=? WHERE userID = ? AND userAvailable=?");
				pstmt.setString(1, user.getUserName());
				pstmt.setString(2, user.getUserPhone());
				pstmt.setString(3, user.getUserEmail());
				pstmt.setString(4, user.getUserBirth());
				pstmt.setString(5, user.getUserAddress());
				pstmt.setInt(6, user.getUserSex());
				pstmt.setInt(7, user.getUserAvailable());
				pstmt.setString(8, user.getUserID());
				pstmt.setInt(9, user.getUserAvailable());
				pstmt.executeUpdate();
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return false;
	}
	
	//USER DELETE 관리자
	public boolean deleteUserAdmin(String userID){
	    try{
	    	pstmt = conn.prepareStatement("update USER set userAvailable = 0 where userID = ? ");
	    	pstmt.setString(1, userID);
	    	int x = pstmt.executeUpdate();
	    	return x == 1;
	    }catch (Exception e) {
			e.printStackTrace();
		} finally{
			if (pstmt!=null) try {pstmt.close();} catch(SQLException e){}
			if (conn!=null) try {conn.close();} catch(SQLException e){}
		}
		return false;
	}

	//검색기능
	public ArrayList<User> getUser(String searchType,String search,int pageNumber){
		ArrayList<User> userList = null;
		String sql = "";
		try{
			if(searchType.equals("이름")){
				sql = "SELECT userID, userName, userPassword, userPhone, userEmail, DATE_FORMAT(userBirth, '%Y-%m-%d'), userSex, userAddress, "
						+ "DATE_FORMAT(userJoinDate, '%Y-%m-%d'), userAvailable,classNo FROM USER WHERE userName LIKE ? ORDER BY userName DESC LIMIT " + pageNumber * 5 +", " + pageNumber * 5 + 6;
			}else if(searchType.equals("아이디")){
				sql = "SELECT userID, userName, userPassword, userPhone, userEmail, DATE_FORMAT(userBirth, '%Y-%m-%d'), userSex, userAddress, "
						+ "DATE_FORMAT(userJoinDate, '%Y-%m-%d'), userAvailable,classNo FROM USER WHERE userID LIKE ? ORDER BY userID DESC LIMIT " + pageNumber * 5 +", " + pageNumber * 5 + 6;
			}
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			userList = new ArrayList<User>();
			
			while (rs.next()){
				User user = new User();
	            user.setUserID(rs.getString(1));
	            user.setUserName(rs.getString(2));
	            user.setUserPassword(rs.getString(3));
	            user.setUserPhone(rs.getString(4));
	            user.setUserEmail(rs.getString(5));
	            user.setUserBirth(rs.getString(6));
	            user.setUserSex(rs.getInt(7));
	            user.setUserAddress(rs.getString(8));
	            user.setUserJoinDate(rs.getString(9));
	            user.setUserAvailable(rs.getInt(10));
	            user.setUserClassNo(rs.getInt(11));
	            
				userList.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return userList;
	}
}


