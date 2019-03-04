<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean class="com.kh.model.vo.Person" id="person" scope="request"/>
이름 : <jsp:getProperty property="name" name="person"/>
나이 : <jsp:getProperty property="age" name="person"/>
주소 : <jsp:getProperty property="address" name="person"/>
<jsp:setProperty property="name" name="person" value="김지섭"/>
이름: <jsp:getProperty property="name" name="person"/>
<jsp:useBean class="com.kh.model.vo.Person" id="p"/>
<jsp:setProperty property="name" value="권민아"  name="p"/>
<jsp:setProperty property="age" value="25"  name="p"/>
<jsp:setProperty property="address" value="하남"  name="p"/>
이름 : <jsp:getProperty property="name" name="p"/>
나이 : <jsp:getProperty property="age" name="p"/>
주소 : <jsp:getProperty property="address" name="p"/>
</body>
</html>