<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Update</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../../include/header.jsp"%>
		</div>
	</header>
	<aside>
		<%@ include file="../aside.jsp"%>
	</aside>
	<br><hr>
	<h2>주문 상세 내역</h2>
		<form role="form" method="post" autocomplete="off">
		<input type="hidden" name="n" value="${info.oId}" />
	
		<div class="inputArea">
			<label for="oId">주문번호</label>
			<span>${info.oId}</span>
		</div>
		--------------- 주문자정보 ----------------
		<div class="inputArea">
			<label for="userName">주문자</label>
			<span> ${info.userName}</span>
		</div>
		<div class="input_area">
			<label for="phone">연락처</label>
			<span> ${info.userPhone}</span>
		</div>
		-------------- 받는사람정보 --------------
		<div class="inputArea">
			<label for="rName">받는 사람</label>
			<span> ${info.rName}</span>
		</div>
		<div class="input_area">
			<label for="rPhone">연락처</label>
			<span> ${info.rPhone}</span>
		</div>
		
		-------------- 배송정보 --------------
		<div class="input_area">
			<label for="rAddr">배송지</label>
			<span> ${info.rAddr}</span>
		</div>
	<c:forEach var="order"  items="${orderView}" varStatus="status">
		<div class="input_area">
			<label for="pName">상품명</label>
			<span> ${order.pName}</span>
		</div>
		<div class="input_area">
			<label for="count">수량</label>
			<span> ${order.count}</span>
		</div>
	</c:forEach>
		<div class="input_area">
			<label for="oDate">주문일</label>
			<span> <fmt:formatDate pattern="yyyy-MM-dd"	value="${info.oDate}"/></span>
		</div>
		<div class="input_area">
			<label for="delivery">상태</label>
			<span>${info.delivery}</span>
		</div>
		</form>
		<div class="input_area">
			<button type="button" id="modify_btn" class="btn btn-warning">수정</button>
			<button type="button" id="delete_btn" class="btn btn-danger">삭제</button>
			<button type="reset" onclick="location.href='orderList'">취소</button>	
		</div>
		
		
		
			<script>
				var formObj = $("form[role='form']");
				
				$("#modify_btn").click(function(){
					formObj.attr('action','orderModify');
					formObj.attr('method','get');
					formObj.submit();					
				});
				
				$("#delete_btn").click(function(){
					
					var con =confirm("삭제하시겠습니까?");
					
					if(con){
						formObj.attr('action','orderDelete');
						formObj.submit();	
					}	
				});
			</script>
		
	
</body>
</html>






