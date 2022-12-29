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
    	});
        html += "<input type='hidden' id='reply_bId' value='" + bId + "'>";
        html += "<input type='hidden' id='reply_cId' value='" + cId + "'>";
        html += "<input type='hidden' id='reply_user' value='tester'>";
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

// reply list button
$(document).on("click", ".reCommentCloseBtn", function() {
	const _this = $(this);
	_this.siblings('.reCommentDiv').hide();
	_this.hide();
	_this.siblings('.reCommentBtn').show();
});

//  comment and reply delete function
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
        })
        .fail(function() {
        	console.log("fail");
        })
        .always(function() {
        	console.log("always");
        	commentList();
        })
	});

//  reply insert function
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