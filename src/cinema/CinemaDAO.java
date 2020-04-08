package cinema;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

public class CinemaDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public CinemaDAO(){
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
	//��ü ���� �����ֱ�
	public Vector<Cinema> getAllCinema(){
		Vector<Cinema> v = new Vector<>();
		
		Cinema bean = null;
		String sql = "select cinemaNo, cinemaImg, cinemaName, cinemaAddress, cinemaPhone, cinemaSiteAddress , cinemaSeatQuantity from CINEMA order by cinemaNo";
		try {
			pstmt = conn.prepareStatement(sql);
			//���� ������ ����� result Ÿ������ ����
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new Cinema();
				//�����͸� ������ �� Ŭ���� ����				
				bean.setCinemaNo(rs.getInt(1));
				bean.setCinemaImg(rs.getString(2));
				bean.setCinemaName(rs.getString(3));
				bean.setCinemaAddress(rs.getString(4));
				bean.setCinemaPhone(rs.getString(5));
				bean.setSiteAddress(rs.getString(6));
				bean.setCinemaSeat(rs.getInt(7));
				//���Ϳ� �� Ŭ������ ����
				v.add(bean);	
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
		
	}
	//�ϳ��� ���� ������ �����ϴ� �޼ҵ�
	public Cinema getOneCinema(int no) {
		Cinema bean = new Cinema();
				
		String sql = "select cinemaNo, cinemaImg, cinemaName, cinemaAddress, cinemaPhone, cinemaSiteAddress , cinemaSeatQuantity from CINEMA where cinemaNo = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setCinemaNo(rs.getInt(1));
				bean.setCinemaImg(rs.getString(2));
				bean.setCinemaName(rs.getString(3));
				bean.setCinemaAddress(rs.getString(4));
				bean.setCinemaPhone(rs.getString(5));
				bean.setSiteAddress(rs.getString(6));
				bean.setCinemaSeat(rs.getInt(7));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}	
	//?������ ������ ���� ã��
	public Cinema getReservationCinema(String userID) {
		Cinema bean = new Cinema();
				
		String sql = "select c.cinemaNo, cinemaImg, cinemaName, cinemaAddress, cinemaPhone, cinemaSiteAddress , cinemaSeatQuantity from CINEMA c join RESERVATION r where c.cinemaNo = r.cinemaNo and userID = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setCinemaNo(rs.getInt(1));
				bean.setCinemaImg(rs.getString(2));
				bean.setCinemaName(rs.getString(3));
				bean.setCinemaAddress(rs.getString(4));
				bean.setCinemaPhone(rs.getString(5));
				bean.setSiteAddress(rs.getString(6));
				bean.setCinemaSeat(rs.getInt(7));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}	
	
	//Cinema SELECT ������
		public Vector<Cinema> selectCinemaAdmin(){
			Vector<Cinema> v = new Vector<>();
		    Cinema Cinema1 = null;
		    String sql = "select cinemaNo, cinemaName, cinemaPhone, cinemaSiteAddress, cinemaAddress,cinemaSeatQuantity, cinemaImg from CINEMA order by cinemaNo";
		    try {
		    	pstmt = conn.prepareStatement(sql);
		        rs = pstmt.executeQuery();
		        while(rs.next()){ //DB�ȿ��� �� sql�� �����Ű�� ������ ������ ����
		        	Cinema1 = new Cinema();//����������� ��ü����
		            Cinema1.setCinemaNo(rs.getInt(1));
		            Cinema1.setCinemaName(rs.getString(2));
		            Cinema1.setCinemaPhone(rs.getString(3));
		            Cinema1.setSiteAddress(rs.getString(4));
		            Cinema1.setCinemaAddress(rs.getString(5));
		            Cinema1.setCinemaSeat(rs.getInt(6));
		            Cinema1.setCinemaImg(rs.getString(7));
		          
		            v.add(Cinema1);
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
		
		
		//Cinema UPDATE ������
		public boolean updateCinemaAdmin(Cinema Cinema){
			String SQL = "SELECT * FROM CINEMA";
			try{
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					pstmt = conn.prepareStatement("UPDATE CINEMA SET cinemaName=?, cinemaPhone=?, "
							+ "cinemaSiteAddress=?, cinemaAddress=?, cinemaSeatQuantity=?, cinemaImg=? WHERE cinemaNo = ? " );
					pstmt.setString(1, Cinema.getCinemaName());
					pstmt.setString(2, Cinema.getCinemaPhone());
					pstmt.setString(3, Cinema.getSiteAddress());
					pstmt.setString(4, Cinema.getCinemaAddress());
					pstmt.setInt(5, Cinema.getCinemaSeat());
					pstmt.setString(6, Cinema.getCinemaImg());
					pstmt.setInt(7, Cinema.getCinemaNo());
					pstmt.executeUpdate();
					return true;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				
			}
			return false;
		}
		
		//Cinema DELETE ������ CinemaNo�̶� String�� INT������ ����!
		public boolean deleteCinemaAdmin(int cinemaNo){
		    try{
		    	pstmt = conn.prepareStatement("DELETE FROM CINEMA WHERE cinemaNo = ?");
		    	pstmt.setInt(1, cinemaNo);
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

		//���� NO��������
		public Cinema getCinemaNo(int CinemaNo){
		    Cinema cinema = null;
		    try {
		        pstmt = conn.prepareStatement("select cinemaNo, cinemaName, cinemaPhone, cinemaSiteAddress, cinemaAddress,cinemaSeatQuantity, cinemaImg from CINEMA WHERE cinemaNo = ?");
		        pstmt.setInt(1, CinemaNo);
		        rs = pstmt.executeQuery();
		        if(rs.next()) {
		        	cinema = new Cinema();//����������� ��ü����
		        	cinema.setCinemaNo(rs.getInt(1));
		        	cinema.setCinemaName(rs.getString(2));
		        	cinema.setCinemaPhone(rs.getString(3));
		        	cinema.setSiteAddress(rs.getString(4));
		        	cinema.setCinemaAddress(rs.getString(5));
		            cinema.setCinemaSeat(rs.getInt(6));
		            cinema.setCinemaImg(rs.getString(7));
		              
		        }
		    } catch(Exception ex) {
		        ex.printStackTrace();
		    } finally {
		        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		    }
		    return cinema;//������ ����� ��ü member ����
		}

		public ArrayList<Cinema> getCinema(String searchType,String search){

			ArrayList<Cinema> CinemaList = null;
			String sql = "";
			try{ //FROM CINEMA WHERE cinemaAddress LIKE ? ORDER BY cinemaNo";
			
				if(searchType.equals("�����")){
					sql = "select cinemaNo, cinemaName, cinemaPhone, cinemaSiteAddress, cinemaAddress, cinemaSeatQuantity, cinemaImg FROM CINEMA WHERE cinemaName LIKE ? ORDER BY cinemaNo";
				}else if(searchType.equals("�ּ�")){
					sql = "select cinemaNo, cinemaName, cinemaPhone, cinemaSiteAddress, "
				    		+ "cinemaAddress, cinemaSeatQuantity, cinemaImg FROM CINEMA WHERE cinemaAddress LIKE ? ORDER BY cinemaNo";	}
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + search + "%");
				rs = pstmt.executeQuery();
				CinemaList = new ArrayList<Cinema>();
				
				while (rs.next()){
					Cinema Cinema = new Cinema();
					Cinema = new Cinema();//����������� ��ü����
		            Cinema.setCinemaNo(rs.getInt(1));
		            Cinema.setCinemaName(rs.getString(2));
		            Cinema.setCinemaPhone(rs.getString(3));
		            Cinema.setSiteAddress(rs.getString(4));
		            Cinema.setCinemaAddress(rs.getString(5));
		            Cinema.setCinemaSeat(rs.getInt(6));
		            Cinema.setCinemaImg(rs.getString(7));
		          
		            
					CinemaList.add(Cinema);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return CinemaList;
		}
	
}