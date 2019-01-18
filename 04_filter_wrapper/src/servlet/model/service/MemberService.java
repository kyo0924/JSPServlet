package servlet.model.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import servlet.model.dao.MemberDao;

public class MemberService {

	public String selectId(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "student", "student");
			conn.setAutoCommit(false);

		} catch(Exception e) {
			e.printStackTrace();
		} 
		String result = new MemberDao().selectId(conn, id, pw);
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
