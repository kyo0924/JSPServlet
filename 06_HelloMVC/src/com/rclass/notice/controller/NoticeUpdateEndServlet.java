package com.rclass.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.rclass.notice.model.service.NoticeService;
import com.rclass.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateEndServlet
 */
@WebServlet("/notice/updateEnd")
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "공지사항 수정 오류!");
			request.setAttribute("loc", "/notice/noticeList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String root = getServletContext().getRealPath("/");
//		dir += "upload/notice";
		String filePath = root + File.separator + "upload" + File.separator + "notice";
		int maxSize = 1024 * 1024 * 10;
		
		MultipartRequest mr = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content = mr.getParameter("content");
		String file = mr.getFilesystemName("up_file");
		
		Notice n = new Notice();
		n.setNoticeNo(Integer.parseInt(mr.getParameter("no")));
		n.setNoticeTitle(title);
		n.setNoticeWriter(writer);
		n.setNoticeContent(content);
		
		/* 
		 status만 바꾸고 안보이기, 실제로 삭제
		 * */
		String fileName = mr.getFilesystemName("up_file");
		File f = mr.getFile("up_file");
		if (f != null && f.length() > 0) {
			
			File deleFile = new File(filePath + "/" + mr.getParameter("old_file"));
			boolean deleteResult = deleFile.delete();
			System.out.println(deleteResult? "삭제 성공" : "삭제 실패");
		} else {
			fileName = mr.getParameter("old_file");
		}
		
		n.setFilePath(fileName);
		
		String msg = "";
		String view = "/views/common/msg.jsp";
		String loc = "/notice/noticeView?noticeno=" + mr.getParameter("no");
		
		int result = new NoticeService().updateNotice(n);
		if (result > 0) {
			msg = "수정성공";
		} else {
			msg = "수정실패";
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
