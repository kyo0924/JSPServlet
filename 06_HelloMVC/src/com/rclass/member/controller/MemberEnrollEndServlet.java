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
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet("/memberEnrollEnd")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		new Member(userId, password, userName, gender, age, email, phone, address, hobby, enrollDate)
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String userName  = request.getParameter("userName");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
//		String hobby = request.getParameter("hobby");
		String[] hobbys = request.getParameterValues("hobby");
		String hobby = String.join(",", hobbys);
//		if (hobbys != null) {
//			for (String hobbyName : hobbys) {
//				hobby += hobbyName + " ";
//				System.out.println(hobby);
//			}
//		}
		Member m = new Member(userId, password, userName, gender, age, email, phone, address, hobby, null);
		int result = new MemberService().insertMember(m);
		
		String msg = "";
		String loc = "";
		String view = "/views/common/msg.jsp";
		
		if (result > 0) {
			msg = "회원가입에 성공하였습니다";
			loc = "";
		} else {
			msg = "회원가입 실패";
			loc = "/views/member/memberEnroll.jsp";
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
