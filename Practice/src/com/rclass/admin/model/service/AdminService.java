package com.rclass.admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.rclass.admin.model.dao.AdminDao;
import com.rclass.member.vo.Member;

public class AdminService {
	
	private AdminDao dao = new AdminDao();
	
	public int selectMemberCount() {
		Connection conn = getConnection();
		int result = dao.selectMemberCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Member> selectMemberList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		ArrayList<Member> list = dao.selectMemberList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
}
