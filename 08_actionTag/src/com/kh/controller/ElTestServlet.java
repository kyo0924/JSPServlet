package com.kh.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.model.vo.Person;

/**
 * Servlet implementation class ElTestServlet
 */
@WebServlet("/elTest.do")
public class ElTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("name", "신재민");
		request.setAttribute("level", "브론즈");
		request.setAttribute("character", "호빵맨");
		request.setAttribute("exp", 10000);
		List<Person> list = new ArrayList();
		list.add(new Person("이일교", 31, "노원구"));
		list.add(new Person("신재민", 27, "동대문"));
		list.add(new Person("박진우", 27, "남양주"));
		list.add(new Person("한혜진", 26, "노량진"));
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/El/elView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
