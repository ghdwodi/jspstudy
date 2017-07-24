<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function send_go1(f) {
				f.action="result01.jsp";
				f.submit();
			}
			function send_go2(f) {
				f.action="result02.jsp";
				f.submit();
			}
			function send_go3(f) {
				f.action="result03.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form method="post">
			<p>이름 : <input type="text" name="name" /></p>
			<p>나이 : <input type="text" name="age" /></p>
			<p>성별 : 
		         <input type="radio" name="gender" value="남"/>남  
		         <input type="radio" name="gender" value="여"/>여
			</p>
			<p>취미 :  
			     <input type="checkbox" name="hobby" value="운동" /> 운동
			     <input type="checkbox" name="hobby" value="음악" /> 음악
			     <input type="checkbox" name="hobby" value="영화" /> 영화
			     <input type="checkbox" name="hobby" value="독서" /> 독서
			</p>  
			<p>거주지 : 
				<select name="addr">
					<option value="서울">서울</option>
					<option value="부산">부산</option>
					<option value="광주">광주</option>
					<option value="제주">제주</option>
				</select> 
			</p>
			<p>애완동물 : 
				<select name="ani" multiple="multiple">
					<option value="강아지">강아지</option>
					<option value="고양이">고양이</option>
					<option value="거북이">거북이</option>
					<option value="뱀">뱀</option>
				</select> 
			</p>  
			<p>
				<input type="button" value="전달1" onclick="send_go1(this.form)"/>
				<input type="button" value="전달2" onclick="send_go2(this.form)"/>
				<input type="button" value="전달3" onclick="send_go3(this.form)"/>
			</p>     
		</form>
	</body>
</html>