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
<script type="text/javascript">
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
			document.joinform.chk_msg.value = "ok"

		}

	}

	function input_chk() {

		if (document.joinform.memberId.value == "") {
			alert("아이디를 입력하세요");
		} else if (document.joinform.pwd.value == "") {
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
			<form action="m_join_insert" method="post" name="joinform">
				<table style="margin-left: auto; margin-right: auto;">
					<tr>
						<td align="right" colspan="2"><a href="/mobile"><img class="m_btn" alt=""
								src="${pageContext.request.contextPath}/resources/image/icon_back_32_32_wh.png"></a></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" class="m_input" name="memberId"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" class="m_input" name="pwd"></td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td><input type="password" class="m_input"  onblur="pwd_check(this)"><br> <input type="text"
							class="m_input" name="chk_msg" readonly="readonly"
							style="border: none; margin: 0px; background-color: white; font-size:12px; height: 13px;"></td>
					</tr>
					<tr>
						<td>이름</td>

						<td><input type="text" class="m_input" name="name"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" class="m_input" name="phone" onKeyup="inputPhoneNumber(this);"></td>
					</tr>
					<tr>
						<td>e-mail</td>
						<td><input type="email" class="m_input" name="email"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="image"
							src="${pageContext.request.contextPath}/resources/image/join_insert_btn.png" onclick="input_chk()"></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
</body>
</html>