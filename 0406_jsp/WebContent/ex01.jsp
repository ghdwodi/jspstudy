<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지시어 : 디렉티브(page, taglib, include)</title>
		<%-- "<%@"로 시작하는 맨 윗줄 코드가 페이지 지시어이다. --%>
		
	</head>
	<body>
		<!-- html 주석 : 소스 보기에서 볼 수 있다. -->
		<%-- jsp 주석 : 소스 보기에서 보이지 않는다. --%>
		<%--
		1. page지시어 : 현재 페이지에 대한 정보를 지정
				톰캣이 page지시어를 보고 해당 페이지를 판단해서 처리\
		  속성 : language = 스크립트코드에 사용되는 언어 지정(기본값은 java)
			 contentType = jsp가 생성할 문서의 타입(기본값은 "text/html; charset=UTF-8")
			 pageEncoding = jsp페이지 자체의 캐릭터인코딩 지정
			 import = 사용할 java클래스의 패키지 지정(java의 import와 같다)
			 session = 세션 사용 여부(기본값은 true)
	 		   ※ 세션 : 사용자 정보를 서버 측에서 저장하고 있는 것을 말한다.
	 		  세션의 생명 주기는 기본적으로 웹 브라우저를 종료하면 끝난다. 시간 조정도 가능(예 : 은행)
	 		 buffer = 출력 버퍼 크기 지정(기본값은 8kb. 최소값이다.)
	 		 autoFlush = 버퍼가 다 찼을 경우 자동 출력
	 		 errorPage = 오류 페이지 지정
	 		 isErrorPage = 해당 페이지가 오류 페이지이면 true, 아니면 false(기본값은 false)
	 	
	 	2. taglib지시어 : 해당 페이지에서 사용할 태그 라이브러리를 지정한다. JSTL을 사용할 때 필요하다.
	 	
	 	3. include지시어 : 특정 영역에 다른 문서를 포함할 때 사용한다.
	 				다른 문서의 소스를 복사하여 현재 문서에 붙여넣은 후 한 번에 처리한다.
		--%>
	</body>
</html>