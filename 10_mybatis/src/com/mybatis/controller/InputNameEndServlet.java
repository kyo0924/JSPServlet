package com.mybatis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mybatis.model.service.MybatisService;
import com.mybatis.model.service.MybatisServiceImpl;

/**
 * Servlet implementation class InputNameEndServlet
 */
@WebServlet("/inputNameEnd.do")
public class InputNameEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private MybatisService service = new MybatisServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputNameEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name= request.getParameter("name");
		int result = service.insertStudent(name);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().append(result > 0 ? "입력완료" : "입력실패");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
