package genre;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

public class GenreDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public GenreDAO(){
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
	//��ü �帣 �����ֱ�
	public Vector<Genre> getAllGenre(){
		Vector<Genre> v = new Vector<>();
		
		Genre bean = null;
		String sql = "select genreNo,genreName from GENRE order by genreNo";
		try {
			pstmt = conn.prepareStatement(sql);
			//���� ������ ����� result Ÿ������ ����
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new Genre();
				//�����͸� ������ �� Ŭ���� ����				
				bean.setGenreNo(rs.getInt(1));
				bean.setGenreName(rs.getString(2));
				//���Ϳ� �� Ŭ������ ����
				v.add(bean);	
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
		
	}
	//���� A�� �帣�� �����ϴ� �޼ҵ�
	public Genre getOneGenre(int no) {
		Genre bean = new Genre();
				
		String sql = "select g.genreNo, g.genreName FROM PLAY p JOIN GENRE g WHERE p.genreNo = g.genreNo AND p.playNo = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setGenreNo(rs.getInt(1));
				bean.setGenreName(rs.getString(2));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}	
	
	
}