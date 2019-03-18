package com.mybatis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mybatis.model.service.MybatisService;
import com.mybatis.model.service.MybatisServiceImpl;
import com.mybatis.model.vo.Rstudent;

/**
 * Servlet implementation class SelectStudentSearchServlet
 */
@WebServlet("/student/selectOne.do")
public class SelectStudentSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private MybatisService service = new MybatisServiceImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectStudentSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		Rstudent s = service.selectOne(no);
//		Map map = service.selectMap(no);
//		System.out.println(map);
//		request.setAttribute("map", map);
		request.setAttribute("map", s);
		request.getRequestDispatcher("/views/student/selectOne.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
