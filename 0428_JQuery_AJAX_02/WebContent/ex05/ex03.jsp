<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax로 json 읽어오기</title>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$.ajax({
					url : "ex03.js",
					dataType : "json",
					type : "get",
					success : function(data) {
						$("#out").empty();
						var table = "<table>"+
						"<thead><tr><th>종류</th><th>가격</th></tr></thead>"+
						"<tbody>";
						$.each(data,function(key,value){
							table += "<tr><td>"+this.name+"</td><td>"+this.price+"</td></tr>";
						});
						table += "</tbody></table>";
						$("#out").append(table);
					},
					error : function() {
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