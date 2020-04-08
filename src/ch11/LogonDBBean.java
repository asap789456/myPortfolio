package ch11;
import java.sql.*;

public class LogonDBBean {
    //LogonDBBean 전역 객체 생성 <- 한개의 객제만 생성해서 공유
	private static LogonDBBean instance = new LogonDBBean();
	
	//LogonDBBean객체를 리턴하는 메소드
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	private LogonDBBean() {}
	
	//개별 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		String jdbcUrl = "jdbc:mysql://128.134.114.237:3306/db216230018"; //URL
		String dbId = "216230018"; //사용자 계정
		String dbPass = "9m4ncx"; //계정 패스워드
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection(jdbcUrl, dbId, dbPass);	
	}
	
	public boolean confirmId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
    
    try {
    	conn = getConnection();
    	pstmt = conn.prepareStatement("select id from member where id = ?");
    	pstmt.setString(1, id);
    	rs = pstmt.executeQuery();
    	result = rs.next();
    } catch(Exception ex) {
    		ex.printStackTrace();
    }finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
    
    return result == false;
}

	public void insertMember(LogonDataBean member){
		Connection conn = null;
		PreparedStatement pstmt = null;
    
    try {
        conn = getConnection();
        pstmt = conn.prepareStatement("insert into member(id, passwd, name, reg_date, address, tel) values (?,?,?,?,?,?)");
        pstmt.setString(1, member.getId());
        pstmt.setString(2, member.getPasswd());
        pstmt.setString(3, member.getName());
        pstmt.setTimestamp(4, member.getRegDate());
        pstmt.setString(5, member.getAddress());
        pstmt.setString(6, member.getTel()); 
        pstmt.executeUpdate();
    } catch(Exception ex) {
        ex.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
};

	public boolean userCheck(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		boolean result = false;
    
    try {
        conn = getConnection();
        pstmt = conn.prepareStatement("select passwd from member where id = ? and passwd = ?");
        pstmt.setString(1, id);
        pstmt.setString(2, passwd);
        rs = pstmt.executeQuery();
        result = rs.next();
    } catch(Exception ex) {
        ex.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
    return result;
	}

	public boolean updateMember(LogonDataBean member){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from member where id = ? and passwd = ?");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			rs = pstmt.executeQuery();
			boolean exists = rs.next();
			rs.close(); rs = null;
			if(exists) {
				pstmt = conn.prepareStatement("update member set name = ?, address = ?, tel = ? where id = ?");
				pstmt.setString(1, member.getName());
				pstmt.setString(2, member.getAddress());
				pstmt.setString(3, member.getTel());
				pstmt.setString(4, member.getId());
				pstmt.executeUpdate();
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return false;
	}
	public LogonDataBean getMember(String id){
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    LogonDataBean member = null;
	    try {
	        conn = getConnection();
	        pstmt = conn.prepareStatement("select id, passwd, name, reg_date, address, tel from member where id = ?");
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();

	        if(rs.next()) {
	            member = new LogonDataBean();//데이터저장빈 객체생성
	            member.setId(rs.getString("id"));
	            member.setName(rs.getString("name"));
	            member.setRegDate(rs.getTimestamp("reg_date"));
	            member.setAddress(rs.getString("address"));
	            member.setTel(rs.getString("tel"));            
	        }
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    }
	    return member;//데이터 저장빈 객체 member 리턴
	}
	
	public boolean deleteMember(String id, String passwd){
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    try{
	    	conn = getConnection();
	    	pstmt = conn.prepareStatement("delete from member where id= ? and passwd=?");
	    	pstmt.setString(1, id);
	    	pstmt.setString(2, passwd);
	    	int x = pstmt.executeUpdate();
	    	return x == 1;
	    }catch (Exception e) {
			e.printStackTrace();
		} finally{
			if (pstmt!=null) try {pstmt.close();} catch(SQLException e){}
			if (pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
		return false;
	}
	
	
}