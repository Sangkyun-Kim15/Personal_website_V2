$(document).on("click", "#modalSubmit", function() {
		const user = $("#userName").val();
		const content = $("#content").val();
		const cId = $("#cId").val();

		console.log(cId);
		console.log(user);
		console.log(content);
		
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
        	location.reload();
        })
	});

//send data to comment update modal
$(document).on("click", ".commentMod", function() {
	// comment update form
	const _this = $(this);
	const cId =  $(this).siblings('#comment_cId').val();
	const comment_text = $(this).siblings('.comment_container').children('h5').text();
	const comment_user = $(this).siblings('b').text();
	
	console.log(cId);
	console.log(comment_text);
	console.log(comment_user);
	$("#userName").val(comment_user);
	$("#content").val(comment_text);
	$("#cId").val(cId);
	
});