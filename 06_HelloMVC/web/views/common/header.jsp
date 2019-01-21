<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello MVC</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css"/>
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<header>
	<h1>Hello MVC</h1>
	<div class="login-container">
		<form id="loginFrm" action="<%=request.getContextPath() %>/login" method="post" onsubmit="return validate();">
		<table>
			<tr>
				<td>
				<input type="text" name="userId" placeholder="아이디"/>
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
					<input type="checkbox" name="saveId" id="saveId"/>
					<label for="saveId">아이디 저장</label>
					<input type="button" value="회원가입" onclick="location.href='#'"/>
				</td>
			</tr>
		</table>
		
		</form>
	</div>
	<h2 id="test">테스트</h2>
	<script>
		function validate(){
			var idVal=$('[name=userId]').val();
			var pwVal=$('[name=password]').val();
			if(idVal.trim().length == 0) {
				alert("아이디를 입력하세요");
				$('[name=userId]').focus();
				return false;
			}
			if(pwVal.trim().length == 0) {
				alert("비밀번호를 입력하세요")
				$('[name=password]').focus();
				return false;
			}
			return true;
		}
		$(function(){
			
			/* alert($("#test").html()); */
		})
	</script>
</header>