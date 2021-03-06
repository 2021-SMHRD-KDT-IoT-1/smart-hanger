package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	MemberDTO dto = null;
	ArrayList<MemberDTO> list = null;

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

	public int join(MemberDTO dto) {
		conn();
		
		try {

			String sql = "insert into member values(?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserId());
			psmt.setString(2, dto.getUserPw());
			psmt.setString(3, dto.getUserName());
			psmt.setString(4, dto.getUserAge());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}
	
	public MemberDTO login(MemberDTO InputDto) {
		conn();
	
		try {

			String sql = "select * from member where USERID = ? and USERPW = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, InputDto.getUserId());
			psmt.setString(2, InputDto.getUserPw());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String email = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String age = rs.getString(4);
				
				dto = new MemberDTO(email, pw, name, age);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
	
	}
	
	public int update(MemberDTO dto) {
		conn();

		try {
			String sql = "update member set USERPW=?, USERNAME=?, USERAGE=? where UserId=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserPw());
			psmt.setString(2, dto.getUserName());
			psmt.setString(3, dto.getUserAge());
			psmt.setString(4, dto.getUserId());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public ArrayList<MemberDTO> select() {
		
		list = new ArrayList<MemberDTO>();
		conn();
		
		try {
			String sql = "select * from member";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			
				String email = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String age = rs.getString(4);
				
				dto = new MemberDTO(email, pw, name, age);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public int delete(MemberDTO dto) {
		conn();
		
		try {

			String sql = "delete from member where USERID = ? and USERPW = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUserId());
			psmt.setString(2, dto.getUserPw());
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
