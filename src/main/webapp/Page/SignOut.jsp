<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/PersonalInformation.css">
</head>
<body>
	<%
	int idx = (int) session.getAttribute("Idx");
	%>

	<form name="SignOut" action="../Page/SignOut.do" method="post">
		<div class="SignOutModal">

			<p class="confirmSignOutA">정말 탈퇴하시겠습니까?</p>
			<p class="confirmSignOutB">비밀번호를 입력해주세요.</p>

			<input type="password" name="user_passwd">

			<button type="submit" onclick="SignOutbtn()"
				class="SignoutBtn">탈퇴하기</button>
	</form>
</body>
 <script type="text/javascript">
    function SignOutbtn() {
      var p1 = document.getElementById('').value;
      var p2 = document.getElementById('password2').value;
      if( p1 != p2 ) {
        alert("비밀번호가 일치 하지 않습니다");
        return false;
      } else{
        alert("비밀번호가 일치합니다");
        return true;
      }

    }
  </script>



</html>