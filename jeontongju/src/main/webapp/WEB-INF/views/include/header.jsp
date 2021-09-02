<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Font -->
<link	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap"	rel="stylesheet" />
<!-- Core theme CSS-->
<link href="../resources/css/homeStyles.css" rel="stylesheet" />

<body style="position: absoulte; z-index:5; ">
<nav style="width: 80%; margin: 0 auto;">
		<!-- 사용자 메뉴 -->
		<div id="userMenu">
			<c:choose>
				<c:when test="${member == null}">
					<a href="/member/loginPage" class="userAfter">로그인</a>
					<a href="/member/order" class="userAfter">마이페이지</a>
					<a href="/order/cart" class="userAfter">장바구니</a>
					<a href="../qna/list">문의사항</a>
				</c:when>
				<c:otherwise>
					<c:if test="${member.verify == 9}">
						<a href="/admin/order/orderList" style="color:#0A7ABF">관리자</a>
					</c:if>
					<c:if test="${member.verify == 1}">
						<span style="color:#0A7ABF; font-weight: 800;">${member.userName}</span>님
					</c:if>
					<a href="../member/logout">로그아웃</a>
					<a href="/member/order">마이페이지</a>
					<a href="/order/cart">장바구니</a>
					<a href="../qna/list">문의사항</a>
				</c:otherwise>
			</c:choose>
		</div>
		
		<!-- 로고 -->
		<a class="navbar-brand" href="/">전통이酒</a>

		
		<!-- 메뉴 -->
	<div id="Menu">
		<div id="SideMenu">
			<ul>
				<li><a href="/product/cateList?category=m"> 막걸리</a></li>
				<li><a href="/product/cateList?category=s">  소주</a></li>
				<li><a href="/product/cateList?category=y">  약주/탁주</a></li>
				<li><a href="/product/cateList?category=f">  과실주</a></li>
				<li><a href="/product/cateList?category=n">  안주</a></li>
			</ul>
		</div>
			
	<!-- 검색창 -->
		<div id="search">
			<form id="search-content" action="../product/search" method="get">
				<div id="search-form">
					<input type="text" name="keyword" value="${keyword}" class="searchinput" id="search-input" placeholder="상품을 입력해주세요.">
					<button type="submit" class="search" id="search-btn"></button>
				</div>
			</form>
		</div>
	</div>
</nav>
</body>