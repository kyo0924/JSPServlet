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
<title>selectOne</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div id="student-container">
		<h2>학생 정보 검색</h2>
		<p>총 학생 수는 ${count }명 입니다.</p>
		<form name="frm" action="${path }/student/selectOne.do">
			<table id="tbl-student">
				<tr>
					<th>학생번호</th>
					<td>
						<input type="number" name="no" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="검색"/>
						<input type="button" value="삭제" id="delBtn"/>
						<input type="button" value="전체조회" onclick="fn_total();"/>
					</td>
				</tr>
				
			</table>
			<table>
			<c:if test="${not empty map }">
			<tr>
				<td colspan="6">${param.no }번 학생 정보</td>
			</tr>
			</c:if>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>주소</th>
					<th>등록일</th>
				</tr>
				<tr>
					<%-- <td>${map['STUDENT_NO'] }</td>
					<td>${map['STUDENT_NAME'] }</td>
					<td>${map['STUDENT_TEL'] }</td>
					<td>${map['STUDENT_EMAIL'] }</td>
					<td>${map['STUDENT_ADDR'] }</td>
					<td>${map['REG_DATE'] }</td> --%>
					<td>${map['studentNo'] }</td>
					<td>${map['studentName'] }</td>
					<td>${map['studentTel'] }</td>
					<td>${map['studentEmail'] }</td>
					<td>${map['studentAddr'] }</td>
					<td>${map['reg_date'] }</td>
				</tr>
			</table>
		</form>
		
		
	</div>
	<script>
		
		$("#delBtn").click(function(){
			frm.action="${path}/deleteStudent";
			frm.submit();
			/* 
			var no = $("[name=no]").val();
			var path = "${path}";
			location.href = path + "/deleteStudent?no=" + no; */
		});
		
		function fn_total() {
			frm.action = "${path}/student/total.do";
			frm.submit();
		}
	</script>
</body>
</html>