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
			var request = createRequest();

			request.onreadystatechange = function() {
				if(request.readyState==4 && request.status==200){
					// eval(내용) : 해당 내용을 자바스크립트 형태로 변경
					var json = eval("("+request.responseText+")");
					var output = "";
					for (var i = 0; i < json.length; i++) {
						output += "<h2>";
						for(var key in json[i]){
							output += json[i][key];
						}
						output += "</h2>";
					}
					document.body.innerHTML = output;
				}
			}
			request.open("GET","data.js",false);
			request.send();
		</script>
	</body>
</html>