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
					dataType : "json",
					type : "get",
					url:"data1.js",
					success:function(data){
						$("#out").empty();
						var table = "<table>"+
						"<thead><tr><th>번호</th><th>이름</th><th>나이</th></tr></thead>"+
						"<tbody>";
						$.each(data,function(key,value){
							table += "<tr><td>"+
										this.Num+"</td><td>"+
										this.Name+"</td><td>"+
										this.Age+"</td></tr>";
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