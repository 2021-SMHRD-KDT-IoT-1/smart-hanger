package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Cody_BoardDAO {

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
	// 코디게시판 등록
	public int Cody_BoardInsert(Cody_BoardDTO dto) {
		conn();
		
		
		try {
			String sql = "insert into cody_board values(?, ?, ?, ?, ?, ?, ? )";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCody_board_num());
			psmt.setString(2, dto.getUserid());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getUpload_date());
			psmt.setString(6, dto.getLike_num());
			psmt.setString(7, dto.getView_num());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
		
	}
	// 코디게시판 전체조회
	public void Cody_Board_All_Select() {
		conn();
		
		
		try {
			String sql= "select * from cody_board";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				private String cody_board_num
				private String userid
				private String title
				private String content
				private String upload_date
				private String like_num
				private String view_num
				
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
