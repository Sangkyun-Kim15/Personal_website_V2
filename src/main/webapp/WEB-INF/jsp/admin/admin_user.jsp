<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../include/menu.jsp" />
	<jsp:include page="../admin/admin_user_detail_modal.jsp" />
	<table class="table">
		<tr>
			<td><strong>Username</strong></td>
			<td><strong>Role</strong></td>
			<td><strong>Date</strong></td>
			<td><strong>Is deleted</strong></td>
		</tr>
		<c:forEach var="account" items="${list}">
			<tr>
				<td class="username" style="cursor: pointer;" data-toggle="modal" data-target="#userDetailModal"><c:out value="${account.username}"></c:out></td>
				<td><c:out value="${account.role}"></c:out></td>
				<td><c:out value="${account.createdDate}"></c:out></td>
				<td><c:out value="${account.isDeleted}"></c:out></td>
			</tr>
			<input type="hidden" id="pageNum" value='<c:out value="${paging.cri.pageNum}"/>'/>
			<input type="hidden" id="amount" value='<c:out value="${paging.cri.amount}"/>'/>
			<input type="hidden" id="keyword" value='<c:out value="${paging.cri.keyword}"/>'/>
		</c:forEach>
	</table>
	
	<div class="pageInfo_wrap">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">
	
				<!-- 이전페이지 버튼 -->
				<c:if test="${paging.prev}">
					<li class="pageInfo_btn previous"><a
						href="<%=request.getContextPath() %>/account/accountSelectPaging.do?pageNum=${paging.startPage - 1}&amount=${paging.cri.amount}&keyword=${paging.cri.keyword}">Previous</a></li>
				</c:if>
	
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${paging.startPage}"
					end="${paging.endPage}">
					<li class="pageInfo_btn"><a
						href="<%=request.getContextPath() %>/account/accountSelectPaging.do?pageNum=${num}&amount=${paging.cri.amount}&keyword=${paging.cri.keyword}">${num}</a></li>
				</c:forEach>
	
				<!-- 다음페이지 버튼 -->
				<c:if test="${paging.next}">
					<li class="pageInfo_btn next"><a
						href="<%=request.getContextPath() %>/account/accountSelectPaging.do?pageNum=${paging.endPage + 1 }&amount=${paging.cri.amount}&keyword=${paging.cri.keyword}">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	
	<div class="search_wrap">
			<div class="search_area">
				<form method="post" action="<%=request.getContextPath()%>/account/accountSelectPaging.do">
					<input type="text" name="keyword" value="${paging.cri.keyword}">
					<button type="submit">Search</button>
				</form>
			</div>
		</div>
</body>
</html>