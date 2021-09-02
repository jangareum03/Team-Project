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
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<title>마이페이지</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e){
	genRowspan("total");
});

function genRowspan(className){
	$("." + className).each(function(){
		var rows = $("." + className + ":contains('" + $(this).text() + "')");
		 if(rows.length > 1){
			 rows.eq(0).attr("rowspan", rows.length);
			 rows.not(":eq(0)").remove();
		 }
	});
}
</script>
<body>
	<!-- 헤드 -->
	<div id="header">
		<%@include file="../include/header.jsp" %>
	</div>
	
	
	<!-- 메인 -->
	<div id="main" style="width: 80%; margin: 0 auto;">
	<!-- 사이드메뉴 -->
    <%@ include file="../include/mypageNav.jsp" %>
    	
    	<!-- 주문상세내역 -->
		<div class="title">마이페이지 > <span>주문상세내역</span></div>
		<div id="dcontent">
			<div id="info">
					<span>• 주문 정보</span>
						<table>
							<tr>
								<th>주문번호</th>
								<th>주문날짜</th>
								<th>배송상태</th>
							</tr>
							<tr>
								<td>${no.oId}</td>
								<td><fmt:formatDate value="${no.oDate}" pattern="yyyy년MM월dd일 E요일 HH시 mm분 ss초" /></td>
								<td>${no.delivery}</td>
							</tr>
					</table>
			</div>
					<div id="person">
				<div class="re">
					<span>• 받는분 정보</span>
						<table>
							<tr>
								<th>받는분</th>
								<td>${no.rName}</td>
							</tr>
							<tr>
								<th>받는분 주소</th>
								<td>${no.rAddr}</td>
							</tr>
							<tr>
								<th>받는분 연락처</th>
								<td>${no.rPhone}</td>
							</tr>
				</table>
			</div>
			<div class="memo">
				<span>• 요청사항</span>
				<div>
					<c:if test="${empty no.oMemo}">
						요청사항이 없습니다 :)
					</c:if>
						${no.oMemo}
				</div>
			</div>
		</div>
			<div id="product">
				<span>• 상품정보</span>
					<table>
						<tr>
							<th>상품이름</th>
							<th>상품이미지</th>
							<th>상품정보</th>
							<th>상품가격</th>
							<th>수량</th>
							<th>금액</th>
							<th>총 금액</th>
						</tr>
						<c:forEach var="orderDetail" items="${orderDetail}">
						<tr>
								<td>${orderDetail.pName}</td>
								<td><img src="../resources/images/${orderDetail.pImg}"	alt="${orderList.pName} 이미지"></td>
								<td>${orderDetail.pInfo}</td>
								<td><fmt:formatNumber pattern="###,###,###" value="${orderDetail.pPrice}" />원</td>
								<td>${orderDetail.count}개</td>
								<td><fmt:formatNumber pattern="###,###,###" value="${orderDetail.oTotal}" />원</td>
								<td class="total"><fmt:formatNumber pattern="###,###,###"	value="${total}"></fmt:formatNumber>원</td>
						</tr>
						</c:forEach>
						
		</table>
			<a href="javascript:history.go(-1)"><button class="btn">확인</button></a>
		</div>
	</div>
	</div>
</body>
</html>