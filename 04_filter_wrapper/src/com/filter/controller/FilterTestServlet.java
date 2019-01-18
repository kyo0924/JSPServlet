package com.filter.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FilterTestServlet
 */
//@WebServlet("/filter.do")
@WebServlet(name="FilterTestServlet", urlPatterns="/filter.do")
public class FilterTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(title + content);
		PrintWriter out = response.getWriter();
//		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("text/html");
		out.write("<html>");
		out.write("<body>");
		out.write("<h1 style='background-color:yellow;color:white;'>" + title + "</h1>");
		out.write("<p id='content'>" + content + "</p>");
		out.write("<button onclick='change();'>" + "실행" + "</button>");
		out.write("<script>");
		out.write("function change(){"
				+ "var content = document.getElementById('content');"
				+ "content.setAttribute('css','background-color:blue');}");
		out.write("</script>");
		out.write("</body>");
		out.write("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
