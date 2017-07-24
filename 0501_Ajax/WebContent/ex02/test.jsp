<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax로 컨트롤러 텍스트 파일 가져오기</title>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#btn1").click(function() {
					$.ajax({
						url:"/0501_Ajax/Controller2",
						type:"get",
						dataType:"text",
						success:function(data){
							var table = "";
							var str = data.split("/");
							for(var k in str){
								table += "<tr>";
								var st = str[k].split(",");
								for(var l in st){
									table += "<td>"+st[l]+"</td>";
								}
								table += "</tr>"
							}
							$("#body").append(table);
						},
						error:function() {
							alert("실패");
						}
					});
				});
				$("#btn2").click(function() {
					$.ajax({
						url:"/0501_Ajax/Controller3",
						type:"get",
						dataType:"xml",
						success:function(data){
							var str = "";
							$(data).find("member").each(function() {
								str += "<tr>";
								str += "<td>"+$(this).find("idx").text()+"</td>";
								str += "<td>"+$(this).find("id").text()+"</td>";
								str += "<td>"+$(this).find("pwd").text()+"</td>";
								str += "<td>"+$(this).find("name").text()+"</td>";
								str += "<td>"+$(this).find("age").text()+"</td>";
								str += "<td>"+$(this).find("addr").text()+"</td>";
								str += "</tr>";
							});
							$("#body").append(str);
						},
						error:function() {
							alert("실패");
						}
					});
				});
				$("#btn3").click(function() {
					$.ajax({
						url:"/0501_Ajax/Controller4",
						type:"get",
						dataType:"xml",
						success:function(data){
							var str = "";
							$(data).find("member").each(function() {
								str += "<tr>";
								str += "<td>"+$(this).attr("idx")+"</td>";
								str += "<td>"+$(this).attr("id")+"</td>";
								str += "<td>"+$(this).attr("pwd")+"</td>";
								str += "<td>"+$(this).attr("name")+"</td>";
								str += "<td>"+$(this).attr("age")+"</td>";
								str += "<td>"+$(this).attr("addr")+"</td>";
								str += "</tr>";
							});
							$("#body").append(str);
						},
						error:function() {
							alert("실패");
						}
					});
				});
				$("#btn4").click(function() {
					$.ajax({
						url:"/0501_Ajax/Controller5",
						type:"get",
						dataType:"json",
						success:function(data){
							var str = "";
							$.each(data,function(data){
								str += "<tr>";
								str += "<td>"+this["idx"]+"</td>";
								str += "<td>"+this["id"]+"</td>";
								str += "<td>"+this["pwd"]+"</td>";
								str += "<td>"+this["name"]+"</td>";
								str += "<td>"+this["age"]+"</td>";
								str += "<td>"+this["addr"]+"</td>";
								str += "</tr>";
							});
							$("#body").html(str);
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
		<h2 id="btn1">텍스트 파일 가져오기</h2>
		<h2 id="btn2">xml 파일 가져오기</h2>
		<h2 id="btn3">xml_attr(속성) 가져오기</h2>
		<h2 id="btn4">json 가져오기</h2>
		<div id="mydiv">
			<table style="border:1px solid navy; width:70%">
				<thead>
					<tr>
						<th>번호</th><th>아이디</th><th>비번</th><th>이름</th><th>나이</th><th>주소</th>
					</tr>
				</thead>
				<tbody id="body">
				</tbody>
			</table>
		</div>
	</body>
</html>