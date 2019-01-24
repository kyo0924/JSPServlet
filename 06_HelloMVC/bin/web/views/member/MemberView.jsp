<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member m = (Member) request.getAttribute("member");
	String[] hobbys = null;
	if (m != null) {
		String temp = m.getHobby();
		if (temp != null)
			hobbys = temp.split(",");
	}
	String[] checkHobby = new String[6];
	if (hobbys != null) {
		for (int i = 0; i < hobbys.length; i++) {

			switch (hobbys[i]) {

				case "독서" :
					checkHobby[0] = "checked";
					break;
				case "꽃꽂이" :
					checkHobby[1] = "checked";
					break;
				case "십자수" :
					checkHobby[2] = "checked";
					break;
				case "게임" :
					checkHobby[3] = "checked";
					break;
				case "승마" :
					checkHobby[4] = "checked";
					break;
				case "펜싱" :
					checkHobby[5] = "checked";
					break;
			}
		}
	}
%>
<style>
#userId_ {
	background-color: lightgray;
}
</style>

<%@ include file="/views/common/header.jsp"%>
<section id="enroll-container">
	<h2>회원정보수정</h2>
	<form name="memberFrm"
		action="<%=request.getContextPath()%>/memberUpdateEnd" method="post"
		onsubmit="return fn_enroll_validate();">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userId" id="userId_"
					value="<%=m.getUserId()%>" /></td>
			</tr>
			<!-- <tr>
				<th>패스워드</th>
				<td><input type="password" name="password" id="password_"
					required /></td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td><input type="password" id="password_2" required /></td>
			</tr>
			<tr> -->
			<th>이름</th>
			<td><input type="text" name="userName" id="userName" required
				value="<%=m.getUserName()%>" /></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="age" id="age"
					value="<%=m.getAge()%>" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" placeholder="abc@dse.com" name="email"
					id="email" value="<%=m.getEmail()%>" /></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><input type="tel" placeholder="(-없이)01012345678"
					name="phone" id="phone" maxlength="11" required
					value="<%=m.getPhone()%>" /></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" id="gender0" value="M"
					<%=m.getGender().equals("M") ? "checked" : ""%> /> <label
					for="gender0">남</label> <input type="radio" name="gender"
					id="gender1" value="F"
					<%=m.getGender().equals("F") ? "checked" : ""%> /><label
					for="gender1">여</label></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="address"
					value="<%=m.getAddress()%>" /></td>
			</tr>
			<tr>
				<th>취미</th>
				<td><input type="checkbox" name="hobby" id="hobby0" value="독서"
					<%=checkHobby[0]%> /><label for="hobby0">독서</label> <input
					type="checkbox" name="hobby" id="hobby1" value="꽃꽂이"
					<%=checkHobby[1]%> /><label for="hobby1">꽃꽂이</label> <input
					type="checkbox" name="hobby" id="hobby2" value="십자수"
					<%=checkHobby[2]%> /><label for="hobby2">십자수</label><br> <input
					type="checkbox" name="hobby" id="hobby3" value="게임"
					<%=checkHobby[3]%> /><label for="hobby3">게임</label> <input
					type="checkbox" name="hobby" id="hobby4" value="승마"
					<%=checkHobby[4]%> /><label for="hobby4">승마</label> <input
					type="checkbox" name="hobby" id="hobby5" value="펜싱"
					<%=checkHobby[5]%> /><label for="hobby5">펜싱</label></td>
			</tr>
		</table>
		<input type="button" value="정보수정" onclick="fn_updateMember();" /> <input
			type="button" onclick="fn_changePw();" value="비밀번호변경" /> <input
			type="button" value="탈퇴" onclick="fn_deleteMember()" />
		<!-- fn_deleteMember() 
		
		-->
	</form>
	<form name="pwChangeFrm" method="post">
		<input type="hidden" name="userId" />
	</form>

	<form name="deleteFrm"
		action="<%=request.getContextPath()%>/deleteMember" method="post">
		<input type="hidden" name="userId" />
	</form>
	<script>
		// 새창 열고 비밀번호 수정페이지 요청(서블릿 연결) 빈화면
		function fn_changePw() {
			/* var option = "left=500px, top=100px, width=300px, height=200px, menuba=no, status=no, scrollbars=yes"; */
			var option = "left=100px, top = 100px, width=500px, height=500px, scrollbars=yes";
			var url = "<%=request.getContextPath()%>/changePassword?userId=<%=m.getUserId()%>";
			var title = "changePassword";
			var popup = window.open(url,title, option);
			
		}
	
		function fn_deleteMember(){
			var flag = confirm("삭제하시겠습니까?");
			if (flag) {
				
				<%-- location.href="<%=request.getContextPath()%>/deleteMember?userId=<%=m.getUserId()%>"; --%>
				deleteFrm.userId.value = "<%=m.getUserId()%>";
				deleteFrm.submit();
			}
		}
	
		function fn_updateMember() {
			memberFrm.submit();
		}
	
		$(function(){
			$("#password_2").blur(function(){
				var pw1 = $("#password_");
				var pw2 = $("#password_2");
				if (pw1.val().trim() != pw2.val().trim()) {
					alert("패스워드가 일치하지 않습니다");
					pw1.val('');
					pw2.val('');
					pw1.focus();
				}
			})
		})
	</script>

</section>
<%@include file="/views/common/footer.jsp"%>