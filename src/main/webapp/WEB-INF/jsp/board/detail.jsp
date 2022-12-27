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
	            html += 	"<input type='hidden' id='comment_bId' value='" + ${board.boardNo} + "'>"
	            html += 	"<input type='hidden' id='comment_cId' value='" + comment.cId + "'>"
	            html += 	"<b id='commentWriter_" + comment.cId + "'>" + comment.user + "</b>";
	            html += 	"<span style='float:right;' align='right' id='commentDate_"+ comment.cId +"'> " + comment.createdDate + " </span>";
	            html += 	"<div class='mb-1 comment_container' >"
	            html += 		"<h5 id='commentText_" + comment.cId + "' style='display: inline'>" + comment.content +"</h5>";
	            html += 		"<span id='ccCount_" + comment.cId + "' style='color: red'> ["+comment.repNum+"]</span>"
	            html += 	"</div>"
	            html += 	"<span style='cursor: pointer; color: blue' class='reCommentBtn' id='reCommentBtn_"+ comment.cId +"'>답글 달기 </span>";
	            html += 	"<span style='display:none; cursor: pointer; color: blue' class='reCommentCloseBtn' id='reCommentCloseBtn_"+ comment.cId +"'>답글 닫기 </span>";
	            html += 	"<span style='cursor: pointer; color: blue' class='commentMod' data-toggle='modal' data-target='#myModal'>수정 </span>";
	            html += 	"<span style='cursor: pointer; color: blue' class='commentDel'>삭제</span>";
	            html += 	"<hr>";
                html += 	"<div class='mx-4 reCommentDiv' id='reCommentDiv_" + comment.cId + "'></div>";
                html += "</div>";
			 });
			 $("#commentList").html(html)
		 });
	}
	
	$(document).on("click", ".commentDel", function() {
		// comment delete
		const _this = $(this);
		const cId =  $(this).siblings('#comment_cId').val();
		
		$.ajax({
			url: "../comment/commentDelete.json",
	        dataType: "json",
	        data: {"cId": cId}
		})
		.done(function() {
        	console.log("success");
        	commentList();
        })
        .fail(function() {
        	console.log("fail");
        })
        .always(function() {
        	console.log("always");
        })
	});
	
	$(document).on("click", ".commentMod", function() {
		// comment update form
		const _this = $(this);
		const cId =  $(this).siblings('#comment_cId').val();
		const comment_text = $(this).siblings('.comment_container').children('h5').text();
		const comment_user = $(this).siblings('b').text();
		
		console.log(cId);
		console.log(comment_text);
		console.log(comment_user);
		
	});
	
	//reply list
	$(document).on("click", ".reCommentBtn", function() {
		const _this = $(this);
		const bId = $(this).siblings('#comment_bId').val();
		const cId = $(this).siblings('#comment_cId').val();
		console.log(bId);
		console.log(cId);
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
	    		html += "<div class='mb-2'>";
                html += "<input type='hidden' id='commentId_"+ comment.cId +"' value='" + comment.cId + "'>"
                html += "<b id='commentWriter_" + comment.cId + "' >" + comment.user + "</b>";
                html += "<span style='float:right;' align='right' id='commentDate'> " + comment.createdDate + " </span>";
                html += "<h5 id='commentText_"+ comment.cId +"'>" + comment.content + "</h5>";
                html += "<hr></div>";
	    	});
            html += "<input type='hidden' id='reply_bId' value='" + bId + "'>"
            html += "<input type='hidden' id='reply_cId' value='" + cId + "'>"
            html += "<input type='hidden' id='reply_user' value='tester'>"
	    	html += "<input style='width: 90%' id='reComment_"+cId+"' class='reComment' name='reComment' placeholder='댓글을 입력해 주세요'>";
            html += "<button type='button' class='btn btn-primary mx-2 reCommentSubmit'>등록</button>";
            
	    	_this.siblings(".reCommentDiv").html(html);
	    })
	    .fail(function() {
        	console.log("fail");
        })
        .always(function() {
        	console.log("always");
        });
	});
	
	$(document).on("click", ".reCommentSubmit", function () {
		const _this = $(this);
		const content = $(this).siblings('.reComment').val();
		const bId = $(this).siblings('#reply_bId').val();
		const cId = $(this).siblings('#reply_cId').val();
		const user = $(this).siblings('#reply_user').val();
		
		$.ajax({
            type: 'post',
            url: "../comment/insert.json",
	        dataType: "json",
            data: {"bId": bId, "cId": cId, "content": content, "user": user},
        })
        .done(function() {
        	let html = "";
        	console.log("success");
        	commentList();
        })
        .fail(function() {
        	console.log("fail");
        })
        .always(function() {
        	console.log("always");
        })
	});
	
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