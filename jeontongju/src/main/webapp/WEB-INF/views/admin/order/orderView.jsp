<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order View</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
	<!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../resources/css/sb-admin-2.css" rel="stylesheet" />
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
		<h1 class="h3 mb-0 text-gray-800" >주문 상세 내역</h1><br>
	</div>
		<div class="col-sm-12">
		<form role="form" method="post" autocomplete="off" >
		<input type="hidden" name="n" value="${info.oId}" />	
		<div  style="text-align:center;">
		<h5><label for="oId">주문번호 </label><span style="margin-left:10px;">${info.oId}</span></h5>
		</div>
		<h5 class="m-0 font-weight-bold text-primary">주문정보</h5><br>
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<th>주문자</th>
					<th>연락처</th>
					<th>주문일</th>
				</tr>
				<tr>
					<td><label for="userName">${info.userName}</label></td>
					<td><label for="phone">${info.userPhone}</label></td>
					<td><label for="oDate"><fmt:formatDate pattern="yyyy-MM-dd"	value="${info.oDate}"/></label></td>
				</tr>
		</table>
		<h5 class="m-0 font-weight-bold text-primary">받는사람정보</h5><br>
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<th>받는 사람</th>
					<th>연락처</th>
					<th>배송지</th>
					<th>상태</th>
				</tr>
				<tr>
					<td><label for="rName">${info.rName}</label></td>
					<td><label for="rPhone">${info.rPhone}</label></td>
					<td><label for="rAddr">${info.rAddr}</label></td>
					<td><label for="delivery">${info.delivery}</label></td>
				</tr>
		</table>
		<h5 class="m-0 font-weight-bold text-primary">상품정보</h5><br>
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<th>상품명</th>
					<th>수량</th>
				</tr>
			<c:forEach var="order"  items="${orderView}" varStatus="status">
				<tr>
					<td><label for="pName">${order.pName}</label></td>
					<td><label for="count">${order.count}</label></td>
				</tr>
			</c:forEach>
		</table>
		<div style="text-align:center;">
			<button type="button" id="modify_btn" class="btn btn-success btn-icon-split">수정</button>
			<button type="button" id="delete_btn" class="btn btn-danger btn-icon-split">삭제</button>
			<button type="reset" class="btn btn-secondary btn-icon-split" onclick="location.href='orderList'">취소</button>	
		</div>	
		</form>
		</div>
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
		</div>
		</div>
	</div>
</body>
</html>







