<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Update</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../../include/aheader.jsp"%>
		</div>
	</header>
	<div id="wrapper">
	<aside>
		<%@ include file="../aside.jsp"%>
	</aside>
	<div id="content-wrapper" class="d-flex flex-column">
	<div class="container-fluid">
	<div class="row">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800" >주문 수정</h1><br>
		</div>
	<div class="col-sm-12">
		<form role="form" method="post" action="orderModify">
		<input type="hidden" name="oId" value="${info.oId}" />
		<div style="text-align:center;">
			<h5><label for="oId">주문번호</label><span style="margin-left:10px;">${info.oId}</span></h5>
		</div>
		<h5 class="m-0 font-weight-bold text-primary">주문 정보</h5><br>
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<th>주문자</th>
					<th>연락처</th>
				</tr>
				<tr>
					<td><label for="userName">${info.userName}</label></td>
					<td><label for="phone">${info.userPhone}</label></td>
				</tr>
		</table>
		<br>
		<h5 class="m-0 font-weight-bold text-primary">받는사람정보</h5><br>
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<th>받는 사람</th>
					<th>연락처</th>
					<th>배송지</th>
				<tr>
					<td><label for="rName"><input type="text" id="rName" name="rName" value="${info.rName}"/></label></td>
					<td><label for="rPhone"><input type="text" id="rPhone" name="rPhone" value="${info.rPhone}"/></label></td>
					<td><label for="rAddr"><input type="text" id="rAddr" name="rAddr" value="${info.rAddr}"/></label></td>
				</tr>
		</table>
		<br>
		<div style="text-align:center;">
			<button type="submit" id="update_btn" class="btn btn-success btn-icon-split">완료</button>
			<button type="button" id="back_btn" class="btn btn-secondary btn-icon-split">취소</button>
		</div>
	</form>
		<%-- <div class="input_area">
			<label for="oDate">주문일</label>
			<span> ${info.oDate}</span>
		</div>
		<div class="input_area">
			<label for="delivery">상태</label>
			<span>${info.delivery}</span>
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
	</c:forEach> --%>
		</div>
	</div>
			<script>
				$("#back_btn").click(function(){
					history.back();
				});
			</script>
	</div>	
	</div>
	</div>
</body>
</html>