<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	alert('<%=(String)request.getAttribute("msg")%>');
	location.href = "<%=request.getContextPath() + request.getAttribute("loc")%>";
</script>
</head>
<body>

</body>
</html>