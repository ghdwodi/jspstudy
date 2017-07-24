<%@page import="com.hb.mybbs.Comm_VO"%>
<%@page import="java.util.List"%>
<%@page import="com.hb.mybbs.DAO"%>
<%@page import="com.hb.mybbs.BBS_VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				location.href="/0424_MVCpatturn_bbs/Control_bbs?cmd=modify";
			}
			function delete_go() {
				location.href="/0424_MVCpatturn_bbs/Control_bbs?cmd=delete";
			}
			function list_go() {
				location.href="/0424_MVCpatturn_bbs/Control_bbs?cmd=list";
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
							<td colspan="2">${bvo.subject}</td>
						</tr>
						<tr>
							<th>첨부파일:</th>
							<td colspan="2">
								<c:choose>
									<c:when test="${bvo.file_name==null}">
										<b>첨부파일 없음</b>
									</c:when>
									<c:otherwise>
										<a href="/0424_MVCpatturn_bbs/Control_bbs?cmd=download&b_idx=${bvo.b_idx}&file_name=${bvo.file_name}">${bvo.file_name}</a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						
						<tr>
							<th>이름:</th>
							<td colspan="2">${bvo.writer}</td>
						</tr>
						<tr>
							<th>내용:</th>
							<td colspan="2"><pre>${bvo.content}</pre></td>
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
					<form method="post" action="Control_bbs?cmd=ans_write">
						<tr>
							<td>이름 : <input type="text" name="writer"/></td>
							<td>내용 : <textarea rows="4" cols="55" name="content"></textarea></td>
							<td>비밀번호:<input type="password" name="pwd"/>
								<input type="hidden" name="b_idx" value="${bvo.b_idx}"/>
								<input type="submit" value="저장하기"/>
							</td>
						</tr>
					</form>
					<c:forEach var="k" items="${commList}">
						<form action="Control_bbs?cmd=ans_delete" method="post">
							<tr>
								<td>이름 : ${k.writer}</td>
								<td>날짜 : ${k.write_date.substring(0,10)}</td>
								<td><input type="submit" value="댓글 삭제" /></td>
							</tr>
							<tr>
								<td colspan="3">내용 : ${k.content}
								<input type="hidden" name="b_idx" value="${k.b_idx}" />
								<input type="hidden" name="c_idx" value="${k.c_idx}" />
								</td>
							</tr>
						</form>
					</c:forEach>
				</tfoot>
			</table>
		</div>
	</body>
</html>
