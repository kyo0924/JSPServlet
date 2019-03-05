<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h3>자동완성기능구현</h3>
	<p>datalist list에 대한 옵션값을 DB에서 가져오는 방식</p>
	<input type="search" name="searchName" id="searchName" list="datalist"/>
	<datalist id="datalist">
	</datalist>
	
	<script>
		$(function(){
			$("#searchName").keyup(function(){
				$.ajax({
					url: "<%=request.getContextPath()%>/js/data.do",
					type: "post",
					// 서버에서 request.getParameter("search")를 하면 input으로 넘긴 값을 받아옴
					// data : 서버에 전송할 데이터를 key : value 형식으로 설정
					data: {"search": $("#searchName").val()},
					success: function(data) {
						var list = data.split(",");
						var html = "";
						for (var i = 0; i < list.length; i++) {
							html += '<option>' + list[i] + "</option>";
						}
						$("#datalist").html(html);
					}
				});
			});
		});
	</script>
</body>
</html>