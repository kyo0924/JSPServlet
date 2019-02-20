package com.jquery.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class AjaxFileUploadServlet
 */
@WebServlet("/ajaxFile")
public class AjaxFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("/index.jsp");
			return;
		}
		// 저장 경로
		String dir = getServletContext().getRealPath("/upload/ajax");
		int maxSize = 1024 * 1024 * 1024;
		
		MultipartRequest mr = new MultipartRequest(request, dir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		// DB 로직 구성~!
		/*System.out.println(mr.getFilesystemName("test1"));
		System.out.println(mr.getFilesystemName("test2"));*/
		Enumeration e = mr.getFileNames();
		List<String> fileNames = new ArrayList();
		while(e.hasMoreElements()) {
			fileNames.add(mr.getFilesystemName((String) e.nextElement()));
		}
		System.out.println(fileNames);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
