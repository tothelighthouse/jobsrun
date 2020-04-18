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
  <link rel="stylesheet" href="<c:url value='/resources/css/csboard/cswriteForm.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <script src="<c:url value='/resources/js/common.js'/>"></script>	
  <script src="<c:url value='/resources/js/csboard/cswriteForm.js'/>"></script>	
</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
   	
    <div class="body">
      <form:form class = "cswriteform" action = "${pageContext.request.contextPath }/csboard/write/${returnPage }" 
        						 method = "post" 
        						 modelAttribute="csboardVO">
        						 
      
      							<form:hidden path="csbid"/>
     <div id = "title">
  			질문하기				
     </div>
     <div id = "title2">
     	<div id = "titlediv">제목 </div>
     	<div id = "titleinput">
     		<form:input type ="text" path="csbtitle" /></div>
     </div>
     <div id = "title3">
     	<div id = "title3div">내용</div>
     	<div id = "title3input">
     		<form:textarea path = "csbcontent"></form:textarea>
     	</div>
     </div>
     <div id = "title4">
     	<form:button class="btn" id="writeBtn">질문하기</form:button>   
     </div>
      </form:form>
    </div>
    <!-- end body -->
  </div>
<%@ include file="../main/footer.jsp"%>
</body>
</html>