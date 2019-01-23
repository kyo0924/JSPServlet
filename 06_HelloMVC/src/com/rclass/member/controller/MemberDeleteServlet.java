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
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/deleteMember")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		
		int result = new MemberService().deleteMember(userId);
		String msg="";
		String loc = "";
		String view = "/views/common/msg.jsp";
		
		if (result > 0) {
			msg = "회원탈퇴성공";
			// 접속자에 대한 세션 삭제
			request.getSession(false).invalidate();
			response.sendRedirect(request.getContextPath());
		} else {
			msg = "회원탈퇴실패";
			loc = "/updateMember?userId=" + userId;
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher(view).forward(request, response);
		}
		
		/*HttpSession session = request.getSession(false);
		if (session != null) {
			Member loginMember = (Member) session.getAttribute("loginMember");
			String userId = loginMember.getUserId();
			int result = new MemberService().deleteMember(userId);
			
			session.invalidate();
			response.sendRedirect(request.getContextPath());
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
