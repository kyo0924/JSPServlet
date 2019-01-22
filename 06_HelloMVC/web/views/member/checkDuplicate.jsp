<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isAble = (boolean) request.getAttribute("isAble");
	String userId = (String) request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<style>
	div#checkid-container{text-align:center; padding-top:50px;}
	span#duplicated{color: red; font-weight: bold;}
</style>
</head>
<body>
	<div id="checkid-container">
		<% if (isAble) { %>
		[<span><%=userId %></span>]는 사용가능합니다.
		<% } else { %>
		[<span id="duplicated"><%=userId %></span>]는 사용 불가능합니다.
		<%} %>
	</div>
</body>
</html>