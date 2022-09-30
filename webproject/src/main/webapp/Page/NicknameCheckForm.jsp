<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("UTF-8");
Integer result = (Integer) session.getAttribute("result");
%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="user_id" value="${param.user_id}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>
<link rel="stylesheet" href="./css/SignUp.css">
</head>
<body>

	<div style="text-align: center; margin: 10vw">
		<b><font size="4" color="gray">별명 중복 확인</font></b> <br>

		<form name="login" method="post" action="../Page/NicknameCheckForm.do"
			onsubmit="return handle_form_submission()">
			<div class="input_style">
				<div class="btn-input">
					<input type="text" id="id" class="input_body" size=30
						maxlength="20" name="nickname" placeholder="별명(중복 확인은 필수입니다.)" />
					<input type="submit" id="check_button"
						value="별명 중복 검사" onclick=" idCheck()" />
				</div>
			</div>
		</form>
		<hr>
		<div id="idError" class="error"></div>
		<span style="color: blue; font-size: 1.2em;"> <%=request.getAttribute("Msg") == null ? "" : request.getAttribute("Msg")%>
			<br> <input type="button" onclick="sendCheckValue()"
			value="사용하기" class="btnSignUp" /> <input type="hidden" id="nickname"
			name="useId" value=<%=request.getAttribute("UseMsg")%> />

			<hr> <input type="button" onclick="window.close()" value="창 닫기"
			class="btnSignUp" />
	</div>
</body>




<script type="text/javascript">

function sendCheckValue(){

	
    opener.document.getElementById("nickname").value = document.getElementById("nickname").value
    window.close(); 
}
</script>