<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../../resources/css/sb-admin-2.css" rel="stylesheet" />
<!-- 다음 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Font -->
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function fn_idChk() {
		$.ajax({
			url : "/member/idChk",
			type : "post",
			dataType : "json",
			data : {
				"userId" : $("#userId").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
	function fn_ageChk() {
		const userBday = new Date($("#userBday").val());
		const today = new Date();

		let age = today.getFullYear() - userBday.getFullYear();
		console.log(age);

		if (age >= 19){
			alert("가입이 가능합니다.");
			$("#submit").removeAttr('disabled');
		}else if(age < 19)
			alert("미성년자는 가입이 불가능 합니다.");
		
	}
	
	function findAddr(){
		 new daum.Postcode({
	           oncomplete: function(data) {
	               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var addr = ''; // 주소 변수

	               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                   addr = data.roadAddress;
	               } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                   addr = data.jibunAddress;
	               }

	               //우편변호와 주소 정보를 해당 필드에 넣는다.
	               document.getElementById('userPostCode').value = data.zonecode;
	               document.getElementById("userAddr").value = addr;
	               
	               // 커서를 상세주소 필드로 이동한다.
	               document.getElementById("userDetailAddr").value = '';
	               document.getElementById("userDetailAddr").focus();
	           }
	       }).open();
	}
</script>
<title>register</title>
</head>
<body class="bg-gradient-primary">
	<div class="container" style="margin-top: 8rem; margin-left: 23rem;">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block bg-login-image">
							<img src="../resources/images/login.PNG" class="logImg">
						</div>
						<div class="col-lg-6">
							<div class="p-2">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">회원가입</h1>
								</div>
								<form role="form" method="post" autocomplete="off" class="user">
									<table>
										<tr>
											<th><label for="userId">아이디</label></th>
											<td><input id="userId" name="userId" required="required" /></td>
											<td><button class="idChk" type="button" id="idChk"
													onclick="fn_idChk();" value="N">중복체크</button></td>
										</tr>
										<tr>
											<th><label for="userPass">비밀번호</label></th>
											<td><input type="password" id="userPass" name="userPass"
												required="required" /></td>
										</tr>
										<tr>
											<th><label for="userName">이름</label></th>
											<td><input type="text" id="userName" name="userName"
												required="required" /></td>
										</tr>
										<tr>
											<th><label for="userEmail">이메일</label></th>
											<td><input type="email" id="userEmail" name="userEmail"
												required="required" /></td>
										</tr>
										<tr>
											<th><label for="userPhone">휴대폰 번호</label></th>
											<td><input type="tel" id="userPhone" name="userPhone"
												placeholder="숫자만 입력해주세요" required="required" /></td>
										</tr>
										<tr>
											<th><label for="userPostCode">우편번호</label></th>
											<td>
												<input type="text" id="userPostCode" name="userPostCode" placeholder="우편번호" style="color:#0A7ABF; font-weight: 800; width: 100px">
											</td>
											<td><input type="button" onclick="findAddr()" value="우편번호 찾기"><br></td>
										</tr>
										<tr>
											<th><label for="userAddr">주소</label></th>
											<td colspan="2"><input type="text" id="userAddr" name="userAddr" style="width: 100%"></td>
										</tr>
										<tr>
											<th></th>
											<td colspan="2"><input type="text" id="userDetailAddr" name="userDetailAddr" placeholder="상세주소를 입력해주세요." style="width: 100%"></td>
										</tr>
										<tr>
											<th><label for="userBday">생년월일</label></th>
											<td><input type="date" id="userBday" name="userBday" /></td>
											<td><button class="ageChk" type="button" id="ageChk"
													onclick="fn_ageChk();" value="N">나이체크</button></td>
										</tr>
									</table>
									<br>
									<div style="text-align: center;">
										<button class="btn btn-success" type="submit" id="submit"
											disabled=true>회원가입</button>
										<button class="cencle btn btn-danger" type="button"
											onclick="javascript:history.go(-1)">취소</button>
									</div>
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