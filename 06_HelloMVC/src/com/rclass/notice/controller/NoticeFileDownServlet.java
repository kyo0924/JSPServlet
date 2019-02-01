package com.rclass.notice.controller;

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
 * Servlet implementation class NoticeFileDownServlet
 */
@WebServlet("/notice/noticeFileDownload")
public class NoticeFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = request.getParameter("fname");
		
		/* 
		 	1. 실제파일의 저장경로를 불러오기
		 	2. 파일입출력 스트림 생성(input, out(servlet))
		 	3. 브라우저에 따른 파일명 처리(인코딩) * 한글
		 	4. response.header에 content-type:application/octet-stream, content-Disposition:attachment; filename=파일명
		 	5. 파일을 outputstream write하면 됨
		 */
		
		// 1. 실제 파일 저장 경로 가져오기
		String dir = getServletContext().getRealPath("/upload/notice");
		
		// 2. 입출력스트림 생성하기
		// 파일과 연결
		File downFile = new File(dir + "/" + fname);
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
		// 서버에 있는 파일을 RAM으로 전송! 올림! RAM과 연결지음 서버에 있는 하드와 RAM 연결
		// InputStream으로 서버의 하드에 있는 파일을 RAM으로 읽어들인 뒤에 OutputStream으로 클라이언트에 출력
		
		// 보낼 스트림 작성 (outputStream) stream 정보 어느 스트림에 보내야하는지 서버의 RAM와 클라이언트의 네트워크 카드 연결
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		// 보낼 클라이언트에 스트림 연결!
		
		// 3. 한글파일을 위한 파일명 분기 처리 (깨지는거 방지)
		String resFileName = "";
		// micro soft internet explorer 호환
		boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != - 1;
	
		if (isMSIE) {
			resFileName = URLEncoder.encode(fname, "UTF-8").replaceAll("\\", "%20");  // 공백을 +로 표시하는 것이 존재
		} else {
			// 한글 파일 깨지는 것 방지 UTF-8, ISO-8859-1
			resFileName = new String(fname.getBytes("UTF-8"),"ISO-8859-1");
		}
		
		// 4. 헤더 세팅
		// setContentType(text/html)
		// octec-stream : 특정한 파일 의미
		response.setContentType("application/octet-stream");
//		response.setHeader("Content-Disposition", "attachment;filename=" + resFileName);
		response.setHeader("Content-Disposition", "inline;filename=" + resFileName);
		
		// 5. 파일 보내주기!
		int read = -1;
		// bis에서 읽은 것 bos로 넘김, 버퍼만큼 쌓인 후 보냄
		while ((read = bis.read()) != - 1) {
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
