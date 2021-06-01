package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Board_DAO {
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
	public int Board_Insert(Board_DTO dto) {
		conn();
		
		
		try {
			String sql = "insert into board values(num_board.nextval, ?, ?, ?, sysdate, ?, ?, ?)";
			
			psmt = conn.prepareStatement(sql);
			
			
			psmt.setString(1, dto.getUserid());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getLike_num());
			psmt.setString(5, dto.getView_num());
			psmt.setString(6, dto.getClothespath());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
		
	}
	// 코디게시판 전체조회
	public ArrayList<Board_DTO> Board_All_Select() {
		ArrayList<Board_DTO> list = new ArrayList<Board_DTO>();
		conn();
		
		
		try {
			String sql= "select * from board";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				 String board_num = rs.getString(1);
				 String userid = rs.getString(2);
				 String title = rs.getString(3);
				 String content = rs.getString(4);
				 String upload_date = rs.getString(5);
				 String like_num = rs.getString(6);
				 String view_num = rs.getString(7);
				 String clothespath = rs.getString(8);
				
				 list.add(new Board_DTO( board_num, userid, title, content, upload_date, like_num, view_num, clothespath));
				 
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	
	// 여기는 개별 조회 
	public Board_DTO Board_One_Select(String in_num) {
		Board_DTO info = null;
		
		conn();
		
		try {
			String sql = "select * from board where num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, in_num);
			
			while(rs.next()) {

				 String board_num = rs.getString(1);
				 String userid = rs.getString(2);
				 String title = rs.getString(3);
				 String content = rs.getString(4);
				 String upload_date = rs.getString(5);
				 String like_num = rs.getString(6);
				 String view_num = rs.getString(7);
				 String clothespath = rs.getString(8);
				
				 info = new Board_DTO(board_num, userid, title, content, upload_date, like_num, view_num, clothespath);
				 
			}
			
			rs = psmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return info;
	}
	//개별삭제
	public int Board_One_delete(String num) {
		conn();
		String sql = "delete from Board where num=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt ;
	}
		
}