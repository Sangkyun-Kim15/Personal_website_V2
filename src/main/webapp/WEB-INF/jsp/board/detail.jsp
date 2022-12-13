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
 
 <div>
 	<table class="table">
		<tr>
			<td><strong>c_id</strong></td>
			<td><strong>p_id</strong></td>
			<td><strong>b_id</strong></td>
			<td><strong>User</strong></td>
			<td><strong>Content</strong></td>
			<td><strong>Depth</strong></td>
			<td><strong>Date</strong></td>
		</tr>
		<c:forEach var="comment" items="${list}">
			<tr>
				<td><c:out value="${comment.cId}"></c:out></td>
				<td><c:out value="${comment.bId}"></c:out></td>
				<td><c:out value="${comment.user}"></c:out></td>
				<td><c:out value="${comment.content}"></c:out></td>
				<td><c:out value="${comment.isDeleted}"></c:out></td>
				<td><c:out value="${comment.createdDate}"></c:out></td>
				<td><c:out value="${comment.repNum}"></c:out></td>
			</tr>
		</c:forEach>
	</table>
	
	<form method="post" action="<%=request.getContextPath()%>/comment/insert.do">
		<div>
			<input type="hidden" name="bId" value='<c:out value="${board.boardNo}"/>' class="form-control"/>
		</div>
		<div>
			<textarea name="content"></textarea>
		</div>
		<div>
			<input type="text" name="user" class="form-control" placeholder="user"/>
		</div>
		<div>
			<button type="submit" class="btn btn-primary"> add</button>
		</div>
	</form>
 </div>
 
</body>
</html>