<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
	String type = request.getParameter("type");
	String url = "";
	if(type.equals("account")) {
		url += "/account/accountSelectPaging.do";
	} else if(type.equals("board")) {
		url += "/board/select.do";
	}
	%>
	<div class="search_wrap">
			<div class="search_area">
				<form method="post" action="<%=request.getContextPath()%><%=url %>">
					<input type="text" name="keyword" value="${paging.cri.keyword}">
					<button type="submit">Search</button>
				</form>
			</div>
		</div>
</body>
</html>