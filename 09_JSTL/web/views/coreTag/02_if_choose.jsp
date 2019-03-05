<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>c:if사용해보자</h2>
	<p>조건문을 의미함, 속성은 test, test에는 비교, 진위여부를 판단하는 값이 들어감
		var test의 결과값을 저장하는 변수
	</p>
	<c:if test="${19 < 20 }" var="result">
		<h1>이거 나오니?</h1>
		${result }
	</c:if>
	<h2>전송받은 값 출력</h2>
	<c:out value = "${param.product}"/>
	<c:set var="value" value="${param.product }"/>
	<c:if test="${value== '핸드폰' }">
		<h3>아이뽀</h3>
	</c:if>
	<c:if test="${value == '컴퓨터' }">
		<h3>컴퓨터</h3>
	</c:if>
	<c:if test="${param.product == '책' }">
		<h3>책!</h3>
	</c:if>
	<c:if test="${param.product == '차' }">
		<h3>차</h3>
	</c:if>
	<h3>choose문</h3>
	<c:set var="color" value="${param.color }"/>
	<!-- 앞에 것이 true이면 뒤에꺼는 안봄. if else문 처럼 처리됨 -->
	<c:choose>
		<c:when test="${6 > 5}">
			<span style="color:red">빨강</span>
		</c:when>
		<c:when test="${color=='blue'}">
			<span style="color:blue">파랑</span>
		</c:when>
		<c:when test="${color=='yellow'}">
			<span style="color:yellow">노랑</span>
		</c:when>
		<c:otherwise>
			<span style="color:hotpink">없슈</span>
		</c:otherwise>
	</c:choose>
</body>
</html>