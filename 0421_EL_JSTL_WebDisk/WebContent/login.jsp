<%@page import="com.hb.mywebdisk.VO"%>
<%@page import="com.hb.mywebdisk.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="vo" class="com.hb.mywebdisk.VO" />
<jsp:setProperty property="*" name="vo"/>
<script type="text/javascript">
	function logout_go() {
		location.href="logout.jsp";
	}
	function myinfo_go() {
		location.href="myinfo.jsp";
	}
	function mydisk_go() {
		location.href="mydisk.jsp";
	}
</script>
<%
	VO loginVO = DAO.getLogin(vo);
	if(loginVO!=null){
		session.setAttribute("loginVO", loginVO);
		session.setAttribute("login_chk", true);
		%>
		<h2><%=loginVO.getName()%>(<%=loginVO.getId()%>)님 환영합니다.</h2>
		<button onclick="logout_go()">로그아웃</button>
		<button onclick="myinfo_go()">내 정보</button>
		<button onclick="mydisk_go()">내 디스크</button>
	<%}else{%>
		<script type="text/javascript">
			alert("로그인 실패");
			history.go(-1);
		</script>
	<%}
%>