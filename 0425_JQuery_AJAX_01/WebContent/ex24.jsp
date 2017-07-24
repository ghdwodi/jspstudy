<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#button").click(function() {
					$("#myDiv").empty(); // 초기화
					var rows = parseInt($("#row").val());
					var cols = parseInt($("#col").val());
					var str = "<table border=1 width=300px>";
					str += "<tbody>";
					for(var i=0;i<rows;i++){
						str += "<tr>";
						for(var j=0;j<cols;j++){
							str += "<td>"+(i+1)+"행 "+(j+1)+"열"+"</td>";
						}
						str += "</tr>";
					}
					str += "</tbody></table>";
					$("#myDiv").html(str);
//					$("#myDiv").append(str);
				});
			});
		</script>
	</head>
	<body>
		<span><b>여기에 태그 추가</b></span>
		<input type="number" id="row"/>행
		<input type="number" id="col"/>열
		<input type="button" id="button" value="테이블 생성"/>
		<div id="myDiv"></div>
	</body>
</html>