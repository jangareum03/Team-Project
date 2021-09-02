<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
<title>ProductAdd</title>
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
		<h1 class="h3 mb-0 text-gray-800" >상품등록</h1><br>
	</div>
	<div class="col-sm-12">
	<form role="form" method="post" action="productAdd" enctype="multipart/form-data">
		<table class="table table-bordered dataTable" style="text-align:center;">
			<thead>
				<tr>
				<td><label for="pNo">상품번호</label></td>
					<td>
					<select name = "pNo" id="pNo" onchange="kindChange(this)">
					<option>상품 종류를 선택해주세요</option>
					<option value="m">막걸리</option>
					<option value="s">소주</option>
					<option value="y">약주</option>
					<option value="f">과실주</option>
					<option value="n">안주</option>
					</select>
					</td>
				</tr>
				<tr>
					<td><label for="pName">상품명</label></td>
					<td><input type="text" id="pName" name="pName" /></td>
				</tr>
				<tr>
					<td><label for="pPrice">판매가</label></td>
					<td><input type="number" id="pPrice" name="pPrice" />원</td>
				</tr>
				<tr>
					<td><label for="pCount">수량</label></td>
					<td><input type="number" id="pCount" name="pCount" />개</td>
				</tr>
				<tr>
					<td><label for="pInfo">상세설명</label></td>
					<td><textarea id="pInfo" name="pInfo" rows="5" cols="20"></textarea></td>
				</tr>
				<tr>
					<td><label for="pImg">이미지</label></td>
					<td>
						<input type="file" id="pImg" name="file" />
					</td>
				</tr>
		</table>
				<div class="select_img"><img src=""></div>

				<div style="text-align:center;">
					<button type="submit" id="add_btn" class="btn btn-success btn-icon-split">등록</button>
					<button type="reset" onclick="location.href='productList'" class="btn btn-danger btn-icon-split">취소</button>
				</div>

		<script>
  				$("#pImg").change(function(){
   				if(this.files && this.files[0]) {
    			var reader = new FileReader;
    			reader.onload = function(data) {
    			$(".select_img img").attr("src", data.target.result).width(500);        
    			}
    			reader.readAsDataURL(this.files[0]);
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