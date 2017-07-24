<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ajax를 활용한 DB</title>
		<style type="text/css">
			span{
				width: 150px;
				color: red;
			}
			input{
				border: 1px solid red;
			}
			table{
				width : 80%;
				margin: auto;
			}
			th,td{
				border: 1px solid gray;
			}
			h2{
				text-align: center;
			}
		</style>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				function getList() {
					$.ajax({
						url:"/0502_Ajax/Controller",
						type:"get",
						dataType:"xml",
						success:function(data){
							var table = "";
							$(data).find("member").each(function(data){
								table += "<tr>";
								table += "<td>"+$(this).find("idx").text()+"</td>";
								table += "<td>"+$(this).find("id").text()+"</td>";
								table += "<td>"+$(this).find("pwd").text()+"</td>";
								table += "<td>"+$(this).find("name").text()+"</td>";
								table += "<td>"+$(this).find("age").text()+"</td>";
								table += "<td>"+$(this).find("addr").text()+"</td>";
								table += "<td><input type='button' value='삭제' id='del' name='"
									+$(this).find("idx").text()+"'/></td>";
								table += "</tr>";
							});
							$("#body").html(table);
						},
						error:function(){
							alert("실패");
						}
					});
				};
				
				// 중복확인
				$("#id").keyup(function() {
					$.ajax({
						url:"/0502_Ajax/Controller2",
						type:"get",
						data:"id="+$("#id").val(),	// 서블릿에 넘어가는 데이터
						dataType:"text",
						success:function(data){
							$("span").html(data);
						},
						error:function(){
							alert("실패");
						}
					});
				});
				
				// 회원가입
				$("#btn").click(function() {
					$.ajax({
						url:"/0502_Ajax/Controller3",
						type:"get",
						data:$("#myform").serialize(),	// 파라미터 직렬전송
						dataType:"text",
						success:function(data){
							alert(data);
							$("#myform input").each(function(){
								$(this).val("");
							});
							getList();
						},
						error:function(){
							alert("실패");
						}
					});
				});
				
				// 삭제
				$("table").on("click",'#del',function() {
					$.ajax({
						url:"/0502_Ajax/Controller4",
						type:"get",
						data:"idx="+$(this).attr("name"),
						dataType:"text",
						success:function(data){
							alert(data);
							getList();
						},
						error:function(){
							alert("실패");
						}
					});
				});
				
				getList();
			});
		</script>
	</head>
	<body>
		<h2>회원정보 입력하기</h2>
		<form name="myform" method="post" id="myform">
			<table>
				<thead>
					<tr>
						<th>아이디</th>
						<th>패스워드</th>
						<th>이름</th>
						<th>나이</th>
						<th>주소</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: left;">
							<input type="text" size="14" name="id" id="id"/>
							<span>중복결과여부</span>
						</td>
						<td><input type="password" size="8" name="pwd" id="pwd"/></td>
						<td><input type="text" size="14" name="name" id="name"/></td>
						<td><input type="number" size="8" name="age" id="age"/></td>
						<td><input type="text" size="30" name="addr" id="addr"/></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" align="center">
							<input type="button" value="가입하기" id="btn"/>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		<br />
		<br />
		<br />
		<h2>회원 정보 보기</h2>
		<div id="one">
			<table id="list" cellspacing="0" cellpadding="0">
				<thead>
					<tr style="background-color: pink">
						<th>번호</th>
						<th>아이디</th>
						<th>비번</th>
						<th>이름</th>
						<th>나이</th>
						<th>주소</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="body">
				</tbody>
			</table>
		</div>
	</body>
</html>