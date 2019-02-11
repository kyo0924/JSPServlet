package com.jquery.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jquery.model.dao.AjaxDao;

/**
 * Servlet implementation class AjaxDataServlet
 */
@WebServlet("/js/data.do")
public class AjaxDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String search = request.getParameter("search");
		System.out.println(search);
		
		List<String> isList;
		String csv = "";
		// search 창이 비어있지 않을때, csv 방식으로 파싱처리
		if (!search.trim().isEmpty()) {
			isList = new AjaxDao().selectId(search);
			if (isList.size() > 0) {
				for (int i = 0; i < isList.size(); i++) {
					if (i != 0)
						csv += ",";
					csv += isList.get(i);
				}
			}
		}
		System.out.println("csv : " + csv);
		response.setContentType("text/csv;charset=UTF-8");
		response.getWriter().append(csv);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
