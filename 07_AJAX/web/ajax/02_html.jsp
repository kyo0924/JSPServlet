<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버에서 html받아오기</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	div#mydiv {
		padding: 10px
	}
</style>
</head>
<body>
	<h2>jquery-ajax : html출력</h2>
	<button onclick="htmlTest()">html출력</button>
	<div id="mydiv"></div>
	<script>
		function htmlTest() {
			$.ajax({
				url: "<%=request.getContextPath()%>/js/html.do",
				type: "get",
				dataType: "html",
				success: function(data) {
					console.log(data);
					$("#mydiv").html(data);
				}
			})
		}
	</script>
	
	<h2>jquery ajax - text</h2>
	<button onclick="test()">sample.txt 불러오기</button>
	<div id="mydiv2"></div>
	<script>
		function test() {
			$.ajax({
				url: "sample.txt",
				type: "get",
				dataType: "text",
				success: function(data) {
					console.log(data);
					var temp=$("#mydiv2").text() + data;
					$("#mydiv2").html(data);
				},
				
				error: function(request, status, error) {
					
				}
			});
		}
		
		function print(data) {
			$("#mydiv").html(data);
		}
	</script>
</body>
</html>