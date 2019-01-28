package com.sample.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.rclass.member.vo.Member;

public class SampleDao {

	private Properties prop = new Properties();
	
	public SampleDao() {
		try {
			String fileName = SampleDao.class.getResource("/sql/sample/sample1.properties").getPath();
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int selectCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
//				result = rs.getInt("cnt");
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Member> selectList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectList");
		List<Member> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member m = new Member();
//				new Member(userId, password, userName, gender, age, email, phone, address, hobby, enrollDate)
				m.setUserId(rs.getString("userid"));
				m.setPassword(rs.getString("password"));
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
