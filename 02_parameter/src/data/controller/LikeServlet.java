package data.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/like")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LikeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		// 클라이언트가 보낸 자료를 받아보자
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		// 라디오박스에서 보낸 자료
		String color = request.getParameter("color");
		// select에서 보낸 자료
		String animal = request.getParameter("animal");
		// checkbox에서 보낸 자료
		String[] foods = request.getParameterValues("food");
		System.out.println(name + age + color + animal + foods);
		for (String f : foods) {
			System.out.print(f + " ");
		}

		// parameter의 이름만 가져오는 메소드
		Enumeration e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String el = (String) e.nextElement();
			System.out.println(el);
			System.out.println(request.getParameter(el));
		}

		// 전체값을 가져오는 메소드 Map
		Map<String, String[]> map = request.getParameterMap();
		Set<Map.Entry<String, String[]>> key = map.entrySet();
		Iterator it = key.iterator();
		while (it.hasNext()) {
			Map.Entry<String, String[]> f = (Map.Entry<String, String[]>) it.next();
			for (String val : f.getValue()) {
				System.out.println(val);
			}
		}
		
		// 응답페이지 작성하기
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<html>");
		out.write("<body>");
		out.write("<h1>당신의 이름 " + name + "입니다.</h1>");
		out.write("<h2>당신의 나이 " + age + "살 입니다.</h3>");
		String col="";
		switch(color) {
		case "빨강": col = "red"; break;
		case "초록": col = "green"; break;
		case "검정색": col = "black"; break;
		case "흰색": col = "white"; break;
		case "라벤더": col = "lavender"; break;
		case "노랑": col = "yellow"; break;
		}
		out.write("<h4>당신이 좋아하는 색은 <span style='color:" +col + ";'>" + color + "</span></h4>");
		String src="";
		switch (animal) {
		
		case "고슴도치": src = "https://cdn.pixabay.com/photo/2016/02/22/10/06/hedgehog-1215140__340.jpg"; break;
		case "강아지": src = "https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg"; break;
		case "고양이": src = "https://image.shutterstock.com/image-photo/portrait-surprised-cat-scottish-straight-260nw-499196506.jpg"; break;
		case "하마": src = "https://cdn.pixabay.com/photo/2017/04/25/19/56/hippopotamus-2260681__340.jpg"; break;
		case "팬더": src = "https://cdn.pixabay.com/photo/2016/03/04/22/54/panda-1236875__340.jpg"; break;
		case "하늘다람쥐": src = "https://cdn.pixabay.com/photo/2017/04/17/02/30/the-sky-squirrel-2236225__340.jpg"; break;
		case "기니피그": src = "https://image.shutterstock.com/image-photo/guinea-pig-on-white-background-260nw-96136379.jpg"; break;
		}
		out.write("<h4>당신이 좋아하는 동물은 <img src='" + src + "' width='200px' height='200px'/>" + animal + "입니다 </h4>");
		String cho = "";
		for (String food : foods) {
			
			switch (food) {
			
			case "떡볶이": src = "https://cdn.pixabay.com/photo/2016/02/22/10/06/hedgehog-1215140__340.jpg"; break;
			case "순대국": src = "https://cdn.pixabay.com/photo/2016/10/31/14/55/rottweiler-1785760__340.jpg"; break;
			case "감자전": src = "https://image.shutterstock.com/image-photo/portrait-surprised-cat-scottish-straight-260nw-499196506.jpg"; break;
			case "치킨": src = "https://cdn.pixabay.com/photo/2017/04/25/19/56/hippopotamus-2260681__340.jpg"; break;
			case "곱창": src = "https://cdn.pixabay.com/photo/2016/03/04/22/54/panda-1236875__340.jpg"; break;
			case "삼겹살": src = "https://cdn.pixabay.com/photo/2017/04/17/02/30/the-sky-squirrel-2236225__340.jpg"; break;
			}
			out.write("<img src='" + src + "' width='200px' height='200px'/>");
			cho+=food + " ";
		}
		out.write("<h4>당신이 좋아하는 음식 " + cho + "</h4>");
		out.write("</body>");
		out.write("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
