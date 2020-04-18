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
  <link rel="stylesheet" href="<c:url value='/resources/css/member/mailcheckForm.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

  <script src="<c:url value='/resources/js/member/mailcheckForm.js'/>"></script>
</head>

  <div class="container">
    <%@ include file="../main/header.jsp"%>

    <div class="body">
    	<form:form class = "mailcheckForm-dh" id = "mailcheckForm"
    		 enctype = "multipart/form-data"
             method = "get" modelAttribute="mvo" 	
    		 action ="${pageContext.request.contextPath }/sendMail">
    		<div id = "title">
    			<p id = "p1">이메일 인증</p>
    			<ul>
    				<li id ="li1">이메일 인증을 하시면 5000포인트를 지급합니다.</li>
    				<li id ="li2">가입 시 기입한 이메일(ID)를 입력하세요</li>
    				<li id ="li3">해당 이메일로 들어가 인증확인 버튼을 클릭해주세요</li>
    			</ul>
    		</div>
    		
    		<div id = "emailwrap">
    				<span id = "memberid" style = "display:none;">${member.id }</span>
    				<input type="text" id="id" placeholder="이메일(ID)을 한번더 입력하세요"/>    				
    		</div>
    		<div id = "errwrap">
    			<span id = "errmsg"></span>
    		</div>
    		<div id = "ok2wrap">
    			<input type = "submit" id = "ok2" value="인증메일전송"></button>
    		</div>
    	</form:form>
    
    </div>
    <!-- end .body -->

    
  </div>
<%@ include file="../main/footer.jsp"%>
</body>
</html>