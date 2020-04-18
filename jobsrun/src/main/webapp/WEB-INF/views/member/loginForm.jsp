<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/member/loginForm.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
	<script src="<c:url value ='/resources/js/member/login.js'/>"></script>
</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
  	
    <div class="body">
      <form class="loginForm-dh" id="loginForm" action="<c:url value='/login?reqURI=${reqURI }' />" method="post">
      	<div id = "idwrap">
      		<div id ="idchar">아이디</div>
      		<div id ="idinput"><input id = "id" name="id" type="text" placeholder="아이디를 입력하세요"/></div> 
      		<div id="errdiv"><span id="idMsg" class = "errmsg"></span></div> 		
      	</div>
      	<div id = "pwwrap">
			<div id = "pwchar">비밀번호</div>      	
			<div id = "pwinput"><input id = "pw" name="pw" type ="password" placeholder="비밀번호를 입력하세요"/></div>      	
      		<div id="errdiv"><span id="pwMsg" class = "errmsg">
      		<c:if test="${!empty svr_msg }">${svr_msg }</c:if></span></div>
      	</div>
		<div id ="btnwrap">
			<input type="submit" id="loginBtn" value="로그인"/>
		</div>
		<div id = "findwrap">
			<a href = "<c:url value='/member/joinFormclause'/>" id = "joina">회원가입</a>
			<a href = "<c:url value='/member/findIDForm'/>" id = "idfinda">아이디 찾기</a>
			<a href = "<c:url value='/member/findPWForm'/>" id = "pwfinda">비밀번호 찾기</a>
		</div>
      </form>
      
    </div>
    <!-- end body -->
    
    
  </div>
<%@ include file="../main/footer.jsp"%>
</body></html>