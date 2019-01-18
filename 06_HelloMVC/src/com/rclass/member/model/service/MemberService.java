package com.rclass.member.model.service;

import java.sql.Connection;

import com.rclass.member.model.dao.MemberDao;
import com.rclass.member.vo.Member;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

public class MemberService {

	public Member selectOne(Member m) {
		Connection conn = getConnection();
		Member mem = new MemberDao().selectOne(conn, m);
		close(conn);
		return mem;
	}
}
