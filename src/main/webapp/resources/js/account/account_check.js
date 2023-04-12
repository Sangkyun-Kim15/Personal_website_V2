$(document).ready(function() {
	$("#log").click(function() {
		$.ajax({
			type: "POST",
		    url:"<%=request.getContextPath()%>/account/select.do",
		    dataType:"json"
		})
		.done(function(response) {
			console.log(response)
			var num = 0;
		    response.forEach(function (item , index ) {
		    	if(item.username == $("#username").val() && item.password == $("#password").val()) {
		    		$("#lform").submit();
		    		num = 1;
		    		return;
		        };
		    });
		    if(num == 0){
		    	alert("Check your id and password");              
		    }
		})
	})
});