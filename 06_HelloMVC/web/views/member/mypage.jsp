<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<script>
	function changeName(){
		var userName = $("[name=userName]").html();
		console.log(userName);
		
	}
</script>
<section id="enroll-container">
	<h2>회원정보 수정</h2>
	<form name="memberUpdateFrm"
		action="<%=request.getContextPath()%>/memberUpdateEnd" method="post"
		onsubmit="return fn_enroll_validate();">
		<table>
				<tr>
					<th>
						아이디
					</th>
					<td>
						<%=loginMember.getUserId() %>
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
						<input type="text" name="userName" id="userName" value='<%=loginMember.getUserName()%>'/>
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>
						<input type="number" name="age" id="age" value='<%=loginMember.getAge() %>'/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" placeholder="abc@dse.com" name="email" id="email" value='<%=loginMember.getEmail() %>'/>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required value='<%=loginMember.getPhone() %>'/>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
					<% 
						String gender = loginMember.getGender();
					%>
					<%=gender %>
						<input type="radio" name="gender" id="gender0" value="M" <% if (gender.equals("M")) out.write("checked");%>/><label for="gender0">남</label>
						<input type="radio" name="gender" id="gender1" value="F" <% if (gender.equals("F")) out.write("checked");%>/><label for="gender1">여</label>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address" id="address" value='<%=loginMember.getAddress() %>'/>
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
		<input type="submit" value="수정" /> <input type="reset" value="탈퇴" />
	</form>
</section>
<%@ include file="/views/common/footer.jsp"%>