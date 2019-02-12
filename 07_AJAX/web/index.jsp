<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax 기본 통신</title>
</head>
<body>
	<h1>자바스크립트 이용 ajax 통신</h1>
	<button onclick="fn_get_ajax()">get전송</button>
	<button onclick="fn_post_ajax()">post전송</button>
	<div id="test">
	</div>
	
	<script>
	
		function fn_post_ajax() {
			var xhr = new XMLHttpRequest();  
			xhr.open("post", "<%=request.getContextPath()%>/js/test");
			xhr.onreadystatechange = function(){
				var area = document.getElementById("test");
				
				//data양이 많고 딜레이가 걸리면 아래것들이 한번씩 찍히는데 지금 실험하는 건 워낙 빨라서 상관없음
				if (xhr.readyState == 2) {
					area.innerHTML +="기다려 시작중이야!";
				} 
				
				if (xhr.readyState == 3) {
					area.innerHTML +="기다려 아직이야!";
				}
				
				if(xhr.readyState == 4) {
					if (xhr.status == 200) {
						document.getElementById("test").innerHTML += xhr.responseText;
					}
				}
			}
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send("name=신재민&age=19");
		}
	
		function fn_get_ajax() {
			// 1. XMLHttpRequest 객체 생성
			var xhr = new XMLHttpRequest();
			// 2. 서버 연결방식 설정
			xhr.open("get", "<%=request.getContextPath()%>/js/test?name=Shin&age=27");
			
			// 3. 전송이 완료되면 처리할 함수 지정
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						console.log('처리완료');
						console.log(xhr.responseText);
						document.getElementById("test").innerHTML = xhr.responseText;
					}
				}
			}
			// 4. 전송
			xhr.send();
		}
		
	
	</script>
</body>
</html>