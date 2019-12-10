<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@include file="script.jsp"%>

<title>Join</title>
<script>
	function inputPhoneNumber(obj) {

		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 3);
			phone += "-";
			phone += number.substr(6);
		} else {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 4);
			phone += "-";
			phone += number.substr(7);
		}
		obj.value = phone;
	}

	function pwd_check(obj) {

		var pck = obj.value;
		var p_val = document.joinform.pwd.value;

		if (pck != p_val) {
			document.joinform.chk_msg.style.color = "red";
			document.joinform.chk_msg.value = "비밀번호가 틀립니다"

		} else {
			document.joinform.chk_msg.style.color = "green";
			document.joinform.chk_msg.value = "ν"

		}

	}

	function input_chk() {

		if (document.joinform.userId.value == "") {
			alert("아이디를 입력하세요");
		} else if (document.joinform.pwd.value == "") {
			alert("비밀번호를 입력하세요");
		}
	}

	function go_back() {
		location.replace("");
	}
</script>
<style>
th, td {
	padding: 5px;
}
</style>
</head>
<body class="hold-transition login-page">
	<div style="width: 100%; text-align: center;">
		<div style="width: 40%; display: inline-block;">
			<div class="login-logo">
				<b>회원가입</b>
			</div>
			<!-- login-logo -->
			<div class="login-box-body">
				<div style="text-align: right;">
					<button class="btn btn-default btn-block btn-flat"
						onclick="go_back()" style="width: 8%; display: inline-block;">&larr;</button>
				</div>
				<form name="joinform" method="post" action="join">
					<input type="hidden" name="action" value="insert">
					<table>
						<tr>
							<th style="width: 25%">아이디</th>
							<td style="width: 60%"><input class="form-control"
								type="text" name="userId" size="20"></td>
							<td></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="form-control" type="password" name="pwd"
								size="20"></td>
							<td></td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td><input class="form-control"
								type="password" name="pwd_ck" onblur="pwd_check(this)" size="20"></td>
							<td><input type="text"
								readonly="readonly" name="chk_msg" value=""
								style="border: none; margin: 0px; background-color: white; width: 150px"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input class="form-control" type="text" name="name"
								size="20"></td>
							<td></td>

						</tr>
						<tr>
							<th>전화번호</th>
							<td><input class="form-control" type="tel" name="phone"
								onKeyup="inputPhoneNumber(this);" size="20"
								placeholder="123-4567-8901"></td>
							<td></td>
						</tr>
					</table>
					<br> <input class="btn btn-primary btn-block btn-flat"
						type="submit" value="join"
						style="width: 20%; display: inline-block;">
				</form>

			</div>
		</div>
	</div>
</body>
</html>