<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderList</title>
<style>
td{
font-size:17px;
}
th{
font-size:20px;
}
</style>
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
		<h1 class="h3 mb-0 text-gray-800" >주문 목록</h1><br>
	</div>
		<div class="col-sm-12">
			<table class="table table-bordered dataTable" style="text-align:center;">
					<tr>
						<th>주문번호</th>
						<th>아이디</th>
						<th>받는주소</th>
						<th>전화번호</th>
						<th>주문일</th>
						<th>상태</th>
						<th></th>
					</tr>
			<c:forEach var="order"  items="${orderList}" varStatus="status">
			<c:if test="${status.first}">
			</c:if>
					<tr>
						<td><a href="orderView?oId=${order.oId}">${order.oId}</a></td>
						<td>${order.userId}</td>
					
						<td>${order.rAddr}</td>
						<td>${order.rPhone}</td>
					
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${order.oDate}"/></td>
						<td>${order.delivery}</td>
					
						<td><button type="button" class="btn btn-primary btn-icon-split" onclick="change1_btn(${order.oId})">배송 중</button>
						<button type="button" class="btn btn-primary btn-icon-split" onclick="change2_btn(${order.oId})">배송 완료</button></td>
					</tr>
			<div class="orderChange">
			<form action="orderList" method="post" id="${order.oId}">
				<input type="hidden" name="oId" value="${order.oId}"/>
				<input type="hidden" name="delivery" class="delivery" value="" />
				
				<script type="text/javascript">
					function change1_btn(id){
						$(".delivery").val("배송중");
						document.getElementById(id).submit();
					}
					function change2_btn(id){
						$(".delivery").val("배송완료");
						document.getElementById(id).submit();
					}
				</script>
			</form>
			</div>
			</c:forEach>
			</table>
		</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>