<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%-- XMLHttpRequest 객체 : 자바스크립트에서 ajax를 실행할 때 필요한 객체 --%>
		<script type="text/javascript">
			// 1. 객체 생성(XMLHttpRequest)
			var request = new XMLHttpRequest();
			
			// 2. open("전송 방식","경로","비동기여부");
			request.open("GET","data.html",false);
			
			// 3. send() : 실행
			request.send();
			
			// 4. 화면에 출력
			document.body.innerHTML += request.responseText;
//			document.body.append(request.responseText);	// 태그 적용 없이 가지고 옴
		</script>
	</body>
</html>