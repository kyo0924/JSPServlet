package com.rclass.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rclass.board.model.service.BoardService;
import com.rclass.board.model.vo.Board;
import com.rclass.board.model.vo.BoardComment;

/**
 * Servlet implementation class BoardViewEndServlet
 */

@WebServlet("/board/boardView")
public class BoardViewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardViewEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("no"));
		
		Cookie[] cookies = request.getCookies();
		String boardCookieVal = "";
		boolean hasRead = false;
		
		// 원하는 쿠키가 없다면? 읽지않았다.
		if (cookies != null) {
			
			output : for (Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				// key값이 boardCookie인 경우
				if ("boardCookie".equals(name)) {
					boardCookieVal = value;
					if (value.contains("|" + boardNo + "|")) {
						hasRead = true;
						break output;
					}
				}
			}
		}
		
		// boardCookie를 세팅
		if (!hasRead) {
			// 브라우저가 닫히거나 세션이 종료되었을 때 쿠키 삭제
			Cookie c = new Cookie("boardCookie", boardCookieVal + "|" + boardNo + "|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		// hasRead true이면 조회수 증가, false이면 유지
		Board b = new BoardService().selectOne(boardNo, hasRead);
		if (b != null) { 
			List<BoardComment> list = new BoardService().selectCommentAll(boardNo);
		}
		request.setAttribute("board", b);
		request.getRequestDispatcher("/views/board/boardView2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
