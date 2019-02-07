<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.rclass.board.model.vo.Board"%>
    
<%@ include file= "/views/common/header.jsp" %>
<%
	Board b = (Board) request.getAttribute("board");
%>
<style>
    section#board-container{width:600px; margin:0 auto; text-align:center;}
    section#board-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>

	<section id="board-container">
		<h2>게시판</h2>
		<table id="tbl-board">
			<tr>
				<th>글번호</th>
				<td><%=b.getBoardNo() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=b.getBoardTitle() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=b.getBoardWriter() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=b.getBoardReadcount() %></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
				<%if (b.getBoardOriginalFilename() != null) {%>
				<img alt="첨부파일" src="<%=request.getContextPath()%>/images/file.png"/>
				<a href="javascript:fn_fileDown('<%=b.getBoardOriginalFilename() %>','<%=b.getBoardRenamedFilename() %>')"><%=b.getBoardOriginalFilename() %></a>
				<%} %>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=b.getBoardContent() %></td>
			</tr>
			
			<!-- 관리자, 작성자 -->
			<%if (loginMember != null && (b.getBoardWriter().equals(loginMember.getUserId()) 
					|| "admin".equals(loginMember.getUserId())) ) { %>
			<tr>
				<td colspan="2">
				<input type="button" value="수정하기" onclick="fn_updateBoard()"/>
				<input type="button" value="삭제하기" onclick="fn_deleteBoard()"/>
				</td>
			</tr>
			<%} %>
		</table>
		<div id="comment-container">
			<div class="comment-editor">
				<form name="commentFrm" action="<%=request.getContextPath()%>/board/boardCommentInsert" method="post">
					<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>" />
					<input type="hidden" name="boardCommentWriter" value="<%=loginMember != null ? loginMember.getUserId() : ""%>" />
					<input type="hidden" name="boardCommentLevel" value="1" />
					<input type="hidden" name="boardCommentRef" value="0"/>
					<textarea name="boardCommentContent" cols="60" rows="3"></textarea>
					<button type="submit" id="btn-insert">등록</button>
				</form>
			</div>
		</div>
	</section>
	
	<script>
	$(function(){
		$("[name=boardCommentContent]").focus(function(){
			if(<%=loginMember == null %>) {
				fn_loginAlert();
				$("#userId").focus();
				/* e.preventDefault();
				return; */
			}
		});
		$("[name=commentFrm]").submit(function(e) {
			if(<%=loginMember == null%>) {
				fn_loginAlert();
				e.preventDefault();
				return;
			}
			var len = $("textarea[name=boardCommentContent]").val().trim().length;
			if (len == 0) {
				
				alert("내용을 입력하세요");
				e.preventDefault();
			}
		});
	});
	function fn_loginAlert() {
		alert("로그인 후 이용할 수 있습니다.");
		$("[name=userId]").focus();
	}
	
		function fn_fileDown(oName, rName) {
			rName = encodeURIComponent(rName);
			location.href = '<%=request.getContextPath() %>/board/boardFileDownload2?oName=' +oName + '&rName=' + rName;
		}
	</script>
	

<%@include file= "/views/common/footer.jsp"%>