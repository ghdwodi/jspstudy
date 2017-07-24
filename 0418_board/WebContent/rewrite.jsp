<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    request.setCharacterEncoding("utf-8");
    int groups = Integer.parseInt(request.getParameter("groups"));
    int step = Integer.parseInt(request.getParameter("step"));
    int lev = Integer.parseInt(request.getParameter("lev"));
    
    System.out.println("rewrite Test : " + groups+"," + step+ ","+lev);
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function sendData(){
				for(var i=0 ; i<document.forms[0].elements.length ; i++){
					if(document.forms[0].elements[i].value == ""){
						if(i==6)continue;
						alert(document.forms[0].elements[i].name+
								"를 입력하세요");
						document.forms[0].elements[i].focus();
						return;//수행 중단
					}
				}
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
	<h1>답글쓰기</h1>
		<form action="rewrite_ok.jsp" method="post">
			<input type="hidden" name="groups" value="<%=groups%>">
			<input type="hidden" name="step" value="<%=step%>">
			<input type="hidden" name="lev" value="<%=lev%>">
			<table border="1">
				<tr>
					<td bgcolor="#B2CCFF">작성자</td>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<td bgcolor="#B2CCFF">제목</td>		
					<td><input type="text" name="title"></td>		
				</tr>
				<tr>
					<td bgcolor="#B2CCFF">내용</td>
					<td>
						<textarea rows="10" cols="50" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td bgcolor="#B2CCFF">비밀번호</td>		
					<td><input type="password" name="pwd"></td>		
				</tr>
				<tr>
					<td colspan="2">
						<img src="images/but_submit.gif" onclick="sendData()" height="25px" />
						<img src="images/but_list.gif" onclick="javascript:location.href='list.jsp'" height="25px" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>