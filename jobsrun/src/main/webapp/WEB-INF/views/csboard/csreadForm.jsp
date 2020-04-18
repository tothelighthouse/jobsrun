 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/csboard/csreadForm.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <script src="<c:url value='/resources/js/common.js'/>"></script>	
  
  <script>
		window.addEventListener("load",init, false);
		function init(){
			changeMode(false);

			let modifyBtn = document.getElementById('modifyBtn');
			let deleteBtn = document.getElementById('deleteBtn');
			
      //답글
			replyBtn.addEventListener("click",function(e){
				e.preventDefault();
				console.log("답글");
				console.log(getContextPath());
				let returnPage = e.target.getAttribute('data-returnPage');			
 				let csbnum = e.target.getAttribute('data-csbnum');
				location.href = getContextPath()+"/csboard/csreplyForm/"+returnPage+"/"+csbnum;
			},false);
			
      //수정
      if(modifyBtn != null){
			modifyBtn.addEventListener("click",function(e){
				e.preventDefault();
				changeMode(true);
			},false);
     }
      //삭제
      if(deleteBtn != null){
			deleteBtn.addEventListener("click",function(e){
				e.preventDefault();
					console.log("삭제"+e.target.getAttribute('data-csbnum'));
					
					if(confirm("삭제하시겠습니까?")){
						let returnPage = e.target.getAttribute('data-returnPage');
	 	 				let csbnum = e.target.getAttribute('data-csbnum');
	 	 				location.href = getContextPath() + "/csboard/delete/" 
						+ returnPage + "/" + csbnum;
							}
				},false);
      }
      //취소(수정모드->읽기모드)
			cancelBtn.addEventListener("click",function(e){
				e.preventDefault();
				console.log("취소");
				changeMode(false);
			},false);
			
      //저장	
			saveBtn.addEventListener("click",function(e){
				e.preventDefault();
				console.log("저장");
				//유효성 체크
				document.getElementById('csboardVO').submit();
			},false);      

      //목록
			listBtn.addEventListener("click",function(e){
				e.preventDefault();
				console.log("목록");
				let returnPage = e.target.getAttribute('data-returnPage');
				location.href=getContextPath()+"/csboard/cslist/"+ returnPage;
			},false);     
		}

		//읽기 모드 , 수정모드
		function changeMode(flag){						
				let rmodes = document.getElementsByClassName("rmode");
				let umodes = document.getElementsByClassName("umode");
			//수정모드	
			if(flag){			
				document.getElementById("csbtitle").removeAttribute("readOnly");			
				document.getElementById("csbcontent").removeAttribute("readOnly");			
				//수정모드버튼 활성화
				Array.from(rmodes).forEach(e=>{e.style.display="none";});
				Array.from(umodes).forEach(e=>{e.style.display="block";});
			//읽기모드	
			}else{
				document.getElementById("csbtitle").setAttribute("readOnly",true);
				document.getElementById("csbcontent").setAttribute("readOnly",true);	
				//읽기모드버튼 활성화				
				Array.from(rmodes).forEach(e=>{e.style.display="block";});
				Array.from(umodes).forEach(e=>{e.style.display="none";});
			}
		}
  </script>	
</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
   	
    <div class="body">
      <form:form class = "cswriteform" action = "${pageContext.request.contextPath }/csboard/modify/${returnPage }" 
        						 method = "post" 
        						 modelAttribute="csboardVO">        						 
      							<form:hidden path="csbid"/>
      							<form:hidden path="csbnum"/>
								<form:hidden path="csbgroup"/>
     <div id = "title">
  			고객센터				
     </div>
     <div id = "title2">
     	<div id = "titlediv">제목 </div>
     	<div id = "titleinput">
     		<form:input type ="text" class="col-2" path="csbtitle" style ="border:none" readOnly="true"/></div>
     </div>
     <div id = "title3">
     	<div id = "title3div">내용</div>
     	<div id = "title3input">
     		<form:textarea class="col-3" path = "csbcontent" style ="border:none" readOnly="true"></form:textarea>
     	</div>
     </div>
     <c:if test = "${!empty returnPage }">
        <div id = "newcontent" class="row">
        	<div style= "float:left; background-color:red;" id = "modify" class="row btns">
        					<!--  관리자 계정으로만 답글 가능 -->
        					<%-- <c:if test="${sessionScope.member.id eq 'jobsrun1234@gmail.com'}"> --%>
        					<form:button class="btn rmode" id="replyBtn" style="padding:10px; background-color:#8181F7; color:white; float:left;" data-returnPage = "${returnPage }"  data-csbnum ="${csboardVO.csbnum }">답글</form:button>
					        <%-- </c:if> --%>
					        <!-- 작성자만 수정, 삭제 가능 -->
					        <c:if test="${sessionScope.member.id == csboardVO.csbid }">
					        <form:button class="btn rmode"  id="modifyBtn" style="padding:10px; background-color:#8181F7; color:white; float:left;">수정</form:button>
					        <form:button class="btn umode" id="deleteBtn" data-returnPage = "${returnPage }"  data-csbnum ="${csboardVO.csbnum }" style="padding:10px; background-color:#8181F7; color:white; float:left;">삭제</form:button>
					        </c:if>
					        <!-- 작성자만 수정, 삭제 가능 끝 -->
					        <form:button class="btn umode" id="cancelBtn" style="padding:10px; background-color:#8181F7; color:white; float:left;">취소</form:button>
					        <form:button class="btn umode" id="saveBtn" style="padding:10px; background-color:#8181F7; color:white; float:left;">저장</form:button>
        	</div>	
        <%-- 	<div id ="write">
        	<a href="<c:url value='/board/writeForm'/>">글쓰기</a>
        	</div> --%>
        	<div style = "float:left;" id = "listview">
        		<form:button class="btn" id="listBtn" data-returnPage="${returnPage }" style="padding:10px; background-color:#8181F7; color:white;">목록</form:button>        	
        	</div>
       </div>
      </c:if>
     
      </form:form>
    </div>
    <!-- end body -->
  </div>
<%@ include file="../main/footer.jsp"%>
</body>
</html>