package com.rclass.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rclass.member.model.service.MemberService;
import com.rclass.member.vo.Member;

/**
 * Servlet implementation class MemberUpdateEndServlet
 */
//@WebServlet("/memberUpdateEnd")
@WebServlet(name="MemberUpdateEndServlet", urlPatterns="/memberUpdateEnd")
public class MemberUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String userName = request.getParameter("userName");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String hobby = "";
		String[] hobbys = request.getParameterValues("hobby");
		if (hobbys != null) {
			hobby = String.join(",", hobbys);
		}
		Member m = new Member();
		m.setUserId(userId);
		m.setPassword(password);
		m.setUserName(userName);
		m.setAge(age);
		m.setEmail(email);
		m.setPhone(phone);
		m.setGender(gender);
		m.setAddress(address);
		m.setHobby(hobby);
		int result = new MemberService().updateMember(m);
		String msg = "";
		String loc = "";
		String view = "/views/common/msg.jsp";
		if (result > 0) {
			msg = "회원정보수정 완료";
			view = "";
			
		} else {
			msg = "회원정보수정 실패";
			// Member m을 이용하여 참조하는 코드가 있는데 받아오는 값이 없어서 nullpointererror
			loc = "/updateMember?userId=" + userId;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
