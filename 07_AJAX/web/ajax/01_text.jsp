<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서의 내용 받아오기</title>
<style>
div#mydiv {
	width: 300px;
	min-height: 100px;
	border: 1px solid red;
	margin: 30px 30px;
}
</style>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<h2>jquery ajax - text</h2>
	<button onclick="test()">sample.txt 불러오기</button>
	<div id="mydiv"></div>
	<script>
		$("#mydiv").html("test");
		function test() {
			$.ajax({
				url: "sample.txt",
				type: "get",
				dataType: "text",
				success: function(data) {
					console.log(data);
					var temp=$("#mydiv").text() + data;
					$("#mydiv").html(data);
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