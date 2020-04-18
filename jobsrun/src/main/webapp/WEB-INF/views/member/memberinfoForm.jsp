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
  <link rel="stylesheet" href="<c:url value='/resources/css/member/memberinfoForm.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
	<script src="<c:url value='/resources/js/common.js'/>"></script>
	<script>
	window.addEventListener("load",init, false);
	
		function init(){
			ok.addEventListener("click",function(e){
			  e.preventDefault(); //브라우저의 다른 행동을 막기위해 		  
			      location.href = getContextPath() + "/member/modifyForm/${sessionScope.member.id }";
			  
			 },false);
			}
	</script>
</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
  	 
    <div class="body">
	<%@ include file="../myPage/myPageheader.jsp"%>
      <div id ="title">${mvo.nickname} 님의 회원 정보</div>
      <form class="joinForm-dh">
      	<div id = "formtitle"><span id ="formtitlespan">회원정보 입력</span> </div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">아이디</div>
      		<div class ="condiv" id="iddiv">${mvo.id}</div>
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">비밀번호</div>
      		<div class ="condiv"><input class="inputtext" style="border:none;"readonly = "readonly" type="password" value ="${mvo.pw }" /></div> 	
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">전화번호</div>
      		<div class ="condiv">${mvo.tel }</div> 
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">닉네임</div>
      		<div class ="condiv">${mvo.nickname }</div> 
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">생년월일</div>
      		<div class ="condiv">${mvo.birth }</div>      		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">성별</div>
      		<div class ="condiv">
      			${mvo.gender }
      		</div>      		
      	</div>
      	<div class = "regionwrapdiv">
      	<div class ="textdiv">주소</div>
      	<div class ="regioncondiv">
      		${mvo.region }
		</div> 
	
      	</div>
      	<c:if test = "${mvo.fname != null }">
      	<div class = "wrapdiv" id="picturediv">
      		<div class ="textdiv">프로필 사진</div>
      		<div class ="condiv" id = "picture">
      			<img width="150px;" height = "100px;" style = "margin-top:20px;" src="${pageContext.request.contextPath }/member/file/${mvo.id}">
      			<span id ="fname" >${mvo.fname}</span>
      		</div>  		
      	</div>
      	</c:if>
      	<c:if test = "${mvo.fname == null }">
      	<div class = "wrapdiv" id="picturediv" style ="height:50px;">
      		<div class ="textdiv">프로필 사진</div>
      		<div class ="condiv" id = "picture">
      			등록된 사진이 없습니다.
      		</div>  		
      	</div>
      	</c:if>
      	<div class = "wrapdiv">
      		<div class ="textdiv">고액 추천 여부</div>
      		<div class ="condiv">
      			<c:if test = "${mvo.moneyrecommend == 1}">
      			Yes
      			</c:if>
      			<c:if test = "${mvo.moneyrecommend == 0}">
      			No
      			</c:if>
      		</div>    			     		
      	</div>
      	<div id = "bottom">
      		<button type = "button" id = "ok">회원정보 수정하기</button>
      	</div>
      	
      </form>
    </div>
    <!-- end body -->
    
 
  </div>
   <%@ include file="../main/footer.jsp"%>
</body></html>