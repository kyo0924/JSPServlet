package com.jquery.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.jquery.model.vo.User;

/**
 * Servlet implementation class AjaxJsonServlet
 */
@WebServlet("/js/json.do")
public class AjaxJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxJsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		int index = Integer.parseInt(request.getParameter("index"));
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("name", "유병승");
		jsonobj.put("height", new Double(180.5));
		jsonobj.put("weight", 35.5);
		jsonobj.put("iq", new Integer(50));
//		jsonobj.put("user", new User(1, "user01", "유저", "컴퓨터"));
		
		// 객체배열 넘기기
		List<User> list = new ArrayList();
		list.add(new User(1, "pp", "유병승", "경기도 시흥"));
		list.add(new User(2, "ll", "이일교", "서울시 노원구"));
		list.add(new User(3, "kk", "김지섭", "경기도 파주"));
		list.add(new User(4, "yy", "이영우", "서울시 동작구"));
		
		User u = new User(5, URLEncoder.encode("유병승", "UTF-8"), "유병승", "전세계");
		/*
		JSONArray jarr = new JSONArray();
		
		for (User u : list) {
			
			JSONObject jo = new JSONObject();
			jo.put("userNo", u.getUserNo());
			jo.put("userId", u.getUserId());
			jo.put("userName", u.getUserName());
			jo.put("userAddr", u.getUserAddr());
			if (u.getUserNo() == index) {
				jarr.add(jo);
			}
			
		}
		
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().println(jarr);*/
		response.setContentType("application/json;charset=UTF-8");
//		new Gson().toJson(list, response.getWriter());
		new Gson().toJson(u, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
