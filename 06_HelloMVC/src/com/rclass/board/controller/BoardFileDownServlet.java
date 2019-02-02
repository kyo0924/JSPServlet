package com.rclass.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardFileDownServlet
 */
@WebServlet("/board/boardFileDownload")
public class BoardFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getParameter("fname");
		
		String root = getServletContext().getRealPath("/");
		File downFile = Paths.get(root, "upload", "board", fname).toFile();
		
		// 서버의 RAM과 하드 연결
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
		// 보낼 스트림 작성 어느 스트림에 보내야 하는지 설정, 서버의 하드에서 RAM으로 데이터를 읽어들인 뒤에 클라이언트에 출력
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		
		String encodedFilename = "";
		
		boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1;
		if (isMSIE) {
			encodedFilename = URLEncoder.encode(fname, "UTF-8").replaceAll("\\s", "%20"); // %20 : 공백
		} else {
			encodedFilename = new String(fname.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		// 헤더 세팅
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "inline;filename=" + encodedFilename);
		
		// 파일 전송
		int read = -1;
		// bis에서 읽은 것 bos로 넘김, 입출력장치와 CPU의 속도 차 조정, 버퍼만큼 쌓인 후에 보냄
		while ((read = bis.read()) != -1) {
			bos.write(read);
		}
		bis.close();
		bos.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
