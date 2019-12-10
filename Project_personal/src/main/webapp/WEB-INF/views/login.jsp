<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<%@include file="script.jsp"%>

<OBJECT ID="GPKISecureWeb"
	CLASSID="CLSID:C8223F3A-1420-4245-88F2-D874FC081572"> </OBJECT>
<title>로그인</title>
<script type="text/javaScript" language="javascript">
	function actionLogin() {

		if (document.loginForm.userId.value == "") {
			alert("아이디를 입력하세요");
		} else if (document.loginForm.pwd.value == "") {
			alert("비밀번호를 입력하세요");
		}
	}
</script>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<b>로그인</b>
		</div>
		<!-- login-logo -->
		<form name="loginForm" action="login" method="post">
			<div class="login-box-body">
				<p class="login-box-msg"></p>
				<div class="form-group has-feedback">
					<input type="text" name="userId" id="userId" class="form-control"
						placeholder="아이디"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="pwd" id="pwd" class="form-control"
						placeholder="비밀번호"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<button type="submit" class="btn btn-primary btn-block btn-flat"
					onclick="actionLogin()">로그인</button>
				<div class="row">
					<p></p>
					<div class="col-xs-6">
						<div class="checkbox">
							<label> <input type="checkbox" name="checkId"
								id="checkId" onClick="javascript:saveid(document.loginForm);" />
								&nbsp;&nbsp;ID저장
							</label> 
						</div>
					</div>
				</div>

				<!-- /.col -->
				<div class="row">
					<a href="joinpage" onClick="goSignUp();"
						class="btn btn-block check2">회원가입</a> <a href="#LINK"
						onClick="goFindId();" class="btn btn-block check2">아이디/비밀번호찾기</a>
				</div>
				<!-- /.col -->
			</div>
		</form>
	</div>
	<!-- login-box-body -->

	<!-- REQUIRED JS SCRIPTS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
