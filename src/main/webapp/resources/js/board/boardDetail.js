// duplicate
function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	
	return contextPath;
}

function boardDetail(input) {
	let data;
	let username;
	let role;
	let pageNum;
	let amount;
	let keyword;
	
	username = document.getElementById("username").value;
	role = document.getElementById("role").value;
	pageNum = document.getElementById("pageNum").value;
	amount = document.getElementById("amount").value;
	keyword = document.getElementById("keyword").value;
	
	console.log("username??? : " + username);
	if(input == null || input == "-1") {
		data = document.getElementById("boardNo").value;
	} else {
		data = input;
	}
	
	$.ajax({
		type: "get",
		url: "../board/detail.json",
		dataType: "json",
		data: {
				"boardNo": `${data}`
			  }
	})
	.done(function(response) {
		let html = "";
		
		html += "<div>";
		html += 	"<table class = 'table'>";
		html += 		"<tr>";
		html += 			"<th>NO</th>";
		html += 			"<td>"+ response.boardNo +"</td>";
		html += 			"<th>Writer</th>";
		html += 			"<td>"+ response.writer +"</td>";
		html += 			"<th>Title</th>";
		html += 			"<td>"+ response.title +"</td>";
		html += 			"<th>Date</th>";
		html += 			"<td>"+ response.regDate +"</td>";
		html += 		"</tr>";
		html += 		"<tr>";
		html += 			"<th>Content</th>";
		html += 			"<td>"+ response.content +"</td>";
		html += 		"</tr>";
		html += 	"</table>";
		html += "</div>";
		
		if(username == response.writer || role == "ADMIN") {
			html += "<a href=" + getContextPath() + "/board/updateForm.do?boardNo="+ data +"&pageNum=" + pageNum +"&amount=" + amount +"&keyword=" + keyword +">Update</a>";
			html += "<a href=" + getContextPath() + "/board/delete.do?boardNo="+ data +"&pageNum=" + pageNum +"&amount=" + amount +"&keyword=" + keyword +">Delete</a>";
			
		}
		// need to edit
			if(username != null) {
				html += "<form method='post' action='"+ getContextPath() +"/comment/insert.do'>";
				html += 	"<input type='hidden' name='bId' value='"+ data + "'class='form-control'/>";
				html += 	"<input type='hidden' name='pageNum' value='"+ pageNum + "'class='form-control'/>";
				html += 	"<input type='hidden' name='amount' value='"+ amount + "'class='form-control'/>";
				html += 	"<input type='hidden' name='keyword' value='"+ keyword + "'class='form-control'/>";
				html += 	"<textarea name='content'></textarea>";
				html += 	"<input type='hidden' name='user' class='form-control' value='"+ username +"'/>";
				html += 	"<button type='submit' class='btn btn-primary' id='cmt_reg_btn'> add</button>";
				html += "</form>";
		}
		
		$("#detail_wrap").html(html);
	});
};

function commentInsert() {
	let bId = document.getElementById("bId").value;
	let pageNum = document.getElementById("pageNum").value;
	let amount = document.getElementById("amount").value;
	let keyword = document.getElementById("keyword").value;
	let content = document.getElementById("content").value;
	let user = document.getElementById("user").value;
	
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
		 console.log("1");
		 let url = "../board/select.do?boardNo="+bId+"&pageNum="+pageNum+"&amount="+amount+"&keyword="+keyword;
		 location.replace(url);
	 })
	 .fail(function() {
		 console.log("2");
		 alert("fail");
		 
	 })
	 .always(function() {
		 console.log("3");
		 alert("always");
		 
	 });
}