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
			// XMLHttpRequest : 비동기식으로 서버에 요청(Request)을 보내기 위한 객체로 요청 및 응답을 처리함
			// 1. script문에 요청을 위한 XMLHttpRequest객체 생성
			var xhr = new XMLHttpRequest();  
		
			// 2. open메소드로 요청 방법 및 요청할 대상(Server)선정, 서버 연결 방식 설정
			// ☞ 요청메소드, 요청주소, 동기/비동기 설정, 아이디, 패스워드 설정
			xhr.open("post", "<%=request.getContextPath()%>/js/test");
			
			/* 
			3. 서버의 응답을 처리할 함수 생성 및 지정, 전송이 완료되면 처리할 함수 지정
			☞ onreadystatechange에 함수지정
			*/
			xhr.onreadystatechange = function(){
				var area = document.getElementById("test");
				
				//# readyState속성 값
				//data양이 많고 딜레이가 걸리면 readyState 2부터 한번씩 실행되는데 지금 실험하는 건 워낙 빨라서 볼수없음
				// 2 : (loaded) send메소드가 호출되고 헤더는 도착하지 않은상태
				// 3 : (interactive) 일부 데이터를 받은 상태
				// 4 : (completed) 요청을 완료하고 응답하는 상태
				if (xhr.readyState == 2) {
					area.innerHTML +="기다려 시작중이야!";
				} 
				
				if (xhr.readyState == 3) {
					area.innerHTML +="기다려 아직이야!";
				}
				
				if(xhr.readyState == 4) {
					// status 전송/응답 결과를 저장하는 변수(코드값)
					/*
						status속성 값
						200 (OK) : 요청성공
						404 (Not Found) : 페이지 없음
						500 (Internal Server Error) : 서버오류발생 등
						추가 참조
						https://www.w3schools.com/tags/ref_httpmessages.asp
					*/
					if (xhr.status == 200) {
						// responseText 응답(response)결과를 문자열로 저장하는 변수
						// responseXML 응답(response)결과를 XML data로 저장하는 변수
						document.getElementById("test").innerHTML += xhr.responseText;
					}
				}
			}
			
			
			
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			/* 
			4. send메소드로 대상(Server)에 전송
			☞ post일때 파라미터값 설정/ get일때는 매게변수 없음 
			
			5. 응답상태에 따라 상태확인
			☞ readyState(데이터응답) / status(처리결과) 값을 이용
			
			6. 응답완료 reponseText / reponseXML이용 응답처리
			*/
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