<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/login.do" method="post">
		<fieldset>
			<legend>로그인</legend>
			<!-- 05_jspBasic (request.getContextPath()) -->
			<!-- <form action="login.do" method="post"></form> -->
			아이디<input type="text" name="id"/>
			패스워드<input type="password" name="pw"/>
			<input type="submit" value="로그인"/>
		</fieldset>
	</form>
</body>
</html>