<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json 이용하기</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h2>jSON 자료 받기</h2>
	<button id="btn">실행</button>
	<input type="number" id="index"/>
	<div id="mydiv"></div>
<script>
	$(function(){
		$("#btn").click(function(){
			console.log("test");
			$.ajax({
				url: "<%=request.getContextPath()%>/js/json.do",
				type: "get",
				data: {"index": $("#index").val()},
				dataType: "json",
				success: function(data) {
					console.log(data);
					console.log(data['userId']);
					console.log(decodeURI(data['userId']));
					/* console.log(data.name + " type : " + typeof data.name);
					console.log(data.height + " type : " + typeof data.height);
					console.log(data.weight + " type : " + typeof data.weight); */
					var user = "";
					for (var i = 0; i < data.length; i++) {
						console.log(data[i]);
						
						 for (var a in data[i]) {
							console.log(a + " : " + data[i][a]);
							user += a + " : " + data[i][a] + "\n";
						 } 
					}
					$("#mydiv").html(user);
				}
			});
		});
	})
</script>
</body>
</html>