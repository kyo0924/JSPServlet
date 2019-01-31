<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %> 

<%!
	//자바코드를 작성할 수 있음
	//선언자, 멤버변수, 메소드 선언
	public String name="유병승";
	private int age=21;
	
	public String print()
	{
		return name+" : "+age;
	}	
%>
<!-- 스크릿트립 -->
<%
	String addr="경기도 시흥시";
	double height=180.5;
	List<String> list=new ArrayList();
	list.add("유병승");
	list.add("신재민");
	list.add("이일교");
	list.add("박진우");
	String[] hobbys={"게임","꽃꽂이","복사","영화"};
	
	
	
	
	//request.getAttribute("aa");
	/* request.getRequestDispatcher("/views/content.jsp")
	.forward(request, response); */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp</title>
</head>
<body>
	<h1>안녕 jsp는 처음이지~ 잘해보자~!! 재민씨!!!!</h1>
	<h3>제 이름은 <%=name %> 저의 나이는 <%=age %>입니다</h3>
	<h4>정보출력 : <%=print() %></h4>
	<h3>우리반 3얼과 리더</h3>
	<ul>
		<% for(String name : list) {%>
			<li><%=name %></li>
		<%} %>
	</ul>
	<table border=1>
		<%for(int i=0;i<4;i++){ %>
			<tr>
				<td><%= list.get(i)%></td>
				<td><%= hobbys[i]%></td>
			</tr>
		<%} %>
	</table>
	
	<%if(age>19){ %>
	<h3>나는 성인이다~~!</h3>
	<%} %>
	
	
	
	
</body>
</html>





