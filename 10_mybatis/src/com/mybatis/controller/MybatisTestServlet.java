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
 * Servlet implementation class MybatisTestServlet
 */
@WebServlet("/mybatis.do")
public class MybatisTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private MybatisService service = new MybatisServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MybatisTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = service.insertStudent();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().append(result > 0 ? "입력 성공" : "입력 실패");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
