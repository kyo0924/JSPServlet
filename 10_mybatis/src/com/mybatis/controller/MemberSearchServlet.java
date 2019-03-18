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

//이름으로 검색하는 서블릿

/**
 * Servlet implementation class MemberSearchServlet
 */
@WebServlet("/member/memberSearch.do")
public class MemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MybatisService service = new MybatisServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword=request.getParameter("keyword");
		
		//이름으로 검색했을 땐 하나일수도 있고 여러개 0개 일수도 있는데 무조건 다수로 생각해서 로직을 구현하자 = list
		List<Map> list = service.memberSearch(keyword);
		
		System.out.println(list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/student/memberAllMap.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
