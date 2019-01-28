<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/views/common/header.jsp" %>
<%@page import="java.util.*" %>

<%
	List<Member> list = (List) request.getAttribute("list");
	String pageBar = (String) request.getAttribute("pageBar");
	int cPage = (int) request.getAttribute("cPage");
	int numPerPage = (int) request.getAttribute("numPerPage");
%>

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
		<%
			if (!list.isEmpty()) {
				for (Member m : list) {
		%>
		<tr>
			<td><a
				href='<%=request.getContextPath()%>/updateMember?userId=<%=m.getUserId()%>'><%=m.getUserId()%></a></td>
			<td><%=m.getUserName()%></td>
			<td><%="M".equals(m.getGender()) ? "남" : "여"%></td>
			<td><%=m.getAge()%></td>
			<td><%=m.getEmail()%></td>
			<td><%=m.getPhone()%></td>
			<td><%=m.getAddress()%></td>
			<td><%=m.getHobby()%></td>
			<td><%=m.getEnrollDate()%></td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="9" align="center">검색결과가 없습니다.</td>
		</tr>
		<%
			}
		%>
	</table>
	<%=pageBar %>
<%@include file= "/views/common/footer.jsp"%>