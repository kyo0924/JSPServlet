<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>JSP Practice</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		
		/* $("#login-container").html("테스트"); */
	});
</script>
<style>
		div#login-container {
		text-align: center;
		}
	
		ul.main-nav li {
			list-style-type:none;
			width: 8em;
			height: 2em;
			float: left;
			text-align: center;
		}
	</style>
</head>
<body>
<header>
	<div id="login-container">
		<form id="loginFrm" action="<%=request.getContextPath() %>/login" method="post" onsubmit="return validate();">
			<table>
				<tr>
					<td>
						<input type="text" name="userId" placeholer="아이디"/>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<input type="password" name="password" placeholder="비밀번호"/>
					</td>
					<td>
						<input type="submit" value="로그인"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="checkbox" name="saveId" />
						<label for="saveId">아이디 저장</label>
						<input type="button" value="회원가입" onclick="location.href='<%=request.getContextPath() %>/memberEnroll'"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<nav>
		<ul class="main-nav">
			<li class="home"><a href="<%=request.getContextPath()%>">Home</a></li>
			<li id="notice"><a href="<%=request.getContextPath()%>/notice/noticeList">공지사항</a></li>
			<li class="board"><a href="<%=request.getContextPath()%>">게시판</a></li>
			<li class="photo-board"><a href="<%=request.getContextPath()%>">갤러리</a></li>
			<li class="admin-member"><a href="<%=request.getContextPath()%>/admin/memberList">회원관리</a></li>
		</ul>
	</nav>
	<br>
	<button onclick="location.href='/admin/memberList'" >테스트</button>
	
</header>