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
			$(function() {
				$("#addrcheckbox").click(function(){
					var addrchk = $("#addrcheckbox").is(":checked");
					if(addrchk){
						$("#o_name").val("${cvo.c_name}");
						$("#sample6_postcode").val("${cvo.c_addrnum}");
						$("#sample6_address").val("${cvo.c_addr1}");
						$("#sample6_address2").val("${cvo.c_addr2}");
					}else{
						$("#o_name").val("");
						$("#sample6_postcode").val("");
						$("#sample6_address").val("");
						$("#sample6_address2").val("");
					};
				});
				$(".orders").click(function(){
					$.ajax({
						url:"/Project_printshop/Order_cont?cmd=calc",
						type:"get",
						data:$("#orderform").serialize(),	// 서블릿에 넘어가는 데이터
						dataType:"text",
						success:function(data){
							$("#orderdiv").html(data);
						},
						error:function(){
							alert("계산 실패");
						}
					});
				});
				$(".orders").keyup(function(){
					$.ajax({
						url:"/Project_printshop/Order_cont?cmd=calc",
						type:"get",
						data:$("#orderform").serialize(),	// 서블릿에 넘어가는 데이터
						dataType:"text",
						success:function(data){
							$("#orderdiv").html(data);
						},
						error:function(){
							alert("계산 실패");
						}
					});
				});
			});
			function order_go(f){
				if(f.o_name.value==""||
						f.addrnum.value==""||
						f.addr1.value==""||
						f.addr2.value==""){
					alert("주문지 정보를 입력하십시오.");
					return;
				}
				$.ajax({
					url:"/Project_printshop/Order_cont?cmd=img",
					type:"get",
					data:$("#orderform").serialize(),	// 서블릿에 넘어가는 데이터
					dataType:"text",
					success:function(data){
						$("#inform").html(data);
						$("#finalbtn").removeAttr("disabled");
					},
					error:function(){
					}
				});
			}
			function order_ok(f){
				if(f.o_name.value==""||
						f.addrnum.value==""||
						f.addr1.value==""||
						f.addr2.value==""){
					alert("주문지 정보를 입력하십시오.");
					return;
				}
				f.action = "/Project_printshop/SendMail_cont?cmd=order";
				f.submit();
			}
			function loginpage_go(){
				alert("로그인하십시오");
				location.href="/Project_printshop/Page_cont?cmd=login";
			}
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
		</script>
		<style>
			#orderdiv1{
				border: 1px solid black;
				position: relative;
				float: left;
				width: 350;
			}
			#orderdiv2{
				border: 1px solid black;
				position: relative;
				float: left;
				width: 350;
			}
			#inform img{
				height: 175px;
			}
		</style>
	</head>
	<c:choose>
		<c:when test="${loginchk==-1||empty loginchk}">
			<body onload="loginpage_go()"></body>
		</c:when>
		<c:otherwise>
			<body>
				<div id="bigdiv">
				<form id="orderform" method="post" enctype="multipart/form-data">
					<jsp:include page="top.jsp"/>
					<div id="orderdiv1">
						<input type="hidden" name="c_idx" value="${cvo.c_idx}"/>
						<table>
							<tr><th colspan="2" width="350"><h3>주문</h3></th></tr>
							<tr>
								<td>부수</td>
								<td><input class="orders" type="number" value="1" name="copy_num"/></td>
							</tr>
							<tr>
								<td>매수</td>
								<td><input class="orders" type="number" value="1" name="page_num"/></td>
							</tr>
							<tr>
								<td>용지</td>
								<td>
									<select class="orders" name="pf_idx" id="pf">
										<c:forEach var="k" items="${pfVo}" varStatus="pfvs">
											<option value="${k.pf_idx}">
											${k.paper_form} : ${k.pf_price}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>인쇄</td>
								<td>
									<select class="orders" name="pt_idx" id="pt">
										<c:forEach var="k" items="${ptVo}">
											<option value="${k.pt_idx}">
											${k.printing} : ${k.pt_price}원</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>간지/속지</td>
								<td>
									<select class="orders" name="ip_idx" id="ip">
										<c:forEach var="k" items="${ipVo}">
											<option value="${k.ip_idx}">
											${k.inner_paper} : ${k.ip_price}원</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>간지/속지 매수</td>
								<td><input class="orders" type="number" name="inner_paper_num" value="0"/></td>
							</tr>
							<tr>
								<td>표지</td>
								<td>
									<select class="orders" name="cover_idx" id="cover">
										<c:forEach var="k" items="${coverVo}">
											<option value="${k.cover_idx}">
											${k.cover} : ${k.cover_price}원</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>제본</td>
								<td>
									<select class="orders" name="bind_idx" id="bind">
										<c:forEach var="k" items="${bindVo}">
											<option value="${k.bind_idx}">
											${k.bind} : ${k.bind_price}원</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr><td colspan="2" style="text-align: right;">본인 정보로 보내기 <input type="checkbox" id="addrcheckbox"/></td></tr>
							<tr>
								<td>받는 사람</td>
								<td><input type="text" name="o_name" id="o_name"/></td>
							</tr>
							<tr>
								<td><input type="text" id="sample6_postcode" placeholder="우편번호" name="addrnum"/></td>
								<td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/></td>
							</tr>
							<tr>
								<td><input type="text" id="sample6_address" placeholder="주소" name="addr1"/></td>
								<td><input type="text" id="sample6_address2" placeholder="상세주소" name="addr2"/></td>
							</tr>
							<tr><td colspan="2">파일첨부<input type="file" name="up_file"/></td></tr>
							<tr><td colspan="2">특이사항</td></tr>
							<tr>
								<td colspan="2">
									<textarea rows="10" cols="50" name="o_rmks">용량이 10mb를 넘는 파일은 첨부가 안될 수 있습니다.
									이 경우엔 별도로 대용량 메일을 보내 주시기 바랍니다.
									</textarea>
								</td>
							</tr>
						</table>
					</div>
					<div id="orderdiv2">
						<table style="text-align: center;">
							<tr>
								<td width="250"><div id="orderdiv"></div></td>
								<td width="100"><input type="button" value="주문정보" onclick="order_go(this.form)"/></td>
							</tr>
							<tr>
								<td colspan="2" width="350">
									<input type="button" value="주문"
									 style="height: width: 100px;height: 30px;font-weight: bold;font-size: large;"
									 onclick="order_ok(this.form)" disabled="disabled" id="finalbtn"/>
								</td>
							</tr>
						</table>
						<div id="inform"></div>
					</div>
				</form>
				</div>
			</body>
		</c:otherwise>
	</c:choose>
</html>