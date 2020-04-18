<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/board/list.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
  
  <script src="<c:url value='/resources/js/common.js'/>"></script>
  <script>
	window.addEventListener("load",init,false);

	function init(){
		let bcategory = document.getElementById("bcategory").value;
		//글쓰기 버튼 클릭시
		writeBtn.addEventListener("click",function(e){
			e.preventDefault();
			let returnPage = e.target.getAttribute('data-returnPage');
			location.href=getContextPath()+"/board/writeForm/"+ returnPage+ "/" + bcategory;

			},false);
		
		//검색버튼 클릭시
		searchBtn.addEventListener("click",function(e){
			e.preventDefault();
			//console.log("검색!!");
			// 검색어 입력값이 없으면
			if(keyword.value.trim().length == 0) {
				alert('검색어를 입력하세요!');
				keyword.value="";
				keyword.focus();
				return false;
			}

			let stype = searchType.value; 			//검색유형
			console.log(stype);
			let kword = keyword.value.trim();		//검색어

			location.href = getContextPath() + "/board/list/" + bcategory + "/1/" + stype + "/" + kword;
		},false);
	}
	
</script>

</head>
<c:set var="contextRoot" value="${pageContext.request.contextPath }"/>
<body>
  <div class="container">
    <%@ include file="../main/header.jsp"%>
   
    <div class="list-dg">
    	<input id="bcategory" type="hidden" value="${bcategory }">
      <c:if test = "${bcategory == 1 }">
      <div class="listTitle" >의뢰자 게시판</div>
      </c:if>
      <c:if test = "${bcategory == 2 }">
      <div class="listTitle" >해결사 게시판</div>
      </c:if>
      <div class="th">
        <div class = "thdiv2">닉네임</div>
        <div class = "thdiv3">제목</div>
        <div class = "thdiv4">의뢰날짜</div>
        <div class = "thdiv5">시작시간</div>
        <div class = "thdiv6">위치</div>
        <div class = "thdiv7">업무</div>
        <div class = "thdiv8">예상시간</div>
        <div class = "thdiv9">보수</div>
       </div>
      </div>
      <div class="tbody">
        <c:forEach var="rec" items="${list }">
          <div>
          	<div class = "thdiv2">${rec.bnickname }</div>
	        <div class = "thdiv3"><a href="<c:url value='/board/view/${pc.rc.reqPage}/${rec.bnum} '/>">${rec.btitle }</a></div>
	        <div class = "thdiv4">${rec.sdate }</div>
	        <div class = "thdiv5">${rec.stime }</div>
	        <div class = "thdiv6">${rec.blocation }</div>
	        <div class = "thdiv7">${rec.job }</div>
	        <div class = "thdiv8">${rec.duration }분</div>
	        <div class = "thdiv9">${rec.payment }원</div>
          </div>
      <c:if test = "${sessionScope.member.id ne rec.bid}">   
	      <c:if test = "${bcategory == 1}">
	          <a href="${pageContext.request.contextPath }/board/application/${rec.bnum}"> 
	          <input type="button" id = "btn1" data-bnum=${rec.bnum } value="지원신청"></a>
	      </c:if>
	      <c:if test = "${bcategory == 2}">
	           <a href="${pageContext.request.contextPath }/board/application/${rec.bnum}"> 
	          <input type="button" id = "btn1" data-bnum=${rec.bnum } value="고용신청"></a>          
	      </c:if>
     </c:if>
     <c:if test = "${sessionScope.member.id eq rec.bid}">   
	      <c:if test = "${bcategory == 1}">
	           <input type="button" id = "btn1" data-bnum=${rec.bnum } value="의뢰완료" style = "visibility:hidden;">          
	      </c:if>
	      <c:if test = "${bcategory == 2}">
	           <input type="button" id = "btn1" data-bnum=${rec.bnum } value="고용완료" style = "visibility:hidden;">          
	      </c:if>
     </c:if>	  
        </c:forEach>
      </div>
   
      <div class="listMenu">
        <%-- <a href="<c:url value='/board/writeForm/${bcategory }'/>"><input type="button" value="글쓰기"></a> --%>
        <a><input type="button" id="writeBtn" data-returnPage="${pc.rc.reqPage }" value="글쓰기"></a>
      </div>
      <!-- start of paging -->
      <div class="paging3">	
		<!-- 처음페이지 / 이전페이지 이동 -->
		<c:if test="${pc.prev }" >
			<a href="${contextRoot }/board/boardlistAll/${bcategory }/${pc.fc.searchType}/${pc.fc.keyword}"><i class="fas fa-angle-double-left"></i></a>
			<a href="${contextRoot }/board/boardlistAll/${bcategory }/${pc.startPage-1}/${pc.fc.searchType}/${pc.fc.keyword}"><i class="fas fa-angle-left"></i></a>
		</c:if>
		<c:forEach var="pageNum" begin="${pc.startPage }" end="${pc.endPage }">
			<!-- 현재페이지와 요청페이지가 다르면 -->
			<c:if test="${pc.rc.reqPage != pageNum }">
			<a href="${contextRoot }/board/boardlistAll/${bcategory }/${pageNum }/${pc.fc.searchType}/${pc.fc.keyword}" class="off">${pageNum }</a>
			</c:if>								
			<!-- 현재페이지와 요청페이지가 같으면 -->
			<c:if test="${pc.rc.reqPage == pageNum }">
			<a style = "background-color:#FA5882;" href="${contextRoot }/board/boardlistAll/${bcategory }/${pageNum }/${pc.fc.searchType}/${pc.fc.keyword}" class="on">${pageNum }</a>
			</c:if>
		</c:forEach>
		<!-- 다음페이지 / 최종페이지 이동 -->	
		<c:if test="${pc.next }" >	
			<a href="${contextRoot }/board/boardlistAll/${bcategory }/${pc.endPage+1}/${pc.fc.searchType}/${pc.fc.keyword}"><i class="fas fa-angle-right"></i></a>
			<a href="${contextRoot }/board/boardlistAll/${bcategory }/${pc.finalEndPage}/${pc.fc.searchType}/${pc.fc.keyword}"><i class="fas fa-angle-double-right"></i></a>
		</c:if>	
	</div>
    <!-- end of paging -->
  
    <!-- start of Search -->
	<div id="search">
		<form>		
			<select class = "select1" name="searchType" id="searchType">
				<option value="TC" 
					<c:out value="${pc.fc.searchType == 'TC' ? 'selected':'' }" />>제목+내용</option>
				<option value="T"
					<c:out value="${pc.fc.searchType == 'T' ? 'selected':'' }" />>제목</option>
				<option value="C"
					<c:out value="${pc.fc.searchType == 'C' ? 'selected':'' }" />>내용</option>
				<option value="N"
					<c:out value="${pc.fc.searchType == 'N' ? 'selected':'' }" />>작성자</option>
				<option value="I"
					<c:out value="${pc.fc.searchType == 'I' ? 'selected':'' }" />>아이디</option>
			</select>
			<input type="search" name="keyword" id="keyword" value="${pc.fc.keyword }"/>
			<button id="searchBtn">검색</button>
		</form>
	</div>
	<!-- end of Search -->
      
    </div>
  </div>
     <%@ include file="../main/footer.jsp"%>

</body></html>