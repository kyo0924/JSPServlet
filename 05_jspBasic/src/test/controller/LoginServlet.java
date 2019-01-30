package test.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.model.MemberDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("LoginServlet");
		String result = new MemberDao().selectOne(id, pw);
		String view = "";
		if(result.equals("ok")) {
			view = "/views/mainPage.jsp";
		} else {
			// 로그인 실패시 메세지 띄워주는 뷰로 이동
			view = "/views/common/msg.jsp";
			String msg = "";
			String loc = "/views/login.jsp";
			if (result.equals("idFail")) {
				msg = "아이디가 일치하지않습니다.";
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/error.jsp").e;
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
