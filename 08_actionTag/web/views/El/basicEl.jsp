<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El 간단한 표현</title>
</head>
<% 
	String name = "유병승";
	int age = 19;
	int su1 = 100;
	int su2 = 100;
	request.setAttribute("name", name);
	request.setAttribute("su1", su1);
	request.setAttribute("su2", su2);
%>
<body>
	<%--내장 객체의 name 순회  ${name}--%>
	<p>${name}</p>
	<p><%=request.getAttribute("name") %></p>
	<p>처음 숫자 : ${su1 }</p>
	<p>두번째 숫자 : ${su2 }</p>
	<h2>EL연산</h2>
	<h4>더하기 : ${su1 + su2}</h4>
	<h4>빼기 : ${su1 - su2}</h4>
	<h4>나누기 : ${su1 div su2}</h4>
	<h4>곱하기 : ${su1 * su2}</h4>
	<h4>나머지 : ${su1 mod su2}</h4>
	<h4>대소비교 : ${su1 > 10 and su2 > 100000}</h4>
	<h4>대소비교 : ${su1 > 10 && su2 > 100000}</h4>
	<h4>대소비교 : ${su1 > 10 or su2 > 100000}</h4>
	<h4>대소비교 : ${su1 > 10 || su2 > 100000}</h4>
	<h4>대소비교 : ${su1 lt 10 || su2 lt 100000}</h4>
	<h4>대소비교 : ${su1 gt 10 || su2 gt 100000}</h4>
	<h4>${not empty address }</h4>
	<h4>${address != null}</h4>
	<h4>${not empty name}</h4>
	<h4>${su1 == su2}</h4>
	<h4>${su1 eq su2}</h4>
	<input type="text" value="${name }"/>
	<a href="${pageContext.request.contextPath }/elTest.do">ElTest</a>
</body>
</html>