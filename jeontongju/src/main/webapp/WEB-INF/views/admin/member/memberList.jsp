<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 목록</title>
<style>
td{
font-size:17px;
}
th{
font-size:20px;
}
</style>

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
		<h1 class="h3 mb-0 text-gray-800" >회원 목록</h1><br>
	</div>
		<div class="col-sm-12">
	<table class="table table-bordered dataTable" style="text-align:center;">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>주소</th>
			<th>생년월일</th>
		</tr>
	<c:forEach var="member"  items="${memberList}">
		<tr>
			<td><a href="memberView?n=${member.userId}">${member.userId}</a></td>
			<td>${member.userName}</td>
			<td>${member.userEmail}</td>
			<td>${member.userPhone}</td>
			<td>${member.userAddr}</td>
			<td>${member.userBday}</td>
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