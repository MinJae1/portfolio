<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.m_input {
	border: 2px solid #f7941e;
	height: 30px;
	width: 225px;
	border-radius: 3.5px;
}
</style>
<script type="text/javaScript">
	function actionLogin() {

		if (document.loginForm.memberId.value == "") {
			alert("아이디를 입력하세요");
		} else if (document.loginForm.pwd.value == "") {
			alert("비밀번호를 입력하세요");
		}
	}
</script>

<meta charset="utf-8">
<title>mobile</title>
</head>
<body>
	<div style="text-align: center;">
		<div>
			<img alt="logo" src="${pageContext.request.contextPath}/resources/image/logo_1.png">
		</div>
		<div>
			<form action="m_login" method="post" name="loginForm">
				<table style="margin-left: auto; margin-right: auto;">
					<tr>
						<td>아이디</td>
						<td><input type="text" class="m_input" name="memberId"></td>
						<td rowspan="2" width="67.5px"><input type="image" onclick="actionLogin()"
							src="${pageContext.request.contextPath}/resources/image/login_btn_75 80.png"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" class="m_input" name="pwd"></td>
					</tr>
				</table>
			</form>
		</div>
		<div>
			<a href="/m_join"><img class="m_btn" alt=""
				src="${pageContext.request.contextPath}/resources/image/join_btn.png"></a>
		</div>
	</div>
</body>
</html>