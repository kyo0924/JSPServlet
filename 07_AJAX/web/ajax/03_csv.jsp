<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>csv전송하기</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	img{
		width: 100px;
	}
	table{
		border: 1px solid;
		border-collapse: collapse;
	}
	
	th, td {
		border: 1px solid;
		padding: 10px;
	}
</style>
</head>
<body>
<h2> jquery-ajax : csv</h2>
	<p>csv란 : 데이터를 특정한 특수문자로 구별하여 저장한 데이터
	CSV(comma-separated values)는 몇 가지 필드를 쉼표(,)로 구분한 텍스트 데이터 및 텍스트 파일
	'tab-separated values'(TSV)나, 반각 스페이스로 구분하는 'space-separated values'(SSV) 등을 합쳐서 character-separated values (CSV)라고 부르기도함
	 예) 유병승, 19, 경기도 시흥 | 이일교, 29, 노원구
	 유병승, 19, 경기도 시흥\n 
	 이일교, 29, 노원구
	</p>
	<button id="btn">실행</button>
	<div id="mydiv"></div>
	
	<script>
		$(function(){
			$("#btn").click(function(){
				$.ajax({
					url: "<%=request.getContextPath()%>/js/csv.do",
					dataType: "text",
					success: function(data) {
						console.log(data);
						var member = data.split("\n");
						console.log(member);
						var tbl = $("<table></table>");
						
						for (var i = 0; i < member.length; i++) {
							var property = member[i].split(",");
							var html = "";
							html += "<tr>";
							html += "<td><img src='<%=request.getContextPath()%>/images/" + property[2] + "'/></td>";
							html += "<td>" + property[0] + "</td>"
							html += "<td>" + property[1] + "</td>"
							html += "</tr>";
							tbl.append(html);
							/* property[0]; // 이름
							property[1]; // 전화번호
							property[2]; // 프로필 */
						}
						console.log(tbl);
						$("#mydiv").html(tbl);
					}
				});
			});
		});
	</script>
</body>
</html>