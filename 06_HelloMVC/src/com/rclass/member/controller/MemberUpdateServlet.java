package com.rclass.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rclass.member.model.service.MemberService;
import com.rclass.member.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
//@WebServlet(name="LoginServlet", urlPatterns="/login")
//@WebServlet("/memberUpdate")
@WebServlet(name="MemberUpdateServlet", urlPatterns="/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
//		String userId = request.getParameter("userId");
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String userId = loginMember.getUserId();
		System.out.println("UpdateServlet userId : " + userId);
		String password = request.getParameter("password");
		String userName  = request.getParameter("userName");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String[] hobbys = request.getParameterValues("hobby");
		String hobby = "";
		if (hobbys != null) {
			hobby = String.join(",", hobbys);
		}
		Member m = new Member(userId, password, userName, gender, age, email, phone, address, hobby, null);
		int result = new MemberService().updateMember(m);
		if (result > 0) {
			System.out.println("업데이트 성공 : " + result);
			session.removeAttribute("loginMember");
			session.setAttribute("loginMember", loginMember);
		}
		else
			System.out.println("업데이트 실패 : " + result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
