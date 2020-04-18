 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
  <link rel="stylesheet" href="<c:url value='/resources/css/csboard/cslist.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <script src="<c:url value='/resources/js/common.js'/>"></script>	
  <script src="<c:url value='/resources/js/csboard/cslist.js'/>"></script>	
  
  <script>
	window.addEventListener("load",init,false);

	
	function init(){
		//글쓰기 버튼 클릭시
		writeBtn.addEventListener("click", function(e){
		e.preventDefault();
		let returnPage = e.target.getAttribute('data-returnPage');
		location.href=getContextPath()+"/csboard/writeForm/"+returnPage;
		},false);
			

		//검색버튼 클릭시
		searchBtn.addEventListener("click", function(e){
		e.preventDefault();
		console.log("검색");

		// 검색어 입력값이 없을때
		if(keyword.value.trim().length == 0){
			alert('검색어를 입력하세요!');
			keyword.value = "";
			keyword.focus();
			return false;
		}

		let stype = searchType.value; //검색유형
		let kword = keyword.value;    //검색어

		location.href = getContextPath() + "/csboard/cslist/1/" + stype + "/" + kword;
		
		},false);

		var iimg = document.getElementById('iimg');
		var Q1answer = document.getElementById('Q1answer');
		
		 iimg.addEventListener("click", function(e){
		 e.preventDefault();
		 Q1answer.style.display = "block";
		 },false);
		 iimg2.addEventListener("click", function(e){
		 e.preventDefault();
		 Q2answer.style.display = "block";
		 },false);
		 iimg3.addEventListener("click", function(e){
		 e.preventDefault();
		 Q3answer.style.display = "block";
		},false);
			
}
</script>
</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
   	
    <div class="body">
     <div id = "first">
     	고객센터
     </div>
     <div id = "Q1top">
     <span style = "color:red; font-size:20px; font-weight:bold;">자주 묻는 질문</span>
     </div>
     <div id ="Q1" style = "color: white;margin-top:10px; background-color:black; opacity:0.8px;">
     	<p><i class="fas fa-question" style = "margin-left: 20px; padding-right:15px;"></i>포인트는 어떻게 얻을 수 있나요?? <i id = "iimg" class="far fa-envelope-open" style = "float:right; position:relative; right:20px;"></i></p>
     </div>
     <div id ="Q1answer" class ="Q1answer">
     <p style = "width:60%; margin-left:50px; margin-top:20px;">회원가입 시에 실제로 보유하고 있는 이메일로 회원가입을 한 후에 마이페이지 보안설정으로 들어간후에 이메일 인증을 하시면 5000포인트를 지급합니다.
      이외에는 마이페이지 포인트 내역에서 결제가 가능 합니다. </p>
     </div>
     <div id ="Q1" style = "color: white;margin-top:10px; background-color:black; opacity:0.8px;">
     	<p><i class="fas fa-question" style = "margin-left: 20px; padding-right:15px;"></i>포인트 환전은 어떻게 할 수 있나요? <i id = "iimg2" class="far fa-envelope-open" style = "float:right; position:relative; right:20px;"></i></p>
     </div>
     <div id ="Q2answer" class ="Q1answer">
     <p style = "width:60%; margin-left:50px; margin-top:20px;">포인트는 10000포인트 부터 환전이 가능합니다. 마이페이지 포인트내역보기 탭으로 들어가서 포인트 지급받기 버튼을 클릭하여 환전 받으실 수 있습니다.</p>
     </div>
     <div id ="Q1" style = "color: white;margin-top:10px; background-color:black; opacity:0.8px;">
     	<p><i class="fas fa-question" style = "margin-left: 20px; padding-right:15px;"></i>사이트 이용을 하려면 어떻게 해야하나요? <i id = "iimg3" class="far fa-envelope-open" style = "float:right; position:relative; right:20px;"></i></p>
     </div>
     <div id ="Q3answer" class="Q1answer">
     <p style = "width:60%; margin-left:50px; margin-top:20px;">먼저 회원가입을 합니다. 그리고 로그인을 하신 후에 게시글을 작성 하실 수 있습니다. 단 의뢰자로 게시글을 작성하는 경우는 보수를 지급하여야 하기때문에 포인트가 필요합니다. 해결사로 게시글을 작성하는 경우네는 별도의 포인트는 필요가 없습니다. 의뢰자는 내가 도움을 의뢰하는 것이고 해결사는 내가 해결사로서, 일을 해결할수있다는 의미입니다.</p>
     </div>
     <div id = "teldiv">
     	<div id = "tel1">
     		<span id = "tel1span">전화상담</span>
     	</div>
     	<div id = "tel2">
     		<span>1588-8282</span>
     	</div>
     	<div id = "tel3">
     		<p>월 ~ 금 (주말 및 공휴일 휴무) 09:00 ~ 18:00</p>
     		<p>전화상담 문의는 위 전화번호로 문의주세요 이용가능시간은 위와 같습니다.</p>
     	</div>
     	
     </div>
      <div id = "teldiv2">
     	<div id = "tel1">
     		<span id = "tel1span">대면상담</span>
     	</div>
     	<div id = "tel3">
     		<p>월 ~ 금 (매월 마지막 주 금요일, 주말 및 공휴일 휴무) 11:00 ~ 17:00</p>
     		<p>주소 : 울산광역시 중구 신정동 공업탑 KH정보교육원 502호</p>
     	</div>
     	
     </div>
     
     <div id = "first2">
     	질문 리스트
     </div>
      <div id = "cslist">
      	<div id ="top">
      		<div id = "csbnumtitle">
      		글 번호
      		</div>
      		<div id = "csbcontitle">
      		제목
      		</div>
      		<div id = "csbidtitle">
      		아이디
      		</div>
      		<div id = "csbcdatetitle">
      		작성일자
      		</div>
      	</div>
      	<c:forEach var ="rec" items = "${cslist }">
      	<div id = "div1">
      		<div id = "csbnum">
      		<a href = "${pageContext.request.contextPath}/csboard/view/${pc.rc.reqPage}/${rec.csbnum }">${rec.csbnum }</a>
      		</div>
      		<div id = "csbtitle">
      		<c:forEach begin="1" end="${rec.csbindent }">&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
      		<c:if test="${rec.csbindent > 0 }">
										<span style = "color:white; background-color:#5858FA; padding:5px;">답변</span>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test = "${rec.csbindent == 0 }">
				<span style = "color:white; background-color:#F79F81; padding:5px;">질문</span>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
      		<a href = "${pageContext.request.contextPath}/csboard/view/${pc.rc.reqPage}/${rec.csbnum }">${rec.csbtitle }</a>
      		</div>
      		<div id = "csbid">
      		<a href = "${pageContext.request.contextPath}/ratings/rateList/${rec.csbid}">${rec.csbid }</a>
      		</div>
      		<div id = "csbcdate">
      		<fmt:formatDate value="${rec.csbcdate }" pattern="yyyy-MM-dd"/>
      		</div>
      	</div>
      </c:forEach> 
      </div>
      <div id = "newcontent">
        	 <div class="paging2">
						<!--  처음페이지 / 이전페이지 이동 -->
			<c:if test="${pc.prev }" >
        	 	<a href="${pageContext.request.contextPath }/csboard/cslist/1"><i class="fas fa-angle-double-left"></i></a>
        	 	<a href="${pageContext.request.contextPath }/csboard/cslist/${pc.startPage-1}/${pc.fc.searchType}/${pc.fc.keyword}" id ="" ><i class="fas fa-angle-left"></i></a>
        	 </c:if>
        	 	<c:forEach var="pageNum" begin="${pc.startPage }" end="${pc.endPage }">
        		<!-- 현재페이지와 요청페이지가 다르면 -->
						<c:if test = "${pc.rc.reqPage != pageNum }">					
        		<a class="" href="${pageContext.request.contextPath }/csboard/cslist/${pageNum}/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a>
						</c:if>
						<!-- 현재페이지와 요청페이지가 같으면 -->
						<c:if test = "${pc.rc.reqPage == pageNum }">
						<a class="" style = "background-color:#FA5882;" href="${pageContext.request.contextPath }/csboard/cslist/${pageNum}/${pc.fc.searchType}/${pc.fc.keyword}">${pageNum }</a>
						</c:if>
        		</c:forEach> 		
        	<!-- 다음페이지 / 최종페이지 이동  -->
        	<c:if test="${pc.next }">
        		<a href="${pageContext.request.contextPath }/csboard/cslist/${pc.endPage+1}/${pc.fc.searchType}/${pc.fc.keyword}" id =""><i class="fas fa-angle-right"></i></a>
        		<a href="${pageContext.request.contextPath }/csboard/cslist/${pc.finalEndPage}" id =""><i class="fas fa-angle-double-right"></i></a>
    			</c:if>
    			</div>
   			</div>
   			
      <div id = "searchbar">
      	<select name = "searchType" id = "searchType" style ="width:100px; height:20px;">
      		<option value="A" 
  						<c:out value="${pc.fc.searchType == 'A' ? 'selected' :'' }" />>전체</option>
  						 						
  						<option value="TC" 
  						<c:out value="${pc.fc.searchType == 'TC' ? 'selected' :'' }" />>제목+내용</option>
  						
 						  <option value="T"
 						  <c:out value="${pc.fc.searchType == 'T' ? 'selected' :'' }" />>제목</option>
 						  
  						<option value="C"
  						<c:out value="${pc.fc.searchType == 'C' ? 'selected' :'' }" />>내용</option>
  						
  						<option value="I"
  						<c:out value="${pc.fc.searchType == 'I' ? 'selected' :'' }" />>작성자</option>
      	</select>
      	<input type ="search"  name="keyword" value = "${pc.fc.keyword }" id="keyword" placeholder="검색어를 입력하세요"> <button type="button" data-category = "${category }" style = "padding-right:5px; padding-left:5px; background-color:#0101DF; color:white" id ="searchBtn" >검색</button>
     	<button style="padding:5px; position:relative; left:330px; color:white; background-color:#0000FF;" id="writeBtn" data-returnPage="${pc.rc.reqPage }">질문하기</button>
      </div>
    </div>
    <!-- end body -->
  </div>
<%@ include file="../main/footer.jsp"%>
</body>
</html>