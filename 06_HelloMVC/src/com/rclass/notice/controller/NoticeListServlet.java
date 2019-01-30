package com.rclass.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rclass.notice.model.service.NoticeService;
import com.rclass.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice/noticeList")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//DB에서 데이터 불러옴!
		// Servlet -> Service(Connection) -> Dao
		
		
		
		int cPage, numPerPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage = 5;
		}
		
		// 전체 자료수 호출
		int totalContent = new NoticeService().selectCount();
		int totalPage = (int) Math.ceil((double) totalContent / numPerPage);
		List<Notice> list = new NoticeService().selectList(cPage, numPerPage);
		
		//PAGE 구현 pageBar
		String pageBar = "";
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		//pageBar 채우기
		if (pageNo == 1) {
			pageBar += "<span>[이전]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/notice/noticeList?cPage=" + (pageNo - 1) + "&numPerPage=" + numPerPage + "'>[이전]</a>";
		}
		
		// 번호구현
		while(!(pageNo > pageEnd || pageNo > totalPage)) {
			
			if (cPage == pageNo) {
				pageBar += "<span>" + pageNo + "</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/notice/noticeList?cPage=" + pageNo +"'>" + pageNo + "</a>";
			}
			pageNo++;
		}
		
		if (pageNo > totalPage) {
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/notice/noticeList?cPage=" + pageNo + "'>[다음]</a>"; 
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		// 응답view선택! 데이터 응답view에 전송
		request.getRequestDispatcher("/views/notice/noticeList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
