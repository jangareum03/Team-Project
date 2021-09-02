<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
	li{float: left;  margin:10px; list-style: none !important; position:relative; left:50%;}
	.write_list_qna{ float:right; margin-right:3%;}
	.select_c{position:relative !important; float:left;}
	
</style>

<meta charset="UTF-8">
<title>고객센터</title>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
function passCheck(){
	if("${member.verify}"==9){
		return true;
	}else{
	var result = prompt("비밀번호를 입력해주세요.");
	
var passCom = $("#qPass").val();
	if(result==passCom){
		return true;
	}
	else{
		
		alert('비밀번호 동일안함');
		return false;
	}
	}
}
</script>
</head>
<body>

			<%@ include file = "../include/header.jsp" %>

	<div class="container">

		<br>
				<h1> 문의사항</h1>
			<hr />
			
		<section id="container">
			<form role="form" method="get">
				<table class="table table-hover">
					<thead>
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
					</thead>	
					
					<c:forEach items="${list}" var = "list" varStatus="vs">
						<input type="hidden" id="qPass" name="qPass" value="${list.qPass}"/>
						<input type="hidden" id="qNo" name="qNo" value="${list.qNo}"/>
						
						<tr id="2tr">
							<td><c:out  value="${pageMaker.totalCount-((scri.page-1)*5)-vs.count+1}"/></td>
							<td>
							
							<span onclick="return passCheck()"><a href="/qna/readView?qno=${list.qNo}&
														page=${scri.page}&
														perPageNum=${scri.perPageNum}&
														searchType=${scri.searchType}&
														keyword=${scri.keyword}">
								${list.qTitle}</a></span>

							</td>
							<td ><c:out value="${list.qWriter}" /></td>
							<td><fmt:formatDate value="${list.qDate}" pattern="yyyy.MM.dd hh:mm"/></td>
						</tr>
					</c:forEach>
					
				</table>
				<div class="line_2" >
					<div class="col-xs-2 col-sm-2">
					    <select name="searchType" class="select_c">
					      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>선택</option>
					      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					    </select>
					</div>
					
					<div class="col-xs-10 col-sm-9">
						<div class="input-group">
						    <input class="form-control"  type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
								<span class="input-group-btn">
						    <button class="btn_search"id="searchBtn" type="button">검색</button>
						 		</span>
						 </div>
					  </div>
				      <script>
					      $(function(){
					        $('#searchBtn').click(function() {
					          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
				
					<div class="col-md-offset-4">
					  <ul class="pogination">
					    <c:if test="${pageMaker.prev}">
					    	<li id="li_port"><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li <c:out value="${pageMaker.scri.page == idx ? 'class=info' : ''}" />>
					    	<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li id="li_port"><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
					</div>
						<button  type="button" class="write_list_qna" onClick="location.href='/qna/writeView'">작성</button>
				  </div>
			</form>
		</section>
	</div>
		
				<%@ include file = "../include/footer.jsp" %>
	
</body>
</html>