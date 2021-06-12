package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Cody_Board_DAO {

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

	// 코디게시판 등록
	public String Cody_BoardInsert(Cody_Board_DTO dto) {
		conn();
		String cody_num = null;

		try {
			String sql = "insert into cody_board values(num_cody_board.nextval,?, ?, ?, sysdate, 0, 0, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserid());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getClothespath());

			if (psmt.executeUpdate() > 0) {
				sql = "select * from cody_board where userID = ? and title = ? and content = ? and clothespath = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getUserid());
				psmt.setString(2, dto.getTitle());
				psmt.setString(3, dto.getContent());
				psmt.setString(4, dto.getClothespath());

				rs = psmt.executeQuery();

				if (rs.next()) {
					cody_num = rs.getString(1);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cody_num;

	}

	// 코디게시판 전체조회
	public ArrayList<Cody_Board_DTO> Cody_Board_All_Select() {
		ArrayList<Cody_Board_DTO> list = new ArrayList<Cody_Board_DTO>();
		conn();

		try {
			String sql = "select * from cody_board";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String cody_board_num = rs.getString(1);
				String userid = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String upload_date = rs.getString(5);
				String like_num = rs.getString(6);
				String view_num = rs.getString(7);
				String clothespath = rs.getString(8);
				
				

				list.add(new Cody_Board_DTO(cody_board_num, userid, title, content, upload_date, like_num, view_num, clothespath));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	// 여기는 개별 조회
	public Cody_Board_DTO Cody_Board_One_Select(String in_num) {
		Cody_Board_DTO info = null;

		conn();

		try {
			String sql = "select * from cody_board where cody_board_num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, in_num);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String cody_board_num = rs.getString(1);
				String userid = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String upload_date = rs.getString(5);
				String like_num = "";
				String view_num = rs.getString(7);
				String clothespath = rs.getString(8);

				
				sql = "select * from cody_board_like where cody_board_num = ?";
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, cody_board_num);
				
				rs = psmt.executeQuery();
				
				int num = 0;
				while (rs.next()) {
					num++;
				}
				
				like_num += num;
				
				
				info = new Cody_Board_DTO(cody_board_num, userid, title, content, upload_date, like_num, view_num, clothespath);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return info;
	}

	// 개별삭제
	public int Cody_Board_One_delete(String num) {
		conn();
		String sql = "delete from Cody_Board where num=?";

		try {
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

	// 조회수
	public int Cody_Board_upView(String num) {
		conn();

		try {

			String sql = "select * from Cody_Board where cody_board_num = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);

			rs = psmt.executeQuery();
			if (rs.next()) {
				int viewNum = Integer.parseInt(rs.getString("view_num"));

				sql = "update Cody_Board set view_num = ? where cody_board_num = ?";

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

	// 좋아요 0없음 1있음 2실행성공 3실패
	public int Cody_Board_Like(String check, String num, String userId) {
		cnt = 3;
		conn();

		try {

			String sql = "select * from cody_board_like where cody_board_num = ? and userid = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.setString(2, userId);

			rs = psmt.executeQuery();

			boolean rs_check = rs.next();

			if (rs_check) {
				cnt = 1;

				if (!check.equals("check")) {
					sql = "delete from cody_board_like where cody_board_num = ? and userid = ?";

					psmt = conn.prepareStatement(sql);
					psmt.setString(1, num);
					psmt.setString(2, userId);

					cnt = psmt.executeUpdate() > 0 ? 2 : 3;
				}

			} else {
				cnt = 0;

				if (!check.equals("check")) {

					sql = "insert into cody_board_like values(?, ?)";

					psmt = conn.prepareStatement(sql);
					psmt.setString(1, num);
					psmt.setString(2, userId);

					cnt = psmt.executeUpdate() > 0 ? 2 : 3;

				}

			}

		} catch (

		SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 좋아요 0없음 1있음
	public int Cody_Board_Like_view(String num, String userId) {
		conn();

		try {

			String sql = "select * from cody_board_like where cody_board_num = ? and userid = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.setString(2, userId);

			rs = psmt.executeQuery();
			
			if (rs.next()) {
				cnt = 1;
			}else {
				cnt = 0;
			}

		} catch (

		SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
