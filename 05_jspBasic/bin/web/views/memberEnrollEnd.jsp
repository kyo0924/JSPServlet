<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String email=request.getParameter("email");
	String address=request.getParameter("address");
	request.setAttribute("msg", id+"님 회원가입을 축하드립니다.");
	request.setAttribute("id",id);
	request.setAttribute("pw",pw);
	request.setAttribute("email",email);
	request.setAttribute("address",address);
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","student","student");
	PreparedStatement pstmt=conn.prepareStatement("select * from member where member_id=?");
	pstmt.setString(1,id);
	ResultSet rs=pstmt.executeQuery();
	ArrayList member=new ArrayList();
	if(rs.next())
	{
		member.add(rs.getString("member_id"));
		member.add(rs.getString("member_pwd"));
		member.add(rs.getString("member_name"));
		member.add(rs.getString("email"));
		member.add(rs.getString("gender"));
	}
	session.setAttribute("id", id);
	request.setAttribute("member", member);
	RequestDispatcher rd=request.getRequestDispatcher("/views/memberView.jsp");
	rd.forward(request, response);
%>









