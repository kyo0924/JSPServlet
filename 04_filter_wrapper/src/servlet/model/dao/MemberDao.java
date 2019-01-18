package servlet.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {

	public String selectId(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		boolean flag = false;
		String sql = "SELECT * FROM MEMBER WHERE MEMBER_ID = ?";
		ResultSet rs = null;
		String result = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString("member_id").equals(id) ) {
					if(rs.getString("member_pwd").equals(pw)) {
					result = "ok";
					} else {
						result = "passFail";
					}
				} else {
					result = "idFail";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
		return result;
	}
}
