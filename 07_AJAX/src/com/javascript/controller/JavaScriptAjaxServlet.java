package com.javascript.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JavaScriptAjaxServlet
 */
@WebServlet("/js/test")
public class JavaScriptAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JavaScriptAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		System.out.println(name + " : " + age);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().append("<h1>전달받은 값은</h1>")
		.append("<h2>이름 : " + name + "</h2>")
		.append("<h3>나이 : " + (age + 100) + "</h3>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
