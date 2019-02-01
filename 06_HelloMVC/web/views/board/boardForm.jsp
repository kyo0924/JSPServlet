<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/views/common/header.jsp" %>

<section id="board-container">
	<h3>게시물 등록</h3>
	<form action="<%=request.getContextPath()%>/board/boardFormEnd" method="post" enctype="multipart/form-data">
		<table id="tbl-board">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" id="title" required/>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" value="<%=loginMember.getUserId()%>"/>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="up_file"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="50" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록하기" onclick="return validate()"/>
				</td>
			</tr>
		</table>
	</form>
	<script>
		function validate() {
			var value = $("[name=content]").val().trim();
			if (value.length == 0) {
				alert("내용을 입력해주세요");
				return false;
			}
			return true;	
		}
	</script>
</section>

<%@include file= "/views/common/footer.jsp"%>