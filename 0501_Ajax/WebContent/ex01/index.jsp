<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			function list_all() {
				location.href = "/0501_Ajax/Controller?type=list";
			}
			function list_xml() {
				location.href = "/0501_Ajax/Controller?type=list_xml";
			}
			function list_xml_attr() {
				location.href = "/0501_Ajax/Controller?type=list_xml_attr";
			}
			function list_json() {
				location.href = "/0501_Ajax/Controller?type=list_json";
			}
		</script>
	</head>
	<body>
		<button onclick="list_all()">전체보기</button>
		<button onclick="list_xml()">XML로 만들기</button>
		<button onclick="list_xml_attr()">XML속성을 이용해서 만들기</button>
		<button onclick="list_json()">json 만들기</button>
	</body>
</html>