<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Blog test</title>
<style type="text/css">
.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

</style>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- boardDetail.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/boardDetail.js"></script>
<!-- commen_list.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comment/comment_list.js"></script>
<!-- comment.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comment/comment.js"></script>
<!-- modal.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comment/comment_update_modal.js"></script>
<!-- get_context_path.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/include/get_context_path.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	boardDetail(${paging.cri.boardNo});
	commentList(${paging.cri.boardNo});
});
</script>
</head>
<body>
	<jsp:include page="../include/menu.jsp" />
	<jsp:include page="../board/comment_update_modal.jsp" />
	<div class="table_wrap">
		<input type="hidden" id="username" value='${sessionScope.username}'/>
		<input type="hidden" id="role" value='${sessionScope.role}'/>
		<table class="table">
			<tr>
				<td><strong>No</strong></td>
				<td><strong>Title</strong></td>
				<td><strong>Writer</strong></td>
				<td><strong>Date</strong></td>
			</tr>
			<c:forEach var="board" items="${list}">
				<input type="hidden" id="boardNo" value='<c:out value="${board.boardNo}"/>'/>
				
				<tr>
					<td><c:out value="${board.boardNo}"></c:out></td>
					<td><a onclick="boardDetail(${board.boardNo}); commentList(${board.boardNo})"><c:out
								value="${board.title}"></c:out></a></td>
					<td><c:out value="${board.writer}"></c:out></td>
					<td><c:out value="${board.regDate}"></c:out></td>
				</tr>
				<input type="hidden" id="pageNum" value='<c:out value="${paging.cri.pageNum}"/>'/>
				<input type="hidden" id="amount" value='<c:out value="${paging.cri.amount}"/>'/>
				<input type="hidden" id="keyword" value='<c:out value="${paging.cri.keyword}"/>'/>
			</c:forEach>
		</table>
		<br />
		<c:choose>
			<c:when test="${empty sessionScope.username}">
			</c:when>
			<c:otherwise>
				<a href="<%=request.getContextPath()%>/board/insertForm.do">Add</a>
			</c:otherwise>
		</c:choose>

		<jsp:include page="../include/paging.jsp" >
			<jsp:param value="board" name="type"/>
		</jsp:include>
		<jsp:include page="../include/searching.jsp" >
			<jsp:param value="board" name="type"/>
		</jsp:include>
		
		<div id="detail_wrap"></div>
		<div id="commentList"></div>
	</div>
</body>
</html>