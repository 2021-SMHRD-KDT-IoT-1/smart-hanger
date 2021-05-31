package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class WebClothesDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	

	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}	
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//  옷 등록
	public int insertClothes(WebClothesDTO dto) {
		conn();
		
		try {
			String sql = "insert into my_clothes values(num_clothes.nextval, ?, ?, ?, ?, sysdate, ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMy_clothes_num());
			psmt.setString(2, dto.getUserid());
			psmt.setString(3, dto.getClothesname());
			psmt.setString(4, dto.getClothestype());
			psmt.setString(5, dto.getMemo());
			
			
			cnt = psmt.executeUpdate();
			} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	
	//  등록된 옷 전체 조회
	public ArrayList<WebClothesDTO> SearchClothes() {
		ArrayList<WebClothesDTO> list = new ArrayList<WebClothesDTO>();
		
		conn();
		
		try {
			String sql = "select * from my_clothes";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int num = rs.getInt(1);
				String my_clothes_num = rs.getString(2);
				String userid = rs.getString(3);
				String clothesname = rs.getString(4);
				String username = rs.getString(5);
				String clothestype = rs.getString(6);
				String day2 = rs.getString(7);
				String memo = rs.getString(8);
				
				
				list.add(new WebClothesDTO(num, my_clothes_num, userid, clothesname, username, clothestype, day2, memo));
				
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	//  옷 하나 조회
	public WebClothesDTO SearchOneClothes(String in_num) {
		WebClothesDTO info = null;
		
		conn();
		
		try {
			String sql = "select * from my_clothes where num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, in_num);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int num = rs.getInt(1);
				String my_clothes_num = rs.getString(2);
				String userid = rs.getString(3);
				String clothesname = rs.getString(4);
				String username = rs.getString(5);
				String clothestype = rs.getString(6);
				String day2 = rs.getString(7);
				String memo = rs.getString(8);
				
				
				info = new WebClothesDTO(num, my_clothes_num, userid, clothesname, username, clothestype, day2, memo);
						
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			close();
		}
		return info;
	}
    // 여기는 옷장 수정 할 곳 
	
}
