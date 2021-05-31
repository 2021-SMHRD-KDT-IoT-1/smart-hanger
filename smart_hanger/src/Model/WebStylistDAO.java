package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class WebStylistDAO {

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
//	===========================================================
//	======================== 코디등록 ============================
//	===========================================================
	
	public int insertStylist(WebStylistDTO dto) {
		
		conn();
		
		try {
			String sql = "insert into cody_clothes values(num_cody_clothes, ?, ?, ?, ?)";			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserid());
			psmt.setString(2, dto.getMy_clothes_num());
			psmt.setString(3, dto.getClothespath());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
				
	}
	
//	===========================================================
//	====================등록된 코디 전체 조회========================
//	===========================================================
	
	public ArrayList<WebStylistDTO> SearchStylise() {
		ArrayList<WebStylistDTO> list = new ArrayList<WebStylistDTO>();
	
		conn();
	
		
		try {
			String sql = "select * from cody_clothes";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt(1);
				String cody_num = rs.getString(2);
				String my_clothes_num = rs.getString(3);
				String userid = rs.getString(4);
				String clothespath = rs.getString(5);
				
				list.add(new WebStylistDTO(num, cody_num, my_clothes_num, userid, clothespath));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
		
		
	}
	
}
