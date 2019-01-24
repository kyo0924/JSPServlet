package com.rclass.admin.model.service;

import java.sql.Connection;
import java.util.List;

import com.rclass.admin.model.dao.AdminDao;
import com.rclass.member.vo.Member;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

public class AdminService {
	
	private AdminDao dao = new AdminDao();

	public List<Member> selectMemberList() {
		Connection conn = getConnection();
		List<Member> list = dao.selectMemberList(conn);
		close(conn);
		return list;
	}
}
