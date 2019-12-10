<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#loading-image {
	position: absolute;
	top: 50%;
	width: 100%;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">

<meta charset="utf-8" HTTP-EQUIV="Refresh" CONTENT="4;URL=m_main">
<title></title>
</head>
<body>
	<div>
		<div id="loading-image" class="animated slideInLeft infinite slow" style="text-align: right;">
			<img src="${pageContext.request.contextPath}/resources/image/loading_color.gif" alt="Loading..." />
		</div>
	</div>
</body>
</html>