<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String userId = request.getParameter("userId");

%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드변경</title>
<script src = "http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	div#changePassword-container {
		background-color:yellow;
	}
	
	div#changePassword-container table{
		margin: 0 auto;
		border-spacing: 20px;
	}
	
	div#changePassword-container table tr:last-of-type td{
		text-align-center;
	}
</style>

</head>
<body>
	<div id = "changePassword-container">
	<form name="changePassword" action="<%=request.getContextPath() %>/changePasswordEnd" method="post">
		<table>
			<tr>
				<th>현재비밀번호</th>
				<td>
					<input type="password" name="password" id="password" required/>
				</td>
			</tr>
			<tr>
				<th>변경할 비밀번호</th>
				<td>
					<input type="password" name="password_new" id="password_new" required/>
				</td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td>
					<input type="password" id="password_ck" required/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- false가 나오면 submit 안함 -->
					<input type="submit" onclick="return password_validate()" value="변경"/>
					&nbsp;
					<input type="button" onclick="self.close()" value="닫기"/>
				</td>
			</tr>
		</table>
		<input type="hidden" name="userId" value="<%=userId %>"/>
	</form>
	</div>
	<script>
		function password_validate() {
			var pw = $("#password");
			var pwNew = $("#password_new");
			var pwCk = $("#password_ck");
			if (pwNew.val().trim() != pwCk.val().trim()) {
				alert("새 비밀번호가 잘못 입력되었습니다");
			}
		}
	</script>
</body>
</html>