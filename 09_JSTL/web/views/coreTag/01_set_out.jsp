<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core태그 이용하여 출력, 값 넣기</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h3>c:out태그를 이용하여 출력할 수 있음 속성으로는 value가 있으며, value에 있는 값을 출력해주는 기능/ value에는 "리터럴값" 또는 EL표현식이 들어갈 수 있음</h3>
	<c:out value="JSTL은 처음이지?"/>
	jstl은 처음이지?
	<%--core 태그는 속성에 특정 값을 넣어서 처리하도록 되어있음 --%>
	<%-- <c:out>여기에 써도 되니</c:out> --%>
	<h1><c:out value="태그 적용해보자"/></h1>
	<!-- value안의 값을 무조건 문자열로 인식 -->
	<c:out value="<h2>value안 태그적용</h2>"/>
	<!-- escape xml : xml을 읽어들이는 것을 escape(피함) : false일 경우 xml태그 피하지 않고 읽어들임 기본적으로 escapeXml = 'true' -->
	<c:out value="<h2>value안 태그적용</h2>" escapeXml="false" />
	<c:out value="<h2>value안 태그적용</h2>" escapeXml="true" />
	<% request.setAttribute("name", "권민아"); %>
	<c:out value="<span style='color:green'> ${name }</span>" escapeXml="false"/>
	<c:set var="hobby" value="게임"/>
	<c:out value="${hobby }"/>
	<h3>출력의 예외처리 default</h3>
	<c:set var="address" value="서울강남!"/>
	<!-- value에 값이 있으면 value의 값 없으면 default의 값 출력-->
	<c:out value="${address}" default="경기도 시흥시"/>
	
	<h2>값 넣기!</h2>
	<c:set var="p" value='<%=new com.kh.model.vo.Person("김동현", 26, "서대문구") %>'/>
	<h3><c:out value="${p.name }"/></h3>
	<h2><c:out value="${p.age }"/></h2>
	<h1><c:out value="${p.address }"/></h1>
	<c:set var="result" value="${20 < 30}"/>
	<c:set var="result" value="${hobby eq name }"/>
	${result }
	<c:set var="age" value="19" scope="request"/>
	<c:set var="age" value="27" scope="session"/>
	${requestScope.age }
	${sessionScope.age }
	
	<c:set target="${p }" property="name" value="이정복"/>
	${p.name }
	<h2>저장된 값을 지우기</h2>
	${age } <!-- 19 -->
	<!-- scope 영역 설정 시 해당 영역만 지울 수 있음 -->
	<c:remove var="age" scope="request"/>
	${age }
</body>
</html>