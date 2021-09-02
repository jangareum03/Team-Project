<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Core theme CSS-->
<link href="../resources/css/cartStyle.css" rel="stylesheet" />
<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>장바구니</title>
</head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<body>
	<!-- 헤드 -->
		<%@include file="../include/header.jsp" %>


	<!-- 타이틀 -->
	<div id="main">
		<div class="title">장바구니</div>

		<div id="content">
			<form method="get" action="order" role="frm">
				<table id="main">
					<tr class="crow">
						<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품금액</th>
						<th>삭제</th>
					</tr>
					<c:choose>
						<c:when test="${cart.itemsYN == 0}">
							<tr>
								<td colspan="5" style="height: 15rem">장바구니에 상품이 담겨있지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="cart" items="${cart.items}">
								<tr>
									<td>
										<input type="checkbox" name="cId" class="itemCheck"	onclick="itemSum()" value="${cart.cId}"> 
										<input type="hidden" class="itemSum" value="${cart.count * cart.pPrice}">
									</td>
									<td>
										<div style="display: flex; padding-left: 20rem">
											<img src="../resources/images/${cart.pImg}" alt="${cart.pName} 이미지" class="img">
											<div class="info">
												${cart.pName}<br>
												<fmt:formatNumber pattern="###,###,###" value="${cart.pPrice}" />	원<br>
											</div>
										</div>
									</td>
									<td>${cart.count}개</td>
									<td class="sum"><fmt:formatNumber pattern="###,###,###"
											value="${cart.count * cart.pPrice}" />원</td>
									<td><a href='deleteItem?cId=${cart.cId}'><input
											type="button" value="삭제" class="DBtn"></a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<tr class="crow">
						<th colspan="2">총합</th>
						<td colspan="3" style="font-weight: bold; color: #0A7ABF;"
							id="total" value="${sum}">0원</td>
					</tr>
				</table>
				<div id="btn">
					<input type="button" value="쇼핑 계속하기" class="gBtn"
						onclick="location.href='javascript:history.go(-1)'"> 
						<input type="button" value="전체 삭제" class="deleteAll dBtn"> 
						<input type="button" value="주문하기" class="sBtn" onclick="check()">
				</div>

				<script type="text/javascript">

	//주문하기
	function check(){
		var all = $(".itemCheck").length;
		var count = 0;
	
		for (var i = 0; i < all; i++) {
			if($(".itemCheck")[i].checked == true){
				++count;
			}
		}

		if (count == 0) {
			swal("상품선택", "주문하실 상품을 선택해주세요.", "warning");
		}else{
			$("form[role='frm']").submit();
		}		
	}	
	
	//상품 전체삭제
	$(".deleteAll").click(function() {
		var count = $(".itemCheck").length;
		if (count == 0) {
			swal("상품", "삭제할 상품이 없습니다.", "warning");
		} else {
			var result = swal({
				title: "상품 삭제",
				text: "상품을 전체 삭제하시겠습니까?",
				icon: "warning",
				buttons: ["아니오", "예"]
	    	}).then((YES) => {
	    		if(YES){
	    			location.href='/order/deleteAll';
	    		}
	    	})
		} 
	});

	//전체 체크박스 선택/해제
	$("#allCheck").click(function() {
		var chk = $("#allCheck").prop("checked");
		if (chk) {
			$(".itemCheck").prop("checked", true);
			itemSum();
		} else {
			$(".itemCheck").prop("checked", false);
			itemSum();
		}
	});

	//선택한 상품 가격 총합
	function itemSum() {
		
		var str = "";
		var sum = 0;
		var count = $(".itemCheck").length;

		for (var i = 0; i < count; i++) {
			if ($(".itemCheck")[i].checked == true) {
				sum += parseInt($(".itemSum")[i].value);
			}
		}

		$("#total").html(sum.toLocaleString('ko-KR') + "원");



	//체크 박스 하나 해제시 전체 체크박스 해제
	$(".itemCheck").click(function() {
		$("#allCheck").prop("checked", false);
	});	
}
	
</script>
			</form>

		</div>
	</div>
</body>
</html>