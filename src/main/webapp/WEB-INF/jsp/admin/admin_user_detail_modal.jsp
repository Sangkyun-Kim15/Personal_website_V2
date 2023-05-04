<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- comment.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comment/comment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comment/comment_reply_list_by_user.js"></script>
<!-- get_context_path.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/include/get_context_path.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	commentReplyListByUser();
});
</script>
</head>
<body>
	<div id="userDetailModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 id="modal-title" class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<h4>Board</h4>
					<div id="boardListByUser" style="overflow: scroll; height: 320px"></div>
					<div id="boardTotal"></div>
					<h4>Comment</h4>
					<div id="comListByUser" style="overflow: scroll; height: 320px"></div>
					<div id="commentTotal"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>