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
	<h1>ajax 이용 파일 업로드</h1>
	<form name="ajaxFile" method="post" enctype="multipart/form-data">
		<!-- multiple : 파일 여러개 올릴 때 사용 -->
		<input type="file" name="ajaxFileTest" multiple/>
		<button type="button" id="btn">업로드</button>
	</form>
	<div id="image"></div>
	<script>
		$(function() {
			$("[name=ajaxFileTest]").change(function() {
				$.each(ajaxFile.ajaxFileTest.files, function(index, item){
				console.log(item);
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = $("<img></img>").attr("src", e.target.result).css({'width': '100px', 'height': '100px'});
					/* $("#image").html(img); */
					$("#image").append(img);
				}
				/* reader.readAsDataURL(ajaxFile.ajaxFileTest.files[index]); */
				reader.readAsDataURL(item);
			});
			});
			$("#btn").on("click", function(){
				var fd = new FormData();
				
				$.each(ajaxFile.ajaxFileTest.files, function(i, item){
					fd.append("test" + i, item);
				});
				console.log(ajaxFile.ajaxFileTest.files[0]);
				// formData 객체안에 test라는 이름의 파일 데이터가 들어감
				/* fd.append("test", ajaxFile.ajaxFileTest.files[0]); */
				$.ajax({
					url: "<%=request.getContextPath()%>/ajaxFile",
					data: fd,
					type: "post",
					processData: false,
					contentType: false,
					success: function(data) {
						alert("업로드 완료");
						$("#image").html('');
						$("[name=ajaxFileTest]").val('');
					}
				});
			});
		});
	</script>
</body>
</html>