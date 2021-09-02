<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA view</title>
<style>
th{
	border:3px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../resources/css/sb-admin-2.css" rel="stylesheet" />
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
		<h1 class="h3 mb-0 text-gray-800" >문의 사항 조회</h1><br>
	</div>
		<div class="col-sm-12">
	<h5 class="m-0 font-weight-bold text-primary">댓글 내용</h5><br>
	<form role="form" method="post" autocomplete="off">
	<input type="hidden" name="n" value="${qna.qNo}" />
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<th class="title"><label for="qNo">문의번호</label></th>
					<td><span> ${qna.qNo}</span></td>
				</tr>
				<tr>
					<th class="title"><label for="qTitle">이름</label></th>
					<td><span> ${qna.qTitle}</span></td>
				</tr>
				<tr>
					<th class="title"><label for="qWriter">작성자</label></th>
					<td><span> ${qna.qWriter}</span></td>
				</tr>
				<tr>
					<th class="title"><label for="qContent">내용</label></th>
					<td><span> ${qna.qContent}</span></td>
				</tr>
				<tr>
					<th class="title"><label for="qDate">작성날짜</label></th>
					<td><span> ${qna.qDate}</span></td>
				</tr>
		</table>
		<div style="text-align:center;">
			<button type="button" id="delete_btn" class="btn btn-danger btn-icon-split">삭제</button>
			<button type="reset" onclick="location.href='qnaList'" class="btn btn-secondary btn-icon-split">취소</button>
		</div>
			<script>
				var formObj = $("form[role='form']");
				
				$("#modify_btn").click(function(){
					formObj.attr('action','memberModify');
					formObj.attr('method','get');
					formObj.submit();					
				});
				
				$("#delete_btn").click(function(){
					
					var con =confirm("삭제하시겠습니까?");
					
					if(con){
						formObj.attr('action','qnaDelete');
						formObj.submit();	
					}	
				});
			</script>
	</form>
	<br>
	<!-- 댓글 조회 -->
	<h5 class="m-0 font-weight-bold text-primary">댓글 조회</h5><br>
			<c:forEach items="${replyList}" var="replyList">
				<table class="table table-bordered dataTable" style="text-align:center;">
					<tr>
						<th>작성자 </th>
						<th>작성날짜 </th>
						<th>내용</th>
						<th></th>
					</tr>
					<tr>
						<td>${replyList.rWriter}</td>
						<td><fmt:formatDate value="${replyList.rDate}" pattern="yyyy-MM-dd" /></td>
						<td>${replyList.rContent}</td>	
						<td>
						<button type="button" id="replyUpdateBtn" data-rNo="${replyList.rNo}" class="btn btn-success btn-icon-split">수정</button>
						<button type="button" id="replyDeleteBtn" data-rNo="${replyList.rNo}" class="btn btn-danger btn-icon-split">삭제</button>
						</td>				
					</tr>
				</table>
		</c:forEach>
	<!-- 댓글 작성 -->
	<h5 class="m-0 font-weight-bold text-primary">댓글 작성</h5><br>
	<form name="replyForm" method="post">
		<input type="hidden" id="qNo" name="qNo" value="${qna.qNo}" />
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<th>댓글 작성자</th>
					<th>댓글 내용</th>
				</tr>
				<tr>
					<td><label for ="rWriter">관리자 </label></td>
					<td><label for="rContent"><input type="text" id="rContent" name="rContent" /></label></td>
				</tr>
		</table>
		<div style="text-align:center;">
				<button type="button" id="replyWriteBtn" class="btn btn-success btn-icon-split">작성</button>
		</div>
  		
  		<script>
  			$("#replyWriteBtn").on("click", function(){
  		  		var formObj = $("form[name='replyForm']");
  		  		formObj.attr("action", "replyWrite");
  		  		formObj.submit();
  			});
  			
  		//댓글 수정 View
  			$("#replyUpdateBtn").on("click", function(){
  				location.href = "replyUpdateView?qNo=${qna.qNo}"
  								+ "&rNo="+$(this).attr("data-rNo");
  			});
  					
  		//댓글 삭제 View
  			$("#replyDeleteBtn").on("click", function(){
  				location.href = "replyDeleteView?qNo=${qna.qNo}"
  					+ "&rNo="+$(this).attr("data-rNo");
  			});
  		</script>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>







