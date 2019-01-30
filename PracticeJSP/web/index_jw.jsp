<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<style>
#accordian {
	float: left;
	background: #333333;
	width: 250px;
	height: 100%;
	margin: 0px auto 0 auto;
	color: white;
	box-shadow: 0 5px 15px 1px rgba(0, 0, 0, 0.6), 0 0 200px 1px
		rgba(255, 255, 255, 0.5);
}
/* 메뉴 스타일 */
#accordian h3 {
	font-size: 12px;
	line-height: 34px;
	padding: 0 10px;
	cursor: pointer;
	background: #064461;
	background: linear-gradient(#003040, #002535);
}

#accordian h3:hover {
	text-shadow: 0 0 1px rgba(255, 255, 255, 0.7);
}
/* 아이콘폰트 스타일 */
#accordian h3 span {
	font-size: 16px;
	margin-right: 10px;
}

#accordian li {
	list-style-type: none;
}
/* 서브메뉴 스타일 */
#accordian ul ul li a {
	color: white;
	text-decoration: none;
	font-size: 11px;
	line-height: 27px;
	display: block;
	padding: 0 15px;
	-webkit-transition: all 0.15s;
	-moz-transition: all 0.15s;
	-o-transition: all 0.15s;
	-ms-transition: all 0.15s;
	transition: all 0.15s;
}

#accordian ul ul li a:hover {
	background: #003545;
	border-left: 5px solid #09c;
}
/* active 클래스 외에 것은 보이지 않게 하기 */
#accordian ul ul {
	display: none;
}

#accordian li.active ul {
	display: block;
}

#loginjw {
	width: 170px;
	background: #003545;
	color:white;
	
}
#loginjoinjw {
	width: 170px;
	background: #003545;
	color:white;
}

#idjw {
	width: 170px;
}

#pwjw {
	width: 170px;
}


</style>
	<div id="accordian">
		<ul>
			<form id="loginFrm" action="<%=request.getContextPath()%>/login"
				method="post" onsubmit="return validate();">

				<table>
					<!-- 회원가입 : 아이디 비밀번호 생년월일 이름 이메일 전화번호 -->
					<tr>
						<td><input id="idjw" type="text" name="userId"
							placeholder="아이디" /></td>
						<td></td>
					</tr>
					<tr>
						<td><input id="pwjw" type="password" name="password"
							placeholder="비밀번호" /></td>
					</tr>
					<tr>
						<td><input id="loginjoinjw" type="submit" value="login" /></td>
					</tr>
					<tr>
						<td><input id="loginjw" type="button" value="join"
							onclick="location.href='<%=request.getContextPath()%>/memberEnroll'" />
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type='checkbox' name="saveId"
							id="saveId" /> <label for="saveId">아이디저장</label></td>
					</tr>
				</table>
			</form>
			<li>
				<h3>
					<span class="icon-dashboard"></span>페이지소개
				</h3>
				<ul>
					<li><a href="#">CEO인사말</a></li>
					<li><a href="#">조직도</a></li>
					<li><a href="#">서비스 소개</a></li>
				</ul>
			</li>
			<li class="active">
				<h3>
					<span class="icon-tasks"></span>나의일정
				</h3>
				<ul>
					<li><a href="#">나의일정</a></li>
					<li><a href="#">나의일정</a></li>
					<li><a href="#">나의일정</a></li>
					<li><a href="#">나의일정</a></li>
					<li><a href="#">나의일정</a></li>
				</ul>
			</li>
			<li>
				<h3>
					<span class="icon-calendar"></span>그룹일정
				</h3>
				<ul>
					<li><a href="#">일정보기</a></li>
					<li><a href="#">그룹관리</a></li>
					<li><a href="#">채팅관리</a></li>
					<li><a href="#">투표보기</a></li>
				</ul>
			</li>
			<li>
				<h3>
					<span class="icon-heart"></span>작성할사람 작성~~
				</h3>
				<ul>
					<li><a href="#">기타1</a></li>
					<li><a href="#">기타2</a></li>
					<li><a href="#">기타3</a></li>
					<li><a href="#">기타4</a></li>
				</ul>
			</li>
		</ul>
	</div>

	<script>
		$(function() {
			$("#accordian h3").click(function() {
				$("#accordian ul ul").slideUp();
				if (!$(this).next().is(":visible")) {
					$(this).next().slideDown();
				}
			});
		});
	</script>

</body>
</html>