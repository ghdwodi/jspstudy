<%@page import="com.hb.mybbs.Comm_VO"%>
<%@page import="java.util.List"%>
<%@page import="com.hb.mybbs.DAO"%>
<%@page import="com.hb.mybbs.BBS_VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String b_idx = request.getParameter("b_idx");
	BBS_VO bvo = DAO.getOnelist(b_idx);
	
	// 히트수
	int hit = Integer.parseInt(bvo.getHit())+1;
	bvo.setHit(String.valueOf(hit));
	
	// 히트수를 DB에 업데이트
	DAO.getHit(bvo);
	
	// 수정, 삭제를 위해 bvo 저장
	session.setAttribute("bvo", bvo);
	
	// 댓글 가져오기
	List<Comm_VO> commList = DAO.getCommList(b_idx);
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
			function modify_go() {
				location.href="modify.jsp";
			}
			function delete_go() {
				location.href="del.jsp";
			}
			function list_go() {
				location.href="list.jsp";
			}
		</script>
	</head>
	<body>
		<div id="bbs" align="center">
		
			<table summary="게시판 내용보기">
				<caption>게시판 글쓰기</caption>
				<form method="post" >
					<tbody>
						<tr>
							<th>제목:</th>
							<td colspan="2"><%=bvo.getSubject()%></td>
						</tr>
		
						<tr>
							<th>첨부파일:</th>
							<td colspan="2">
								<%if(bvo.getFile_name()!=null){%>
									<a href="download.jsp?file_name=<%=bvo.getFile_name()%>"><%=bvo.getFile_name()%></a>
								<%}else{%>
									<b>첨부파일 없음</b>
								<%}
								%>
							</td>
						</tr>
						
						<tr>
							<th>이름:</th>
							<td colspan="2"><%=bvo.getWriter()%></td>
						</tr>
						<tr>
							<th>내용:</th>
							<td colspan="2"><pre><%=bvo.getContent()%></pre></td>
						</tr>
						
						<tr>
							<td colspan="3">
								<input type="button" value="수정" onclick="modify_go()"/>
								<input type="button" value="삭제" onclick="delete_go()"/>
								<input type="button" value="목록" onclick="list_go()"/>
							</td>
						</tr>
					</tbody>
				</form>
				<tfoot>
					<form method="post" action="ans_write.jsp">
						<tr>
							<td>이름 : <input type="text" name="writer"/></td>
							<td>내용 : <textarea rows="4" cols="55" name="content"></textarea></td>
							<td>비밀번호:<input type="password" name="pwd"/>
								<input type="hidden" name="b_idx" value="<%=bvo.getB_idx()%>"/>
								<input type="submit" value="저장하기"/>
							</td>
						</tr>
					</form>
					<%for(Comm_VO k : commList){%>
						<form action="ans_del.jsp" method="post">
							<tr>
								<td>이름 : <%=k.getWriter()%></td>
								<td>날짜 : <%=k.getWrite_date().substring(0,10)%></td>
								<td><input type="submit" value="댓글 삭제" /></td>
							</tr>
							<tr>
								<td colspan="3">내용 : <%=k.getContent()%>
								<input type="hidden" name="b_idx" value="<%=k.getB_idx()%>" />
								<input type="hidden" name="c_idx" value="<%=k.getC_idx()%>" />
								</td>
							</tr>
						</form>
					<%}%>
				</tfoot>
			</table>
		</div>
	</body>
</html>
