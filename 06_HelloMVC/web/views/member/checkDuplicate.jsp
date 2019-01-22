<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean isAble = (boolean) request.getAttribute("isAble");
	String userId = (String) request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<style>
	div#checkid-container{text-align:center; padding-top:50px;}
	span#duplicated{color: red; font-weight: bold;}
</style>
</head>
<script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<body>
	<div id="checkid-container">
		<% if (isAble) { %>
		[<span><%=userId %></span>]는 사용가능합니다.
		<br><br>
		<button type="button" onclick="fn_close();">닫기</button>
		<% } else { %>
		[<span id="duplicated"><%=userId %></span>]는 사용 불가능합니다.
		<form action="<%=request.getContextPath() %>/checkIdDuplicate" method="post" onsubmit="return fn_validate();">
		
			<input type="text" id="userId" name="userId" placeholder="아이디입력"/>
			<input type="submit" value="재검색"/>
		</form>
		<%} %>
	</div>
	<script>
		function fn_close() {
			var frm = opener.document.memberEnrollFrm;
			console.log(frm);
			frm.userId.value = '<%=userId%>';
			frm.password.focus();
			self.close();
		}
	
		function fn_validate() {
			var userId = document.getElementById('userId').value;
			if (!userId || userId.trim().length < 4) {
				alert("아이디를 4글자 이상 입력해주세요");
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>