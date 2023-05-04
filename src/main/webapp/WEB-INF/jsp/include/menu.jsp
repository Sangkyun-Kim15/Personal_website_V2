<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <!-- jstl c tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- get_context_path.js file -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/include/get_context_path.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/aLink.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/menuBar.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<div id="nav">
			<ul>
				<c:choose>
					<c:when test="${empty sessionScope.username}">
						<li><a href="<%=request.getContextPath() %>/board/select.do">Home</a></li>
						<li><a href="<%=request.getContextPath() %>/account/loginForm.do">Login Test</a></li>
					</c:when>
					<c:otherwise>
						<%
							String role = (String) session.getAttribute("role");
							
							if(role.equals("ADMIN")) {
						%>
							<li><a href="<%=request.getContextPath() %>/board/select.do">Home</a></li>
							<li><a href="<%=request.getContextPath() %>/account/logout.do?username=${sessionScope.username}">Logout Test</a></li>
							<li><a href="<%=request.getContextPath() %>/account/accountSelectPaging.do">Admin</a></li>
						
						<%
							} else {
						%>
							<li><a href="<%=request.getContextPath() %>/board/select.do">Home</a></li>
							<li><a href="<%=request.getContextPath() %>/account/logout.do?username=${sessionScope.username}">Logout Test</a></li>
						<%
							}
						%>
					</c:otherwise>
				</c:choose>	
			</ul>
		</div>
	</nav>
</body>
</html>