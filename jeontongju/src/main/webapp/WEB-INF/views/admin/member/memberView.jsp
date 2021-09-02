<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Update</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
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
		<h1 class="h3 mb-0 text-gray-800" >회원 조회</h1><br>
	</div>
		<div class="col-sm-12">
	<form role="form" method="post" autocomplete="off">
	<input type="hidden" name="n" value="${member.userId}" />
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<td class="title"><label for="userId">아이디</label></td>
					<td><span> ${member.userId}</span></td>
				</tr>
				<tr>
					<td class="title"><label for="userName">이름</label></td>
					<td><span> ${member.userName}</span></td>
				</tr>
				<tr>
					<td class="title"><label for="userEmail">이메일</label></td>
					<td><span> ${member.userEmail}</span></td>
				</tr>
				<tr>
					<td class="title"><label for="userPhone">연락처</label></td>
					<td><span> ${member.userPhone}</span></td>
				</tr>
				<tr>
					<td class="title"><label for="userAddr">주소</label></td>
					<td><span> ${member.userAddr}</span></td>
				</tr>
				<tr>
					<td class="title"><label for="userBday">생년월일</label></td>
					<td><span> ${member.userBday}</span></td>
				</tr>
		</table>
				<div style="text-align:center;">
					<button type="button" id="modify_btn" class="btn btn-success btn-icon-split">수정</button>
					<button type="button" id="delete_btn" class="btn btn-danger btn-icon-split">삭제</button>
					<button type="reset" onclick="location.href='memberList'" class="btn btn-secondary btn-icon-split">취소</button>
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
						formObj.attr('action','memberDelete');
						formObj.submit();	
					}	
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







