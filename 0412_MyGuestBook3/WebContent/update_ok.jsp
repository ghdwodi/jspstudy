<%@page import="com.hb.myguestbook.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<jsp:useBean id="vo2" class="com.hb.myguestbook.VO" />
<jsp:setProperty property="*" name="vo2"/>
<%
// insert, delete, update는 수동커밋이 기본 => 반드시 나중에 커밋
	SqlSession ss = DBService.getFactory().openSession(false);
	
	// insert(mapper의 id, id의 파라미터)
	// insert, delete, update의 결과는 int이다.
	int result = ss.update("update", vo2);
	if(result>0){
		String idx = vo2.getIdx();
		response.sendRedirect("onelist.jsp?idx="+idx);
	}else{%>
		<script type="text/javascript">
			alert("갱신 실패");
			location.href="list.jsp";
		</script>
	<%}
	ss.commit();
	ss.close();
%>