<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>전통이酒</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"	rel="stylesheet" />
<link href="../resources/css/homeStyles.css" rel="stylesheet" />
<!-- Font -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Noto+Sans+KR:wght@300&display=swap"	rel="stylesheet">
	
</head>
	<body>
	<!-- 헤더 -->
	<%@include file="include/header.jsp" %>
	
	<!-- BEST -->
	<section class="py-5" style="font-family: 'Gowun Dodum', sans-serif;">
		<div id="product_title">BEST</div>
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${bestList}" var="bestList">
					<div class="col mb-5">
						<div class="card h-100">
							<div>
								<a href="/product/view?n=${bestList.pNo}"><img	class="card-img-top" src="../resources/images/${bestList.pImg}"></a>
							</div>
							<div id="card-body p-4">
								<div class="text-center">
									<div class="fw-bolder">${bestList.pName}</div>
										<div class="price_s">
										<fmt:formatNumber pattern="###,###,###" value="${bestList.pPrice}" />원
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 막걸리 -->
	<section class="py-5" style="font-family: 'Gowun Dodum', sans-serif;">
		<div id="product_title">막걸리</div>
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${mList}" var="mList">
					<div class="col mb-5">
						<div class="card h-100">
							<div>
								<a href="/product/view?n=${mList.pNo}"><img	class="card-img-top" src="../resources/images/${mList.pImg}"></a>
							</div>
							<div id="card-body p-4">
								<div class="text-center">
									<div class="fw-bolder">${mList.pName}</div>
										<div class="price_s">
										<fmt:formatNumber pattern="###,###,###" value="${mList.pPrice}" />원
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 소주 -->
	<section class="py-5" style="font-family: 'Gowun Dodum', sans-serif;">
		<div id="product_title">소주</div>
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${sList}" var="sList">
					<div class="col mb-5">
						<div class="card h-100">
							<div>
								<a href="/product/view?n=${sList.pNo}"><img	class="card-img-top" src="../resources/images/${sList.pImg}"></a>
							</div>
							<div id="card-body p-4">
								<div class="text-center">
									<div class="fw-bolder">${sList.pName}</div>
										<div class="price_s">
										<fmt:formatNumber pattern="###,###,###" value="${sList.pPrice}" />원
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 약주 -->
	<section class="py-5" style="font-family: 'Gowun Dodum', sans-serif;">
		<div id="product_title">약주</div>
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${yList}" var="yList">
					<div class="col mb-5">
						<div class="card h-100">
							<div>
								<a href="/product/view?n=${yList.pNo}"><img	class="card-img-top" src="../resources/images/${yList.pImg}"></a>
							</div>
							<div id="card-body p-4">
								<div class="text-center">
									<div class="fw-bolder">${yList.pName}</div>
										<div class="price_s">
										<fmt:formatNumber pattern="###,###,###" value="${yList.pPrice}" />원
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 과실주 -->
	<section class="py-5" style="font-family: 'Gowun Dodum', sans-serif;">
		<div id="product_title">과실주</div>
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${fList}" var="fList">
					<div class="col mb-5">
						<div class="card h-100">
							<div>
								<a href="/product/view?n=${fList.pNo}"><img	class="card-img-top" src="../resources/images/${fList.pImg}"></a>
							</div>
							<div id="card-body p-4">
								<div class="text-center">
									<div class="fw-bolder">${fList.pName}</div>
										<div class="price_s">
										<fmt:formatNumber pattern="###,###,###" value="${fList.pPrice}" />원
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 안주 -->
	<section class="py-5" style="font-family: 'Gowun Dodum', sans-serif;">
		<div id="product_title">안주</div>
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach items="${nList}" var="nList">
					<div class="col mb-5">
						<div class="card h-100">
							<div>
								<a href="/product/view?n=${nList.pNo}"><img	class="card-img-top" src="../resources/images/${nList.pImg}"></a>
							</div>
							<div id="card-body p-4">
								<div class="text-center">
									<div class="fw-bolder">${nList.pName}</div>
										<div class="price_s">
										<fmt:formatNumber pattern="###,###,###" value="${nList.pPrice}" />원
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
	
	
	<%@include file="include/footer.jsp" %>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>


<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>전통 이酒 </title>
</head>
<body>
	<div id="root">
		<header id = "header">
			<div id="header_box">
				<%@ include file = "include/header.jsp" %>
			</div>
		</header>
		
		<nav id= "nav">
			<div id="nav_box">
				<%@ include file = "include/nav.jsp" %>
			</div>
		</nav>
		
		<section id="container">
			<div id="container_box">
				본문
			</div>
		
		</section>
		
		<footer>
			<div id="footer_box">
				<%@ include file = "include/footer.jsp" %>
			</div>
		</footer>
	</div>

</body>
</html>
 --%>