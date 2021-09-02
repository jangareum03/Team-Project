<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Core theme CSS-->
<link href="../resources/css/orderStyle.css" rel="stylesheet" />

<!-- font -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<title>마이페이지</title>
</head>
<body>
	<!-- 헤드 -->
	<%@include file="../include/header.jsp" %>

	<!-- 메인 -->
	<div id="main" style="width: 80%; margin: 0 auto;">
		
		<!-- 사이드 메뉴 -->
    	<%@ include file="../include/mypageNav.jsp" %>
	
		<!-- 주문내역 -->
		<div class="title">마이페이지 > <span>주문내역</span></div>
			<c:if test="${empty order}">
			<div style="margin-left:700px;margin-top:200px;font-size:20px;">
				주문하신 상품이 없습니다.
			</div>
			</c:if>
		<c:forEach var="order" items="${order}">

			<div id="content">
					<div class="image">
						<a href='/product/view?n=${order.pNo}'><img src="../resources/images/${order.pImg}" alt="${order.pName} 이미지" ></a>
					</div>
					<div class="info">
						<div class="no">
							<span class="oId">${order.oId}</span>
							<button type="button" class="${order.delivery eq '배송완료' ? 'badge rounded-pill bg-success' : 'badge rounded-pill bg-warning'}">${order.delivery}</button>
						</div>
						<span class="date"><fmt:formatDate value="${order.oDate}" pattern="yyyy-MM-dd" /></span>
						<span class="spacing name"><br>${order.pName}(<fmt:formatNumber pattern="###,###,###" value="${order.pPrice}" />원)</span>
						<span class="spacing">${order.count}개</span>
						<span class="spacing"><fmt:formatNumber pattern="###,###,###" value="${order.pPrice * order.count}" />원</span>
						<span class="spacing"><a href='mpOrderDetail?oId=${order.oId}'>주문상세 > </a></span>
					</div>
			</div>
		</c:forEach>
	</div>
	
</body>
</html>