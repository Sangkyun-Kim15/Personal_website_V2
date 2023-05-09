<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
video {
	position: fixed;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto%;
	z-index: -100;
	background-size: cover;
}

#content {
	padding: 350px 90px;
}

#title {
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	font-size: 60px;
	letter-spacing: -1px;
	color: white;
	line-height: 30px;
	margin: 0px 0px 30px;
	text-transform: uppercase;
}

a:link {
	background-color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 100;
	font-size: 20px;
	color: black;
	letter-spacing: 1px;
	text-transform: uppercase;
	text-decoration-line: none;
	border-radius: 10px;
	padding-bottom: 5px;
	padding-top: 5px;
}

a:visited {
	background-color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 100;
	font-size: 20px;
	letter-spacing: 1px;
	color: black;
	text-transform: uppercase;
	text-decoration-line: none;
	border-radius: 10px;
	padding-bottom: 5px;
	padding-top: 5px;
}

a:active {
	background-color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 100;
	font-size: 20px;
	letter-spacing: 1px;
	color: black;
	text-transform: uppercase;
	text-decoration-line: none;
	border-radius: 10px;
	padding-bottom: 5px;
	padding-top: 5px;
}

a:hover {
	background-color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 100;
	font-size: 20px;
	color: black;
	letter-spacing: 1px;
	text-transform: uppercase;
	text-decoration-line: none;
	border-radius: 10px;
	padding-bottom: 5px;
	padding-top: 5px;
}


</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
</head>
<body>
	<video
		src="file:/video/main/coverr-golden-gate-bridge-at-sunset-5420-original.mp4"
		muted autoplay loop></video>
	<div id="content">
		<h2 id="title">Sangkyun's portfolio</h2>
		<a href="<%=request.getContextPath()%>/main.do">&nbsp;&nbsp;&nbsp;visit&nbsp;&nbsp;&nbsp;</a><br />
	</div>
</body>
</html>