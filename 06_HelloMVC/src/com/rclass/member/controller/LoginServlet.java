package com.rclass.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rclass.member.model.service.MemberService;
import com.rclass.member.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet", urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 로그인을 처리하는 컨트롤러
		// 사용자가 보낸값을 받아오기
		String id = request.getParameter("userId");
		String pw = request.getParameter("password");
		System.out.println(id + pw);
		Member m = new Member();
		m.setUserId(id);
		m.setPassword(pw);
		
		// 비지니스 로직
		Member result = new MemberService().selectOne(m);
		String msg = "";
		String loc = "/";
		String view = "/views/common/msg.jsp";
		
		if (result != null) {
			// 아이디는 존재
			if (result.getPassword().equals(pw)) {
				// 로그인 성공
				msg = "로그인 성공!";
				// 로그인 성공했기 때문에 session에 값을 넣으면 됨.
				HttpSession session = request.getSession();
				// request.getSession(매개변수) <== true, false;
				// true : 세션이 있으면 그 세션을 가져오고 세션이 없으면 생성해서 가져옴
				// false : 세션이 있으면 그 세션을 가져오고 없으면 안가져옴.
				// default : true;
				session.setAttribute("loginMember", result);
//				session.setMaxInactiveInterval(10);
				
				// 아이디 저장 로직 구현 Cookie 이용
				String saveId = request.getParameter("saveId");
				System.out.println(saveId); // checked : on, not checked : null
				if (saveId != null) { // 체크가 되어있으면
					Cookie c = new Cookie("saveId", id);
					c.setMaxAge(7 * 24 * 60 * 60); // 7일
					response.addCookie(c);
				} else {
					// key : value 형식 map과 같음, key값 중복 불가, 동일한 key일 경우 기존의 값에 나중 값을 덮어씌움
//					Cookie c = new Cookie("saveId", "test");
					Cookie c = new Cookie("saveId", id);
					c.setMaxAge(0);
					response.addCookie(c);
				}
			} else {
				// 비밀번호 불일치
				msg = "비밀번호가 일치하지 않습니다.";
			}
		} else {
			// 아이디 없음!
			msg = "아이디가 존재하지 않습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
