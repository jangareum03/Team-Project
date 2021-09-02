<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/homeStyles.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style type="text/css">
#searchTitle{
	font-family: 'Gowun Dodum', sans-serif;
	font-size:25px;
	position: relative;
	top: 5rem;
	left: 15%;
}
.price_s{font-family: 'Gowun Dodum', sans-serif;}
</style>
<title>전통 이酒 </title>
</head>
<body>
		<!-- 헤더 -->
		<%@ include file="../include/header.jsp"%>
		<!-- 검색결과 -->
		<div id="root">
			<section class="py-5">
				<p id="searchTitle">'<span style="color: #66ADD9">${titleMain}</span>' 검색결과</p>
					<c:if test="${empty search}">
						일치하는 검색 결과가 없습니다.
					</c:if>
				<div class="container px-4 px-lg-5 mt-5">
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<c:forEach items="${search}" var="search">
							<div class="col mb-5">
								<div class="card h-100">
									<div>
										<a href="/product/view?n=${search.pNo}"> <img class="card-img-top" src="../resources/images/${search.pImg}"></a>
									</div>
								<div id="card-body p-4">
									<div class="text-center">
										<div class="fw-bolder">${search.pName}</div>
										<div class="price_s">
											<fmt:formatNumber pattern="###,###,###" value="${search.pPrice}" />	원
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