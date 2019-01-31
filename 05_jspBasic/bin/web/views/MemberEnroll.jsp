<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/views/memberEnrollEnd.jsp" method="post">
	아이디<input type="text" name="id">
	패스워드<input type="password" name="pw">
	이메일<input type="email" name="email">
	주소<input type="text" name="address">
	<input type="submit" value="회원가입">
</form>




</body>
</html>