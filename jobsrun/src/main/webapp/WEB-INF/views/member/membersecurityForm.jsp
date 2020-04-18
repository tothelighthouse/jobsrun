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
  <link rel="stylesheet" href="<c:url value='/resources/css/member/membersecurityForm.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
	<script src="<c:url value='/resources/js/common.js'/>"></script>
	<script>
	window.addEventListener("load",init, false);
	
		function init(){
			ok.addEventListener("click",function(e){
			  e.preventDefault(); //브라우저의 다른 행동을 막기위해 		  
			      location.href = getContextPath() + "/member/memberchangepwForm/${sessionScope.member.id }";
			  
			 },false);
			ok2.addEventListener("click",function(e){
				  e.preventDefault(); //브라우저의 다른 행동을 막기위해 		  
				      location.href = getContextPath() + "/member/mailcheckForm/${sessionScope.member.id }";
				  
				 },false);
			}
	</script>
</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
    <div class="body">
  	<%@ include file="../myPage/myPageheader.jsp"%>
    <div id = "entirewrap">
      <div id = "title">비밀번호</div>
      <div id = "description">
      	<p id ="p1">잡스런 로그인 시 사용하는 <b>비밀번호를 변경</b> 하실수 있습니다. 주기적인 비밀번호
      	변경을 통해 개인정보를 안전하게 보호하세요.</p>
      </div>
      <div id = "buttonwrap">
    	<button id = "ok">변경하러가기</button>
    </div>
    
    <div id = "title2">이메일 인증</div>
    
    
   
    <div id = "description">
		<p id = "p2">지금 <b>이메일 인증</b>을 하시면 5000포인트를 지급해드립니다.</p>
	</div>
	<c:if test="${memberVO.emailcheck == 1}">
		<div id = "buttonwrap">
    		<button id = "ok3">인증 완료</button>
    	</div>
     </c:if>
     <c:if test="${memberVO.emailcheck == 0}">
		<div id = "buttonwrap">
    		<button id = "ok2">인증하러가기</button>
    	</div>
     </c:if>
    </div>    
   </div> 
    <!-- end body -->
    </div>
    <%@ include file="../main/footer.jsp"%>
  

</body></html>