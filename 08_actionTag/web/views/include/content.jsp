<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="header.jsp" %> --%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:include page="header.jsp">
	<jsp:param value="게시판" name="title"/>
</jsp:include>
<section>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>1</td>
			<td>여러분 힘내요</td>
			<td><%-- <%=name %> --%></td>
			<td>2019.03.04</td>
		</tr>
	</table>

</section>

</body>
</html>