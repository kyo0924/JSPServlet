<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>    
<%
	String id=(String)request.getAttribute("id");
	String pw=(String)request.getAttribute("pw");
	String email=(String)request.getAttribute("email");
	String address=(String)request.getAttribute("address");
	String msg=(String)request.getAttribute("msg");
	List<String> member=(ArrayList)request.getAttribute("member");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력정보출력 view화면</title>
</head>
<body>
	<h1><%=msg %></h1>
	<h1>사용자로 입력받은 데이터</h1>
		<hr/>
		<h3>아이디는 <%=id %></h3>
		<h3>패스워드는 <%=pw %></h3>
		<h3>email은 <%=email %></h3>
		<h3>주소는 <%=address %></h3>
		<hr/>
	<h1>DB로 부터 가저온 데이터</h1>
	<ul>
		<%for(String val : member) {%>
			<li><%=val %></li>
		<%} %>
	</ul>

</body>
</html>