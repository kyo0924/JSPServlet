package com.rclass.notice.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rclass.notice.model.service.NoticeService;
import com.rclass.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/noticeDelete")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int deleteNo = Integer.parseInt(request.getParameter("deleteNo"));
		String deleteFile = request.getParameter("deleteFile");
		Notice n = new Notice();
		n.setNoticeNo(deleteNo);
		
		String dir = getServletContext().getRealPath("/");
		String filePath = dir + File.separator + "upload" + File.separator + "notice";
		
		String msg = "";
		String loc = "";
		String view = "/views/common/msg.jsp";
		int result = new NoticeService().deleteNotice(n);
		
		if (result > 0) {
//			File deleteFile2 = new File(filePath + "/" + deleteFile);
			File deleteFile2 = Paths.get(filePath, deleteFile).toFile();
			deleteFile2.delete();
			msg = "게시물이 삭제되었습니다(Paths.get(filePath,fileName).toFile())";
			loc = "/notice/noticeList";
		} else {
			msg = "게시물 삭제 실패";
			loc = "/notice/noticeView?noticeno=" + deleteNo;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
