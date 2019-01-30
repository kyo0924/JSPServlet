package com.rclass.notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.rclass.notice.model.dao.NoticeDao;
import com.rclass.notice.model.vo.Notice;

public class NoticeService {
	
	private NoticeDao dao = new NoticeDao();
	
	public Notice selectOne(int no) {
		Connection conn = getConnection();
		Notice n = dao.selectOne(conn, no);
		close(conn);
		return n;
	}
	
	public int selectCount() {
		Connection conn = getConnection();
		int result = dao.selectCount(conn);
		close(conn);
		return result;
	}
	
	public int selectNoticeCount() {
		Connection conn = getConnection();
		int result = dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	
	public List<Notice> selectList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Notice> list = dao.selectList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public ArrayList<Notice> selectNoticeList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		ArrayList<Notice> list = dao.selectNoticeList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public ArrayList<Notice> selectNoticeList() {
		Connection conn = getConnection();
		ArrayList<Notice> list = dao.selectNoticeList(conn);
		close(conn);
		return list;
	}
}
