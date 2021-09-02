<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Update</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<style>
.title{
width:300px;
font-weight: bold;
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
		<h1 class="h3 mb-0 text-gray-800" >회원 수정</h1><br>
	</div>
		<div class="col-sm-12">
	<form role="form" method="post" action="memberModify">
	<input type="hidden" name="userId" value="${member.userId}" />
		<table class="table table-bordered dataTable" style="text-align:center;">
				<tr>
					<td class="title"><label for="userId">아이디</label></td>
					<td><span> ${member.userId}</span></td>
				</tr>
				<tr>
					<td class="title"><label for="userName">이름</label></td>
					<td><input type="text" id="userName" name="userName" value="${member.userName}"/></td>
				</tr>
				<tr>
					<td class="title"><label for="userEmail">이메일</label></td>
					<td><input type="text" id="userEmail" name="userEmail" value="${member.userEmail}"/></td>
				</tr>
				<tr>
					<td class="title"><label for="userPhone">연락처</label></td>
					<td><input type="text" id="userPhone" name="userPhone" value="${member.userPhone}"/></td>
				</tr>
				<tr>
					<td class="title"><label for="userAddr">주소</label></td>
					<td><input type="text" id="userAddr" name="userAddr" value="${member.userAddr}"/></td>
				</tr>
				<tr>
					<td class="title"><label for="userBday">생년월일</label></td>
					<td><input type="text" id="userBday" name="userBday" value="${member.userBday}"/></td>
				</tr>
		</table>
				<div style="text-align:center;">
					<button type="submit" id="update_btn" class="btn btn-success btn-icon-split">완료</button>
					<button type="button" id="back_btn" class="btn btn-secondary btn-icon-split">취소</button>
				</div>			
			<script>
				$("#back_btn").click(function(){
					history.back();
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