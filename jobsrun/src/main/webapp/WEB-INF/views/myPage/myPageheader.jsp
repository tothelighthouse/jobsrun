<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<script src="<c:url value='/resources/js/main.js'/>"></script>

<link rel="stylesheet"  href="<c:url value='/resources/css/myPage/myPageheader.css'/>" >
</head>
	<div class="myPageNav">
		<ul>
			<li><a href="<c:url value='/member/memberinfoForm/${sessionScope.member.id }'/>">회원정보보기</a></li>
			<li><a href="<c:url value='/member/membersecurityForm/${sessionScope.member.id }'/>">보안</a></li>
			<li><a href="<c:url value='/ratings/rateList/${sessionScope.member.id }'/> ">평가내역보기</a></li>
			<li><a href="<c:url value='/DebitCredit/history/${sessionScope.member.id }'/> ">포인트내역</a></li>
		</ul>
	</div>

