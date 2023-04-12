<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 id="modal-title" class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<input class="form-control" id="cId" type="hidden">
					<table class="table">
						<tr>
							<td>User</td>
							<td><input class="form-control" id="userName" type="text" value="${sessionScope.username}" readonly="readonly"></td>
						</tr>
						<tr>
							<td>Content</td>
							<td><textarea class="form-control" id="content" rows="10"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button id="modalSubmit" type="button" class="btn btn-success">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>