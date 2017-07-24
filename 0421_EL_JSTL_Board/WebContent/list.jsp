<%@page import="com.hb.mybbs.Paging"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.hb.mybbs.DAO"%>
<%@page import="com.hb.mybbs.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			tr {
				text-align: center;
				padding: 4px 10px;
				background-color: #F6F6F6;
			}
			
			th {
				text-align: center;
				padding: 4px 10px;
				background-color: #B2CCFF;
			}
			table tfoot ol.paging {
		    	list-style:none;
		    	margin: 4px;
		    	padding: 4px;
			}
			
			table tfoot ol.paging li {
			    float:left;
			    margin-right:8px;
			}
			
			table tfoot ol.paging li a {
			    display:block;
			    padding:3px 7px;
			    border:1px solid #00B3DC;
			    color:#2f313e;
			    font-weight:bold;
			}
			
			table tfoot ol.paging li a:hover {
			    background:#00B3DC;
			    color:white;
			    font-weight:bold;
			}
			
			.disable {
			    padding:3px 7px;
			    border:1px solid silver;
			    color:silver;
			}
			
			.now {
			   padding:3px 7px;
			    border:1px solid #ff4aa5;
			    background:#ff4aa5;
			    color:white;
			    font-weight:bold;
			}
		</style>
		<script type="text/javascript">
			function write_go() {
				location.href="write.jsp";
			}
		</script>
	</head>
	<body>
	<%
		String cPage=null;
		if(request.getParameter("cPage")==null){
			cPage="1";
		}else{
			cPage=request.getParameter("cPage");
		}
		Paging p = new Paging(cPage);
		List<BoardVO> bvoList = DAO.getList(p.getMap());
		session.setAttribute("bvoList", bvoList);
		session.setAttribute("cPage", cPage);
		pageContext.setAttribute("p", p);
	%>
		<h2>BBS 리스트</h2>
		<table style="width: 700px">
			<tbody>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
				<c:choose>
					<c:when test="${empty bvoList}">
						<tr><td colspan="5"><h2>등록된 자료가 없습니다.</h2></td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${bvoList}" varStatus="vs">
							<tr>
								<td>${p.totalRecord-((p.nowPage-1)*p.numPerPage+vs.index)}</td>
								<td align="left">
									<c:if test="${k.step>0}">
										<c:forEach begin="1" end="${k.step}">
											<img src="images/arrow.JPG" height="12px">
										</c:forEach>
									</c:if>
									<a href="view.jsp?seq=${k.seq}&cPage=${cPage}">${k.title}</a>
								</td>
								<td>${k.writer}</td>
								<td>${k.regdate.substring(0,10)}</td>
								<td>${k.hit}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr align="center">
					<td colspan="4">
						<ol class="paging">
							<%-- 이전 버튼 --%>
							<c:choose>
								<c:when test="${p.beginPage<=p.pagePerBlock}">
									<li class="disable">이전으로</li>
								</c:when>
								<c:otherwise>
									<li><a href="list.jsp?cPage=${p.beginPage-p.pagePerBlock}">이전으로</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="k" begin="${p.beginPage}" end="${p.endPage}" step="1" varStatus="vs">
								<c:choose>
									<c:when test="${k==p.nowPage}">
										<li class="now">${k}</li>
									</c:when>
									<c:otherwise>
										<li><a href="list.jsp?cPage=${k}">${k}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- 다음 버튼 --%>
							<c:choose>
								<c:when test="${p.endPage>=p.totalPage}">
									<li class="disable">다음으로</li>
								</c:when>
								<c:otherwise>
									<li><a href="list.jsp?cPage=${p.beginPage+p.pagePerBlock}">다음으로</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
					<td colspan="1" align="center">
						<img src="images/but_write.gif" onclick="write_go()" height="25px" />
					</td>
				</tr>
			</tfoot>	
		</table>
	</body>
</html>