package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class My_clothesDAO {

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


	// 옷 등록
	public String My_clothes_Insert(My_clothesDTO dto) {
		String clothes_num = null;
		conn();

		try {
			String sql = "insert into my_clothes values(num_my_clothes.nextval, ?, ?, ?, sysdate, ?, ?)";
			psmt = conn.prepareStatement(sql);

			
			psmt.setString(1, dto.getUserId());
			psmt.setString(2, dto.getClothesName());
			psmt.setString(3, dto.getClothesType());
			psmt.setString(4, dto.getMemo());
			psmt.setString(5, dto.getClothespath());

			if (psmt.executeUpdate() > 0) {
				sql = "select * from my_clothes where userID = ? and clothesname = ? and clothespath = ?";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, dto.getUserId());
				psmt.setString(2, dto.getClothesName());
				psmt.setString(3, dto.getClothespath());
				
				rs = psmt.executeQuery();
				
				if (rs.next()) {
					clothes_num = rs.getString(1);
					System.out.println(clothes_num);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return clothes_num;
	}

	// 옷 등록
	public ArrayList<My_clothesDTO> My_clothes_All_Select(String in_userId) {
		ArrayList<My_clothesDTO> list = new ArrayList<My_clothesDTO>();
		conn();

		try {
			String sql = "select * from my_clothes where userId = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, in_userId);

			rs = psmt.executeQuery();

			while (rs.next()) {
				
				String my_clothes_num = rs.getString(1);
				String userId = rs.getString(2);
				String clothesName = rs.getString(3);
				String clothesType = rs.getString(4);
				String upload_date = rs.getString(5);
				String memo = rs.getString(6);
				String Clothespath = rs.getString(7);
				
				list.add(new My_clothesDTO(my_clothes_num, userId, clothesName, clothesType, upload_date, memo, Clothespath));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 개별 조회
	public My_clothesDTO My_clothes_One_Select(String num) {
		My_clothesDTO result = null;
		conn();

		try {
			String sql = "select * from my_clothes where my_clothes_num = ?";
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
				String Clothespath = rs.getString(7);

				result = new My_clothesDTO(my_clothes_num, userId, clothesName, clothesType, upload_date, memo, Clothespath);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 개별삭제
	public int My_clothes_One_delete(String num) {

		conn();

		try {
			String sql = "delete from my_clothes where my_clothes_num = ?";
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
	
	
	// 수정(업데이트)
	public int My_clothes_Update(My_clothesDTO dto) {
		
		conn();
		
		try {
			String sql = "update my_clothes set clothesname=?, memo=?, clothespath=? where my_clothes_num=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getClothesName());
			psmt.setString(2, dto.getMemo());
			psmt.setString(3, dto.getClothespath());
			psmt.setString(4, dto.getMy_clothes_num());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	

		
	}
}
