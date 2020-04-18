<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">
<link rel="stylesheet" href="<c:url value='/resources/css/admin/table.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/admin/adminButton.css'/>">
<script src="<c:url value='/resources/js/main.js'/>"></script>
</head>

<div class="container">
	<%@ include file="../main/header.jsp"%>
	<!-- 페이지 이동 버튼 -->
	<div class="body">
		<h3>회원관리</h3>
		<div>
			<button class="button button2"><a href="<c:url value='/WEB-INF/views/admin/adminMember.jsp' />" >회원관리</a></button>
			<button class="button button3"><a href="<c:url value='' />">의뢰자게시물</a></button>
			<button class="button button5"><a href="<c:url value='' />">해결사게시물</a></button>
			
		</div>
		<div>
			<div class="searchright">
				<div class="search">
					<input type="text" placeholder="아이디를 입력해주세요.">

					<button>검색</button>

				</div>

			</div>
		</div>

<!-- 회원테이블 -->

		<div id="table">
			<div class="row">
				<span class="cell col1">회원번호</span> <span class="cell col2">아이디</span>
				<span class="cell col3">이름</span> <span class="cell col4">평점</span>
				<span class="cell col5">포인트 보유내역</span> <span class="cell col6">가입일</span>
				<span class="cell col7">비고</span>
			</div>
			<div class="row">

				<span class="cell col1">열 2-1</span> <span class="cell col2">열
					2-2</span> <span class="cell col3">열 2-3</span> <span class="cell col4">열
					2-4</span> <span class="cell col5">열 2-5</span> <span class="cell col6">열
					2-6</span> <span class="cell col7"><button>수정</button>
					<button>삭제</button></span>

			</div>
			<div class="row">
				<span class="cell col1">열 2-1</span> <span class="cell col2">열
					2-2</span> <span class="cell col3">열 2-3</span> <span class="cell col4">열
					2-4</span> <span class="cell col5">열 2-5</span> <span class="cell col6">열
					2-6</span> <span class="cell col7"><button>수정</button>
					<button>삭제</button></span>

			</div>
			<div class="row">
				<span class="cell col1">열 2-1</span> <span class="cell col2">열
					2-2</span> <span class="cell col3">열 2-3</span> <span class="cell col4">열
					2-4</span> <span class="cell col5">열 2-5</span> <span class="cell col6">열
					2-6</span> <span class="cell col7"><button>수정</button>
					<button>삭제</button></span>

			</div>
			<div class="row">
				<span class="cell col1">열 2-1</span> <span class="cell col2">열
					2-2</span> <span class="cell col3">열 2-3</span> <span class="cell col4">열
					2-4</span> <span class="cell col5">열 2-5</span> <span class="cell col6">열
					2-6</span> <span class="cell col7"><button>수정</button>
					<button>삭제</button></span>

			</div>
			<div class="row">
				<span class="cell col1">열 2-1</span> <span class="cell col2">열
					2-2</span> <span class="cell col3">열 2-3</span> <span class="cell col4">열
					2-4</span> <span class="cell col5">열 2-5</span> <span class="cell col6">열
					2-6</span> <span class="cell col7"><button>수정</button>
					<button>삭제</button></span>

			</div>
			<div class="row">
				<span class="cell col1">열 2-1</span> <span class="cell col2">열
					2-2</span> <span class="cell col3">열 2-3</span> <span class="cell col4">열
					2-4</span> <span class="cell col5">열 2-5</span> <span class="cell col6">열
					2-6</span> <span class="cell col7"><button>수정</button>
					<button>삭제</button></span>

			</div>
			<div class="row">
				<span class="cell col1">열 2-1</span> <span class="cell col2">열
					2-2</span> <span class="cell col3">열 2-3</span> <span class="cell col4">열
					2-4</span> <span class="cell col5">열 2-5</span> <span class="cell col6">열
					2-6</span> <span class="cell col7"><button>수정</button>
					<button>삭제</button></span>



			</div>
			<div class="row">
				<span class="cell col1">열 2-1</span> <span class="cell col2">열
					2-2</span> <span class="cell col3">열 2-3</span> <span class="cell col4">열
					2-4</span> <span class="cell col5">열 2-5</span> <span class="cell col6">열
					2-6</span> <span class="cell col7"><button>수정</button>
					<button>삭제</button></span>



			</div>
			<div class="row">
				<span class="cell col1">열 2-1</span> <span class="cell col2">열
					2-2</span> <span class="cell col3">열 2-3</span> <span class="cell col4">열
					2-4</span> <span class="cell col5">열 2-5</span> <span class="cell col6">열
					2-6</span> <span class="cell col7"><button>수정</button>
					<button>삭제</button></span>



			</div>
			<div class="row">
				<span class="cell col1">열 2-1</span> <span class="cell col2">열
					2-2</span> <span class="cell col3">열 2-3</span> <span class="cell col4">열
					2-4</span> <span class="cell col5">열 2-5</span> <span class="cell col6">열
					2-6</span> <span class="cell col7"><button>수정</button>
					<button>삭제</button></span>


			</div>
			<!-- end .body -->

			<%@ include file="../main/footer.jsp"%>
		</div>
		</body>
</html> --%>