<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.*" %> --%>    
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 운세</title>
</head> -->
<%-- <%
	Date today=new Date();
%> --%>
<%@ include file="/views/common/header.jsp" %>
<section>
	<h2>오늘의 운세<%@ include file="/views/dateView.jsp" %></h2>
	<select>
		<option>쥐띠</option>
		<option>돼지띠</option>
		<option>닭띠</option>
		<option>소띠</option>
		<option>개띠</option>
		<option>토끼띠</option>
		<option>잔나비띠</option>		
	</select>
</section>
<%@ include file="/views/common/footer.jsp" %>


<!-- </body>
</html>
 -->




