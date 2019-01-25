package com.rclass.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static common.JDBCTemplate.close;

import com.rclass.member.vo.Member;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		try {
			String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectMemberCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectMemberCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Member> selectSearchMember(Connection conn, String type, String key, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Member> list = new ArrayList<>();
		switch (type) {
		
		case "userId": sql=prop.getProperty("searchUserIdPage"); break;
		case "userName": sql = prop.getProperty("searchUserNamePage"); break;
		case "gender": sql = prop.getProperty("searchGenderPage"); break;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + key + "%");
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setUserId(rs.getString("userid"));
				m.setUserName(rs.getString("username"));
				m.setGender(rs.getString("gender"));
				m.setAge(rs.getInt("age"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setHobby(rs.getString("hobby"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Member> selectSearchMember(Connection conn, String type, String key) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Member> list = new ArrayList<>();
		switch (type) {
		
		case "userId": sql=prop.getProperty("searchUserId"); break;
		case "userName": sql = prop.getProperty("searchUserName"); break;
		case "gender": sql = prop.getProperty("searchGender"); break;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + key + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setUserId(rs.getString("userid"));
				m.setUserName(rs.getString("username"));
				m.setGender(rs.getString("gender"));
				m.setAge(rs.getInt("age"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setHobby(rs.getString("hobby"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<Member> selectMemberList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMemberList");
//		String sql = "SELECT * FROM MEMBER ORDER BY ENROLLDATE DESC";
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			System.out.println();
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			System.out.println("selectMemberList");
			while (rs.next()) {
				Member m = new Member();
				m.setUserId(rs.getString("userid"));
				m.setUserName(rs.getString("username"));
				m.setGender(rs.getString("gender"));
				m.setAge(rs.getInt("age"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setHobby(rs.getString("hobby"));
				m.setEnrollDate(rs.getDate("enrolldate"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
}
