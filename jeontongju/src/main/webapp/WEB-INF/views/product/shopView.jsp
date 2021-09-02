
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../resources/css/homeStyles.css" rel="stylesheet" />
<script> 
function replyList(){
 var pNo = "${shopList.pNo}";
 $.getJSON("/product/view/replyList" + "?n=" + pNo, function(data){
  var str = "";
  
  $(data).each(function(){
   
   console.log(data);
   
   var cDate = new Date(this.cDate);
   cDate = cDate.toLocaleDateString("ko-US")
   
   str += "<li data-cNO='" + this.cNO + "'>"
     + "<div class='userInfo'>"
     + "<span class='userId'>" +"작성자 : "+ this.userId + "&nbsp&nbsp</span>"
     + "<span class='date'>" + cDate + "</span>"
     + "</div>"
     + "<div class='replyContent'>" + this.cContent + "</div>"
     
     + "<c:if test='${member != null}'>"
     
      + "<div class='replyFooter'>"
      + "<button type='button' class='modify' data-cNO='" + this.cNO + "'>수정</button>"
      + "<button type='button' class='delete' data-cNO='" + this.cNO + "'>삭제</button>"
      + "</div>"
     
     + "</c:if>"
     
     + "</li>";           
  });
  
  $("section.replyList ol").html(str);
 });
}
</script>
<style>
section#container {
	width: 80%;
	height: auto;
	margin: 10% auto;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

section#content {
	width: 1000px;
}

section#content::after {
	content: "";
	display: block;
	clear: both;
}

div.goods div.goodsImg {
	float: left;
	width: 350px;
	margin: 10px;
}

div.goods div.goodsImg img {
	width: 350px;
	height: 470;
	border: 1px solid #eaeaea;
}

div.goods div.goodsInfo{
	position: relative;
	left: 15rem;
	top: 1rem;
}

div.goods div.goodsInfo table{
	border-collapse: separate;
	border-spacing: 0 30px;
}

div.goods div.goodsInfo th{
	font-size: 14px;
	color: #858080;
}

div.goods div.goodsInfo td{
	text-align: left;
	margin-left: 1rem;
}

.plus, .minus{
	width: 30px;
	height: 30px;
	background-color: transparent;
	border: 1px solid #B9B2B2;
	border-radius: 15px;
}

.addCart_btn{
	width: 100%;
	height: 50px;
	border: none;
	border-radius: 5px;
	background-color: #0A7ABF;
	font-size: 18px;
	font-weight: 800;
	color: white;
}

div#reply {
	display: block;
	position: relative;
	margin-left: 100;
}

div#reply p#replylogin {
	display: block;
	clear: both;
	margin-top: 50;
}

section.replyForm {
	content: "";
	display: block;
	clear: both;
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
}

section.replyForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 100%;;
	height: 150px;
}

section.replyForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
	position: relative;
	left: 750;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
	margin-top: 30px;
}

section.replyList div.userInfo .userName {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
}

section.replyList div.replyFooter {
	margin-bottom: 10px;
	position: relative;
	left: 580;
}

section.replyList div.replyFooter button {
	font-size: 14px;
	border: 1px solid #999;
	background: none;
	margin-right: 10px;
}

div.replyModal {
	position: relative;
	z-index: 1;
	display: none;
}

