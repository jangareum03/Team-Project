<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>header</title>
<style>
.navbar-brand {
  padding-top: 0.3125rem;
  padding-bottom: 0.3125rem;
  text-align: center;
  font-size: 3.5rem;
  font-family: 'East Sea Dokdo', cursive;	
  text-decoration: none;
  white-space: nowrap;
  color: #8B4513;
}
.log{
	float: right;
	padding: 25px;
	padding-right:70px;
}
</style>
	<!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../resources/css/sb-admin-2.css" rel="stylesheet" />
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "/member/logout";
		})
		$("#myPageBtn").on("click", function() {
			location.href = "member/myPage";
		})

	})
</script>
<body>
         <span class="container px-4 px-lg-5" style="margin:0;">
			<a class="navbar-brand" href="/">전통이酒</a>	
		</span>
		<span class="log">
			<c:if test="${member ==null}">
				<a href="/../../member/loginPage">로그인</a>
			</c:if>
			<c:if test="${member != null}">
				<a style="text-align:right;" href="/member/logout">로그아웃</a>
					<%-- <c:if test="${member.verify == 9}">
							<a href="/admin/orderList">관리자 화면</a>
					</c:if> --%>
					</c:if>
		</span>
		
	

</body>
</html>