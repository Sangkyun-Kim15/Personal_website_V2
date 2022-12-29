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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/modal.js"></script>
<!-- comment.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board/comment.js"></script>
<script>
	$(document).ready(function() {
		commentList();
	});
	// comment list
	function commentList() {
		 $.ajax({
			 type: "get",
			 url: "../comment/select.json",
			 dataType: "json",
			 data: {"boardNo":"${board.boardNo}"}
		 })
		 .done(function(response) {
			 console.log(response)
			 let html = "";
			 
			 response.forEach(function(comment) {
				 
				html += "<div class='mb-2'>";
	            html += 	"<input type='hidden' id='comment_bId' value='" + ${board.boardNo} + "'>";
	            html += 	"<input type='hidden' id='comment_cId' value='" + comment.cId + "'>";
	            html += 	"<b id='commentWriter_" + comment.cId + "'>" + comment.user + "</b>";
	            html += 	"<span style='float:right;' align='right' id='commentDate_"+ comment.cId +"'> " + comment.createdDate + " </span>";
	            html += 	"<div class='mb-1 comment_container' >";
	            html += 		"<h5 id='commentText_" + comment.cId + "' style='display: inline'>" + comment.content +"</h5>";
	            html += 		"<span id='ccCount_" + comment.cId + "' style='color: red'> ["+comment.repNum+"]</span>";
	            html += 	"</div>";
	            html += 	"<span style='cursor: pointer; color: blue' class='reCommentBtn' id='reCommentBtn_"+ comment.cId +"'>답글 달기 </span>";
	            html += 	"<span style='display:none; cursor: pointer; color: blue' class='reCommentCloseBtn' id='reCommentCloseBtn_"+ comment.cId +"'>답글 닫기 </span>";
	            html += 	"<span style='cursor: pointer; color: blue' class='commentMod' data-toggle='modal' data-target='#myModal'>수정 </span>";
	            html += 	"<span style='cursor: pointer; color: blue' class='commentDel'>삭제</span>";
	            html += 	"<hr>";
                html += 	"<div class='mx-4 reCommentDiv' id='reCommentDiv_" + comment.cId + "'></div>";
                html += "</div>";
			 });
			 $("#commentList").html(html);
		 });
	}
</script>
</head>
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
				<button type="submit" class="btn btn-primary" id="cmt_reg_btn"> add</button>
			</div>
	</form>
 </div>
 <div id="commentList"></div>
 <jsp:include page="../include/modal.jsp" />
</body>
</html>