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
	const bId =  $(this).siblings('#comment_bId').val();
	const cId =  $(this).siblings('#comment_cId').val();
	const currPage = $(this).siblings('#curr_page').val();
	const from = $(this).siblings('#comment_from').val();
	
	console.log(from);
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
    	if(from == "BOARD") {
    		commentList(bId);
    	} else if(from == "ADMIN") {
    		location.reload();
    	}
    	console.log("always");
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
    	commentList(bId);
    })
    .fail(function() {
    	console.log("fail");
    })
    .always(function() {
    	console.log("always");
    	
    })
});

function commentInsert() {
	const bId = document.getElementById("bId").value;
	const pageNum = document.getElementById("pageNum").value;
	const amount = document.getElementById("amount").value;
	const keyword = document.getElementById("keyword").value;
	const content = document.getElementById("content").value;
	const user = document.getElementById("user").value;
	
	$.ajax({
		 type: "POST",
		 url: "../comment/commentInsert.json",
		 data: {
			 	"bId":bId,
			 	"user":user,
			 	"content":content
			    }
	 })
	 .done(function(response) {
		 alert(response);
		 let url = "../board/select.do?boardNo="+bId+"&pageNum="+pageNum+"&amount="+amount+"&keyword="+keyword;
		 location.replace(url);
	 })
	 .fail(function() {
		 console.log("2");
		 alert("fail");
		 
	 })
	 .always(function() {
		 console.log("3");
	 });
}