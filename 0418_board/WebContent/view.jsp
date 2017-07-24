<%@page import="com.hb.mybbs.DAO"%>
<%@page import="com.hb.mybbs.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	BoardVO bvo = DAO.getOneList(request.getParameter("seq"));
	String cPage = request.getParameter("cPage");
	session.removeAttribute("cPage");
	session.setAttribute("cPage", cPage);
	
	int hit = Integer.parseInt(bvo.getHit())+1;
	bvo.setHit(String.valueOf(hit));
	DAO.getHit(bvo);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			tr {
			    text-align:center;
			    padding:4px 10px;
			    background-color: #F6F6F6;
			}
				
			th {
				width:120px;
			    text-align:center;
			    padding:4px 10px;
			    background-color: #B2CCFF;
			}
		</style>
		<script type="text/javascript">
			function rewrite_go() {
				document.forms[0].submit();
			}
			function modify_go(){
				document.forms[0].action="modify.jsp";
				document.forms[0].submit();
			}
			function delete_go(){
				document.forms[0].action="delete.jsp";
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
		<form name="myform" action="rewrite.jsp" method="post">
			<table style="width: 500px">
				<tr>
					<th bgcolor="#B2EBF4">작성자</th>
					<td><%=bvo.getWriter()%></td>
					<td rowspan="3" width="100px" height="150px">
						<img alt="사진없음" src="upload/<%=bvo.getFilename()%>" width="100px" height="150px">
					</td>
				</tr>
				<tr>
					<th bgcolor="#B2EBF4">제목</th>
					<td><%=bvo.getTitle()%></td>
				</tr>
				<tr>
					<th bgcolor="#B2EBF4">첨부파일</th>
					<%if(bvo.getFilename()==null){%>
						<td><b>첨부파일없음</b></td>
					<%}else{%>
						<td><a href="download.jsp?filename=<%=bvo.getFilename()%>"><%=bvo.getFilename()%></a></td>
					<%}
					%>
				</tr>
				<tr>
					<th bgcolor="#B2EBF4" colspan="3">내용</th>
				</tr>
				<tr>
					<td colspan="3" align="left"><pre><%=bvo.getContent()%></pre></td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="hidden" name="groups" value="<%=bvo.getGroups()%>" />
						<input type="hidden" name="step" value="<%=bvo.getStep()%>" />
						<input type="hidden" name="lev" value="<%=bvo.getLev()%>" />
						<input type="hidden" name="seq" value="<%=bvo.getSeq()%>" />
						<input type="hidden" name="pwd" value="<%=bvo.getPwd()%>" />
						<input type="hidden" name="filename" value="<%=bvo.getFilename()%>" />
						<img src="images/button/but_answer.gif" onclick="rewrite_go()" height="25px" />
					   	<img src="images/button/but_modify.gif" onclick="modify_go()" height="25px" />
					   	<img src="images/button/but_del.gif" onclick="delete_go()" height="25px" />
					   	<img src="images/but_list.gif" onclick="javascript:location.href='list.jsp?cPage=<%=cPage%>'" height="25px" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>