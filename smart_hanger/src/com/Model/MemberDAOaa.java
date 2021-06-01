package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class MemberDAOaa {

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

<<<<<<< HEAD
	public int join(MemberDTOaa dto) {
=======
	public int join(MemberDTO dto) {
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
		conn();

		try {

			String sql = "insert into web_member values(?,?,?,?)";
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

	// 회원 등록
	public int My_clothes_Insert(My_clothesDTO dto) {
		conn();

		try {
			String sql = "insert from my_clothes_Insert values(?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMy_clothes_num());
			psmt.setString(2, dto.getUserId());
			psmt.setString(3, dto.getClothesName());
			psmt.setString(4, dto.getClothesType());
			psmt.setString(5, dto.getUpload_date());
			psmt.setString(5, dto.getMemo());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 회원 등록
	public ArrayList<My_clothesDTO> My_clothes_All_Select(My_clothesDTO dto) {
		ArrayList<My_clothesDTO> list = new ArrayList<My_clothesDTO>();
		conn();

		try {
			String sql = "select * from my_clothes_Insert";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String my_clothes_num = rs.getString(1);
				String userId = rs.getString(2);
				String clothesName = rs.getString(3);
				String clothesType = rs.getString(4);
				String upload_date = rs.getString(5);
				String memo = rs.getString(6);

				list.add(new My_clothesDTO(my_clothes_num, userId, clothesName, clothesType, upload_date, memo));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 회원 조회
	public My_clothesDTO My_clothes_One_Select(String num) {
		My_clothesDTO result = null;
		conn();

		try {
			String sql = "select * from my_clothes_Insert where num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String my_clothes_num = rs.getString(1);
				String userId = rs.getString(2);
				String clothesName = rs.getString(3);
				String clothesType = rs.getString(4);
				String upload_date = rs.getString(5);
				String memo = rs.getString(6);

				result = new My_clothesDTO(my_clothes_num, userId, clothesName, clothesType, upload_date, memo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 회원 삭제
	public int My_clothes_One_delete(String num) {

		conn();

		try {
			String sql = "delete from my_clothes_Insert where num = ?";
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
