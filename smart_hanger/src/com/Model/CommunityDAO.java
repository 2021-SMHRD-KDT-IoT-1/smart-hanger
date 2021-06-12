package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;





public class CommunityDAO {
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
	public int community_Insert(CommunityDTO dto) {
		conn();

		try {
			String sql = "insert into board values(num_board.nextval,?,?,?,sysdate,0,0,?)";
			psmt = conn.prepareStatement(sql);
			
	
			
			psmt.setString(1, dto.getUserid());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getUpload_date());
			

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 전체 조회
	public ArrayList<CommunityDTO> Community_Show() {
		ArrayList<CommunityDTO> community_list = new ArrayList<CommunityDTO>();
		conn();

		try {
			String sql = "select * from board order by upload_date desc";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int board_num = rs.getInt("board_num");
				String userid = rs.getString("userid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String[] upload_dates = rs.getString("upload_date").split(" ");
				String upload_date = upload_dates[0];
				int like_num = rs.getInt("like_num");
				int view_num = rs.getInt("view_num");
				CommunityDTO dto = new CommunityDTO(board_num, title, userid, content, upload_date, like_num,view_num);
				community_list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return community_list;
	}
	

	// 개별 조회
	public Board_commentsDTO Board_comments_One_Select(String num) {
		Board_commentsDTO result = null;
		conn();

		try {
			String sql = "select * from board where board_num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String board_num = rs.getString(1);
				String userid = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String upload_date = rs.getString(5);

				result = new Board_commentsDTO(board_num, userid, title, content, upload_date);
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
			String sql = "delete from board where board_num = ?";
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
	
	// 정희가 만듬 난 몰라
	public CommunityDTO showOne(String choice) {
		CommunityDTO dto = null;
		conn();
		
		String sql = "select * from board where board_num = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, choice);
			rs = psmt.executeQuery();
			if(rs.next()) {
				int board_num = rs.getInt("board_num");
				String userid = rs.getString("userid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String upload_date = rs.getString("upload_date");
				int like_num = rs.getInt("like_num");
				int view_num = rs.getInt("view_num");
				String clothespath = rs.getString("clothespath");
				
				dto = new CommunityDTO(board_num,userid, title,content,upload_date, like_num,view_num, clothespath);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	
	
	// userId별 조회
	public ArrayList<CommunityDTO> Community_Select_Show(String userId_input) {
		ArrayList<CommunityDTO> community_list = new ArrayList<CommunityDTO>();
		conn();

		try {
			String sql = "select * from board  where userid = ? order by upload_date desc";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId_input);
			
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				int board_num = rs.getInt("board_num");
				String userid = rs.getString("userid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String[] upload_dates = rs.getString("upload_date").split(" ");
				String upload_date = upload_dates[0];
				int like_num = rs.getInt("like_num");
				int view_num = rs.getInt("view_num");
				CommunityDTO dto = new CommunityDTO(board_num, title, userid, content, upload_date, like_num,view_num);
				community_list.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return community_list;
	}
	
	
	
	
	// 조회수
	public int Board_upView(String num) {
		conn();

		try {

			String sql = "select * from board where board_num = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);

			rs = psmt.executeQuery();
			if (rs.next()) {
				int viewNum = Integer.parseInt(rs.getString("view_num"));

				sql = "update board set view_num = ? where board_num = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, viewNum + 1 + "");
				psmt.setString(2, num);

				cnt = psmt.executeUpdate();

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
}


