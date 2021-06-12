package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class My_codyDAO {

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


	// 코디 등록
	public String My_cody_Insert(My_codyDTO dto) {
		String clothes_num = null;
		conn();

		try {
			String sql = "insert into my_cody values(num_cody_clothes.nextval, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);

			
			psmt.setString(1, dto.getUserID());
			psmt.setString(2, dto.getClothesname());
			psmt.setString(3, dto.getMemo());
			psmt.setString(4, dto.getClothespath());

			
			
			

			if (psmt.executeUpdate() > 0) {
				sql = "select * from my_cody where userID = ? and clothesname = ? and clothespath = ?";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, dto.getUserID());
				psmt.setString(2, dto.getClothesname());
				psmt.setString(3, dto.getClothespath());
				
				
				
				rs = psmt.executeQuery();
				
				if (rs.next()) {
					clothes_num = rs.getString(1);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return clothes_num;
	}

	// 코디 조회
	public ArrayList<My_codyDTO> My_cody_All_Select(String in_userId) {
		ArrayList<My_codyDTO> list = new ArrayList<My_codyDTO>();
		conn();

		try {
			String sql = "select * from my_cody where userId = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, in_userId);

			rs = psmt.executeQuery();

			while (rs.next()) {
				
				String my_cody_num = rs.getString(1);
				String userID = rs.getString(2);
				String clothesname = rs.getString(3);
				String memo = rs.getString(4);
				String clothespath = rs.getString(5);
				
				list.add(new My_codyDTO(my_cody_num, userID, clothesname, memo, clothespath));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 코디 개별 조회
	public My_codyDTO My_cody_One_Select(String num) {
		My_codyDTO result = null;
		conn();

		try {
			String sql = "select * from my_cody where my_cody_num = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String my_cody_num = rs.getString(1);
				String userID = rs.getString(2);
				String clothesname = rs.getString(3);
				String memo = rs.getString(4);
				String clothespath = rs.getString(5);

				result = new My_codyDTO(my_cody_num, userID, clothesname, memo, clothespath);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 개별삭제
	public int My_cody_One_delete(String num) {

		conn();

		try {
			String sql = "delete from my_cody where my_cody_num = ?";
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
	public int My_cody_Update(My_codyDTO dto) {
		
		conn();
		
		try {
			String sql = "update my_clothes set clothesname=?, memo=?, clothespath=? where my_clothes_num=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getClothesname());
			psmt.setString(2, dto.getMemo());
			psmt.setString(3, dto.getClothespath());
			psmt.setString(4, dto.getMy_cody_num());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	

		
	}
}
