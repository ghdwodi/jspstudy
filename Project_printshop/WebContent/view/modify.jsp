<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>한빛인쇄</title>
		<script type="text/javascript" src="/Project_printshop/js/jquery-3.2.1.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript">
			function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
	
		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;
	
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }
	
		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
	
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('sample6_address').value = fullAddr;
	
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('sample6_address2').focus();
		            }
		        }).open();
		    }
			$(function() {
				// 중복확인
				$("#pw2").keyup(function() {
					if($("#pw").val() == $("#pw2").val()){
						$("#pwchk").text("비밀번호 확인");
						$("#modifybtn").removeAttr("disabled");
					}else{
						$("#pwchk").text("비밀번호가 다릅니다");
						$("#modifybtn").attr("disabled","disabled");
					}
				});
			});
			function modifyok_go(f) {
				if(f.c_pw.value==""){
					alert("패스워드를 입력하세요");
					return;
				}
				if(f.c_name.value==""){
					alert("이름을 입력하세요");
					return;
				}
				if(f.c_addrnum.value==""){
					alert("우편번호를 입력하세요");
					return;
				}
				if(f.c_addr1.value==""){
					alert("주소를 입력하세요");
					return;
				}
				if(f.c_addr2.value==""){
					alert("상세주소를 입력하세요");
					return;
				}
				$.ajax({
					url:"/Project_printshop/Customer_cont?cmd=modify",
					type:"get",
					data:$("#modify").serialize(),	// 서블릿에 넘어가는 데이터
					dataType:"text",
					success:function(data){
						alert(data);
						location.href="/Project_printshop/Page_cont?cmd=mypage";
					},
					error:function(){
						alert("수정 실패");
					}
				});
			};
		</script>
		<style type="text/css">
			span{color: red;}
		</style>
	</head>
	<body>
		<jsp:include page="top.jsp"/>
		<form id="modify" method="post">
			<fieldset>
				<legend>회원정보 수정</legend>
				<input type="hidden" value="${cvo.c_idx}" name="c_idx">
				아이디 ${cvo.c_id}<br />
				비밀번호 수정<input type="password" name="c_pw" id="pw" value="${cvo.c_pw}"/><br />
				비밀번호 확인<input type="password" name="c_pw2" id="pw2"/><span id="pwchk">비밀번호를 입력하세요</span><br />
				성명<input type="text" name="c_name" value="${cvo.c_name}"/><br />
				이메일<c:choose>
						<c:when test="${cvo.c_email==null}">
							<input type="text" name="c_email"/>
						</c:when>
						<c:otherwise>
							<input type="text" name="c_email" value="${cvo.c_email}"/>
						</c:otherwise>
					</c:choose>
				<br />
				<input type="text" id="sample6_postcode" placeholder="우편번호" name="c_addrnum" value="${cvo.c_addrnum}"/>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" placeholder="주소" name="c_addr1" value="${cvo.c_addr1}"/>
				<input type="text" id="sample6_address2" placeholder="상세주소" name="c_addr2" value="${cvo.c_addr2}"/>
				<br />
				<input type="button" value="수정" id="modifybtn" disabled="disabled" onclick="modifyok_go(this.form)"/>
				<input type="reset" value="초기화"/>
			</fieldset>
		</form>
	</body>
</html>