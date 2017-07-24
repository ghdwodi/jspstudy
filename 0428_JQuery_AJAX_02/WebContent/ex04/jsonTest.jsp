<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>json을 jQuery로 읽기</title>
		<style type="text/css">
			table{
				border: 1px solid red;
				width: 600px;
			}
			tr,th,td{border: 1px solid red;}
		</style>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#btn").click(function() {
					$.getJSON("data.js",function(data){
						$("#out").empty();
						var table = "<table>";
						table += "<thead><tr><th>제품명</th><th>가격</th></tr></thead>";
						table += "<tbody>";
						/* $.each(data,function(key,value){
							table += "<tr><td>"+value["name"]+"</td><td>"+value["price"]+"</td></tr>";
						}); */
						$.each(data,function(key,value){
							table += "<tr><td>"+this.name+"</td><td>"+this.price+"</td></tr>";
						});
						table += "</tbody></table>";
						$("#out").append(table);
					});
				});
			});
		</script>
	</head>
	<body>
		<div id="btn">json jQuery로 읽기</div>
		<hr />
		<div id="out"></div>
	</body>
</html>