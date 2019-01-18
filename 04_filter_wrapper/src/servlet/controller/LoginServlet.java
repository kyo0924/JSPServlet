package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.model.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/login.do")
//@WebServlet(name="FilterTestServlet", urlPatterns="/filter.do")
@WebServlet(name="LoginServlet", urlPatterns="/login.do")
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
		//클라이언트가 보낸 값을 확인/저장
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		System.out.println("id : " + id + " / pw : " + pw);
		
		//비지니스로직처리
		//로그인 처리 : DB테이블에 id와 password가 있는지 확인
		// 있으면 로그인 메세지 출력, 없으면 로그인 실패 메세지 출력
		String flag = new MemberService().selectId(id, pw);
		System.out.println(flag);
		
		//응답페이지 작성
//		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.write("<html>");
		out.write("<body>");
		
		if (flag.equals("ok")) {
			out.write("<h1>" + id + "님 로그인하신 것을 환영합니다</h1>");
		} else {
			if (flag.equals("passFail")) {
				out.write("<h1>" + id + "님 패스워드가 일치하지 않습니다.");
				out.write("<br>");
			} else {
				out.write("<h1><span style='color:red;font-size:30px;'>아이디</span>가 일치하지 않습니다</h1>");
			}
			out.write("<a href='index.html'>메인화면</a>");
		}
		out.write("</body>");
		out.write("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
