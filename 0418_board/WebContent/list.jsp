<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.hb.mybbs.DAO"%>
<%@page import="com.hb.mybbs.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		// 페이지에 해당하는 시작번호와 끝번호 구하기
		int nowPage = 1;		// 현재 페이지
		int nowBlock = 1;		// 현재 블록
		int totalRecord = 0;	// 총 게시물의 수
		int numPerPage = 10;		// 한 페이지에 게시되는 글의 수
		int pagePerBlock = 10;	// 블록당 표현되는 페이지 수
		int totalPage = 0 ;		// 전체 페이지 수
		int totalBlock = 0;		// 전체 블록의 수
		int begin = 0;			// 시작 번호
		int end = 0;			// 끝 번호
		
		// 1. 전체 게시물 수
		totalRecord = DAO.getTotalCount();
		
		// 2. 전체 페이지 수
		totalPage = totalRecord/numPerPage;
		if(totalRecord%numPerPage!=0) totalPage++;
		
		// 3. 현재 페이지 구하기
		// list.jsp는 처음 빼고 무조건 cPage(현재 페이지)값을 받아야 한다.
		String cPage = request.getParameter("cPage");
		if(cPage!=null){
			nowPage = Integer.parseInt(cPage);
		} else {
			cPage = "1";
		}
		// 4. 현재 페이지에 따른 시작 번호와 끝 번호
		begin = (nowPage-1)*numPerPage+1;
		end = (begin-1)+numPerPage;
		
		// 5. DB처리를 위해 Map을 만든다
		Map<String,Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		List<BoardVO> bvoList = DAO.getList(map);
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
				<%if(bvoList.size()<=0){%>
					<tr><td colspan="5"><h2>등록된 자료가 없습니다.</h2></td></tr>
				<%}else{
					for(BoardVO k : bvoList){%>
					<tr>
						<td><%=k.getSeq()%></td>
						<td align="left">
							<%
							if(Integer.parseInt(k.getStep())>0){
								for(int i=0;i<Integer.parseInt(k.getStep());i++){
									%>
									<img src="images/arrow.JPG" height="12px">
									<%
								}
							}
							%>
							<a href="view.jsp?seq=<%=k.getSeq()%>&cPage=<%=cPage%>"><%=k.getTitle()%></a>
						</td>
						<td><%=k.getWriter()%></td>
						<td><%=k.getRegdate().substring(0,10)%></td>
						<td><%=k.getHit()%></td>
					</tr>
					<%}
				}%>
			</tbody>
			<tfoot>
				<tr align="center">
					<td colspan="4">
						<ol class="paging">
						<%
							// 현재 페이지를 이용한 블록의 시작 번호와 끝 번호
							int beginPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
							int endPage = beginPage+pagePerBlock-1;
							
							// 주의사항 : endPage가 totalPage보다 클 수 있다.
							if(endPage>totalPage) endPage=totalPage;
							
							// 이전 버튼
							if(beginPage<=pagePerBlock){%>
								<li class="disable">이전으로</li>
							<%}else{%>
								<li><a href="list.jsp?cPage=<%=beginPage-pagePerBlock%>">이전으로</a></li>
							<%}
							// 번호
							for(int i=beginPage;i<=endPage;i++){
								// 현재 페이지를 제외한 나머지 페이지는 링크가 걸리도록 한다.
								if(i==nowPage){%>
									<li class="now"><%=i%></li>
								<%}else{%>
									<li><a href="list.jsp?cPage=<%=i%>"><%=i%></a></li>
								<%}
							}
							// 다음 버튼
							if(endPage>=totalPage){%>
								<li class="disable">다음으로</li>
							<%}else{%>
								<li><a href="list.jsp?cPage=<%=beginPage+pagePerBlock%>">다음으로</a></li>
							<%}
						%>
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