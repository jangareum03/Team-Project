<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order View</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
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
		<h1 class="h3 mb-0 text-gray-800" >제품 상세 내역</h1><br>
	</div>
	<div class="col-sm-12">
	<form role="form" method="post" autocomplete="off">
		<input type="hidden" name="n" value="${product.pNo}" />
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<td><label for="pNo">상품번호</label></td>
					<td><span class="category1">${product.pNo}</span></td>
				</tr>
				<tr>
					<td><label for="pName">상품명</label></td>
					<td><span> ${product.pName}</span></td>
				</tr>
				<tr>
					<td><label for="pPrice">판매가</label></td>
					<td><span> ${product.pPrice}</span></td>
				</tr>
				<tr>
					<td><label for="pCount">수량</label></td>
					<td><span> ${product.pCount}</span>개</td>
				</tr>
				<tr>
					<td><label for="pInfo">상세설명</label></td>
					<td><span> ${product.pInfo}</span></td>
				</tr>
				<tr>
					<td><label for="pImg">이미지</label></td>
					<td><img src="${product.pImg}" class="oriImg"/></td>
				</tr>
				<%-- <tr>
					<td><img src="${product.pThumbImg}" class="thumbImg"/></td>
				</tr> --%>
				</table>
				<div style="text-align:center;">
					<button type="button" id="modify_btn" class="btn btn-success btn-icon-split">수정</button>
					<button type="button" id="delete_btn" class="btn btn-danger btn-icon-split">삭제</button>
					<button type="reset" onclick="location.href='productList'" class="btn btn-secondary btn-icon-split">취소</button>
				</div>
			<script>
				var formObj = $("form[role='form']");

				$("#modify_btn").click(function() {
					formObj.attr('action', 'productModify');
					formObj.attr('method', 'get');
					formObj.submit();
				});

				$("#delete_btn").click(function() {

					var con = confirm("삭제하시겠습니까?");

					if (con) {
						formObj.attr('action', 'productDelete');
						formObj.submit();
					}
				});
			</script>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>