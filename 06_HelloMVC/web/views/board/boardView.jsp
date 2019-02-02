<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.rclass.board.model.vo.Board" %>
<%
	 Board b = (Board) request.getAttribute("board");
%>
<%@ include file= "/views/common/header.jsp" %>

<style>
    section#board-container{width:600px; margin:0 auto; text-align:center;}
    section#board-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>
	<section id="board-container">
		<table id="tbl-board">
			<tr>
				<th>제목</th>
				<td><%=b.getBoardTitle() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=b.getBoardWriter() %></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				
				<td><%if(b.getBoardRenamedFilename()!=null) { %>
					<a href="javascript:fn_fileDown('<%=b.getBoardRenamedFilename() %>')">
						<%-- <a href="<%=request.getContextPath()%>/notice/noticeFileDownload?fname=<%=n.getFilePath()%>"></a> --%>
						<img alt="첨부파일"
						src="<%=request.getContextPath()%>/images/file.png"
						width="16px"/>
					</a>
					<script>
						function fn_fileDown(fname) {
							fname = encodeURIComponent(fname);
							location.href="<%=request.getContextPath()%>/board/boardFileDownload?fname=" + fname;
						}
					</script>
					<%} %>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=b.getBoardContent() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정하기" onclick="fn_updateBoard()"/>
					<input type="button" value="삭제하기" onclick="fn_deleteBoard()"/>
				</td>
			</tr>
		</table>
		<!-- 게시물 삭제를 위해 게시물번호, 파일경로 정보 필요 -->
		<form name="deleteFrm" action="<%=request.getContextPath()%>/boardDelete"  method="post">
			<input type="hidden" name="deleteNo" value="<%=b.getBoardNo()%>"/>
			<input type="hidden" name="deleteFile" value="<%=b.getBoardRenamedFilename() %>"/>
		</form>
		
		<script>
			function fn_updateBoard() {
				location.href = "<%=request.getContextPath()%>/board/boardUpdate?no=<%=b.getBoardNo()%>";
			}
			
			function fn_deleteBoard() {
				var flag = confirm("게시물을 지우겠습니까?");
				if (flag) {
					deleteFrm.submit();
				} else {
					return;
				}
			}
		</script>
	</section>
<%@include file= "/views/common/footer.jsp"%>