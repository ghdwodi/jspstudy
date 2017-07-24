<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL : jsp 표준 태그 라이브러리</title>
	</head>
	<body>
		<%--
		1. JSTL 라이브러리 다운받기 : tomcat.apache.org
		2. 라이브러리 지시어 사용
			<%@ taglib prefix="c"(접두어) uri="http://java.sun.com/jsp/jstl/core" %>
		--%>
		<%-- 변수 지원 태그(set) : <c:set var="변수이름" value="변수값"></c:set> --%>
		<c:set var="test" value="Hello JSTL"/>
		<%-- 출력 태그(out) : <c:out value="출력값 or 변수명(EL방식으로 써야 함)"></c:out> --%>
		<h2>
			<p><c:out value="test"/></p>
			<p><c:out value="${test}"/></p>
			<p>${test}</p>
		</h2>
		<hr />
		<%-- 변수 삭제 --%>
		<c:remove var="test"/>
		<h2>
			<p><c:out value="test"/></p>
			<p><c:out value="${test}"/></p>
			<p>${test}</p>
		</h2>
		<%-- if문 : else가 존재하지 않음, 조건이 참일 때만 실행 --%>
		<%-- <c:if test="조건식(EL사용)" var="변수명"></c:if> --%>
		<c:if test="${5==5}" var="k">
			<p>결과1 : ${k}</p>
			<p>결과2 : <c:out value="${k}"/></p>
		</c:if>
		<hr />
		<c:set var="sum" value="79"/>
		<c:if test="${sum>60}" var="res">
			<p>결과 : 합격, ${res}</p>
		</c:if>
		
		<%-- choose문 : switch문과 비슷하다(if-else 대용) --%>
		<%-- 조건식에서 list.size()==0||list.size==null보다는 empty를 사용 --%>
		<c:set var="sum2" value="75"/>
		<c:choose>
			<c:when test="${sum2>=90}">A학점</c:when>
			<c:when test="${sum2>=80}">B학점</c:when>
			<c:when test="${sum2>=70}">C학점</c:when>
			<c:when test="${sum2>=60}">D학점</c:when>
			<c:otherwise>F학점</c:otherwise>
		</c:choose>
		<hr />
		<c:set var="test" value="70"/>
		<c:choose>
			<c:when test="${test>=60}">
				<c:set var="result" value="합격"/>
			</c:when>
			<c:otherwise>
				<c:set var="result" value="불합격"/>
			</c:otherwise>
		</c:choose>
		<c:out value="${result}"/>
		
		<%-- 일반 for문 : <c:forEach></c:forEach> --%>
		<hr />
		<c:forEach begin="1" end="10" step="1" var="k">
			<c:if test="${k%2==0}">${k}</c:if>
		</c:forEach>
		<hr />
		<c:forEach begin="0" end="9" step="1" var="k" varStatus="vs">
			${k+1}/${vs.index}/${vs.count}<br />
		</c:forEach>
		
		<%-- 개선된 for문 --%>
		<%
		String[] arr = {"a","b","c","d","e"};	// 강제로 만든 배열은 속성에 집어넣어야 한다.
		pageContext.setAttribute("arr", arr);
		%>
		<hr />
		<c:forEach var="k" items="${arr}">
			${k}<br />
		</c:forEach>
		
		<%-- forTokens : 반복실행과 동시에 분리 --%>
		<hr />
		<c:forTokens var="k" 
		items="하늘을 우러러 한 점 부끄럼이 없기를.잎새에 우는 바람에도 나는 괴로워했다/오늘도 별이 바람에 스치운다" 
		delims="/,. ">
			${k}<br />
		</c:forTokens>
		
		<%-- <c:redirect> --%>
		<%-- <c:redirect url="JSTL02.jsp">
			<c:param name="name" value="윤동주"/>
			<c:param name="job" value="시인"/>
		</c:redirect> --%>
		<%-- <jsp:forward page="JSTL02.jsp">
			<jsp:param name="name" value="윤동주"/>
			<jsp:param name="job" value="시인"/>
		</jsp:forward> --%>
	</body>
</html>