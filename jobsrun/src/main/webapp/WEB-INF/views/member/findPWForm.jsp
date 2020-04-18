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
  <link rel="stylesheet" href="<c:url value='/resources/css/member/findPWForm.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
  <script src="<c:url value ='/resources/js/member/findPW.js' />"></script>

</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
  	
    <div class="body">
      
      <c:choose>
      <c:when test="${empty result or result == 0}">
      	 <div id = "title">비밀번호 찾기</div>
	      <div id = "description">비밀번호가 기억나지 않으신가요?
						가입시 기입한 이메일을 입력하고 비밀번호 찾기 버튼을 클릭해주세요. 해당 이메일로 임시비밀번호를 전송해드립니다.</div>
	      <form class="findPWForm-dh" method = "get" id = "findPWForm" action="<c:url value='/member/sendMail2'/>">
	      	<div id = "emailwrap">
	      		<div id = "emamilfont">이메일</div>
	      		<div id = "emailinput"><input type="text" id ="id" name="id" /></div>
	      		<div id = "errdiv"><span id = "errmsg">
	      			<c:if test="${!empty svr_msg }">${svr_msg }</c:if>
	      		</span></div>
	      	</div> 
	      	<div id = "findPWBtnwrap">
	      		<input type="submit" id ="findPWBtn"/>
	      	</div>
	      </form>
      </c:when>

	<c:when test="${result == 1 }">
		<div style = "margin-top:100px; font-size:20px; text-align:center; color:#F7819F;">
			메일을 발송하였습니다. 메일함에서 임시 비밀번호를 확인하세요!
		</div>
		<div style = "margin-top:80px; margin-left:250px;">	
			<img src="<c:url value='/resources/img/mail.png'/>" width = "500px;" height = "400px;">
		</div>
		
	</c:when>
	
      
      </c:choose>
    </div>
    <!-- end body -->
    
    
  </div>
<%@ include file="../main/footer.jsp"%>
</body></html>