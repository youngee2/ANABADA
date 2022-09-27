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
<title>UpdatePersonalInfomation</title>
<link rel="stylesheet" href="./css/PersonalInformation.css">

</head>

<body>
	<section class="Personalinfo">
		<h1 class="personalA-title">회원정보</h1>
		<hr class="personal-lineA">
		<h3 class="personalB-subtitle">회원 정보 변경</h3>


		<%
		request.setCharacterEncoding("UTF-8");
		String user_id = (String) session.getAttribute("UserId");

		if (user_id == null) {
			out.println("<script>alert('로그인 후 사용주세요.'); location.href='tradeListPage.do';</script>");
		}
		%>

		<table class="PersonalC-table">

			<form name="UpdateInfo" method="post" action="../Page/UpdateInfo.do">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="${dto.name}"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="nickname"
						value="${ dto.nickname}"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="user_id" value="${ dto.user_id}"
						readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="user_passwd"
						value="${ dto.user_passwd}"></td>
				</tr>
				<tr>
					<th>이메일 주소</th>
					<td><input type="text" name="email" value="${ dto.email}"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone_num"
						value="${ dto.phone_num}"></td>
				</tr>
				<tr>
					<th>프로필 사진</th>
					<td><input type="text" name="user_picture"
						value="${ dto.user_picture}"></td>
		</table>

		<button type="submit">수정하기</button>

		</form>


		<hr class="personal-lineB">
	</section>

	<%@ include file="./HeaderFooter/Footer.jsp"%>