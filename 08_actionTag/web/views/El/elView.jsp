<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>이름</th>
			<th>레벨</th>
			<th>캐릭터</th>
			<th>경험치</th>
		</tr>
		<tr>
			<td>${name }</td>
			<td>${level }</td>
			<td>${character }</td>
			<td>${exp }</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>주소</th>
		</tr>
		<tr>
			<td>${list.get(0)["name"] }</td>
			<td>${list.get(0)["age"] }</td>
			<td>${list.get(0)["address"] }</td>
		</tr>
	</table>
	<h1>${list }</h1>
</body>
</html>