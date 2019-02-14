package com.rclass.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardFileDownloadServelt
 */
@WebServlet("/board/boardFileDownload2")
public class BoardFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rName = request.getParameter("rName");
		String oName = request.getParameter("oName");
		
		// 서버에 저장되어있는 첨부파일의 경로 가져오기 : 프로젝트 절대 경로 + /upload/board/
		// C:/Users/abc95/git/JSPServlet/06_HelloMVC/web/upload/board/
		/* 
		Gets the real path corresponding to the given virtual path. 
		For example, if path is equal to /index.html,this method will return the absolute 
		file path on the server's filesystem to which a request of the form 
		http: // <host>: <port> / <contextPath> /index.html would be mapped,
		 */
	
		String saveDir = getServletContext().getRealPath("/upload/board/");
		System.out.println(saveDir);
		File downFile = new File(saveDir + rName);
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		
		// 브라우저 별 인코딩 처리
		String resFileName = "";
		boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1;
		
		if (isMSIE) {
			resFileName = URLEncoder.encode(oName, "UTF-8");
			resFileName = resFileName.replaceAll("\\s", "%20");
		} else {
			resFileName = new String(oName.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + resFileName);
		
		int read = -1;
		while ((read = bis.read()) != -1) {
			bos.write(read);
		}
		bos.close();
		bis.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
