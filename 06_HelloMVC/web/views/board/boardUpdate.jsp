<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.rclass.board.model.vo.Board"%>
<% 
	Board b = (Board) request.getAttribute("board");
%>

<%@ include file= "/views/common/header.jsp" %>

<style>
	section#board-container {
		width: 600px;
		margin: 0 auto;  <!-- top right bottom left-->
		
	}
	section#board-container h2{
		text-align: center;
	}
	table#tbl-board {
		width: 500px;
		margin: 0 auto;
		border: 1px solid black;
		border-collapse: collapse;
	}
	table#tbl-board th {
		width: 125px;
		border: 1px solid;
		padding: 5px 0;
	
	}
	
	table#tbl-board td {
		border: 1px solid;
		padding: 5px 0 5px 10px;
		
	}
	
</style>

<section id="board-container">
	
	<h2>게시판 수정</h2>
	<form action="/board/boardUpdateEnd" method="post">
	
		<input type="hidden" name="boardNo" value="<%=b.getBoardNo()%>"/>
		
		<table id="tbl-board">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="<%=b.getBoardTitle()%>" required/>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" value="<%=b.getBoardWriter()%>" readonly/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="5" cols="50"><%=b.getBoardContent()%></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록하기" onclick="return validate()"/>
				</th>
			</tr>
		</table>
	</form>

</section>
<script>
	function validate() {
		if ($("[name=content]").val().trim().length == 0) {
			alert("내용을 입력해주세요");
			return false;
		} else 
			return true;
	}
</script>

<%@include file= "/views/common/footer.jsp"%>