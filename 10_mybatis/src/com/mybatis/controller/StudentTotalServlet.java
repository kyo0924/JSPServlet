package com.mybatis.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mybatis.model.service.MybatisService;
import com.mybatis.model.service.MybatisServiceImpl;

/**
 * Servlet implementation class StudentTotalServlet
 */
@WebServlet("/student/total.do")
public class StudentTotalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private MybatisService service = new MybatisServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentTotalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		List<Rstudent> list = service.selectTotal();
		// resultMap 이용
		List list = service.selectTotal();
//		List<Map<String, String>> list = service.selectTotalMap();
		System.out.println(list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/student/selectList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
