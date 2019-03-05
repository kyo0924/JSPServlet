<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>더한 결과는 <%=request.getAttribute("result") %></h2>
	<h3>당신의 나이는 <%=request.getParameter("age") %>이고, 성별은 <%=request.getParameter("gender")%></h3>
</body>
</html>