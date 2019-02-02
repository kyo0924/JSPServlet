package com.rclass.board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.rclass.board.model.dao.BoardDao;
import com.rclass.board.model.vo.Board;

public class BoardService {
	
	private BoardDao dao = new BoardDao();
	
	public Board selectOne(int boardNo) {
		Connection conn = getConnection();
		Board result = dao.selectOne(conn, boardNo);
		close(conn);
		return result;
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
