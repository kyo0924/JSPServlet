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
public class BoardFileDownloadServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFileDownloadServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rName = request.getParameter("rName");
		String oName = request.getParameter("oName");
		
		// 디렉토리
		String saveDir = getServletContext().getRealPath("/upload/board/");
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
