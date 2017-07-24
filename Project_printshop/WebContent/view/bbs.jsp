<%@page import="com.hb.mybatis.DAO"%>
<%@page import="com.hb.mybatis.BBS_VO"%>
<%@page import="java.util.List"%>
<%@page import="com.hb.mybatis.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="/Project_printshop/js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			function writepage_go() {
				if("${loginchk==-1 || loginchk==null}"=="true"){
					alert("로그인하십시오");
					location.href="/Project_printshop/Page_cont?cmd=login";
				}else if("${loginchk!=0 && b_category==0}"=="true"){
					alert("관리자만 가능합니다.");
					return;
				}else{
					location.href="/Project_printshop/Page_cont?cmd=write";
				}
			}
		</script>
		<style type="text/css">
			tr {
				text-align: center;
				padding: 4px 10px;
				background-color: #F6F6F6;
			}
			
			th {
				text-align: center;
				padding: 4px 10px;
				background-color: #b3b3b3;
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
			    border:1px solid #b3b3b3;
			    color:#2f313e;
			    font-weight:bold;
			}
			
			table tfoot ol.paging li a:hover {
			    background:#b3b3b3;
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
			    border:1px solid #595959;
			    background:#595959;
			    color:white;
			    font-weight:bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="top.jsp"/>
		<c:choose>
			<c:when test="${b_category==0}">
				<h2>공지사항</h2>
			</c:when>
			<c:otherwise>
				<h2>문의게시판</h2>
			</c:otherwise>
		</c:choose>
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
											<img src="img/images/re.png" width="12px" height="15px">
										</c:forEach>
									</c:if>
									<a href="/Project_printshop/Page_cont?cmd=bbsview&b_idx=${k.b_idx}&cPage=${cPage}">${k.title}</a>
								</td>
								<c:set var="c_idx" value="${k.c_idx}"/>
								<%
									String c_idx = (String)pageContext.getAttribute("c_idx");
									pageContext.setAttribute("c_name", DAO.getWriter(c_idx));
								%>
								<td>${c_name}</td>
								<td>${k.b_date.substring(0,10)}</td>
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
									<li><a href="/Project_printshop/Page_cont?cmd=bbs&b_category=${b_category}&cPage=${p.beginPage-p.pagePerBlock}">이전으로</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="k" begin="${p.beginPage}" end="${p.endPage}" step="1" varStatus="vs">
								<c:choose>
									<c:when test="${k==p.nowPage}">
										<li class="now">${k}</li>
									</c:when>
									<c:otherwise>
										<li><a href="/Project_printshop/Page_cont?cmd=bbs&b_category=${b_category}&cPage=${k}">${k}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- 다음 버튼 --%>
							<c:choose>
								<c:when test="${p.endPage>=p.totalPage}">
									<li class="disable">다음으로</li>
								</c:when>
								<c:otherwise>
									<li><a href="/Project_printshop/Page_cont?cmd=bbs&b_category=${b_category}&cPage=${p.beginPage+p.pagePerBlock}">다음으로</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
					<td colspan="1" align="center">
						<input type="button" value="글쓰기" onclick="writepage_go()"/>
					</td>
				</tr>
			</tfoot>	
		</table>
	</body>
</html>