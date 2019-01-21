<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<script>
	$(function(){
		
		
	});
	function fn_enroll_validate(){
		var userId = $("#userId_").val();
		if (userId.trim().length < 4) {
			alert("아이디를 4글자 이상 입력하세요!");
			$("#userId_").focus();
			return false;
		}
		return true;
	}
</script>
	<section id="enroll-container">
		<h2>회원가입정보 입력</h2>
		<form action="<%=request.getContextPath()%>/memberEnrollEnd" method="post" onsubmit="return fn_enroll_validate();">
			<table>
				<tr>
					<th>
						아이디
					</th>
					<td>
						<input type="text" name="userId" id="userId_"
						required placeholder = "4글자 이상 입력"/>
					</td>
				</tr>
				<tr>
					<th>
						패스워드
					</th>
					<td>
						<input type="password" name="password" id="password_" required/>
					</td>
				</tr>
				<tr>
					<th>패스워드확인</th>
					<td>
						<input type="password" name="password" id="password_2" required/>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="userName" id="userName" required/>
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>
						<input type="number" name="age" id="age"/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" placeholder="abc@dse.com" name="email" id="email"/>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required/>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" id="gender0" value="M" checked/><label for="gender0">남</label>
						<input type="radio" name="gender" id="gender1" value="F" checked/><label for="gender1">여</label>
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						<input type="checkbox" name="hobby" id="hobby0" value="독서"/><label for="hobby0">독서</label>
						<input type="checkbox" name="hobby" id="hobby1" value="꽃꽂이"/><label for="hobby1">꽃꽂이</label>
						<input type="checkbox" name="hobby" id="hobby2" value="십자수"/><label for="hobby2">십자수</label><br>
						<input type="checkbox" name="hobby" id="hobby3" value="게임"/><label for="hobby3">게임</label>
						<input type="checkbox" name="hobby" id="hobby4" value="승마"/><label for="hobby4">승마</label>
						<input type="checkbox" name="hobby" id="hobby5" value="펜싱"/><label for="hobby5">펜싱</label>
					</td>
				</tr>
			</table>
			<input type="submit" value="가입"/>
			<input type="reset" value="취소"/>
		</form>
	</section>
<%@ include file="/views/common/footer.jsp" %>