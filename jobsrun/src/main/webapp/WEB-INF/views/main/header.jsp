<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="<c:url value='/resources/css/main/header.css'/>">
 <link rel="stylesheet"href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap">
 <link rel="stylesheet"href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
 <script src="<c:url value='/resources/js/calculation.js'/>"></script>
 <script src="<c:url value='/resources/js/common.js'/>"></script>	
</head>
<body>
	<div class="header">
      <a href="<c:url value='/'/>"><img src="<c:url value='/resources/img/잡스런작은로고사람.png'/>"></a>
      <div><a id="headera" href="<c:url value='/'/>">JOB'S RUN</a></div>
      
      <c:if test="${!empty member && member.id ne 'jobsrun1234@gmail.com' }" >
		<div>
			<a id = "nicka" href="<c:url value='/member/myPage'/>">${member.nickname }님</a>			 
			<a id = "balancea" href="<c:url value='/DebitCredit/history/${member.id }'/>"></a>
		</div>
		
		<div><a href="<c:url value='/board/boardlistAll/1'/>">의뢰자 게시판</a></div>
      	<div><a href="<c:url value='/board/boardlistAll/2'/>">해결사 게시판</a></div>
      	<div><a href="<c:url value='/logout'/>">로그아웃</a></div>
      	<div><a href="<c:url value='/csboard/cslist'/>">고객센터</a></div>
	  </c:if>
	  <c:if test="${!empty member && member.id eq 'jobsrun1234@gmail.com'}" >	  	
		<div>
			<a id = "nicka" href="<c:url value='/member/myPage'/>">${member.nickname }님</a>
			<a id = "balancea" href="<c:url value='/DebitCredit/history/${member.id }'/>"></a>
		</div>
		<div><a href="<c:url value='/board/boardlistAll/1'/>">의뢰자 게시판</a></div>
      	<div><a href="<c:url value='/board/boardlistAll/2'/>">해결사 게시판</a></div>
      	<div><a href="<c:url value='/logout'/>">로그아웃</a></div>
      	<div><a href="<c:url value='/csboard/cslist'/>">고객센터</a></div>
      	<div><a href="<c:url value='/admin/adminmember'/>">관리자페이지</a></div>
	  </c:if>
	  
	  
	  
	  <c:if test="${empty member }" >    
      	<div><a href="<c:url value='/loginForm'/>">로그인</a></div>
	    <div><a href="<c:url value='/board/boardlistAll/1'/>">의뢰자 게시판</a></div>
	    <div><a href="<c:url value='/board/boardlistAll/2'/>">해결사 게시판</a></div>
	    <div><a href="<c:url value='/member/joinFormclause'/>">회원 가입</a></div>
	    <div><a href="<c:url value='/csboard/cslist'/>">고객센터</a></div>
	 </c:if>  
 </div>
</body>
</html>