<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 xml 읽어오기</title>
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "http://data.mafra.go.kr:7080/openapi/59b8562426e598d34bad37835a94736c23205ab31f14808b6003978930bb873a/xml/Grid_20151204000000000316_1/1/5",
			dataType : "jsonp",
			type : "get",
			crossDomain : true,
			success : function(data) {
				var xmlData = data.returnXml;
				$("#out").empty();
				var table="";
				$(xmlData).find("Grid_20151204000000000316_1").each(
					function() {
						var totalCnt = $(this).find("totalCnt").text();
						table = "<p>"+totalCnt+"<p>";
					});
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