<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.rclass.board.model.vo.*, java.util.*"%>
    
<%@ include file= "/views/common/header.jsp" %>
<%
	Board b = (Board) request.getAttribute("board");
	List<BoardComment> comments = (List) request.getAttribute("comments");
%>
<style>
    section#board-container{width:600px; margin:0 auto; text-align:center;}
    section#board-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    
    table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-reply{display:none;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-reply{display:inline;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
    table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
    table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
    table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
    table#tbl-comment textarea{margin: 4px 0 0 0;}
    table#tbl-comment button.btn-insert2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}
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
			<table id="tbl-comment">
			<%if(comments != null) {
				for(BoardComment bc : comments) {
					if (bc.getBoardCommentLevel() == 1) {
					%>
					<tr class="level1">
						<td>
							<sub class="comment-writer"><%=bc.getBoardCommentWriter() %></sub>
							<sub class="comment-date"><%=bc.getBoardCommentDate() %></sub>
							<br/>
							<%=bc.getBoardCommentContent() %>
						</td>
						<td>
							<button class="btn-reply" value="<%=bc.getBoardCommentNo()%>">답글</button>
							<%if (loginMember != null && (bc.getBoardCommentWriter().equals(loginMember.getUserId()) 
									|| "admin".equals(loginMember.getUserId()))) {%>
							<button class="btn-delete" value="<%=bc.getBoardCommentNo()%>">삭제</button>
							<%} %>
						</td>
					</tr>
					<%
					} else {%>
					<tr class='level2'>
						<td>
							<sub><%=bc.getBoardCommentWriter()%></sub>
							<sub><%=bc.getBoardCommentDate()%></sub>
							<br/>
							<%=bc.getBoardCommentContent() %>
						</td>
						<td></td>
					</tr>	
					<% }
				}
			 }%>
			</table>
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
	
	$(".btn-delete").on("click", function(){
		if (!confirm("정말로 삭제하시겠습니까")) return;
		// 되돌아갈 게시판 번호, 삭제할 댓글 번호 bc.getBoardCommentNo()
		location.href = "<%=request.getContextPath()%>/board/boardCommentDelete?no=<%=b.getBoardNo()%>&delNo=" + $(this).val();
	});
	
	$(".btn-reply").on("click", function(){
		<%if (loginMember != null) { %>
			var tr = $("<tr></tr>");
			var html = "<td style='display:none;text-align:left;' colspan=2>";
			html += "<form action='<%=request.getContextPath()%>/board/boardCommentInsert' method='post'>";
			html += "<input type='hidden' name='boardRef' value='<%=b.getBoardNo()%>'/>";
			html += "<input type='hidden' name='boardCommentWriter' value='<%=loginMember.getUserId()%>'/>";
			html += "<input type='hidden' name='boardCommentLevel' value='2'/>";
			html += "<input type='hidden' name='boardCommentRef' value='"+$(this).val()+"'/>";
			html += "<textarea cols='60' rows='1' name='boardCommentContent'></textarea>";
			html += "<button type='submit' class='btn-insert2'>등록</button>";
			html += "</form></td>";
			tr.html(html);
			// 붙이고 난 뒤 자식들중 td 찾음
			tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
			// 댓글에 대한 답글, 게시판 하나, 상위 댓글 하나로 참조자 두 개, hidden으로 필요한 값을 다 가져와야
			$(this).off('click');
			
			// tr 자식중 form 태그
			tr.find("form").submit(function(){
				if (<%=loginMember == null%>) {
					fn_loginAlert();
					event.preventDefault();
					return;
				}
				// this : form 의미
				var content = $(this).children('textarea').val().trim().length;
				if (content == 0) {
					alert("내용을 입력하세요");
					event.preventDefault();
					return;
				}
			});
			
		<%}  else {%>
			fn_loginAlert();
		<% }%>
		
		
	});
	
	</script>
	

<%@include file= "/views/common/footer.jsp"%>