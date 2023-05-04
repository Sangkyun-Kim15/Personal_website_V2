function commentList(input) {
	let data;
	const username = document.getElementById("username").value;
	const role = document.getElementById("role").value;
	
	if(input == null || input == "-1") {
		console.log("parameter is null");
		data = document.getElementById("boardNo").value;
	} else {
		data = input;
		console.log("parameter is not null");
		console.log("detail boardNo : "+ data);
	}
	
	$.ajax({
		 type: "get",
		 url: "../comment/select.json",
		 dataType: "json",
		 data: {"boardNo":`${data}`}
	})	
	.done(function(response) {
		let html = "";
		
		response.forEach(function(comment) {
			html += "<div class='mb-2'>";
			html += 	"<input type='hidden' id='comment_from' value='BOARD'>";
			html += 	"<input type='hidden' id='comment_bId' value='" + data + "'>";
			html += 	"<input type='hidden' id='comment_cId' value='" + comment.cId + "'>";
			html += 	"<b id='commentWriter_" + comment.cId + "'>" + comment.user + "</b>";
			html += 	"<span style='float:right;' align='right' id='commentDate_"+ comment.cId +"'> " + comment.createdDate + " </span>";
			html += 	"<div class='mb-1 comment_container' >";
			html += 		"<h5 id='commentText_" + comment.cId + "' style='display: inline'>" + comment.content +"</h5>";
			html += 		"<span id='ccCount_" + comment.cId + "' style='color: red'> ["+comment.repNum+"]</span>";
			html += 	"</div>";
			html += 	"<h5>" + comment.isDeleted +"</h5>";
			html += 	"<span style='cursor: pointer; color: blue' class='reCommentBtn' id='reCommentBtn_"+ comment.cId +"'>Reply </span>";
			html += 	"<span style='display:none; cursor: pointer; color: blue' class='reCommentCloseBtn' id='reCommentCloseBtn_"+ comment.cId +"'>Close </span>";
			if(username == comment.user || role == "ADMIN") {
	            html += 	"<span style='cursor: pointer; color: blue' class='commentMod' data-toggle='modal' data-target='#myModal'>Edit </span>";
	            html += 	"<span style='cursor: pointer; color: blue' class='commentDel'>Delete</span>";
			}
			html += 	"<hr>";
			html += 	"<div class='mx-4 reCommentDiv' id='reCommentDiv_" + comment.cId + "'></div>";
			html += "</div>";
		});
		$("#commentList").html(html);
	});
	
};

$(document).on("click", ".reCommentBtn", function() {
	const _this = $(this);
	const bId = $(this).siblings('#comment_bId').val();
	const cId = $(this).siblings('#comment_cId').val();
	let username;
	let role;
	username = document.getElementById("username").value;
	role = document.getElementById("role").value;
	console.log(username)
	console.log("bid : " + bId)
	console.log("cid : " + cId)
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
    		html += 	"<input type='hidden' id='comment_from' value='BOARD'>";
    		html += 	"<input type='hidden' id='comment_cId' value='" + comment.cId + "'>";
    		html += 	"<input type='hidden' id='comment_bId' value='" + comment.bId + "'>";
    		html += 	"<b id='commentWriter_" + comment.cId + "' >" + comment.user + "</b>";
    		html += 	"<span style='float:right;' align='right' id='commentDate'> " + comment.createdDate + " </span>";
    		html += 	"<div class='mb-1 comment_container' >";
    		html += 		"<h5 id='commentText_"+ comment.cId +"'>" + comment.content + "</h5>";
    		html += 	"</div>";
    		if(username == comment.user  || role == "ADMIN") {
	            html += 	"<span style='cursor: pointer; color: blue' class='commentMod' data-toggle='modal' data-target='#myModal'>Edit </span>";
	            html += 	"<span style='cursor: pointer; color: blue' class='commentDel'>Delete</span>";
    		}
    		html += 	"<hr>";
    		html += "</div>";
    	});
        html += "<input type='hidden' id='reply_bId' value='" + bId + "'>";
        html += "<input type='hidden' id='reply_cId' value='" + cId + "'>";
        
    	if(username != "") {
	        html += "<input type='hidden' id='reply_user' value='"+ username +"'>";
	    	html += "<input style='width: 90%' id='reComment_"+cId+"' class='reComment' name='reComment' placeholder='Write reply...'>";
	        html += "<button type='button' class='btn btn-primary mx-2 reCommentSubmit'>Add</button>";
    	}
    	_this.siblings(".reCommentDiv").html(html);
    })
    .fail(function() {
    	console.log("fail");
    })
});