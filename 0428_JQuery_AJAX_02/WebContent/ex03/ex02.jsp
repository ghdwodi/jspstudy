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
				$("#a").load("data2.jsp");
				
				$("#b").load("data2.jsp",{"result":$(this).val()});
				
				$.get("data2.jsp",function(data){
					$("#c").html(data);
				});
				
				/* append : 추가 */
				$.get("data2.jsp",function(data){
					$("#d").append(data);
				});
				
				$.post("data2.jsp",function(data){
					$("#e").html(data);
				});
				
				/* append : 추가 */
				$.post("data2.jsp",function(data){
					$("#f").append(data);
				});
			});
		</script>
	</head>
	<body>
		<div id="a">a</div><hr />
		<div id="b">b</div><hr />
		<div id="c">c</div><hr />
		<div id="d">d</div><hr />
		<div id="e">e</div><hr />
		<div id="f">f</div>
	</body>
</html>