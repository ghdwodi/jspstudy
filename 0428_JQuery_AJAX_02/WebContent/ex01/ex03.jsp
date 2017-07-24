<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<script type="text/javascript">
			function createRequest() {
				var request;
				try {
					// IE 7.0 이상
					request = new XMLHttpRequest();
				} catch (e) {
					try {
						// IE 6.0 이하
						request = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						request = new ActiveXObject("Msxml3.XMLHTTP");
					}
				}
				return request;
			}
			// 1. 객체 생성(ActiveXObject)
			var request = createRequest();
			// request.readyState => 데이터의 배달 결과 상태 표시;
			// 0:(객체 생성, open 안함), 1:(open함, send 안함)
			// 2:(send함, data를 받지 않음), 3:(data 일부만 받음)
			// 4:(data 전부를 받음)
			
			// request.status => 200(성공), 400번대(클라이언트 오류), 500번대(서버 오류)
			
			request.onreadystatechange = function() {
				if(request.readyState==4 && request.status==200){
					document.body.innerHTML += request.responseText;
				}
			}
			
			// 2. open("전송 방식","경로","비동기여부");
			request.open("GET","ajax.txt",false);
			
			// 3. send() : 실행
			request.send();
			
			// 4. 화면에 출력
//			document.body.innerHTML += request.responseText;
//			document.body.append(request.responseText);	// 태그 적용 없이 가지고 옴
			
		</script>
	</body>
</html>