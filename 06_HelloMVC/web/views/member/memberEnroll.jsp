<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<script>
	$(function(){
		
		/* $("#password_2").blur(function() {
			
			var pw1 = $("#password_").val();
			var pw2 = $("#password_2").val();
			if (pw1.trim() != pw2.trim()) {
				
				alert("비밀번호가 일치하지 않습니다!");
				$("#password_").focus();
				$("#password_").val('');
				$("#password_2").val("");
				
			}
		}); */
		
		$("#password_2").blur(function() {
			
			var pw1 = $("#password_");
			var pw2 = $("#password_2");
			if (pw1.val().trim() != pw2.val().trim()) {
				
				alert("비밀번호가 일치하지 않습니다!Version2");
				pw1.focus();
				pw1.val('');
				pw2.val("");
				
			}
		});
		
		
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
	
	function fn_checkIdDuplicate() {
		
		var userId = $("#userId_").val().trim();
		if (!userId || userId.length < 4) {
			alert("아이디를 4글자 이상 입력하세요!");
			return;
		}
		// 새 창을 열어서 아이디값을 비교하는 로직을 구성!
		var url = "<%=request.getContextPath()%>/checkIdDuplicate";
		var title = "checkIdDuplicate";
		var option = "left=500px, top=100px, width=300px, height=200px, menuba=no, status=no, scrollbars=yes";
		var popup = window.open("",title, option);
		// form은 name으로 접근 가능/ form 태그안에 이름이 userId인것(input태그)의 value에 값을 설정
		checkIdDuplicateFrm.userId.value = userId;
		checkIdDuplicateFrm.target = title;
		checkIdDuplicateFrm.action = url;
		checkIdDuplicateFrm.method = "post";
		checkIdDuplicateFrm.submit();
		
	}
	
</script>
	<section id="enroll-container">
		<h2>회원가입정보 입력</h2>
		<form name="memberEnrollFrm" action="<%=request.getContextPath()%>/memberEnrollEnd" method="post" onsubmit="return fn_enroll_validate();">
			<table>
				<tr>
					<th>
						아이디
					</th>
					<td>
						<input type="text" name="userId" id="userId_"
						required placeholder = "4글자 이상 입력"/>
						<input type="button" value="중복검사" onclick="fn_checkIdDuplicate()"/>
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
						<input type="password" id="password_2" required/>
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
					<th>주소</th>
					<td>
						<input type="text" name="address" id="address"/>
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
		<form name="checkIdDuplicateFrm" method="post">
			<input type="hidden" name="userId"/>
		</form>
	</section>
<%@ include file="/views/common/footer.jsp" %>