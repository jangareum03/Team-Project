<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<style type="text/css">
#nav {
	position: absolute;
	width: auto;
	padding: 0;
	margin-top: 5rem;
	height: 100%;
	overflow: auto;
	text-align: center;
	border-right: 1px solid gray;
	font-family: 'Gowun Dodum', sans-serif;
	z-index:0;
}

#nav .nav_title {
	width: auto;
	height: 8rem;
	margin: 2rem 0.8rem;
	font-size: 1.4rem;
	font-weight: bold;
	border-bottom: 2px solid lightgray;
}

#icon-mypage{
	width: 3rem;
	position: relative;
}

#nav span{
	display:block;
	font-size: 14px;
	color: #312C29;
}

#nav b{
	text-align: center;
	font-size: 18px;
	color: #3FB0C8;
}


#nav .nav_content{
	list-style: none;
	padding-right: 3rem;
	font-family: 'Noto Sans KR', sans-serif;
}

.nav_content li{
	display: block;
	padding: auto;
	font-family: 'Gowun Dodum', sans-serif;
}

.nav_content li:after{
  display:block;
  content: '';
  border-bottom: solid 3px #3FB0C8;  
  transform: scaleX(0);  
  transition: transform 250ms ease-in-out;
}

.nav_content li:hover:after { transform: scaleX(1); }

#nav a {
	display: inline-block;
	margin: 1rem auto;
	color:#5A443F;
	text-decoration: none;
	font-size: 14px;
}

</style>
<body>
	<!-- 사이드 메뉴 -->
	<div id="nav">
		<div class="nav_title">
			 <img src="../../resources/images/myPage.png" id="icon-mypage" />
			<span><b>${name}</b>님<br></span><span style="font-size:20px">마이페이지</span><br>
		</div>
		<ul class="nav_content">
			<li><a href="order">주문내역</a></li>
			<li><a href="qna">문의사항</a></li>
			<li><a href="update">회원정보수정</a></li>
			<li><a href="delete">탈퇴하기</a></li>
		</ul>
	</div>
</body>
</html>