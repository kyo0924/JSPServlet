<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/inputStudentEnd.do" method="post" >
		이름 : <input type="text" name="memberId"/> <br>
		비밀번호: <input type="password" name="memberPwd"/><br>
		비밀번호 확인: <input type="password" id="pwdCk"/><br>
		이름<input type="text" name="memberName"/><br>
		성별
		<input type="radio" value="M" name="gender"/>남
		<input type="radio" value="F" name="gender"/>여
		<br>
		나이 <input type="number" name="age"/><br>
		이메일 <input type="email" name="email"/><br>
		전화번호 <input type="text" name="phone"/><br>
		주소 <input type="text" name="address"/><br>
		취미 <input type="text" name="hobby"/><br>
		<input type="submit" name="등록"/><br>
		
	</form>
</body>
</html>