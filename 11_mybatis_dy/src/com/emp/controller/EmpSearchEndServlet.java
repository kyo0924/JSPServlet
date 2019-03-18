package com.emp.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.model.service.EmpService;
import com.emp.model.service.EmpServiceImpl;

/**
 * Servlet implementation class EmpSearchEndServlet
 */
@WebServlet("/search/empSearchEnd.do")
public class EmpSearchEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private EmpService service = new EmpServiceImpl();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpSearchEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//검색부분인데 클라이언트가 던져주는 값이 있으니 인코딩부터
		request.setCharacterEncoding("UTF-8");
		//option부분
		String searchType=request.getParameter("searchType");
		//검색어 쓰는 부분
		String keyword=request.getParameter("keyword");


		
		//parameter값을 2개를 넘길순 없다 그래서 map에 넣어서 보낸다 map은 선언할때 hashMap이나 그걸로 선언
		Map<String, Object> map = new HashMap();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("gender", request.getParameter("gender"));
		//gender같은경우는 service나 dao를 갈 필요가 없고 바로 mapper로 간다 /salary, sal도 마찬가지
		
		map.put("salary", request.getParameter("salary"));
		map.put("sal", request.getParameter("sal"));
		
		//입사일 - date는 date누른 값을 넘겨줘야되는 거고 / 
		map.put("hire_date", request.getParameter("hire_date"));
		map.put("hire_option", request.getParameter("hire_option"));
		System.out.println(map);
		
		//자료형이 다르다 job은 String배열이기 때문에  Map<String, Object> map = new HashMap();
		map.put("job", request.getParameterValues("job"));
		
		
		List<Map> list=service.selectSearch(map);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/emp/search1.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
