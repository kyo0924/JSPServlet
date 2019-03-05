<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<%request.setCharacterEncoding("UTF-8"); %>
<body>
	<h2>주문내역</h2>
	상품명 : ${param.pname }<br/>
	수량 : ${param.count }<br/>
	<%--중복된 이름으로 저장된 데이터 : paramValues --%>
	옵션1 : ${paramValues.option[0] }<br/>
	옵션2 : ${paramValues.option[1] }<br/>
	
</body>
</html>