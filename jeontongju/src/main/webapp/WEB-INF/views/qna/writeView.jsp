<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>게시판</title>
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
<style type="text/css">
.textarea_qcon{font-family: 'Gowun Dodum', sans-serif;display:inline-block; width:15%; position:relative; top:-200px;}
.write_qna{margin-left:200px;font-family: 'Gowun Dodum', sans-serif;}
.button_write{margin:10px; position: absolute; right: 30%;font-family: 'Gowun Dodum', sans-serif;}
</style>
</head>
<body>

			<%@ include file = "../include/header.jsp" %>
	<div class="container">
		<br>
				<h1> 문의사항</h1>
			<hr />
		
			<section id="container">
				<div class="write_qna">
				<form name="frm" method="post" action="/qna/write">
					
					<c:if test="${member.userId != null}">
					
						<div class="form-group">
							<label for="qTitle" class="col-sm-2 control-label">제목</label>
							<input class="form-control2" type="text" id="qTitle" name="qTitle" />
						</div>
						<div class="form-group">
								<label for="qWriter" class="col-sm-2 control-label">작성자</label>
								<input class="form-control2" type="text" id="qWriter" name="qWriter" value="${member.userId}" readonly="readonly"/>
						</div>
						<div class="form-group">
								<label for="qPass" class="col-sm-2 control-label">비밀번호</label>
								<input class="form-control2"  type="password" id="qPass" name="qPass" />
						</div>
						<div class="form-group">
								<label for="qContent" class="textarea_qcon">내용</label>
								<textarea class="form-control3"  id="qContent" name="qContent" ></textarea>
						</div>
						<div class="button_write">
								<button type="submit" onclick="return qnaCheck()">등록</button>
								<button type="button" onclick="location.href='/qna/list'" >취소</button>
						</div>	
					
					</c:if>
					<c:if test="${member.userId == null}">
						<script>
						alert("로그인 후에 작성하실수 있습니다.");
						history.back();
						</script>
					</c:if>			
			
				</form>
				</div>
			</section>
		</div>
	
		<%@ include file = "../include/footer.jsp" %>
	
	
</body>
</html>