package com.rclass.board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.rclass.board.model.dao.BoardDao;
import com.rclass.board.model.vo.Board;
import com.rclass.board.model.vo.BoardComment;

public class BoardService {
	
	private BoardDao dao = new BoardDao();
	
	public List<BoardComment> selectCommentAll(int no) {
		Connection conn = getConnection();
		List<BoardComment> list = dao.selectCommentAll(conn, no);
		close(conn);
		return list;
	}
	
	public int insertComment(BoardComment comment) {
		Connection conn = getConnection();
		int result = dao.insertComment(conn, comment);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}
	
	public Board selectOne(int boardNo, boolean hasRead) {
		Connection conn = getConnection();
		Board b = dao.selectOne(conn, boardNo);
		if (b != null && !hasRead) {
			int result = dao.increReadCount(conn, boardNo);
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
		}
		close(conn);
		return b;
	}
	
	public int selectBoardCount() {
		Connection conn = getConnection();
		int result = dao.selectBoardCount(conn);
		close(conn);
		return result;
	}

	public List<Board> selectBoardList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Board> list = dao.selectBoardList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.insertBoard(conn, b);
		if (result > 0 )
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
}
