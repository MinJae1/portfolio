<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.m_input {
	border: 2px solid #f7941e;
	height: 30px;
	width: 150px;
	border-radius: 3.5px;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<meta charset="utf-8">
<script type="text/javaScript">
	function actionLogin() {

		if (document.loginForm.memberId.value == "") {
			alert("아이디를 입력하세요");
		} else if (document.loginForm.pwd.value == "") {
			alert("비밀번호를 입력하세요");
		}
	}
</script>
<title>mobile</title>

<style type="text/css">
#loading-image {
	position: absolute;
	top: 45%;
	width: 100%;
	z-index: 5
}

#loading {
	position: absolute;
	background-color: white;
	z-index: 3;
	width: 100vw;
	height: 100vh;
	opacity: 0.75;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	$(window).load(function() {
		setTimeout("$('#loading').hide()", 2250);
	});
</script>

</head>

<body>
	<div id="loading">
		<div id="loading-image" class="animated slideInLeft infinite" style="text-align: right;">
			<img src="${pageContext.request.contextPath}/resources/image/loading_color.gif" alt="Loading..." />
		</div>
	</div>

	<div class="main" style="text-align: center;">
		<img alt="logo" src="${pageContext.request.contextPath}/resources/image/basiclogo.png"> <br>
		<tag:login></tag:login>
		<br> <a href="check_page"><img alt=""
			src="${pageContext.request.contextPath}/resources/image/icon_check.png"></a><a href="rent_page"><img
			alt="" src="${pageContext.request.contextPath}/resources/image/icon_rent.png"></a><a
			href="m_mypage"><img alt=""
			src="${pageContext.request.contextPath}/resources/image/icon_mypage.png"></a> <br>
	</div>
</body>
</html>