<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	if("${msg}") {
		alert("${msg}");
	}

</script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
	<table class="table">
		<tr>
			<td><strong>No</strong></td>
			<td><strong>Title</strong></td>
			<td><strong>Writer</strong></td>
			<td><strong>Date</strong></td>
		</tr>
		<c:forEach var="board" items="${list}">
			<tr>
				<td><c:out value="${board.boardNo}"></c:out></td>
				<td><c:out value="${board.title}"></c:out></td>
				<td><c:out value="${board.writer}"></c:out></td>
				<td><c:out value="${board.regDate}"></c:out></td>
			</tr>
		</c:forEach>
	</table>
		<br/>
		<a href="<%=request.getContextPath() %>/board/insertForm.do">Add</a>
</body>
</html>