<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h2>c:import</h2>
	<p>페이지를 불러오는것 -----------> jsp:include 
	c:import : 변수에 불러오는 페이지를 저장하고 그걸 EL 호출해서
	속성 : var(저장변수명), url(페이지주소)
	페이지를 불러올 때 불러오는 페이지에 값을 전달할 수 있음
	</p>
	<c:import var="sum" url="http://localhost:9090/08_actionTag/views/forward/result.jsp">
		
		<c:param name="age" value="100"/>
		<c:param name="gender" value="남"/>
	</c:import>
	${sum }
	
	<h1>1</h1>
	<h1>2</h1>
	${sum }
	<h1>3</h1>
	<h1>4</h1>
	<h1>5</h1>
	<c:set var="img" value="https://cdn.pixabay.com/photo/2018/12/09/07/36/city-3864462__340.jpg"/>
	<img src="${img }" width="200" height="200"/>
	<c:url var="img2" value="https://cdn.pixabay.com/photo/2018/12/09/07/36/city-3864462__340.jpg"/>
	<img src="${img2 }" width="200" height="200"/>
	
	<c:set var="search" value="https://search.naver.com/search.naver?query=왕찬웅"/>
	<a href="${search }">왕찬웅</a>
	<c:url var="search2" value="https://search.naver.com/search.naver">
		<c param name="query" value="권민아"/>
	</c:url>
	<a href="${search2 }">네이버검색</a>
</body>
</html>