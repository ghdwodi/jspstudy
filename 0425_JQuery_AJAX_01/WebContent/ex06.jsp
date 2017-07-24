<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			table, tr, td{border: 1px solid black;}
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				// .find		=> 특정 요소 찾기
				// .get			=> 특정 요소 가져오기
				// :contains()	=> 특정 요소의 값 찾기
				// :eq(index)	=> 해당 인덱스 요소
				// :gt(index)	=> 해당 인덱스값보다 큰 인덱스 요소
				// :lt(index)	=> 해당 인덱스값보다 작은 인덱스 요소
				
				$("td:contains('jsp')")				// jsp 문자 찾기
					.siblings().css("color","red")	// 형제 노드(자기 자신은 제외)
					.parent()						// 부모 노드
					.find("td:eq(0)").css("color","blue");
				
				var name = $("#web").get(0).tagName;
				alert(name+"태그");
			});
		</script>
	</head>
	<body>
		<table>
			<tbody>
				<tr id="app">
					<td>java</td>
					<td>Basic</td>
					<td>8.0</td>
				</tr>
				<tr id="web">
					<td>jsp</td>
					<td>servlet</td>
					<td>2.2</td>
				</tr>
				<tr>
					<td>Spring</td>
					<td>Web</td>
					<td>4.0</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>