$(document).on("click", "#modalSubmit", function() {
		const user = $("#userName").val();
		const content = $("#content").val();
		const cId = $("#cId").val();
		
		const bId = document.getElementById("comment_bId").value;
		const pageNum = document.getElementById("pageNum").value;
		const amount = document.getElementById("amount").value;
		const keyword = document.getElementById("keyword").value;

		$.ajax({
            url: "../comment/commentUpdate.json",
	        dataType: "json",
            data: {"cId": cId, "content": content, "user": user},
        })
        .done(function() {
        	let html = "";
        	console.log("success");
        })
        .fail(function() {
        	console.log("fail");
        })
        .always(function() {
        	console.log("always");
        	let url = "../board/select.do?boardNo="+bId+"&pageNum="+pageNum+"&amount="+amount+"&keyword="+keyword;
        	console.log(url);
        	location.replace(url);
        })
	});

//send data to comment update modal
$(document).on("click", ".commentMod", function() {
	// comment update form
	const _this = $(this);
	const cId =  $(this).siblings('#comment_cId').val();
	const comment_text = $(this).siblings('.comment_container').children('h5').text();
	const comment_user = $(this).siblings('b').text();
	
	$("#userName").val(comment_user);
	$("#content").val(comment_text);
	$("#cId").val(cId);
});