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
  <link rel="stylesheet" href="<c:url value='/resources/css/board/viewForm.css'/>">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <script src="<c:url value='/resources/js/common.js'/>"></script>	
  <script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>	
  <script src="<c:url value='/resources/js/board/viewForm.js'/>"></script>	
  
  <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body>
  <div class="container">
    <%@ include file="../main/header.jsp"%>

    <form:form action="${pageContext.request.contextPath }/board/modify/${returnPage }"
			 class="writeForm"
		     enctype="multipart/form-data"
		   	 method="post"
		     modelAttribute="boardVO">
      <form:hidden path="boardCategoryVO.bcid"/>
      <form:hidden path="bnum"/>
      <!-- <div class="viewFormTitle">의뢰자 글 읽기</div> -->
     
      <div class="btitle">
        <form:label path="btitle">제목</form:label>
        <form:input type="text" path="btitle"/>
      </div>
      <div class="bid">
        <form:label path="bid">글작성자</form:label>
        <form:input type="text" path="bid" value="${boardVO.bid }" readonly="true"/>
      </div>
      <div class="bnickname" style ="border:none;">
        <form:label path="bnickname">별칭</form:label>
        <form:input type="text" path="bnickname" value="${boardVO.bnickname }" readonly="true"/>
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
			        <form:label path="job"><span></span>1.업무구분</form:label>
  					<div class="btnContainer">
  						<form:radiobuttons path="job" items="${job}" itemLabel="label" itemValue="code" disabled="true"/>
	  					<div>
	  						<%-- <form:radiobutton path="job" label="기타" value=""/> --%>
	  						<%-- <form:input type="text" path="job"/> --%>
	  					</div>
  					</div>
		    	</div>
	        	<div>
			        <form:label path="duration"><span></span>2.시간</form:label>
	        		<div class="btnContainer">
		        		<form:radiobuttons path="duration" items="${duration}" itemValue="code" itemLabel="label" disabled="true"/>
			        		<%-- <form:radiobutton path="duration" label="기타" value="" /> --%>
			        		<%-- <form:input type="text" path="duration"/> --%>
	        		</div>
        		</div>
		        <div>
			        <form:label path="payment"><span></span>3.금액</form:label>
			        <div class="btnContainer">
						<form:radiobuttons path="payment" items="${payment }" itemValue="code" itemLabel="label" disabled="true"/>
					          <%-- <form:radiobutton path="payment" label="기타" value="" /> --%>
					          <%-- <form:input type="text" path="payment"/> --%>
			        </div>
		        </div>
	        </div>
	        <div>
		        <div>
			        <form:label path="sdate"><span></span>4.시작날짜</form:label>
			        <form:input type="date" path="sdate" disabled="true"/>
		        </div>
		        <div>
			        <form:label path="stime"><span></span>5.시작시간</form:label>
			        <form:input type="time" path="stime" disabled="true"/>
		        </div>
	        </div>
	        <div>
		        <div>
			        <label for="blocation"><span></span>6.지역</label>
			       <%--  <span style="margin-left:50px;">${boardVO.blocation }</span> --%>
			        
			       	<form:input type="text" path="blocation" readOnly ="true"/> 
		        </div>
		        <div id = "mapdiv" style ="margin-top:10px;">
		        	
		        	<div id = "mapcon"></div>
		        </div>
		        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec"></script>
   			<script>
var mapContainer = document.getElementById('mapdiv'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${boardVO.longitude},${boardVO.latitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${boardVO.longitude},${boardVO.latitude}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
				
		        
	        </div>
        </div>
      </div><!-- end of category -->
      <div class="attachment" style="display:none">
       <form:label path="bfiles">첨부</form:label>
       
       	
        <form:input type="file" path="bfiles" multiple="multiple"/>
     </div>
      <div class="picSection" id = "filediv">
	      <div>첨부 이미지</div>
	      <div>
		      <div style = "display:none;">이미지를 드래그 드랍 하세요</div>
		      <div class="picContainer">
		      <c:if test="${!empty files}">
        	<c:forEach var="file" items="${files }">
        	<a style = "height:20px;" class="fileList" href="${pageContext.request.contextPath}/board/file/${file.fid }">${file.fname }</a>
        		<img style ="position:relative; top:25px; right:170px; width:100px; height:100px;"src = "${pageContext.request.contextPath }/board/file/${file.fid}">
        	</c:forEach>
        </c:if>
			      <div id="pic" style="display:none">
				      <div class="delete">삭제ⓧ</div>
				      <div class="picItem"></div>
				      <div class="picTitle">파일명</div>
			      </div>
		      </div>
	      </div>
      </div>

      <div class="writeMenu">
        <!-- 작성자만 수정, 삭제 가능 시작 -->
        <c:if test="${sessionScope.member.id == boardVO.bid }" >
        <form:button class="btn rmode" id="modifyBtn">수정</form:button>
        <form:button class="btn rmode" id="deleteBtn" data-returnPage="${returnPage }" data-bnum="${boardVO.bnum }">삭제</form:button>
        </c:if>
        <!-- 작성자만 수정, 삭제 가능 끝 -->
        <form:button class="btn umode" id="cancelBtn">취소</form:button>
        <form:button class="btn umode" id="saveBtn">저장</form:button>
        <form:button class="btn" id="listBtn" data-returnPage="${returnPage }">목록</form:button>     
        </div>
    </form:form>

 
  </div>
     <%@ include file="../main/footer.jsp"%>
</body></html>