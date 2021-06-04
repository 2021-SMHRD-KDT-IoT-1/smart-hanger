package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Cody_board_commentsDAO {

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
			if (rs != null) {
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

	
	// 등록
	public int Cody_clothes_Insert(Cody_board_commentsDTO dto) {
		conn();

		try {
			String sql = "insert into Cody_board_comments values(num_cody_board_comments.nextval, ?, ?, ?,  sysdate)";
			psmt = conn.prepareStatement(sql);

		
			psmt.setString(1, dto.getUserId());
			psmt.setString(2, dto.getCody_board_num());
			psmt.setString(3, dto.getComments());
			
			

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	
	// 전체 조회
	public ArrayList<Cody_board_commentsDTO> Board_comments_All_Select(Cody_board_commentsDTO dto) {
		ArrayList<Cody_board_commentsDTO> list = new ArrayList<Cody_board_commentsDTO>();
		conn();

		try {
			String sql = "select * from Cody_board_comments";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				
				
				String comments_num = rs.getString(1);
				String userId = rs.getString(2);
				String cody_board_num = rs.getString(3);
				String comments = rs.getString(4);
				String upload_date = rs.getString(5);

				list.add(new Cody_board_commentsDTO( comments_num, userId, cody_board_num, comments, upload_date));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 개별 조회
	public Cody_board_commentsDTO Board_comments_One_Select(String num) {
		Cody_board_commentsDTO result = null;
		conn();

		try {
			String sql = "select * from Cody_board_comments where comments_num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);

			rs = psmt.executeQuery();

			if (rs.next()) {
				
				
				String comments_num = rs.getString(1);
				String userId = rs.getString(2);
				String cody_board_num = rs.getString(3);
				String comments = rs.getString(4);
				String upload_date = rs.getString(5);

				result = new Cody_board_commentsDTO(comments_num, userId, cody_board_num, comments, upload_date);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 개별 삭제
	public int Board_comments_One_delete(String num) {

		conn();

		try {
			String sql = "delete from Cody_board_comments where comments_num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
