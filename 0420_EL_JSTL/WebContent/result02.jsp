<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%--
		- EL 사용시 파라미터값은 별도로 속성에 저장하지 않아도 된다.
		  EL 내장객체 중 param, paramValues을 사용하기 때문이다. 즉 for문도 사용하지 않는다.
		--%>
		<h2>결과 보기</h2>
		<h3>
			<ul>
				<li>이름 : ${param.name}</li>
				<li>나이 : ${param.age}</li>
				<li>성별 : ${param.gender}</li>
				<li>취미 :
					<ul>
						<li>${paramValues.hobby[0]}</li>
						<li>${paramValues.hobby[1]}</li>
						<li>${paramValues.hobby[2]}</li>
						<li>${paramValues.hobby[3]}</li>
					</ul> 
				</li>
				<li>주소 : ${param.addr}</li>
				<li>애완동물
					<ul>
						<li>${paramValues.ani[0]}</li>
						<li>${paramValues.ani[1]}</li>
						<li>${paramValues.ani[2]}</li>
						<li>${paramValues.ani[3]}</li>
					</ul>
				</li>
			</ul>
		</h3>
	</body>
</html>