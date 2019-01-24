<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ include file= "/views/common/header.jsp" %>
<%
	List<Member> list = (List) request.getAttribute("list");
%>
<style>
	<!--id가 memberList-container인 section 태그 선택-->
	section#memberList-container {
		text-align: center;
	}
	section#memberList-container table#tbl-member{
		width: 100%;
		border: 1px solid gray;
		border-collapse: collapse;
	}
	
	section#memberList-container table#tbl-member th, table#tbl-member td{
		border: 1px solid gray; padding: 10px;
	}
</style>
<section id="memberList-container">
	<h2>회원관리</h2>
	<table id="tbl-member">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>취미</th>
			<th>가입일</th>
		</tr>
		<%if(list != null || !list.isEmpty()) { 
			for(Member m : list) { 
			%>
			<tr>
				<td><%=m.getUserId() %></td>
				<td><%=m.getUserName() %></td>
				<td><%="M".equals(m.getGender())? "남": "여" %></td>
				<td><%=m.getAge()%></td>
				<td><%=m.getEmail()%></td>
				<td><%=m.getPhone()%></td>
				<td><%=m.getAddress()%></td>
				<td><%=m.getHobby()%></td>
				<td><%=m.getEnrollDate()%></td>
			</tr>
		<%
			}
		}  else {%>
		<tr>
			<td colspan="9" align="center">검색결과가 없습니다.</td>
		</tr>
		<%} %>
	</table>
</section>
<%@include file= "/views/common/footer.jsp"%>