<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.hb.mybbs.DAO"%>
<%@page import="com.hb.mybbs.BoardVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="bvo" class="com.hb.mybbs.BoardVO" />
<jsp:setProperty property="*" name="bvo" />
<%
	int lev = Integer.parseInt(bvo.getLev());
	int step = Integer.parseInt(bvo.getStep());
	int groups = Integer.parseInt(bvo.getGroups());
	
	String cPage = (String)session.getAttribute("cPage");
	
	lev++; step++;
	
	Map<String,Integer> map = new HashMap<>();
	map.put("groups", groups);
	map.put("lev", lev);

	DAO.getUp_lev(map);
	
	bvo.setFilename("");
	bvo.setIp(request.getRemoteAddr());
	bvo.setLev(String.valueOf(lev));
	bvo.setStep(String.valueOf(step));
	
	int result = DAO.getInsertRewrite(bvo);
	if(result>0){
		response.sendRedirect("list.jsp?cPage="+cPage);
	}else{%>
		<script type="text/javascript">
			alert("작성 실패");
			history.go(-1);
		</script>
	<%}
%>