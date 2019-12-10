<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="m_login" method="post" name="loginForm">
	<c:choose>
		<c:when test="${user.id !=null}">
			:: ${user.name}님 반갑습니다. &nbsp;
			<a href="m_logout">logout</a>

		</c:when>
		<c:otherwise>
			:: Login &nbsp;
			<input type="hidden" name="action" value="login">
			<label>아이디</label>
			<input type="text" class="m_input" name="memberId">&nbsp;
			<label>비밀번호</label>
			<input type="password" class="m_input" name="pwd">
			<input type="image" onclick="actionLogin()" style="display: inline-block;"
				src="${pageContext.request.contextPath}/resources/image/login_btn_100 30.png">
			<a href="/m_join"><img class="m_btn" alt=""
				src="${pageContext.request.contextPath}/resources/image/join_btn_100 30.png"></a>
		</c:otherwise>
	</c:choose>

</form>
