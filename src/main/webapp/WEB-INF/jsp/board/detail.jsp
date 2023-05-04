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
<!-- modal.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comment/comment_update_modal.js"></script>
<!-- comment.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comment/comment.js"></script>
<!-- comment.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comment/comment_reply_list_by_user.js"></script>
<!-- get_context_path.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/include/get_context_path.js"></script>
<script>
	$(document).ready(function() {
		commentReplyListByUser();
	});
	
</script>
</head>
<body>
	<jsp:include page="../include/menu.jsp" />
	<jsp:include page="../board/comment_update_modal.jsp" />
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
 	<c:choose>
		<c:when test="${sessionScope.username eq board.writer or sessionScope.role eq 'ADMIN'}">
	 		<a href="<%=request.getContextPath() %>/board/updateForm.do?boardNo=${board.boardNo}">Update</a>
	 		<a href="<%=request.getContextPath() %>/board/delete.do?boardNo=${board.boardNo}&pageNum=${cri.pageNum}&amount=${cri.amount}">Delete</a>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
 </div>
 <div>
	<c:choose>
		<c:when test="${empty sessionScope.username}">
		</c:when>
		<c:otherwise>
			<form method="post" action="<%=request.getContextPath()%>/comment/insert.do">
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>' class="form-control"/>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>' class="form-control"/>
				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>' class="form-control"/>
				<input type="hidden" name="boardNo" value='<c:out value="${cri.boardNo}"/>' class="form-control"/>
				<input type="hidden" name="bId" value='<c:out value="${board.boardNo}"/>' class="form-control"/>
				<textarea name="content"></textarea>
				<input type="hidden" name="user" class="form-control" value="${sessionScope.username}"/>
				<button type="submit" class="btn btn-primary" id="cmt_reg_btn"> add</button>
			</form>
		</c:otherwise>
	</c:choose>
 </div>
 	
</body>
</html>