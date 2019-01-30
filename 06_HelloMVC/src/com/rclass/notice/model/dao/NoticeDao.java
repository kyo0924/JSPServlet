package com.rclass.notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static common.JDBCTemplate.close;
import com.rclass.notice.model.vo.Notice;

public class NoticeDao {

	Properties prop = new Properties();
	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectNoticeCount");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
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
	
	public ArrayList<Notice> selectNoticeList(Connection conn) {
		
		// DB 정보를 가져오는 객체
		// 1. Connection, PreparedStatement, ResultSet(select) / int (insert, update, delete)
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		String sql = prop.getProperty("selectNoticeList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Notice n = new Notice();
//				new Notice(noticeNo, noticeTitle, noticeWriter, noticeContent, noticeDate, filePath)
				n.setNoticeNo(rs.getInt("notice_no"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeWriter(rs.getString("notice_writer"));
				n.setNoticeContent(rs.getString("notice_content"));
				n.setNoticeDate(rs.getDate("notice_date"));
				n.setFilePath(rs.getString("filepath"));
				list.add(n);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Notice> selectNoticeList(Connection conn, int cPage, int numPerPage) {
		
		// DB 정보를 가져오는 객체
		// 1. Connection, PreparedStatement, ResultSet(select) / int (insert, update, delete)
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		String sql = prop.getProperty("selectNoticeList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				Notice n = new Notice();
//				new Notice(noticeNo, noticeTitle, noticeWriter, noticeContent, noticeDate, filePath)
				n.setNoticeNo(rs.getInt("notice_no"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeWriter(rs.getString("notice_writer"));
				n.setNoticeContent(rs.getString("notice_content"));
				n.setNoticeDate(rs.getDate("notice_date"));
				n.setFilePath(rs.getString("filepath"));
				list.add(n);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

}
