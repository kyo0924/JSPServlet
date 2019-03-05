<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="02_if_choose.jsp" method="post">
	<select name="product">
		<option value="핸드폰">아이뻐</option>
		<option value="컴퓨터">컴퓨터</option>
		<option value="책">책</option>
		<option value="차">차</option>
	</select>
	<input type="radio" name="color" value="red"/>빨강
	<input type="radio" name="color" value="blue"/>파랑
	<input type="radio" name="color" value="yellow"/>노랑
	<input type="submit" value="제출"/>
</form>
	<form action="03_forEach.jsp" method="post">
		<input type="checkbox" name="hobby" value="게임">게임
		<input type="checkbox" name="hobby" value="코딩">코딩
		<input type="checkbox" name="hobby" value="펜싱">펜싱
		<input type="checkbox" name="hobby" value="승마">승마
		<input type="submit" value="제출"/>
	</form>
</body>
</html>