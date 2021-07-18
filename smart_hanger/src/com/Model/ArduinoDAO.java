package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ArduinoDAO {

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

	// 전체조회
	public ArrayList<ArduinoDTO> All_Select(String userId) {
		ArrayList<ArduinoDTO> list = new ArrayList<ArduinoDTO>();
		conn();

		try {
			String sql = "select * from my_clothes where userID = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, userId);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String cloth_num = rs.getString(1);
				String state = rs.getString(8);

			
				list.add(new ArduinoDTO(cloth_num, state));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	
	
	// 변경
	public int One_Select(String userId, String num, String set) {
		conn();
		
		try {
			String sql = "update my_clothes set cloth_state = ? where my_clothes_num = ? and userID = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, set);
			psmt.setString(2, num);
			psmt.setString(3, userId);
			
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// 변경
	public ArrayList<String> Ones_Select(String num) {
		ArrayList<String> list = new ArrayList<String>();
		conn();
		
		try {
			String sql = "select * from my_cody_clothes where my_cody_num = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, num);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				
				list.add(rs.getString(2));
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}

}
