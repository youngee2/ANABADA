<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<link rel="stylesheet" type="text/css" href="../css/HeaderFooter.css">

	<span style="color: red; font-size: 1.2em;"> <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>
	</span>
	<%
    if (session.getAttribute("UserId") == null) {  // 로그인 상태 확인
        // 로그아웃 상태
    %>
	<script>
		function validateForm(form) {
			if (!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>
	<form action="
	Page/LoginSession/LoginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		<div class="form-group">
			<input type="text" name="user_id" required /><label>ID</label>
		</div>
		<div class="form-group">
			<input type="password" name="user_passwd" required /><label>Password</label>
		</div>
		<input type="checkbox" name="save_check" value="Y" /> 아이디 저장하기
		<div class="GoSignUp">
			<input type="submit" value="Login" class="submit" id="btnLogin">
			<p>
				Not Yet Registered? <a href="../Page/SignUp1.do">Sign Up</a>
			</p>
		</div>
	</form>

<%
    } else { // 로그인된 상태
    %>
	<%= session.getAttribute("userName") %>
	회원님, 로그인하셨습니다.
	<br />
	<a href="Logout.jsp">[로그아웃]</a>
	<%
    }
    %>


	<script>
		function validateForm(form) {
			if (!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>



</body>
</html>