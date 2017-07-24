<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			h2{text-align: center;}
			table{width: 70%}
			table,tr,td,th{
				text-align: center;
				border: 1px solid red;
				margin: auto;
			}
		</style>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#btn1").click(function() {
					$.ajax({
						url:"/0501_Ajax/Controller6",
						type:"get",
						dataType:"text",
						success:function(data) {
							var table = "<table><thead><tr><th>지역</th><th>온도</th><th>날씨</th></tr></thead>";
							table += "<tbody>";
							var str = data.split("/");
							for(var k in str){
								table += "<tr>";
								var st = str[k].split(",");
								for(var l in st){
									table += "<td>"+st[l]+"</td>";
								}
								table += "</tr>"
							}
							table += "</tbody></table>"
							$("#mydiv").html(table);
						},
						error:function() {
							alert("실패");
						}
					});
				});
				$("#btn2").click(function() {
					$.ajax({
						url:"/0501_Ajax/Controller7",
						type:"get",
						dataType:"json",
						success:function(data) {
							var str = "<table><thead><tr><th>도서관이름</th><th>주소</th><th>휴관일</th><th>전화번호</th></tr></thead>";
							str += "<tbody>";
							$.each(data,function(data){
								$.each(this["row"],function(data2){
									str += "<tr>";
									str += "<td>"+this["LBRRY_NAME"]+"</td>";
									str += "<td>"+this["ADRES"]+"</td>";
									str += "<td>"+this["FDRM_CLOSE_DATE"]+"</td>";
									str += "<td>"+this["TEL_NO"]+"</td>";
									str += "</tr>";
								});
							});
							str += "</tbody></table>";
							$("#mydiv").html(str);
						},
						error:function() {
							alert("실패");
						}
					});
				});
				$("#btn3").click(function() {
					$.ajax({
						url:"/0501_Ajax/Controller8",
						type:"get",
						dataType:"xml",
						success:function(data) {
							var str = "<table><thead><tr><th>지역</th><th>온도</th><th>날씨</th></tr></thead>";
							str += "<tbody>";
							$(data).find("local").each(function() {
								str += "<tr>";
								str += "<td>"+$(this).text()+"</td>";
								str += "<td>"+$(this).attr("ta")+"</td>";
								str += "<td>"+$(this).attr("desc")+"</td>";
								str += "</tr>";
							});
							str += "</tbody></table>";
							$("#mydiv").html(str);
						},
						error:function() {
							alert("실패");
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<h3>날씨 보기<button id="btn1">클릭</button></h3>
		<h3>서울 도서관 목록<button id="btn2">클릭</button></h3>
		<h3>날씨 보기2<button id="btn3">클릭</button></h3>
		<div id="mydiv"></div>
	</body>
</html>