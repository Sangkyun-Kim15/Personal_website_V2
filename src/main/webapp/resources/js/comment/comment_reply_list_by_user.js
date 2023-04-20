function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	
	return contextPath;
}

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
			html += "<h3>board<h3/>";
			 
			response.forEach(function(board) {
				if(board.isDeleted == 'N') {
					postNum++;
					html += "<div>";
					html += 	"<a href='"+ getContextPath() +"/board/detail.do?boardNo="+ board.boardNo +"' target='_blank'><h5 style='display: inline'>" + board.title +"</h5></a>";
					html += 	"<span style='float:right;' align='right'> " + board.regDate + " </span>";
					html += "</div>";
				} else {
					html += "<div>";
					html += 	"<h5 style='display: inline'>" + board.title +"</h5>";
					html += 	"<span style='float:right;' align='right'> " + board.regDate + " </span>";
					html += "</div>";
				}
				totalNum++;
			});
			html += 	"<h2> " + "Total : " + totalNum + " </h2>";
			html += 	"<h2> " + "Post : " + postNum + " </h2>";
			html += 	"<hr>";
			$('#boardListByUser').html(html);
		});
	 	/*
	 	 * add total and post num
	 	 * */
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
			 html += "<h3>comment<h3/>";
			 // use if statement
			 response.forEach(function(comment) {
				 totalNum++;
				 html += "<div>";
				 html += 	"<input type='hidden' id='comment_cId' value='" + comment.cId + "'>";
			     html += 	"<input type='hidden' id='curr_page' value='boardListByUser'>";
			     html += 	"<h5 style='display: inline'>" + comment.content +"</h5>";
			     if(comment.isDeleted == "N") {
			    	postNum++;
				 	html += 	"<span style='cursor: pointer; color: blue' class='commentDel'>Delete </span>";
				 }
				 html += 	"<span style='float:right;' align='right'> " + comment.createdDate + " </span>";
				 html += "</div>";
			 });
			 html += 	"<span> " + "Total : " + totalNum + " </span>";
			 html += 	"<span> " + "Post : " + postNum + " </span>";
			 $('#comListByUser').html(html);
		 });
	  });
}