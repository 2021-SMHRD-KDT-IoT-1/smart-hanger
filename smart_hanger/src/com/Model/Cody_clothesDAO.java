package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Cody_clothesDAO {

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
	public int Cody_clothes_Insert(Cody_clothesDTO dto) {
		conn();

		try {
			////점심 먹고와서 여기부터 다시 시작 sql문 앞에 시퀀스 넣어야하고 
			String sql = "insert from cody_clothes values(num_cody_clothes.nextval, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			
			psmt.setString(2, dto.getMy_clothes_num());
			psmt.setString(3, dto.getUserID());
			psmt.setString(4, dto.getTitle());
			psmt.setString(5, dto.getContent());
			psmt.setString(6, dto.getKind());
			psmt.setString(7, dto.getClothesPath());


			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 전체 조회
	public ArrayList<Cody_clothesDTO> Cody_clothes_All_Select() {
		ArrayList<Cody_clothesDTO> list = new ArrayList<Cody_clothesDTO>();
		conn();

		try {
			String sql = "select * from cody_clothes";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String cody_num = rs.getString(1);
				String my_clothes_num = rs.getString(2);
				String userID = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				String kind = rs.getString(6);
				String clothesPath = rs.getString(7);

				list.add(new Cody_clothesDTO(cody_num, my_clothes_num, userID, title, content, kind, clothesPath));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 개별 조회
	public Cody_clothesDTO Cody_clothes_One_Select(String num) {
		Cody_clothesDTO result = null;
		conn();

		try {
			String sql = "select * from cody_clothes where cody_num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String cody_num = rs.getString(1);
				String my_clothes_num = rs.getString(2);
				String userID = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				String kind = rs.getString(6);
				String clothesPath = rs.getString(7);

				result = new Cody_clothesDTO(cody_num, my_clothes_num, userID, title, content, kind, clothesPath);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 개별 삭제
	public int Cody_clothes_One_delete(String num) {

		conn();

		try {
			String sql = "delete from cody_clothes where cody_num = ?";
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
