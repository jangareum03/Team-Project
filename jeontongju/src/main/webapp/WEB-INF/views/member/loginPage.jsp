<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS -->
<link href="../../resources/css/sb-admin-2.css" rel="stylesheet" />
<!-- Font -->
<link	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
<link	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Noto+Sans+KR:wght@300&display=swap"	rel="stylesheet">
</head>
<body class="bg-gradient-primary">
	<div class ="container" style="margin-top:8rem;margin-left:23rem;">
	<div class="col-xl-10 col-lg-12 col-md-9"> 
	<div class="card o-hidden border-0 shadow-lg my-5">
	<div class="card-body p-0">
		<div class="row">
			<div class="col-lg-6 d-none d-lg-block bg-login-image">
				<img src="../resources/images/login.PNG" class="logImg">
			</div>
			<div class="col-lg-6">
				<div class="p-5">
					<div class="text-center">
						<h1 class="h4 text-gray-900 mb-4"><a class="navbar-brand" style="font-size:30px;color:#8B4513;"href="/">전통이酒</a></h1>
					</div>
					<form name="form" method="post" action="/member/login" class="user">
						<c:if test="${member == null}">
							<div class="form-group">
								<input type="text" id="userId" name="userId"
									class="form-control" placeholder="Id" />
							</div>
							<div class="form-group">
								<input type="password" id="password" name="userPass"
									class="form-control" placeholder="Password" />
							</div>
							<div>
								<button type="button" id="register_btn"	onclick="location.href='registerPage'"	class="btn btn-facebook btn-user btn-block">회원가입</button>
								<button type="submit" id="login_btn" name="login_btn" class="btn btn-primary btn-user btn-block">로그인</button>
							</div>
						</c:if>
						<c:if test="${msg == false}">
							<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
						</c:if>
					</form>
				</div>
			</div>
		</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html>