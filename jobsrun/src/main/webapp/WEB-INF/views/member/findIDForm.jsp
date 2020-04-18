<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/member/findIDForm.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
  <script src="<c:url value ='/resources/js/member/findID.js' />"></script>

</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
  	
    <div class="body">
      <div id = "title">아이디 찾기</div>
      <div id = "description">아이디가 기억나지 않으신가요?
					 가입시 입력한 전화번호와 생년월일을 입력하고 아이디 찾기 버튼을 눌러주세요.</div>
      <form class="findIDForm-dh" id ="findIDForm">
      	<div id = "tellwrap">
      		<div id = "telfont">전화번호</div>
      		<div id = "telinput"><input type="text" name = "tel" placeholder="전화번호" id ="telinput-input"/></div>
      		<div id = "telMsgwrap" style="display:none;"><span id = "telMsg" ></span></div>
      	</div>
      	<div id = "birthwrap">
      		<div id = "birthfont">생년월일</div>
      		<div id = "birthinput"><input type="date" name = "birth" placeholder="생년월일" id = "birthinput-input"/></div>
      		<div id = "birthMsgwrap" style="display:none"><span id = "birthMsg" class =" errmsg"></span></div>
      	</div>
      	<div id = "idfind">
      	 
      	<div id ="inputfindwrap">
      		<span id = "idte">찾은 아이디</span>
      		<input type="text" name = "id" id ="id" readonly="true" />
      	</div>
	      	<div id ="joindatewrap">
	      		<span id ="cdate">가입 일자</span>
	      		 <input type="text" id="joindate" name = "cdate" readonly="true">
	      	</div>
	    </div>
      	
      	<div id = "findIDBtnwrap">
      		<button type="button" id ="findIDBtn">아이디 찾기</button>
      	</div>
      </form>     
    </div>
    <!-- end body -->
  </div>
<%@ include file="../main/footer.jsp"%>
</body></html>