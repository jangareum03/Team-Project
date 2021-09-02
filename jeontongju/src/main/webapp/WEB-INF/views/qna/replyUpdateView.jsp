<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>문의사항</title>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/qna/readView?qno=${replyUpdate.qNo}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			
			
			});
			$(".updateBtn").on("click", function(){
				location.href = "/qna/readView?qno=${read.qNo}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
			
		})
		
	</script>

<meta charset="UTF-8">
<style type="text/css">
.textarea_qcon{display:inline-block; width:15%; position:relative; top:-200px;}
.write_qna{margin-left:200px;}
.write_qna2{margin-left:300px;}
.button_write{margin:10px; position: absolute; right: 30%;}
</style>
</head>
<body>

			<%@ include file = "../include/header.jsp" %>
	
	<div id="root" class="container">
			<br>
				<h1> 문의사항</h1>
			
			<hr />
			
			<section id="container">
			<div class="write_qna">
				<form name="updateForm" role="form" method="post" action="/qna/replyUpdate">
					<input type="hidden" name="qNo" value="${replyUpdate.qNo}" readonly="readonly"/>
					<input type="hidden" id="rNo" name="rNo" value="${replyUpdate.rNo}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<div class="form-group">
									<label for="rContent" class="col-sm-2 control-label">내용</label>
									<input class="form-control3"  type="text" id="rContent" name="rContent" value="${replyUpdate.rContent}"/>
					</div>
					<div class="button_write">
						<button type="submit" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
					</div>
				</form>
				</div>
			</section>
			
		</div>

</body>
</html>