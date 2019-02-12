package com.jquery.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jquery.model.vo.Member;


/**
 * Servlet implementation class AjaxHtmlServlet
 */
@WebServlet("/js/html.do")
public class AjaxHtmlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxHtmlServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Member> list = new ArrayList();
		list.add(new Member("박보검","01045639764", "parkBogum.jpg"));
		list.add(new Member("쥴리아로버츠", "010123444364", "juliaRoberts.jpg"));
		list.add(new Member("맷 데이먼", "01012234232", "mattDamon.jpg"));
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
