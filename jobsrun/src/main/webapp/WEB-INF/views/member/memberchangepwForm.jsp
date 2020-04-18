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
  <link rel="stylesheet" href="<c:url value='/resources/css/member/memberchangepwForm.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

  <script src="<c:url value='/resources/js/member/memberchangepwForm.js'/>"></script>
</head>

  <div class="container">
    <%@ include file="../main/header.jsp"%>

    <div class="body">
    	<form:form class = "changepwForm-dh" id = "changepwForm"
    		 enctype = "multipart/form-data"
             method = "post" modelAttribute="mvo" 	
    		 action ="${pageContext.request.contextPath }/member/changepw">
    		<div id = "title">
    			<p id = "p1">비밀번호 변경</p>
    			<ul>
    				<li id ="li1">안전한 비밀번호로 내정보를 보호하세요.</li>
    				<li id ="li2">다른 아이디 또는 사이트에서 사용한 적 없는 비밀번호</li>
    				<li id ="li3">이전에 사용한 적 없는 비밀번호가 안전합니다.</li>
    			</ul>
    		</div>
    		<div id = "inputwrap">
    			<form:input type ="text" path="id" style= "display:none;"/>
    			<input type = "password" id ="presentpw" class="presentpw" placeholder="현재 비밀번호"/> 	 					
    		</div>
    		<span id = "ppw" style="display:none;">${member.pw }</span>
    		<div id = "errmsgdiv"><span id = "errmsg"></span></div>
    		<div style = "margin-left:40px; color:red; margin-top:10px;"></div>
    		<div id = "inputwrap2">
    			<form:input type = "password" path ="pw" class="newpw" placeholder="새 비밀번호"/>  		
    		</div>
    		<div id = "errmsgdiv"><span id = "pw_errmsg"></span></div>
    		<div id = "inputwrap3">
    			<input type = "password" class="checkpw" id = "pwChk" placeholder="비밀번호 확인">  		
    		</div>
    		<div id = "errmsgdiv"><span id = "pwChk_errmsg"></span></div>
    		<div id = "changepwwrap">
    			<button type ="submit" id = "changepwBtn">
    				변경하기
    			</button>
    		</div>
    	
    	
    	</form:form>
    
    </div>
    <!-- end .body -->

    
  </div>
<%@ include file="../main/footer.jsp"%>
</body>
</html>