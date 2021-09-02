<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h1 class="h3 mb-0 text-gray-800" >문의 사항 목록</h1><br>
	</div>
		<div class="col-sm-12">
	<table class="table table-bordered dataTable" style="text-align:center;">
		<tr>
			<th>문의번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
		</tr>
	<c:forEach var="qna"  items="${qnaList}">
		<tr>
			<td><a href="qnaView?n=${qna.qNo}">${qna.qNo}</a></td>
			<td>${qna.qTitle}</td>
			<td>${qna.qWriter}</td>
			<td>${qna.qDate}</td>
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