<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "신재민 호빵씨";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<style>
	ul {
		list-style-type:none;
	}
	
	li {
		display: inline;
	}
</style>
</head>
<body>
	<header>
		<%-- <h3><%=request.getParameter("title")%></h3> --%>
		<h3>${param.title} </h3>
		<ul>
			<li>메인메뉴</li>
			<li>게시판</li>
			<li><a href="gallary.jsp">갤러리</a></li>
		</ul>
	</header>
</body>
</html>