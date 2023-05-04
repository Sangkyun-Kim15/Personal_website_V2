function commentReplyListByUser() {
	// Click event handler for data cells
	$('.username').click(function() {
		// Get the data from the clicked data cell
	    var username = $(this).text();
	    
	 	$.ajax({
	 		type: "get",
	 		url: "../board/boardSelectByUser.json",
			dataType: "json",
			data: {"username":username}
	 	})
	 	.done(function(response) {
	 		let html = "";
			let totalNum = 0;
			let postNum = 0;
			response.forEach(function(board) {
				html += "<div>";
				if(board.isDeleted == 'N') {
					postNum++;
					html += "<a href='"+ getContextPath() +"/board/detailAdmin.do?boardNo="+ board.boardNo +"' target='_blank'><h5 style='display: inline'>" + board.title +"</h5></a>";
				} else {
					html += "<h5 style='display: inline'>" + board.title +"</h5>";
				}
				totalNum++;
				html += 	"<span style='float:right;' align='right'> " + board.regDate + " </span>";
				html += "</div>";
			});
			$('#boardListByUser').html(html);
			html = "";
			html += 	"<span> " + "Total : " + totalNum + " </span>";
			html += 	"<span> " + "Post : " + postNum + " </span>";
			$('#boardTotal').html(html);
		});
	 	
	 	$.ajax({
	 		type: "get",
			url: "../comment/commentSelectByUser.json",
			dataType: "json",
			data: {"username":username}
	 	})
	 	.done(function(response) {
	 		let html = "";
			let totalNum = 0;
			let postNum = 0;
			// use if statement
			response.forEach(function(comment) {
				totalNum++;
				html += "<div>";
				html += 	"<input type='hidden' id='comment_from' value='ADMIN'>";
				html += 	"<input type='hidden' id='comment_cId' value='" + comment.cId + "'>";
		        html += 	"<input type='hidden' id='comment_bId' value='" + comment.bId + "'>";
			    html += 	"<input type='hidden' id='curr_page' value='boardListByUser'>";
			    html += 	"<h5 style='display: inline'>" + comment.content +"</h5>";
			    if(comment.isDeleted == "N") {
			    	postNum++;
				 	html += 	"<span style='cursor: pointer; color: blue' class='commentDel'>Delete </span>";
				}
				html += 	"<span style='float:right;' align='right'> " + comment.createdDate + " </span>";
				html += 	"<hr>";
				html += "</div>";
			});
			$('#comListByUser').html(html);
			html = "";
			html += 	"<span> " + "Total : " + totalNum + " </span>";
			html += 	"<span> " + "Post : " + postNum + " </span>";
			$('#commentTotal').html(html);
		});
	 });
}