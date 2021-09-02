<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<link href="../resources/css/homeStyles.css" rel="stylesheet" />
<!-- Font -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>

</style>
	<title>전통 이酒 </title>
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		
		<br>
		<section class="py-5">
		
		<p id="category_title">
			<c:choose>
				<c:when test="${category eq 'm'}">막걸리</c:when>
				<c:when test="${category eq 's'}">소주</c:when>
				<c:when test="${category eq 'y'}">약주/탁주</c:when>
				<c:when test="${category eq 'f'}">과실주</c:when>
				<c:when test="${category eq 'n'}">안주</c:when>
			</c:choose>
		</p>

		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					
					<c:forEach items="${cateList}" var="list">
					
						<div class="col mb-5">
							<div class="card h-100">
								<div>
									<a href="/product/view?n=${list.pNo}">
									<img class="card-img-top" src="../resources/images/${list.pImg}"></a>
								</div>
								<div id="card-body p-4">
									<div class="text-center">
										<div class="fw-bolder">
											${list.pName}
										</div>
										<div class="price_s"  style="font-family: 'Gowun Dodum', sans-serif;">
											<fmt:formatNumber pattern="###,###,###" value="${list.pPrice}"/>
											원	
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
			
					</div>
			</div>

		</section>
		
	</div>

</body>
</html>
