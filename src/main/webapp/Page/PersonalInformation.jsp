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
<link rel="stylesheet" href="./css/PersonalInformation.css">



<script>
	// Modal을 가져옵니다.
	var modals = document.getElementsByClassName("modal");
	// Modal을 띄우는 클래스 이름을 가져옵니다.
	var btns = document.getElementsByClassName("btn");
	// Modal을 닫는 close 클래스를 가져옵니다.
	var spanes = document.getElementsByClassName("close");
	var funcs = [];

	// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
	function Modal(num) {
		return function() {
			// 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
			btns[num].onclick = function() {
				modals[num].style.display = "block";
				console.log(num);
			};

			// <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
			spanes[num].onclick = function() {
				modals[num].style.display = "none";
			};
		};
	}

	// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
	for (var i = 0; i < btns.length; i++) {
		funcs[i] = Modal(i);
	}

	// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
	for (var j = 0; j < btns.length; j++) {
		funcs[j]();
	}

	// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
	window.onclick = function(event) {
		if (event.target.className == "modal") {
			event.target.style.display = "none";
		}
	};
</script>
</head>

<body>
	<section class="Personalinfo">
		<h1 class="personalA-title">회원정보</h1>
		<hr class="personal-lineA">
		<h3 class="personalB-subtitle">회원 정보 변경</h3>
		<table class="PersonalC-table">
			<tr>
				<th>이름</th>
				<td>${ dto.name }</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${ dto.nickname }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${ dto.user_id }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>${ dto.user_passwd }</td>
			</tr>
			<tr>
				<th>이메일 주소</th>
				<td>${ dto.email }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${ dto.phone_num }</td>
			</tr>
			<tr>
				<th>프로필 사진</th>
				<td></td>
			</tr>
		</table>

		<h3 class="personalB-subtitle">회원 탈퇴</h3>
		<hr class="personal-lineB">
		<div class="PersonalE-SignOut">
			<h3 class="btn SignOutBtn">탈퇴하기</h3>

			<div class="modal">
				<form name="SignOut" action="" method="get">
					<div class="SignOutModal">
						<span class="close">&times;</span>
						<p class="confirmSignOutA">정말 탈퇴하시겠습니까?</p>
						<p class="confirmSignOutB">비밀번호를 입력해주세요.</p>
						<input type="password" required />
						<button onclick="javascript:SignOutbtn()" class="SignoutBtn">
							탈퇴하기</button>
					</div>
				</form>
			</div>
		</div>
		<hr class="personal-lineB">
	</section>


	<%@ include file="./HeaderFooter/Footer.jsp"%>