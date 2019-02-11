<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xml 출력하기</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h2>jQuery ajax : xml</h2>
	<button id="btn">실행</button>
	<div id="fiction">
		<h3>소설</h3>
		<table id="fictionInfo">
		</table>
	</div>
	<div id="it">
		<h3>프로그래밍</h3>
		<table id="itInfo">
		</table>
	</div>
	<script>
	// root element를 찾고 그 밑에 있는 element를 하나씩 찾음
		$(function() {
			$("#btn").click(function(){
				$.ajax({
					url : "sample.xml",
					type : "get",
					dataType: "xml",
					success : function(data) {
						console.log(data);
						var root = $(data).find(":root");
						// root context는 books
						console.log(root);
						var book = root.find("book");
						console.log(book);
						var fic = "<tr><th>제목</th><th>저자</th></tr>";
						var it = "<tr><th>제목</th><th>저자</th></tr>";
						book.each(function(){
							var html = "<tr><td>" + $(this).find("title").text() + "</td>";
							html += "<td>" + $(this).find("author").text() + "</td></tr>";
							
							if ($(this).find("subject").text() == "소설") {
								fic += html;
							}
							if ($(this).find("subject").text()  == "프로그래밍") {
								it += html;
							}
						});
						console.log(fic);
						console.log(it);
						$("#fictionInfo").html(fic);
						$("#itInfo").html(it);
					}
				});
			});
		})
	</script>
</body>
</html>