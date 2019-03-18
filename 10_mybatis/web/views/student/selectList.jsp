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

	<table>
			<c:if test="${not empty list }">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>주소</th>
					<th>등록일</th>
				</tr>
				<c:forEach var="map" items="${list}">
				<tr>
					<td>${map['studentNo'] }</td>
					<td>${map['studentName'] }</td>
					<td>${map['studentTel'] }</td>
					<td>${map['studentEmail'] }</td>
					<td>${map['studentAddr'] }</td>
					<td>${map['reg_date'] }</td>
					<!-- 오라클 컬럼명 대문자로 반환하기 때문에 가져올 때 key를 대문자로 주어야 -->
					<%-- <td>${map['STUDENT_NO'] }</td>
					<td>${map['STUDENT_NAME'] }</td>
					<td>${map['STUDENT_TEL'] }</td>
					<td>${map['STUDENT_EMAIL'] }</td>
					<td>${map['STUDENT_ADDR'] }</td>
					<td>${map['REG_DATE'] }</td> --%>
				</tr>
				</c:forEach>
			</c:if>
	</table>
			
</body>
</html>