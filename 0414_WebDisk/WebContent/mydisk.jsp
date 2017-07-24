<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.hb.mywebdisk.VO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 검사 --%>
<%
	// 로그인 검사
		Boolean chk = false;
		chk = (Boolean)session.getAttribute("login_chk");
		if(chk==null){%>
			<script type="text/javascript">
				alert("로그인을 하십시오.");
				location.href="index.jsp";
			</script>
		<%}else{%>
<%
	VO mvo = (VO)session.getAttribute("loginVO");
	request.setCharacterEncoding("utf-8");
%>
<%-- 용량을 구하기 위한 선언부 --%>
<%!
	int totalSize = 500*1024*1024; // 개인당 총 용량 = 500MB;
	int userSize; // 사용한 용량
	String encoded_cPath; // ★현재 위치
	String cPath; // ★현재 위치
	
	// 개인 사용량 계산하는 메소드
	public int userSizeCount(File dir){
		int size = 0;
		// 매개변수 dir의 모든 파일과 폴더를 배열로 저장한다.
		File[] fileList = dir.listFiles();
		for(int i=0; i<fileList.length;i++){
			if(fileList[i].isFile()){	// 파일인가? => 용량이 존재
				size += fileList[i].length();
			}else{	// 파일이 아니라 폴더 => 용량이 존재하지 않음
				// 재귀함수(자기 자신을 부르는 함수, 메소드)
				size += userSizeCount(fileList[i]);
			}
		}
		return size;
	}
%>
<%
	encoded_cPath = request.getParameter("cPath");	// 맨 처음 해당 페이지에 들어오면 cPath는 무조건 null이다.
	// System.out.println("인코딩된 패스 : "+encoded_cPath);
	String path = null;
	if(encoded_cPath==null){	// 로그인 후 이 페이지에 처음으로 들어왔는가?
		path = getServletContext().getRealPath("/member/"+mvo.getId());
		userSize = userSizeCount(new File(path));
		cPath = mvo.getId();	// 본인 ID로 만들어진 폴더가 최상위 폴더가 된다.
	}else{
		cPath = URLDecoder.decode(encoded_cPath, "utf-8");
		// System.out.println("디코딩된 패스 : "+cPath);
		path = getServletContext().getRealPath("/member/"+cPath);
		userSize = userSizeCount(new File(path));
	}
	// 폴더 안의 또 다른 폴더를 선택했을 때 사용하는 경로
	File select_file = new File(path);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
		table,div {
			width: 600px;
			border: 1px solid skyblue;
			border-collapse: collapse;
			text-align: center;
		}
		th,td {
			border: 1px solid skyblue;
		}
		.dt {
			background-color: #dedede;
			width: 25%;
			text-align: center;
		}
		li.item {
			float: left;
			width: 160px;
			margin-bottom: 20px;
		}
		hr {
			clear: both;
		}
		ul.menu {
			list-style: none;
		}
		li a {
			display: block;
			font-size: 22px;
			line-height: 35px;
			margin-right: 10px;
			color: #00b3dc;
			font-weight: bold;
			padding: 0px 8px;
			border: 2px solid #00b3dc;
			text-decoration: none;
			text-align: center;
		}
		</style>
		<script type="text/javascript">
			function newFolder() {
				document.myForm.action="newfolder.jsp";
				document.myForm.submit();
			}
			function newFile() {
				document.myForm.action="upload.jsp";
				document.myForm.submit();
			}
			function delete_file(f) {	// 파일삭제
				document.myForm.filename.value = f ;
				document.myForm.action="delete_file.jsp";
			    document.myForm.submit();
			}
			function down_go(f){		// 파일 다운로드
				document.myForm.filename.value = f;
				document.myForm.action="filedownload.jsp";
			    document.myForm.submit();
			}
			function remydisk_go(f){	//폴더 이름
				document.myForm.cPath.value = "<%=cPath%>/"+f;
				document.myForm.action="mydisk.jsp";
			    document.myForm.submit();
			}
		</script>
	</head>
	<body>
		<h1>내 디스크</h1>
		<!-- 용량 표시하는 테이블  -->
		<table cellpadding="4" cellspacing="0">
			<tbody>
				<tr>
					<td class="dt">전체용량</td>
					<td><%= totalSize/1024 %>KB</td>
				</tr>
				<tr>
					<td class="dt">사용용량</td>
					<td><%= userSize/1024 %>KB</td>
				</tr>
				<tr>
					<td class="dt">남은용량</td>
					<td><%= (totalSize-userSize)/1024 %>KB</td>
				</tr>
			</tbody>
		</table>
		<hr />
		<ul class="menu">
			<li class="item"><a href="#" onclick="newFolder()">폴더만들기 </a></li>
			<li class="item"><a href="#" onclick="newFile()">파일올리기 </a></li>
		</ul>
		<hr />
		현재위치 : <%=cPath %>
		<p />
		<!-- 현재 위치의 폴더 내용을 출력하는 테이블 -->
		<table>
			<thead>
				<tr>
					<td class="dt">구분</td>
					<td class="dt">폴더 및 파일명</td>
					<td class="dt">삭제여부</td>
				</tr>
			</thead>
			<tbody>
			<%
				// 현재 위치가 ID와 같다면 최상위 폴더
				if(!cPath.equals(mvo.getId())){
					String up_path = cPath.substring(0,cPath.lastIndexOf("/"));
					String encoded_up_path = URLEncoder.encode(up_path,"utf-8");
				%>
				<tr>
					<td colspan="3"><a href="mydisk.jsp?cPath=<%=encoded_up_path%>"><img src="images/go_up.jpg"></a></td>
				</tr>
				<%}
				File[] s_list = select_file.listFiles();
				for(int i=0;i<s_list.length;i++){%>
					<tr>
						<%-- 파일과 폴더 그림 생성 --%>
						<%
						if(s_list[i].isFile()){%>
							<td><img src="images/file.jpg"></td>
						<%}else{%>
							<td><img src="images/folder.jpg"></td>
						<%}
						%>
						<%-- 파일이면 다운로드, 폴더면 내용 확인 --%>
						<%
						if(s_list[i].isFile()){%>
							<td><a onclick="down_go('<%=s_list[i].getName() %>')"><%=s_list[i].getName() %></a></td>
						<%}else{%>
							<td><a onclick="remydisk_go('<%=s_list[i].getName() %>')"><%=s_list[i].getName() %></a></td>
						<%}
						%>
						<%-- 삭제 유무 선택 --%>
						<%
						if(s_list[i].isFile()){%>
							<td><button onclick="delete_file('<%=s_list[i].getName() %>')">파일삭제</button></td>
						<%}else{
							File[] ch = s_list[i].listFiles();
							if(ch.length==0){%>						    
								<td><button onclick="delete_file('<%=s_list[i].getName() %>')">폴더삭제</button></td>
							<%}else{%>
								<td>폴더가 비어 있지 않습니다.</td>
							<%}
						}%>
					</tr>
				<%}%>
			</tbody>
		</table>
		<%-- 항상 가지고 다녀야 할 숨겨진 파라미터값들 --%>
		<form method="get" name="myForm">
			<input type="hidden" name="cPath" value="<%=cPath%>" />
			<input type="hidden" name="filename" value="" />
		</form>
	</body>
	<%}%>
</html>