<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./HeaderFooter/Header.jsp"%>

<!DOCTYPE html>
<html lang="ko">

<head>


	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>signup_2</title>
	<link rel="stylesheet" href="./css/SignUp.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
		
	<script type="text/javascript">
		function CheckSignup(Join) {
			if (login.name.value == "") {
				alert("이름을 입력하세요!");
			} else if (login.nickname.value == "") {
				alert("별명을 입력하세요!");
			} else if (login.id.value == "") {
				alert("아이디를 입력하세요!");
			} else if (login.password.value == "") {
				alert("비밀번호를 입력하세요!");
			} else if (login.password_check.value == "") {
				alert("비밀번호 확인을 입력하세요!");
			} else if (login.phone.value == "") {
				alert("전화번호를 입력하세요!");
			} else if (login.password.value != login.password_check.value) {
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			} else {
				Join.action = "./SignUp3.jsp";
				Join.submit();
			}
		}

		// ID 중복 검사 함수.(DB 필요)
		//         function checkid(){
		// 	var userid = document.getElementById("uid").value;
		// 	if(userid)  //userid로 받음
		// 	{
		// 		url = "check.jsp?userid="+userid;
		// 		window.open(url,"chkid","width=400,height=200");
		// 	}
		// }
	</script>
</head>

<body>
<section style="margin: 0 15% 15% 15%">
	<div class="signup_title">회원가입</div>
	<div class="step_title">
		<p>1 약관동의</p>
		<p class="step_point_2">2 정보입력</p>
		<p>3 가입 완료</p>
	</div>
	<hr style="margin-top: 0px">
	<div class="step_ments_1">
		<p class="step_ment_1">회원 정보를 정확히 입력해주세요.</p>
		<p class="step_ment_1">모두 입력하셔야 가입할 수 있습니다.</p>
		<p class="step_ment_1">안 될 시 1:1 문의에 문의해주시길 바랍니다.</p>
	</div>
	<hr>
	<div class="essential_ments">
		<span style="color: red">*</span>필수 입력 정보입니다.
	</div>

	<form name="login" method="post" action="../Page/SignUp2.do"
		class="form_style" onsubmit="CheckSignup(this)">
		<div class="input_style">
			이름&nbsp;<span style="color: red">*</span> <input class="input_body"
				size=50 maxlength="20" type="text" name="name" placeholder="이름"
				id="namechk" />
		</div>

		<div class="input_style">
			별명&nbsp;<span style="color: red">*</span> <input class="input_body"
				size=50 maxlength="20" type="text" name="nickname" placeholder="별명" />
			<input type="button" id="check_button" value="별명 중복 검사"
				onclick="checkid();">
			</p>
		</div>

		<div class="input_style">
			아이디&nbsp;<span style="color: red">*</span> <input class="input_body"
				size=50 maxlength="20" type="id" name="id"
				placeholder="아이디(중복체크 확인)" />
			<!-- ---------------------------DB 관련된 ID 중복 체크 검사 ----------------------- -->
			<input type="button" id="check_button" value="ID 중복 검사"
				onclick="checkid();">
			</p>
			<!-- ---------------------------DB 관련된 ID 중복 체크 검사 ----------------------- -->
		</div>

		<div class="input_style">
			비밀번호&nbsp;<span style="color: red">*</span><input class="input_body"
				size=50 maxlength="16" type="password" name="password"
				placeholder="비밀번호(8~16자의 영문, 숫자, 특수기호)" />
		</div>

		<div class="input_style">
			비밀번호 확인&nbsp;<span style="color: red">*</span> <input
				class="input_body" size=50 maxlength="16" type="password"
				name="password_check" placeholder="비밀번호 확인" />
		</div>
		<div class="input_style">
			이메일 <input class="input_body" size=50 maxlength="20" type="email"
				name="e-mail" placeholder="이메일" />
		</div>
		<div class="input_style">
			휴대전화&nbsp;<span style="color: red">*</span> <input class="input_body"
				size=50 maxlength="13" type="text" name="phone" placeholder="번호" />
		</div>
		<button type="submit" class="next_btn" style="width: 100%">가입하기</button>
	</form>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
	
	</section>
	
	<%@ include file="./HeaderFooter/Footer.jsp"%>

</body>

</html>