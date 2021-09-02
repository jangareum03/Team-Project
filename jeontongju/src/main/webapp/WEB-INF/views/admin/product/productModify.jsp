<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
<title>Product Modify</title>
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
		<h1 class="h3 mb-0 text-gray-800" >상품 수정</h1><br>
	</div>
	<div class="col-sm-12">
	<form role="form" method="post" action="productModify">
	<input type="hidden" name="pNo" value="${product.pNo}" />
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<td><label for="pNo">상품번호</label></td>
					<td><span>${product.pNo}</span></td>
				</tr>
				<tr>
					<td><label for="pName">상품명</label></td>
					<td><input type="text" id="pName" name="pName" value="${product.pName}"/></td>
				</tr>
				<tr>
					<td><label for="pPrice">판매가</label></td>
					<td><input type="number" id="pPrice" name="pPrice" value="${product.pPrice}"/>원</td>
				</tr>
				<tr>
					<td><label for="pCount">수량</label></td>
					<td><input type="number" id="pCount" name="pCount" value="${product.pCount}"/>개</td>
				</tr>
				<tr>
					<td><label for="pInfo">상세설명</label></td>
					<td><textarea id="pInfo" name="pInfo" rows="5" cols="20">${product.pInfo}</textarea></td>
				</tr>
		</table>
				<div style="text-align:center;">
					<td><button type="submit" id="update_btn" class="btn btn-success btn-icon-split">완료</button></td>
					<td><button type="button" id="back_btn" class="btn btn-danger btn-icon-split">취소</button></td>
				</div>
		
		<div class="input_area">
			<script>
				$("#back_btn").click(function(){
					history.back();
				});
			</script>	
		</div>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>