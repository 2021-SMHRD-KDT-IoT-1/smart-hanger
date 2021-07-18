package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Board_commentsDAO {

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
	public int Board_comments_Insert(Board_commentsDTO dto) {
		conn();

		try {
			String sql = "insert into board_comments values(num_board_comments.nextval,?, ?, ?, sysdate)";
			psmt = conn.prepareStatement(sql);
			
		
			
			psmt.setString(1, dto.getUserId());
			psmt.setString(2, dto.getboard_num());
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
	public ArrayList<Board_commentsDTO> Board_comments_All_Select(String num) {
		ArrayList<Board_commentsDTO> list = new ArrayList<Board_commentsDTO>();
		conn();

		try {
			String sql = "select * from board_comments where board_num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			rs = psmt.executeQuery();

			while (rs.next()) {
				String comments_num = rs.getString(1);
				String userId = rs.getString(2);
				String board_num = rs.getString(3);
				String comments = rs.getString(4);
				String upload_date = rs.getString(5);

				list.add(new Board_commentsDTO(comments_num, userId, board_num, comments, upload_date));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 개별 조회
	public Board_commentsDTO Board_comments_One_Select(String num) {
		Board_commentsDTO result = null;
		conn();

		try {
			String sql = "select * from board_comments where comments_num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String comments_num = rs.getString(1);
				String userId = rs.getString(2);
				String board_num = rs.getString(3);
				String comments = rs.getString(4);
				String upload_date = rs.getString(5);

				result = new Board_commentsDTO(comments_num, userId, board_num, comments, upload_date);

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
			String sql = "delete from board_comments where comments_num = ?";
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
