<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form action="paramEnd.jsp" method="post">
		제품명<input type="text" name="pname">
		수량<input type="number" name="count">
		옵션1<input type="text" name="option">
		옵션2<input type="text" name="option">
		<input type="submit" value="주문"/>
	</form>
</body>
</html>