package com.rclass.notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.rclass.notice.model.dao.NoticeDao;
import com.rclass.notice.model.vo.Notice;

public class NoticeService {
	
	private NoticeDao dao = new NoticeDao();
	
	public int selectNoticeCount() {
		Connection conn = getConnection();
		int result = dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Notice> selectNoticeList() {
		Connection conn = getConnection();
		ArrayList<Notice> list = dao.selectNoticeList(conn);
		close(conn);
		return list;
	}
}
