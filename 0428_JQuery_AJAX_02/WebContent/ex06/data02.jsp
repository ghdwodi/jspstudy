<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$.ajax({
					dataType : "xml",
					type : "get",
					url:"data2.xml",
					success:function(data){
						$("#out").empty();
						var table = "<table>"+
						"<thead><tr><th>이름</th><th>연도</th><th>주소</th></tr></thead>"+
						"<tbody>";
						$(data).find("company").each(function() {
							var name = $(this).find("name").text();
							var number = $(this).find("number").text();
							var addr = $(this).find("address").text();
							table += "<tr><td>"+name+"</td><td>"+number+"</td><td>"+addr+"</td></tr>";
						});
						table += "</tbody></table>";
						$("#out").append(table);
					},
					error:function(){
						alert("실패");
					}
				});
			});
		</script>
	</head>
	<body>
		<h2>결과보여주기</h2>
		<hr />
		<div id="out"></div>
	</body>
</html>