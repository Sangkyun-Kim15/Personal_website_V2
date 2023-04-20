<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

// js 파일에 넣어서 실행하면 post 400 오류 남  
$(document).ready(function() {
	$("#log").click(function() {
		$.ajax({
			type: "POST",
		    url:"<%=request.getContextPath()%>/account/check.do",
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
</script>
</head>
<body>
	<div class="login">
		<form  id="lform" method="post" action="<%=request.getContextPath() %>/account/login.do">
	    	<input type="text" name="username" id="username" placeholder="username" required="required" />
	        <input type="password" name="password" id="password" placeholder="Password" required="required" />
	        <input type="button" value="Enter" id="log" class="btn btn-primary btn-block btn-large"></input>
	    </form>
	</div>
</body>
</html>