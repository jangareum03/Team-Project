<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>login</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/aheader.jsp"%>
		</div>
	</header>
	<section id="container">
		<aside>
			<%@ include file="aside.jsp"%>
		</aside>
		<div id=container_box>
			관리자 메뉴에서 오신걸 환영합니다.<br>
			팔요하신 메뉴를 관리자 메뉴에서 선택해주세요
		</div>
	</section>
</body>
</html>
