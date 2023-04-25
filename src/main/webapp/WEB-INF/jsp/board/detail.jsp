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
			 var username = '<%=(String)session.getAttribute("username")%>';
			 var role = '<%=(String)session.getAttribute("role")%>';
			 let html = "";
			 console.log(username)
			 
			 response.forEach(function(comment) {
				 if(username == comment.user || role == "ADMIN") {
					 html += "<div class='mb-2'>";
		             html += 	"<input type='hidden' id='comment_bId' value='" + ${board.boardNo} + "'>";
		             html += 	"<input type='hidden' id='comment_cId' value='" + comment.cId + "'>";
		             html += 	"<b id='commentWriter_" + comment.cId + "'>" + comment.user + "</b>";
		             html += 	"<span style='float:right;' align='right' id='commentDate_"+ comment.cId +"'> " + comment.createdDate + " </span>";
		             html += 	"<div class='mb-1 comment_container' >";
		             html += 		"<h5 id='commentText_" + comment.cId + "' style='display: inline'>" + comment.content +"</h5>";
		             html += 		"<span id='ccCount_" + comment.cId + "' style='color: red'> ["+comment.repNum+"]</span>";
		             html += 	"</div>";
		             html += 	"<h5>" + comment.isDeleted +"</h5>";
		             html += 	"<span style='cursor: pointer; color: blue' class='reCommentBtn' id='reCommentBtn_"+ comment.cId +"'>답글 달기 </span>";
		             html += 	"<span style='display:none; cursor: pointer; color: blue' class='reCommentCloseBtn' id='reCommentCloseBtn_"+ comment.cId +"'>답글 닫기 </span>";
		             html += 	"<span style='cursor: pointer; color: blue' class='commentMod' data-toggle='modal' data-target='#myModal'>수정 </span>";
		             html += 	"<span style='cursor: pointer; color: blue' class='commentDel'>삭제</span>";
		             html += 	"<hr>";
	                 html += 	"<div class='mx-4 reCommentDiv' id='reCommentDiv_" + comment.cId + "'></div>";
	                 html += "</div>";					 
				 } else {
					 html += "<div class='mb-2'>";
		             html += 	"<input type='hidden' id='comment_bId' value='" + ${board.boardNo} + "'>";
		             html += 	"<input type='hidden' id='comment_cId' value='" + comment.cId + "'>";
		             html += 	"<b id='commentWriter_" + comment.cId + "'>" + comment.user + "</b>";
		             html += 	"<span style='float:right;' align='right' id='commentDate_"+ comment.cId +"'> " + comment.createdDate + " </span>";
		             html += 	"<div class='mb-1 comment_container' >";
		             html += 		"<h5 id='commentText_" + comment.cId + "' style='display: inline'>" + comment.content +"</h5>";
		             html += 		"<span id='ccCount_" + comment.cId + "' style='color: red'> ["+comment.repNum+"]</span>";
		             html += 	"</div>";
		             html += 	"<h5>" + comment.isDeleted +"</h5>";
		             html += 	"<span style='cursor: pointer; color: blue' class='reCommentBtn' id='reCommentBtn_"+ comment.cId +"'>답글 달기 </span>";
		             html += 	"<span style='display:none; cursor: pointer; color: blue' class='reCommentCloseBtn' id='reCommentCloseBtn_"+ comment.cId +"'>답글 닫기 </span>";
		             html += 	"<hr>";
	                 html += 	"<div class='mx-4 reCommentDiv' id='reCommentDiv_" + comment.cId + "'></div>";
	                 html += "</div>";					 
				 }
			 });
			 $("#commentList").html(html);
		 });
	}
	
	//reply list
	$(document).on("click", ".reCommentBtn", function() {
		const _this = $(this);
		const bId = $(this).siblings('#comment_bId').val();
		const cId = $(this).siblings('#comment_cId').val();
		var username = '<%=(String)session.getAttribute("username")%>';
		var role = '<%=(String)session.getAttribute("role")%>';
		console.log(username)
		// ?
	    _this.siblings('.reCommentDiv').show();
	    _this.hide();
	    _this.siblings('.reCommentCloseBtn').show();
	    
	    $.ajax({
	    	type: "get",
	        url: "../comment/replySelect.json",
	        dataType: "json",
	        data: {"cId": cId}
	    })
	    .done(function(response) {
	    	console.log(response)
			let html = "";
	    	
	    	response.forEach(function(comment) {
	    		if(username == comment.user  || role == "ADMIN") {
		    		html += "<div class='mb-2'>";
		            html += 	"<input type='hidden' id='comment_cId' value='" + comment.cId + "'>";
		            html += 	"<b id='commentWriter_" + comment.cId + "' >" + comment.user + "</b>";
		            html += 	"<span style='float:right;' align='right' id='commentDate'> " + comment.createdDate + " </span>";
		            html += 	"<div class='mb-1 comment_container' >";
		            html += 		"<h5 id='commentText_"+ comment.cId +"'>" + comment.content + "</h5>";
		            html += 	"</div>";
		            html += 	"<span style='cursor: pointer; color: blue' class='commentMod' data-toggle='modal' data-target='#myModal'>수정 </span>";
		            html += 	"<span style='cursor: pointer; color: blue' class='commentDel'>삭제</span>";
		            html += 	"<hr>";
		            html += "</div>";
	    			
	    		} else {
	    		html += "<div class='mb-2'>";
	            html += 	"<input type='hidden' id='comment_cId' value='" + comment.cId + "'>";
	            html += 	"<b id='commentWriter_" + comment.cId + "' >" + comment.user + "</b>";
	            html += 	"<span style='float:right;' align='right' id='commentDate'> " + comment.createdDate + " </span>";
	            html += 	"<div class='mb-1 comment_container' >";
	            html += 		"<h5 id='commentText_"+ comment.cId +"'>" + comment.content + "</h5>";
	            html += 	"</div>";
	            html += 	"<hr>";
	            html += "</div>";
	    			
	    		}
	    	});
	        html += "<input type='hidden' id='reply_bId' value='" + bId + "'>";
	        html += "<input type='hidden' id='reply_cId' value='" + cId + "'>";
	    	if(username != "null") {
		        html += "<input type='hidden' id='reply_user' value='"+ username +"'>";
		    	html += "<input style='width: 90%' id='reComment_"+cId+"' class='reComment' name='reComment' placeholder='댓글을 입력해 주세요'>";
		        html += "<button type='button' class='btn btn-primary mx-2 reCommentSubmit'>등록</button>";
	    		
	    	}
	        
	    	_this.siblings(".reCommentDiv").html(html);
	    })
	    .fail(function() {
	    	console.log("fail");
	    })
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
				<input type="hidden" name="bId" value='<c:out value="${board.boardNo}"/>' class="form-control"/>
				<textarea name="content"></textarea>
				<input type="hidden" name="user" class="form-control" value="${sessionScope.username}"/>
				<button type="submit" class="btn btn-primary" id="cmt_reg_btn"> add</button>
			</form>
		</c:otherwise>
	</c:choose>
 </div>
 <div id="commentList"></div>
 	
</body>
</html>