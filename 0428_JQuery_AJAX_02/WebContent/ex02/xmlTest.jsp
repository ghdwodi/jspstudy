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
					// html이나 text는 그냥 가져와서 출력하면 되었다.
					// xml은 출력하려면 parsing을 해야 한다.
					// xml 자료를 html변경(DOM방식)
					var xml = request.responseXML;
					var names = xml.getElementsByTagName("name");
					var prices = xml.getElementsByTagName("price");
					
					// 요소에서 text추출
					for (var i = 0; i < names.length; i++) {
						var name = names[i].childNodes[0].nodeValue;
						var price = prices[i].childNodes[0].nodeValue;
						document.body.innerHTML += "<h2>"+name+" : "+price+"</h2>";
					}
				}
			}
			request.open("GET","data.xml",false);
			request.send();
		</script>
	</body>
</html>