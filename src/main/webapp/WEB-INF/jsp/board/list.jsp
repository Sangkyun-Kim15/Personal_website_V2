<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Blog test</title>
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
</head>
<body>
	<jsp:include page="../include/menu.jsp" />
	<div class="table_wrap">
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
					<td><a
						href="<%=request.getContextPath()%>/board/detail.do?boardNo=${board.boardNo}&pageNum=${paging.cri.pageNum}&amount=${paging.cri.amount}"><c:out
								value="${board.title}"></c:out></a></td>
					<td><c:out value="${board.writer}"></c:out></td>
					<td><c:out value="${board.regDate}"></c:out></td>
				</tr>
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


		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">

					<!-- 이전페이지 버튼 -->
					<c:if test="${paging.prev}">
						<li class="pageInfo_btn previous"><a
							href="<%=request.getContextPath() %>/board/select.do?pageNum=${paging.startPage - 1}&amount=${paging.cri.amount}&keyword=${paging.cri.keyword}">Previous</a></li>
					</c:if>

					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${paging.startPage}"
						end="${paging.endPage}">
						<li class="pageInfo_btn"><a
							href="<%=request.getContextPath() %>/board/select.do?pageNum=${num}&amount=${paging.cri.amount}&keyword=${paging.cri.keyword}">${num}</a></li>
					</c:forEach>

					<!-- 다음페이지 버튼 -->
					<c:if test="${paging.next}">
						<li class="pageInfo_btn next"><a
							href="<%=request.getContextPath() %>/board/select.do?pageNum=${paging.endPage + 1 }&amount=${paging.cri.amount}&keyword=${paging.cri.keyword}">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>

		<div class="search_wrap">
			<div class="search_area">
				<form method="post" action="<%=request.getContextPath()%>/board/select.do">
					<input type="text" name="keyword" value="${paging.cri.keyword}">
					<button type="submit">Search</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>