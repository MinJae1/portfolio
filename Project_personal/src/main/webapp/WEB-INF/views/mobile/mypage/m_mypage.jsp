<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
table.type05 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.type05 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #FFD598;
}

table.type05 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.m_input {
	border: 2px solid #f7941e;
	height: 30px;
	width: 225px;
	border-radius: 3.5px;
}
</style>


<script type="text/javascript">
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
</script>
</head>
<body>
	<table class="type05">
		<tr>
			<td align="right" colspan="2"><a href="back"><img class="m_btn" alt=""
					src="${pageContext.request.contextPath}/resources/image/icon_back_32_32_wh.png"></a></td>
		</tr>

		<tr>
			<th scope="row">아이디</th>
			<td>${user.memberId}</td>
		</tr>
		<tr>
			<th scope="row">비밀번호</th>
			<td><input type="password" class="m_input" name="pwd"></td>
		</tr>
		<tr>
			<th scope="row">비밀번호 확인</th>
			<td><input type="password" class="m_input" onblur="pwd_check(this)"><input
				type="text" class="m_input" name="chk_msg" readonly="readonly"
				style="border: none; margin: 0px; background-color: white; font-size: 12px; height: 13px; width: 115px"></td>
		</tr>
		<tr>
			<th scope="row">이름</th>
			<td>${user.name}</td>
		</tr>
		<tr>
			<th scope="row">이메일</th>
			<td>${user.email}</td>
		</tr>
		<tr>
			<th scope="row">전화번호</th>
			<td>${user.phone}</td>
		</tr>

	</table>
</body>
</html>