div.modalBackground {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

div.modalContent {
	position: fixed;
	top: 20%;
	left: calc(50% - 250px);
	width: 525px;
	height: 290px;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

div.modalContent textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;
	height: 200px;
}

div.modalContent button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

div.modalContent button.modal_cancel {
	margin-left: 20px;
}

h5 {
	margin-left: 50;
	color: #3FB0C8;
	width: 100;
}
</style>
<title>전통 이酒</title>
</head>
<body>
	<!-- 상단메뉴 -->
	<%@ include file="../include/header.jsp"%>
	
	<!-- 상품상세 -->
	<div id="root" class="container">
		<section id="container">
			<div id="container_box" style="width: 80; height: 320; border-bottom: 2px solid #eee">
				<section id="content">
					<form role="form" method="post">
						<input type="hidden" name="pNo" value="${shopList.pNo}" />
					</form>

					<div class="goods">
						<div class="goodsImg"><img src="../resources/images/${shopList.pImg}">	</div>
						<div class="goodsInfo">
							<table>
								<tr>
									<th>상품명</th>
									<td>${shopList.pName}</td>
								</tr>
								<tr>
									<th>종류</th>
									<td>${shopList.cateName}</td>
								</tr>
								<tr>
									<th>상품설명</th>
									<td>${shopList.pInfo}</td>
								</tr>
								<tr>
									<th>가격</th>
									<td><fmt:formatNumber pattern="###,###,###"
											value="${shopList.pPrice}" />원</td>
								</tr>
								<tr>
									<th>재고</th>
									<td><fmt:formatNumber pattern="###,###,###"
											value="${shopList.pCount}" /></td>
								</tr>
								<tr>
									<th>구입 수량</th>
									<td>
										<button type="button" class="minus">-</button> 
										<input type="number" class="numBox_1" min="1" max="${shopList.pCount}" value="1" readonly="readonly" />
										<button type="button" class="plus">+</button> 
										<script>
											  $(".plus").click(function(){
												   var num = $(".numBox_1").val();
												   var plusNum = Number(num) + 1;
								   
												   if(plusNum >= ${shopList.pCount}) {
												  	  $(".numBox_1").val(num);
												   } else {
												  	  $(".numBox_1").val(plusNum);          
												   }
											  });
								  
											  $(".minus").click(function(){
												   var num = $(".numBox_1").val();
												   var minusNum = Number(num) - 1;
									   
												   if(minusNum <= 0) {
												   	 $(".numBox_1").val(num);
												   } else {
												   	 $(".numBox_1").val(minusNum);          
												   }
								 			 });
										 </script>
									</td>
								</tr>
								<tr>
									<td colspan="2">	<button type="button" class="addCart_btn">장바구니에 담기</button> 
									<script>
								  $(".addCart_btn").click(function(){
								   var gdsNum = $("#gdsNum").val();
								   var cartStock = $(".numBox_1").val();
								      
								   var data = {
										   pNo : gdsNum,
								    	 count : cartStock
								     };
								   
								   $.ajax({
								    url : "/product/view/addCart",
								    type : "post",
								    data : data,
								    success : function(result){
								    	if(result == 1){
								    			 alert("장바구니 담기 성공");
								    			 $(".numBox").val("1");
								    	}else{
								    		alert("회원만 사용할수 있습니다.")
								    		$(".numBox_1").val("1");
								    	}
								    },
								    error : function(){
								     alert("장바구니 담기 실패");
								    }
								   });
								  });
								 </script>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</section>

			</div>
			<br>
			<div id="reply" style="margin-top: 200px !important;">
				<h5>상품평</h5>

				<c:if test="${member == null }">

					<p id="replylogin">

						소감을 남기시려면 <a href="/member/loginPage">로그인</a>해주세요
				</c:if>
				<section class="replyList">
					<ol>

					</ol>
					<script> 
						replyList();
				</script>

					<script>
						$(document).on("click", ".modify", function(){
						$(".replyModal").fadeIn(200);
						
						 var cNO = $(this).attr("data-cNO");
						 var cContent = $(this).parent().parent().children(".replyContent").text();
						 
						 $(".modal_repCon").val(cContent);
						 $(".modal_modify_btn").attr("data-cNO", cNO);
					});
					
					
					
					 $(document).on("click", ".delete", function(){
					  
						 var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
					  
						  if(deleteConfirm){
							 
							  var data = {cNO : $(this).attr("data-cNO")};
							   
							  $.ajax({
							   url : "/product/view/deleteReply",
							   type : "post",
							   data : data,
							   success : function(result){
								   
									   if(result == 1) {
									    replyList();
									   } else {
									    alert("작성자 본인만 할 수 있습니다.");     
									   }
								  },
								  error : function(){
									  alert("로그인하세요.")
								  }
							  	});
						  }
					 });
					</script>
				</section>
				<c:if test="${member != null}">
					<section class="replyForm">
						<form role="form" method="post" autocomplete="off"
							action="/product/replyView">
							<input type="hidden" name="pNo" id="gdsNum"
								value="${shopList.pNo}">
							<div class="input_area">
								<textarea name="cContent" id="repCon"></textarea>
							</div>

							<div class="input_area">
								<button type="button" id="reply_btn">소감 남기기</button>

								<script>
							 $("#reply_btn").click(function(){
							  
							  var formObj = $(".replyForm form[role='form']");
							  var gdsNum = $("#gdsNum").val();
							  var repCon = $("#repCon").val()
							  
							  var data = {
								  pNo : gdsNum,
								  cContent : repCon
							    };
							  
							  $.ajax({
							   url : "/product/view/registReply",
							   type : "post",
							   data : data,
							   success : function(){
							    replyList();
							    $("#repCon").val("");
							   }
							  });
							 });
							</script>
							</div>

						</form>
					</section>
				</c:if>
			</div>
		</section>
		<div class="replyModal">

			<div class="modalContent">

				<div>
					<textarea class="modal_repCon" name="modal_repCon"></textarea>
				</div>

				<div>
					<button type="button" class="modal_modify_btn">수정</button>
					<button type="button" class="modal_cancel">취소</button>
				</div>

			</div>

			<div class="modalBackground"></div>

		</div>

		<script>
	$(".modal_modify_btn").click(function(){
		 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
						 
		if(modifyConfirm) {
			  var data = {
					  cNO : $(this).attr("data-cNO"),
			     cContent : $(".modal_repCon").val()
			    };  // ReplyVO 형태로 데이터 생성
			  
			  $.ajax({
			   url : "/product/view/modifyReply",
			   type : "post",
			   data : data,
			   success : function(result){
			    
			    if(result == 1) {
			     replyList();
			     $(".replyModal").fadeOut(200);
			    } else {
			     alert("작성자 본인만 할 수 있습니다.");       
			    }
	 		   },
			   error : function(){
			    alert("로그인하셔야합니다.")
			   }
			  });
			 }
			 
			});

		$(".modal_cancel").click(function(){

		 $(".replyModal").fadeOut(200);
		});
		</script>

	</div>

</body>
</html>
