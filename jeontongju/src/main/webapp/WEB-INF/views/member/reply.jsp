<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
</head>
<body>
			<c:forEach var="reply" items="${reply}">
				<tr>
					<th>작성자</th><td>${reply.rContent}</td>
				</tr>
			</c:forEach>
</body>
</html>