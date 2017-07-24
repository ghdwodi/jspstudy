<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function send_go(f) {
				f.action="ex10.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<h1> 파라미터 전송 하기 </h1>
	<form>
	   <fieldset>
	   		<legend>정보 전송</legend>
	   		<p>이름 : <input type="text" name="name" />  </p>
	   		<p>나이 : <input type="number" name="age" />  </p>
	   		<p>주소 : <input type="text" name="addr" />  </p>
	   		<p>성별 : <input type="radio" name="gender" value="남" /> 남  
	   		         <input type="radio" name="gender" value="여" /> 여
	   		</p>
	   		<p>취미 : 
	   		         <input type="checkbox" name="hobby" value="운동"/> 운동  
	   		         <input type="checkbox" name="hobby" value="독서"/> 독서  
	   		         <input type="checkbox" name="hobby" value="영화"/> 영화  
	   		         <input type="checkbox" name="hobby" value="게임"/> 게임  
	   		</p>
	   		<p>거주지 : <select name="addr2">
	   		              <option>:: 선택하세요 </option>
	   		              <option value="서울">서울</option>
	   		              <option value="경기">경기</option>
	   		              <option value="부산">부산</option>
	   		              <option value="광주">광주</option>
	   				   </select>
	   		</p>
	   		<p>운동 :<br /> 
	   		           <select name="play" multiple>
	   		              <option>:: 좋아하는 운동 </option>
	   		              <option value="축구">축구</option>
	   		              <option value="야구">야구</option>
	   		              <option value="농구">농구</option>
	   		              <option value="배구">배구</option>
	   		              <option value="당구">당구</option>
	   				   </select>
	   		</p>
	   		<p><input type="button" value="보내기" onclick="send_go(this.form)"/></p>
	   		<p><input type="reset" value="취소" /></p>
	   </fieldset> 
	</form>
	</body>
</html>