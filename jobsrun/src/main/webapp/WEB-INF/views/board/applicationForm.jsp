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
  <link rel="stylesheet" href="<c:url value='/resources/css/board/writeForm.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <script src="<c:url value='/resources/js/common.js'/>"></script>	
  <script src="<c:url value='/resources/js/board/writeForm.js'/>"></script>	
</head>
<body>
  <div class="container">
    <%@ include file="../main/header.jsp"%>

    <%-- <form:form action="${pageContext.request.contextPath }/board/write" --%>
    <form:form action="${pageContext.request.contextPath }/board/write"
			 class="writeForm"
		     enctype="multipart/form-data"
		   	 method="post"
		     modelAttribute="boardVO">
      <form:hidden path="boardCategoryVO.bcid" value="1"/>
      <div class="writeFormTitle">의뢰자 글쓰기</div>
     
      <div class="btitle">
        <form:label path="btitle">제목</form:label>
        <form:input type="text" path="btitle"/>
      </div>
      <div class="bid">
        <form:label path="bid">글작성자</form:label>
        <form:input type="text" path="bid" value="${member.id }" readonly="true"/>
      </div>
      <div class="bnickname">
        <form:label path="bnickname">별칭</form:label>
        <form:input type="text" path="bnickname" value="${member.nickname }" readonly="true"/>
      </div>
      
      <div class="bcontent">
        <form:label path="bcontent">본문</form:label>
        <form:textarea rows="15" path="bcontent"/>
      </div>
       <div class="category">
       	<div>업무 상세 내용</div>
  		<div class="categoryItems">
  			<div>
  				<div>
			        <form:label path="job"><span>*</span>1.업무구분</form:label>
  					<div class="btnContainer">
  						<form:radiobuttons path="job" items="${job}" itemLabel="label" itemValue="code"/>
	  					<div>
	  						<form:radiobutton path="job" label="기타" value=""/>
	  						<form:input type="text" path="job"/>
	  					</div>
  					</div>
		    	</div>
	        	<div>
			        <form:label path="duration"><span>*</span>2.시간</form:label>
	        		<div class="btnContainer">
		        		<form:radiobuttons path="duration" items="${duration}" itemValue="code" itemLabel="label"/>
			        		<form:radiobutton path="duration" value="code" label="기타"/>
			        		<form:input type="text" path="duration"/>
	        		</div>
        		</div>
		        <div>
			        <form:label path="payment"><span>*</span>3.금액</form:label>
			        <div class="btnContainer">
						<form:radiobuttons path="payment" items="${payment }" itemValue="code" itemLabel="label"/>
					          <form:radiobutton path="payment" value="code" label="기타"/>
					          <form:input type="text" path="payment"/>
			        </div>
		        </div>
	        </div>
	        <div>
		        <div>
			        <form:label path="sdate"><span>*</span>4.시작날짜</form:label>
			        <form:input type="date" path="sdate" />
		        </div>
		        <div>
			        <form:label path="stime"><span>*</span>5.시작시간</form:label>
			        <form:input type="time" path="stime" />
		        </div>
	        </div>
	        <div>
		        <div>
			        <label for="blocation"><span>*</span>6.지역</label>
			        <select name="blocation" id="blocation">
			          <option value="">선택</option>
			          <option value="부산">부산</option>
			          <option value="울산">울산</option>
			          <option value="대구">대구</option>
			          <option value="광주">광주</option>
			        </select>
		        </div>
		        <div>
		        	<div>카카오 지도 자리</div>
		        </div>
	        </div>
        </div>
      </div><!-- end of category -->
      <div class="attachment" style="display:none">
       <form:label path="bfiles">첨부</form:label>
        <input type="file" id="bfiles" name="bfiles" multiple="multiple"></input>
     </div>
      <div class="picSection">
	      <div>첨부 이미지</div>
	      <div>
		      <div>이미지를 드래그 드랍 하세요</div>
		      <div class="picContainer">
			      <div id="pic" style="display:none">
				      <div class="delete">삭제ⓧ</div>
				      <div class="picItem"></div>
				      <div class="picTitle">파일명</div>
			      </div>
		      </div>
	      </div>
      </div>

      <div class="writeMenu">
        <form:button id="writeBtn">등록</form:button>
        <form:button id="cancelBtn">취소</form:button>
        <form:button id="listBtn">목록</form:button>
      </div>
    </form:form>

 
  </div>
     <%@ include file="../main/footer.jsp"%>
</body></html>