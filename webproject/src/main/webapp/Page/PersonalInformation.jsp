<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./LoginSession/Header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PersonalInfomation</title>
<link rel="stylesheet" href="./css/PersonalInformation.css">

</head>

<body>
	<section class="Personalinfo">
		<h1 class="personalA-title">회원정보</h1>
		<hr class="personal-lineA">
		<h3 class="personalB-subtitle">회원 정보 변경</h3>

		<%
		String user_id = (String) session.getAttribute("UserId");
		String nickname = (String) session.getAttribute("Nickname");
		int idx = (int) session.getAttribute("Idx");
		%>

		<table class="PersonalC-table">
			<tr>
				<th>이름</th>
				<td>${ dto.name }</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${ dto.nickname}</td>
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
		</table>


		<div class="updateInfo">
			<a href="../Page/UpdateInfo.do">정보 수정</a>
		</div>

		<h3 class="personalB-subtitle">회원 탈퇴</h3>
		<hr class="personal-lineB">
		<div class="PersonalE-SignOut">
			<h3 class="btn SignOutBtn"><a href="./SignOut.jsp" >탈퇴하기</a></h3>

			<script>
				
			</script>
		</div>
		</div>
		<hr class="personal-lineB">
	</section>

	<script>
		var modals = document.getElementsByClassName("modal");
		var btns = document.getElementsByClassName("btn");
		var spanes = document.getElementsByClassName("close");
		var funcs = [];

		function Modal(num) {
			return function() {
				btns[num].onclick = function() {
					modals[num].style.display = "block";
					console.log(num);
				};

				spanes[num].onclick = function() {
					modals[num].style.display = "none";
				};
			};
		}

		for (var i = 0; i < btns.length; i++) {
			funcs[i] = Modal(i);
		}

		for (var j = 0; j < btns.length; j++) {
			funcs[j]();
		}

		window.onclick = function(event) {
			if (event.target.className == "modal") {
				event.target.style.display = "none";
			}
		};
	</script>
	<script>
		var modals = document.getElementsByClassName("modal");
		var btns = document.getElementsByClassName("btn");
		var spanes = document.getElementsByClassName("close");
		var funcs = [];

		function Modal(num) {
			return function() {
				btns[num].onclick = function() {
					modals[num].style.display = "block";
					console.log(num);
				};

				spanes[num].onclick = function() {
					modals[num].style.display = "none";
				};
			};
		}

		for (var i = 0; i < btns.length; i++) {
			funcs[i] = Modal(i);
		}

		for (var j = 0; j < btns.length; j++) {
			funcs[j]();
		}

		window.onclick = function(event) {
			if (event.target.className == "modal") {
				event.target.style.display = "none";
			}
		};
	</script>
	<%@ include file="./HeaderFooter/Footer.jsp"%>