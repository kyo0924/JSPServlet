<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문 사용하기</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%request.setCharacterEncoding("UTF-8"); %>
</head>
<style>
table, tr, td {
	border: 1px solid black;
	
}
</style>
<body>
	<h2>forEach문 활용</h2>
	<p>일반적인 반복문을 의미한다.
	속성 : var, items, varStatus 
	var : items에 있는 0번 인덱스의 값부터 차례대로 값을 var에 보관
	items : 컬렉션, 배열 넣는곳, EL로 값을 넣는다.
	varStatus : 반복문에 대한 정보를 보관하는 객체
		index : 접근한 인덱스값(0 ~ ...), 
		count : 반복한 횟수(1 ~ ...), 
		last : 현재 반복이 마지막일 때(boolean), 
		first : 현재 반복이 처음일때(boolean), 
		current : 현재 반복 횟수
	</p>
	${paramValues.hobby[0] }
	${paramValues.hobby[1] }
	<c:forEach var="h" items="${paramValues.hobby }">
		<c:choose>
			<c:when test="${h == '게임' }">
				<p>${h }은 재밌어요</p>
			</c:when>
			<c:when test="${h == '승마' }">
				<p>${h }는 무서워요</p>
			</c:when>
			<c:when test="${h == '펜싱' }">
				<p>${h }은 집중력이 중요해요</p>
			</c:when>
			<c:when test="${h == '코딩' }">
				<p>${h }은 즐거워요</p>
			</c:when>
		</c:choose>
	</c:forEach>
	
	<h1>순서대로 출력하기</h1>
	<c:forEach var="val" begin="5" end="10" step="2" varStatus="vs">
		<span>${vs.first}/ ${vs.last} / ${val } / 인덱스 ${vs.index } / count ${vs.count }</span><br>
		<span>${val }<c:if test="${not vs.last }">,</c:if></span>
	</c:forEach>
	
	<h2>객체를 활용하여 반복문 쓰기</h2>
	<%@ page import="java.util.*, com.kh.model.vo.Person" %>
	<% 
		List<Person> list = new ArrayList();
		list.add(new Person("유병승", 19, "경기도 시흥시"));
		list.add(new Person("김지섭", 29, "경기도 파주시"));
		list.add(new Person("이정복", 26, "중계동"));
		list.add(new Person("임지안", 18, "성북구"));
		request.setAttribute("list", list);
		String[] stars={"유병승", "원빈", "장동건", "정우성", "김미리", "태연", "김준현"};
		request.setAttribute("stars", stars);
	%>
	<c:forEach var="p" items="${list }" varStatus="vs">
		<%-- <p>${vs.count } ${p.name } ${p.age } ${p.address }</p> --%>
		<h${vs.count }>${vs.count } ${p.name } ${p.age } ${p.address }</h${vs.count}>
	</c:forEach>
	<c:forEach var="i" begin="0" end="5" varStatus="vs">
		<h${vs.count }>${stars[i]}</h${vs.count}>
	</c:forEach>
	list에 있는 값을 테이블 넣기!
	<table id="member">
	<c:forEach var="i" begin="0" end="${list.size() - 1}" varStatus="vs">
		<tr>
			<td>${list[i].name }</td>
			<td>${list[i].age }</td>
			<td>${list[i].address }</td>
		</tr>
	</c:forEach>
	</table>
	<h1>forTokens</h1>
	<%
		String name = "유병승, 청하, 이나영, 권민아, 장미란";
		request.setAttribute("name", name);
	%>
	<c:forTokens var="name" items="${name }" delims=",">
		<h4>${name }</h4>
	</c:forTokens>
	
	<c:forTokens var="name" items="자바| C, C#| javascript, jsp" delims=",|">
		<h4>${name }</h4>
	</c:forTokens>
</body>
</html>