<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>

</script>
<body>
 <div>
	 <table class = "table">
	 	<tr>
	 		<th>NO</th>
	 		<td>${board.boardNo}</td>
	 		<th>Writer</th>
	 		<td>${board.writer}</td>
	 		<th>Title</th>
	 		<td>${board.title}</td>
	 		<th>Date</th>
	 		<td>${board.regDate}</td>
	 	</tr>
	 	<tr>
	 		<th>Content</th>
	 		<td>${board.content}</td>
	 	</tr>
	 </table>
 </div>
 <div>
 		<a href="<%=request.getContextPath() %>/board/updateForm.do?boardNo=${board.boardNo}">Update</a>
 		<a href="<%=request.getContextPath() %>/board/delete.do?boardNo=${board.boardNo}">Delete</a>
 </div>
 
</body>
</html>