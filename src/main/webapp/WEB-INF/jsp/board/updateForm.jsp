<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
 %>
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
</head>
<body>
	<h2>Updating</h2>
	<form method="post" action="<%=request.getContextPath()%>/board/update.do">
		<input type="hidden" name="boardNo" value="${board.boardNo}">
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label">Title</label>
			<div class="col-sm-10">
				<input type="text" name="title" value='<c:out value="${board.title}"/>' class="form-control" >
			</div>
		</div>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label">Writer</label>
			<div class="col-sm-10">
				<input type="text" name="writer" value='<c:out value="${board.writer}"/>' class="form-control"  readonly>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label">Content</label>
			<div class="col-sm-10">
				<input type="text" name="content" value='<c:out value="${board.content}"/>' class="form-control" >
			</div>
		</div>
		<div class="form-group row">
    		<div class="col-sm-10">
    			<button type="submit" class="btn btn-primary">Update</button>
    		</div>
    	</div>
	</form>
</body>
</html>