<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">
<!-- Core theme CSS-->
<link href="../resources/css/orderStyle.css" rel="stylesheet" />
<!-- font -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>주문서</title>
</head>
<style type="text/css">
#orderMain{
	margin-right: auto;
	margin-left: auto;
}
</style>
<script type="text/javascript">
function userCheck(){
	document.getElementById("rName").value = '${order.item0.userName}';
	document.getElementById("rAddr").value = '${order.item0.userAddr}';
	document.getElementById("rPhone").value = '${order.item0.userPhone}';
}

function orderCheck(){
	if(document.frm.rName.value == ""){
		swal("확인", "받는분을 입력해주세요.", "warning");
		frm.rName.focus();
		return false;
	}else	if(document.frm.rAddr.value == ""){
		swal("확인", "받는분 주소를 입력해주세요.", "warning");
		frm.rAddr.focus();
		return false;
	}else if(document.frm.rPhone.value.length == 0){
		swal("확인", "받는분 번호를 입력해주세요.", "warning");
		frm.rPhone.focus();
		return false;
	}else if(document.frm.rPhone.value.length != 11){
		swal("확인", "11자리를 입력해주세요.", "warning");
		frm.rPhone.focus();
		return false;
	}else if(document.frm.pay.value == ""){
		swal("확인", "결제수단을 선택해주세요.", "warning");
		frm.pay.focus();
		return false;
	}
}	

	</script>
<body>
	<!-- 헤드 -->
	<div id="header">
		<%@include file="../include/header.jsp" %>
	</div>

<!-- 주문서  -->
<div id="main">

	<div class="ordertitle">주문서</div>
		<div id="ocontent">
			<form name="frm" action="orderComplete" method="post">
				<div id="oproduct">
					<span>주문상품</span>
					<table> 
					<c:forEach var="i" begin="0" end="${num-1}" >
						<c:set var="item" value="item${i}"/>
							<input type="hidden"  name="cId" value="${order[item].cId}">
							<tr>
								<td><img src="../resources/images/${order[item].pImg}"	alt="${order[item].pName} 이미지" ></td>
								<td>${order[item].pName}</td>
								<td>${order[item].count}개</td>
								<td class="price"><fmt:formatNumber pattern="###,###,###"	value="${order[item].count * order[item].pPrice}" />원</td>
							</tr>
					</c:forEach>
					</table>
				</div>
			<div id="ome">
				<span>주문자 정보</span>
					<table>
						<tr>
							<th>보내는 분</th>
							<td>${userName}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${userPhone}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${userEmail}</td>
						</tr>
					</table>
			</div>
			<div id="total">
				<div class="operson">
					<span>배송지 정보</span>
						<table>
						<tr>
							<th>받는 분</th>
							<td><input type="text"  placeholder="이름을 입력해주세요." name="rName" id="rName" style="width: 100%;"></td>
						</tr>
						<tr>
							<th>배송지 주소</th>
							<td><input type="text"  placeholder="주소를 입력해주세요." name="rAddr" id="rAddr" style="width: 100%;"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text"  placeholder="연락처를 입력해주세요." name="rPhone" id="rPhone" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="width: 100%;"></td>
						</tr>
						<tr>
							<th>요청사항</th>
							<td>
								<textarea placeholder="요청사항을 입력해주세요." name="oMemo" id="oMemo" rows="5" cols="30"></textarea><br>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;"><input type="button" name="userInfo" id="userInfo" value="사용자 정보 불러오기" onclick="userCheck()"/></td>
						</tr>
						</table>
				</div>
				
				<div class="money">
					<span>결제 금액</span>
					<table>
						<tr>
							<th>최종결제 금액</th>
							<td style="color: #3FB0C8; font-weight: bold; float:right">
								<fmt:formatNumber pattern="###,###,###"	value="${total}"  />원
								<input type="hidden"  name="oTotal" value="${total}">
							</td>
						</tr>
						<tr>
							<th>상품 금액</th>
								<c:forEach var="i" begin="0" end="${num-1}" >
								<c:set var="item" value="item${i}"/>
								<tr>
									<td style="padding-right: 20px">┕ ${order[item].pName}</td>
									<td style="color: #3FB0C8; float:right">
										<fmt:formatNumber pattern="###,###,###"	value="${order[item].count * order[item].pPrice}" />원
									</td>
								</tr>
								</c:forEach>
						</tr>
					</table>
				</div>
			</div>
			
			<div id="pay">
				<span>결제 수단</span>
				<table>
					<tr>
						<td><input type="radio" value="kakao" id="kakao" name="pay"></td>
						<th><label for="kakao">카카오페이</label></th>
						<td><label for="kakao"><img src="../resources/images/Btn_kakaoPay.png"></label></td>		
					</tr>
					<tr>
						<td><input type="radio" value="naver" id="naver" name="pay"></td>
						<th><label for="naver">네이버페이</label></th>
						<td><label for="naver"><img src="../resources/images/Btn_naverPay.png"></label></td>
					</tr>
					<tr>
						<td><input type="radio" value="toss" id="toss"  name="pay"></td>
						<th><label for="toss">토스</label></th>						
						<td><label for="toss"><img src="../resources/images/Btn_toss.png"></label></td>
					</tr>
				</table>
			</div>
	
			<div id="paybtn">
				<input type="submit" class="pay" value="결제하기" onclick="return orderCheck()">
			</div>
	</form>
</div>

</div>
</body>
</html>