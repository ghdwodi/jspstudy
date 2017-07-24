<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#content{
		width: 1200px;
		height: 600px;
		background-color: skyblue;
		padding-left: 20px;
		padding-right: 20px;
	}
	img{width: 200px; height: 250px}
	#movie{
		width: 200px;
		height: 300px;
		border:  2px dashed red;
		position: absolute;
		top: 200px;
		left:50px;
		padding: 20px;
		display: none;
	}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function showdiv(){
		$("#movie").css("display","block");
	}
	function hidediv(){
		$("#movie").css("display","none");
	}
</script>
</head>
<body>
	<div id ="movie">
		<div>
			<img alt="" src="img/image1.gif">
			<a href="javascript:hidediv();">닫기</a>
		</div>
	</div>
	<div id="content">
			<h2> 피카다리 영화관</h2>
			<p>
				망했냐? <br /> 몰라몰라몰라
			</p>
			<a href="javascript:showdiv()">영화보기</a>
	</div>
</body>
</html>