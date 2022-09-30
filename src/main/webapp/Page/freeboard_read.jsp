<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Page/Header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/Freeboard_style.css">
<meta charset="UTF-8">
<title>자유게시판 보기</title>
</head>



<body style="margin:0;">
	<section style="margin: 0% 15% 15% 15%">
		<div>
			<p class="free_title_mini">자유게시판</p>
		</div>
		<hr style="color: #4C6D81; height: 4px; margin-bottom: 0px;">
		<div class="top_list">
			<table class="table_freeboard">
				<tr>
					<th>제목</th>
					<td>${dto.free_title}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${dto.nickname}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${dto.free_date}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${dto.free_count}</td>
				</tr>
			</table>
		</div>

		<div style="text-align: center;">
			<p class="freeboard_content">${dto.free_contents}</p>
		</div>

		<hr style="margin-top: 20%; border: 1px solid #d3d3d3;">
		<div class="btn_list">
			<button class="list_move_btn" type="button"
				onclick="location.href='../Page/freeListPage.do' ">목록</button>
		</div>
		<form name="writeFrm">
		<input type="hidden" name="num" value="${dto.free_num}" />
	<!-- 
			<button class="list_move_btn" type="button"
				onclick="location.href='../Page/freeBoard.do' ">수정</button>
			<button class="list_move_btn" type="button"
				onclick="location.href='../Page/freeBoard.do' ">삭제</button>
 -->
		</form>

		<!-- <form action="for.jsp" method="post">
        <input type="text"  size= 50 maxlength="10" placeholder="댓글을 입력하세요.">
        <input id ="comment_input_btn" type="submit" /> 
    </form> -->




		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous">
			
		</script>
	</section>
	<%@ include file="./HeaderFooter/Footer.jsp"%>

</body>

</html>

