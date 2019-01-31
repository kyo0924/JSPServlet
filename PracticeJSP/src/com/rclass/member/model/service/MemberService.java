package com.rclass.member.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

import java.sql.Connection;

import com.rclass.member.model.dao.MemberDao;
import com.rclass.member.model.vo.Member;


public class MemberService {
	
	private MemberDao dao = new MemberDao();

	public Member selectOne(Member m) {
		Connection conn = getConnection();
		Member result = dao.selectOne(conn, m);
		close(conn);
		return result;
	}
}
