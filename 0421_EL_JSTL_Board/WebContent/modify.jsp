<%@page import="com.hb.mybbs.DAO"%>
<%@page import="com.hb.mybbs.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	BoardVO bvo = DAO.getOneList(seq);
	pageContext.setAttribute("bvo", bvo);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			#bbs table {
			    width:580px;
			    margin-left:10px;
			    border:1px solid black;
			    border-collapse:collapse;
			    font-size:14px;
			    
			}
			
			#bbs table caption {
			    font-size:20px;
			    font-weight:bold;
			    margin-bottom:10px;
			}
			
			#bbs table th {
			    text-align:center;
			    border:1px solid black;
			    padding:4px 10px;
			}
			
			#bbs table td {
			    text-align:left;
			    border:1px solid black;
			    padding:4px 10px;
			}
			.no {width:15%}
			.subject {width:30%}
			.writer {width:20%}
			.reg {width:20%}
			.hit {width:15%}
			.title{background:lightsteelblue}
			.odd {background:silver}
		</style>
		<script type="text/javascript">
			function sendData(){
				for(var i=0 ; i<document.forms[0].elements.length ; i++){
					if(document.forms[0].elements[i].value == "" && i!=2 && i!=5){
						alert(document.forms[0].elements[i].name+
								"를 입력하세요");
						document.forms[0].elements[i].focus();
						return;//수행 중단
					}
				}
				if(document.forms[0].elements[3].value != ${bvo.pwd}){
					alert("암호가 틀렸습니다.");
					document.forms[0].elements[3].focus();
					return;
				}
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
		<div id="bbs">
			<form action="modify_ok.jsp" method="post" 
			encType="multipart/form-data">
				<table summary="글 수정하기">
					<caption>글 수정하기</caption>
					<tbody>
						<tr>
							<th>제목:</th>
							<td><input type="text" name="title"  value="${bvo.title}"  size="45"/></td>
						</tr>
						<tr>
							<th>이름:</th>
							<td>${bvo.writer}</td>
						</tr>
						<tr>
							<th>내용:</th>
							<td><textarea name="content" cols="50" 
									rows="8">${bvo.content}</textarea></td>
						</tr>
						<tr>
							<th>첨부파일:</th>
							<td><input type="file" name="filename"/></td>
						</tr>
						<tr>
							<th>비밀번호:</th>
							<td>
								<input type="password" name="pwd" size="12"/>
								<input type="hidden" name="seq" value="${bvo.seq}" />
								<input type="hidden" name="filename2" value="${bvo.filename}" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<img src="images/but_submit.gif" onclick="sendData()" height="25px" />
								<img src="images/but_list.gif" onclick="javascript:location.href='list.jsp'" height="25px" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</body>
</html>