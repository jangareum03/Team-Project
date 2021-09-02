<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
td{
font-size:17px;
}
th{
font-size:20px;
}
</style>
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
		<h1 class="h3 mb-0 text-gray-800" style="margin-right:30px;">상품 내역</h1><br>
		<button type="button" onclick="location.href='productAdd'">상품등록</button>		
	</div>
	<div class="col-sm-12">
	<table class="table table-bordered dataTable" style="text-align:center;">
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>판매가</th>
			<th>재고</th>
			<th>판매량</th>	
		</tr>
	<c:forEach var="product"  items="${productList}">
		<tr>
			<td>${product.pNo}</td>
			<td><a href="productView?n=${product.pNo}">${product.pName}</a></td>
			<td>${product.pPrice}</td>
			<td>${product.pCount}</td>
			<td>${product.pSales}</td>
		</tr>
	</c:forEach>	
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>