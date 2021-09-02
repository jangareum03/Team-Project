<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Core theme CSS-->
<link href="../resources/css/deleteStyle.css" rel="stylesheet" />
<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>마이페이지</title>
</head>
<script type="text/javascript">
	function deleteCheck(){
		var result = -1;
		
		if(result == -1){
			if(document.frm.userPass.value == ""){
				swal("경고", "비밀번호를 입력해주세요.", "error")
				frm.userPass.focus();
				return false;
			}else if(document.frm.userPass.value != document.frm.passcheck.value){
				swal("경고", "비밀번호가 맞지 않습니다.", "error")
				frm.userPass.focus();
				return false;
			}
			
			result = 1;
		}
		
		if(result == 1){
			alert("탈퇴했습니다. 그동안 감사했습니다.");
			return true;
		}
	}
</script>
<body>
	<!-- 헤드 -->
	<%@include file="../include/header.jsp" %>

    
    <!-- 메인 -->
	<div id="main" style="width: 80%; margin: 0 auto;">
   		
		<!-- 사이드 메뉴 -->
    	<%@ include file="../include/mypageNav.jsp" %>
   		
   		<div class="title">마이페이지 > <span>회원탈퇴</span></div>
		
		<div id="dcontent">
			<form method="post" action="delete" name="frm">
				<table>
					<tr><th colspan="2">정말로 탈퇴하시겠습니까?</th></tr>
					<tr>
						<td colspan="2" class="text">
							1. 탈퇴 후 회원정보가 모두 삭제됩니다. 아이디, 메일주소, 핸드폰 번호 등 <span>회원정보가 모두 삭제</span>되며, 삭제된 데이터는 복구되지 않습니다. <br>
							2. 탈퇴한 아이디로 다시 <span>가입이 가능</span>합니다.<br>
							3. 탈퇴 후에도 게시글은 삭제되지 않습니다.
						</td>
					</tr>
					<tr class="check">
							<th class="check">아이디</th>
							<td><input type="text" name="userId" value="${member.userId}" readonly="readonly"></td>
					</tr>
					<tr  class="check">
							<th class="check">비밀번호</th>
							<td><input type="password" name="userPass"><input type="hidden" name="passcheck" value="${member.userPass}"></td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="submit" class="sBtn" value="탈퇴" onclick="return deleteCheck()">
							<input type="button" class="rBtn" value="취소" onclick="location.href='../member/order'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>