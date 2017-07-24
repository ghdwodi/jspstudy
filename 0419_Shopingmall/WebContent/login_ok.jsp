<%@page import="com.hb.myshopingmall.DAO"%>
<%@page import="com.hb.myshopingmall.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	MemberVO mvo = new MemberVO();
	mvo.setId(id); mvo.setPwd(pwd);
	if(DAO.getLogin(mvo)==null){%>
		<script type="text/javascript">
			alert("회원정보가 없습니다.");
			history.go(-1);
		</script>
	<%}else{
		session.setAttribute("memberVO", DAO.getLogin(mvo));
		if(DAO.getLogin(mvo).getMemberidx().equals("0")){
			session.setAttribute("login_chk", 0);
		}else{
			session.setAttribute("login_chk", 1);
		}
	%>
		<script type="text/javascript">
			location.href="memberpage.jsp?memberidx=<%=DAO.getLogin(mvo).getMemberidx()%>&name=<%=DAO.getLogin(mvo).getName()%>";
		</script>
	<%}
%>