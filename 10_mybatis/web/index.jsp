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
	<a href="${path }/mybatis.do">첫 mybatis</a>
	<a href="${path }/inputName.do">이름만 등록</a>
	<a href="${path }/inputMember.do">학생 등록</a>
	<a href="${path }/selectCount.do">학생 수 조회</a></br>
	<a href="${path }/selectMember.do">Member조회</a>
	<a href="${path }/selectMemberMap.do">Member Map으로 조회</a>
</body>
</html>