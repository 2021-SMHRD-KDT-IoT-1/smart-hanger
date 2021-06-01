package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClothMemberDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	ClothMemberDTO dto = null;
	ArrayList<ClothMemberDTO> list = null;

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

	public int join(ClothMemberDTO dto) {
		conn();
		
		try {

			String sql = "insert into cloth_member values(?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getAge());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}
	
	public ClothMemberDTO login(ClothMemberDTO InputDto) {
		conn();
	
		try {
			String sql = "select * from cloth_member where email = ? and pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, InputDto.getEmail());
			psmt.setString(2, InputDto.getPw());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String email = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String age = rs.getString(4);
				
				dto = new ClothMemberDTO(email, pw, name, age);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
	
	}
	
//	public int update(clothMemberDTO dto) {
//		conn();
//
//		try {
//			String sql = "update cloth_member set pw=?, tel=?, address=? where email=?";
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, dto.getPw());
//			psmt.setString(2, dto.getTel());
//			psmt.setString(3, dto.getAddr());
//			psmt.setString(4, dto.getEmail());
//			cnt = psmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		
//		return cnt;
//	}
	
	public ArrayList<ClothMemberDTO> select() {
		
		list = new ArrayList<ClothMemberDTO>();
		conn();
		
		try {
			String sql = "select * from cloth_member";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			
				String email = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String age = rs.getString(4);
				
				dto = new ClothMemberDTO(email, pw, name, age);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public int delete(ClothMemberDTO dto) {
		conn();
		
		try {
			String sql = "delete from cloth_member where email = ? and pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
