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
	const currPage = $(this).siblings('#curr_page').val();
	
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
    	history.go(0);
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