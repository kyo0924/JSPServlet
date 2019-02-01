<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.rclass.board.model.vo.*, java.util.*"%>
<%@ include file= "/views/common/header.jsp" %>
<%
	List<Board> list = (List<Board>) request.getAttribute("list");
	String pageBar = (String) request.getAttribute("pageBar");
%>
<style>
	#btn-add {
		float: right;
	}
</style>

<section id = "board-container">
	<h3> 게시판 </h3>
	<% 
		if (loginMember != null) {
	%>
	<input type="button" value="글쓰기" id="btn-add" onclick="fn_boardForm()"/>
	<% } %>
	<script>
		function fn_boardForm() {
			location.href = "<%=request.getContextPath()%>/board/boardForm";
		}
	</script>
	<table>
		<tr>
			<th>게시글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>첨부파일</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<% if (list.size() > 0) {
			for (Board b : list) {%>
		<tr>
			<td><%=b.getBoardNo() %></td>
			<td><a href="<%=request.getContextPath()%>/board/boardView?no=<%=b.getBoardNo()%>"><%=b.getBoardTitle() %></a></td>
			<td><%=b.getBoardWriter() %></td>
			<td><%=b.getBoardOriginalFilename() %></td>
			<td><%=b.getBoardDate() %></td>
			<td><%=b.getBoardReadcount() %></td>
		</tr>
		<%
		 	} 
		  }%>
	</table>
	<div>
		<%= pageBar%>
	</div>
</section>
<%@include file= "/views/common/footer.jsp"%>