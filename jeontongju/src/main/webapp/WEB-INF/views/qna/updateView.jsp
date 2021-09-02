<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">

<script type="text/javascript" >

function qnaCheck(){
	if(document.frm.qTitle.value.length ==0){
		alert("제목을 입력하세요.");
		document.frm.qTitle.focus();
		return false;	
	}
	if(document.frm.qContent.value.length == 0){
		alert("내용을 입력하세요.");
		document.frm.qContent.focus();
		return false;
	}
	if(document.frm.qPass.value.length == 0){
		alert("비밀번호를 입력하세요.");
		document.frm.qPass.focus();
		return false;
	}else if(isNaN(document.frm.qPass.value)){
		alert("비밀번호는 숫자로 입력하세요.");
		document.frm.qPass.focus();
		return false;
	}
	return true;
}
</script>
<title>문의사항</title>
<style type="text/css">
.textarea_qcon{display:inline-block; width:15%; position:relative; top:-200px;}
.write_qna{margin-left:200px;}
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
					<form name="frm" role="updateForm" method="post" action="/qna/update">
						<input type="hidden" id="qNo"name="qNo" value="${update.qNo}" readonly="readonly"/>
						<input type="hidden" id="page" name="page" value="${scri.page}"> 
						<input type="hidden" id="perPageNum" name="perPageNum"value="${scri.perPageNum}"> 
						<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
							<div class="form-group">
								<label for="qTitle" class="col-sm-2 control-label">제목</label>
								<input class="form-control2" type="text" id="qTitle" name="qTitle" value="${update.qTitle}"/>
							</div>
							<div class="form-group">
								<label for="qWriter" class="col-sm-2 control-label">작성자</label>
								<input class="form-control2"type="text" id="qWriter" name="qWriter" value="${update.qWriter}" readonly="readonly"/>
							</div>
							<div class="form-group">
								<label for="qPass" class="col-sm-2 control-label">비밀번호</label>
								<input class="form-control2" type="password" id="qPass" name="qPass" value="${update.qPass }" readonly="readonly" />
							</div>
							<div class="form-group">
								<label for="qContent" class="textarea_qcon">내용</label>
								<textarea class="form-control3" id="qContent" name="qContent"><c:out value="${update.qContent}" /></textarea>
							</div>
							<div class="form-group">
								<label for="qdate" class="col-sm-2 control-label">작성일</label>
								<fmt:formatDate  value="${update.qDate}" pattern="yyyy.MM.dd hh:mm"/>					
								
							</div>
						<div class="button_write">
							<button type="submit" onclick="return qnaCheck()">저장</button>
							<button type="reset" class="cancle_btn">취소</button>
						</div>
					</form>
				</div>
			</section>
		</div>
	
			<%@ include file = "../include/footer.jsp" %>
	
</body>
</html>