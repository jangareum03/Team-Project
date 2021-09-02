<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>댓글 삭제</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$("#cancel_btn").on("click", function(){
				location.href = "qnaView?n=${replyDelete.qNo}";
			})
		})
	</script>
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
		<h1 class="h3 mb-0 text-gray-800" >댓글 삭제</h1><br>
		</div>
		<div class="col-sm-12">
				<form name="updateForm" role="form" method="post" action="replyDelete">
					<input type="hidden" name="qNo" value="${replyDelete.qNo}" readonly="readonly"/>
					<input type="hidden" id="rNo" name="rNo" value="${replyDelete.rNo}" />
						
					<div>
						<p>삭제 하시겠습니까?</p>
						<button type="submit" id="delete_btn" class="btn btn-success btn-icon-split">예 삭제합니다.</button>
						<button type="button" id="cancel_btn" class="btn btn-secondary btn-icon-split">아니오. 삭제하지 않습니다.</button>
					</div>
				</form>
			<hr />
		</div>
		</div>
		</div>
		</div>
		</div>
	</body>
</html>