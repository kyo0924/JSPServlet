package com.rclass.board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.rclass.board.model.vo.Board;
import com.rclass.board.model.vo.BoardComment;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardComment> selectCommentAll(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardComment> list = new ArrayList();
		String sql = prop.getProperty("selectCommentAll");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardComment bc = new BoardComment();
				bc.setBoardCommentNo(rs.getInt("board_comment_no"));
				bc.setBoardCommentLevel(rs.getInt("board_comment_level"));
				bc.setBoardCommentWriter(rs.getString("board_comment_writer"));
				bc.setBoardCommentContent(rs.getString("board_comment_content"));
				bc.setBoardRef(rs.getInt("board_Ref"));
				bc.setBoardCommentRef(rs.getInt("board_comment_ref"));
				bc.setBoardCommentDate(rs.getDate("board_comment_date"));
				list.add(bc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public int insertComment(Connection conn, BoardComment comment) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getBoardCommentLevel());
			pstmt.setString(2, comment.getBoardCommentWriter());
			pstmt.setString(3, comment.getBoardCommentContent());
			pstmt.setInt(4, comment.getBoardRef());
			pstmt.setString(5, comment.getBoardCommentRef() == 0 
					? null : String.valueOf(comment.getBoardCommentRef()));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteComment(Connection conn, int delNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteComment");
		int result = 0;
		System.out.println(sql);
		System.out.println(delNo);
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, delNo);
		
			result = pstmt.executeUpdate();
			System.out.println("result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int increReadCount(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("increReadCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Board selectOne(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board b = null;
		String sql = prop.getProperty("selectOne");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				b = new Board();
				b.setBoardNo(rs.getInt("board_no"));
				b.setBoardTitle(rs.getString("board_title"));
				b.setBoardWriter(rs.getString("board_writer"));
				b.setBoardContent(rs.getString("board_content"));
				b.setBoardOriginalFilename(rs.getString("board_original_filename"));
				b.setBoardRenamedFilename(rs.getString("board_renamed_filename"));
				b.setBoardDate(rs.getDate("board_date"));
				b.setBoardReadcount(rs.getInt("board_readcount"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}

	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectBoardCount");
		int result = 0;
		System.out.println("selectBoardCount");
		try {
			System.out.println("selectBoardCount try");
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
	
	public List<Board> selectBoardList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectBoardList");
		List<Board> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board b = new Board();
//				new Board(boardNo, boardTitle, boardWriter, boardContent, boardOriginalFileName, boardRenamedFilename, boardDate, boardReadCount)
				b.setBoardNo(rs.getInt("board_no"));
				b.setBoardTitle(rs.getString("board_title"));
				b.setBoardWriter(rs.getString("board_writer"));
				b.setBoardContent(rs.getString("board_content"));
				b.setBoardOriginalFilename(rs.getString("board_original_filename"));
				b.setBoardRenamedFilename(rs.getString("board_renamed_filename"));
				b.setBoardDate(rs.getDate("board_date"));
				b.setBoardReadcount(rs.getInt("board_readcount"));
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardWriter());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getBoardOriginalFilename());
			pstmt.setString(5, b.getBoardRenamedFilename());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
