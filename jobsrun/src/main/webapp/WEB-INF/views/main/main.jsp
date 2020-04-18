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
  <link rel="stylesheet" href="<c:url value='/resources/css/main/main.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">
  <script src="<c:url value='/resources/js/main.js'/>"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script><base>
<!--슬라이드  -->
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=551d147fe1ec2714aac6922bd74159ec&libraries=services"></script>
<script>
window.addEventListener("load",init,false);
   
function init(){	
	var latitude   = document.getElementsByClassName('latitude');
	var longitude = document.getElementsByClassName('longitude');
	var blocation = document.getElementsByClassName('blocation');
	
	/* console.log("latitude =" + latitude[0].innerHTML); */
	console.log("longitude =" + longitude.length);
	console.log("blocation =" , blocation);

	
	
	var mapContainer = document.getElementById('maparea'), // 지도를 표시할 div
	
	   mapOption = { 
	        center: new kakao.maps.LatLng(longitude[0].innerHTML, latitude[0].innerHTML), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var mapBtn = window.document.getElementById("mapBtn");
    var moreBody = document.getElementById('moreBody');
    var bitemdiv = document.getElementById('bitemdiv');
    var maparea = document.getElementById('maparea');
	  
    mapBtn.addEventListener("click",function(e){
		  console.log('클릭됨');
	  

    nonediv.style.display = 'none';
   	maparea.style.display = 'block';
   	recspan.style.display = 'block';
    map.relayout();
	  
    },false);
	  
	  
	  
    boardBtn.addEventListener("click",function(e){
		  console.log('클릭됨');
	  
	  nonediv.style.display = 'block';
	  maparea.style.display = 'none';
	  recspan.style.display = 'none';
	  
	  },false);
	// 마커를 표시할 위치와 title 객체 배열입니다 
	   let userpositions = [];
	
	for (let i = 0; i<latitude.length; i++){

		let lat = latitude[i].innerHTML;
		let log = longitude[i].innerHTML;
		
		let obj = { "title" : blocation[i].innerHTML,
					"latlng" : new kakao.maps.LatLng(log,lat)};
		
 		/* let obj ={}
 		obj.title = blocation[i].innerHTML;
		obj.latlng = new kakao.maps.LatLng(lat, log); */

		userpositions.push(obj);
	}
	
console.log("userpositions = ", userpositions);

	  var positions = userpositions; 
	 
		   
		console.log("positions = " , positions);
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (let i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 


	});
  }

	var latitude2   = document.getElementsByClassName('latitude2');
	var longitude2 = document.getElementsByClassName('longitude2');
	var blocation2 = document.getElementsByClassName('blocation2');
		
	var mapContainer2 = document.getElementById('maparea2'), // 지도를 표시할 div
	
	   mapOption2 = { 
	        center: new kakao.maps.LatLng(longitude2[0].innerHTML, latitude2[0].innerHTML), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다

	var mapBtn2 = window.document.getElementById("mapBtn2");
    var moreBody2 = document.getElementById('moreBody2');
    var bitemdiv2 = document.getElementById('bitemdiv2');
    var maparea2 = document.getElementById('maparea2');
	  
    mapBtn2.addEventListener("click",function(e){
		  console.log('클릭됨');
	  

    nonediv2.style.display = 'none';
   	maparea2.style.display = 'block';
   	recspan2.style.display = 'block';
    map2.relayout();
	  
    },false);
	  
	  
	  
    boardBtn2.addEventListener("click",function(e){
		  console.log('클릭됨');
	  
	  nonediv2.style.display = 'block';
	  maparea2.style.display = 'none';
	  recspan2.style.display = 'none';
	  
	  },false);
	// 마커를 표시할 위치와 title 객체 배열입니다 
	   let userpositions2 = [];
	
	for (let i = 0; i<latitude2.length; i++){

		let lat2 = latitude2[i].innerHTML;
		let log2 = longitude2[i].innerHTML;
		
		let obj2 = { "title" : blocation2[i].innerHTML,
					"latlng" : new kakao.maps.LatLng(log2,lat2)};
		
 		/* let obj ={}
 		obj.title = blocation[i].innerHTML;
		obj.latlng = new kakao.maps.LatLng(lat, log); */

		userpositions2.push(obj2);
	}

	  var positions2 = userpositions2; 
	 
		   
		console.log("positions2= " , positions2);
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc2 = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (let i = 0; i < positions2.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc2, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map2, // 마커를 표시할 지도
	        position: positions2[i].latlng, // 마커를 표시할 위치
	        title : positions2[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	});
  }  
}


</script>
  <style>
  @keyframes slidy {
0% { left: 0%; }
20% { left: 0%; }
25% { left: -100%; }
45% { left: -100%; }
50% { left: -200%; }
70% { left: -200%; }
75% { left: -300%; }
95% { left: -300%; }
100% { left: -400%; }
}
body { margin: 0; } 


div#slider { overflow: hidden;}
div#slider figure img { width: 20.0%; float: left; }
div#slider figure { 
  position: relative;
  width: 500%;
  margin: 0;
  top:0;
  left: 0;
  text-align: left;
  font-size: 0;
  -webkit-animation: 20s slidy ease-in-out infinite;
  animation: 20s slidy ease-in-out infinite; 
}
.header{border-bottom: 2px solid #000;margin-bottom: 13px;}
.banner{width:100%;display:inline-block;padding:0!important;}

</style>
</head>

  <div class="container" id = "maincontainer">
    <%@ include file="../main/header.jsp"%>
    <div class="banner" id ="slider">
    	<figure>
			<img src="<c:url value='/resources/img/메인포스터11.jpg' />"> 
			<img src="<c:url value='/resources/img/잡스런12.jpg' />"> 
			<img src="<c:url value='/resources/img/잡스런13.jpg' />"> 
			<img src="<c:url value='/resources/img/잡스런12.jpg' />"> 
		</figure>
    </div>
   <%--  ${recommendlist1 } --%>
   <c:if test = "${member != null}">
    <div class="searchBar">
      <!-- <select>
        <option value="">시간</option>
        <option value="">장소</option>
        <option value="">금액</option>
        <option value="">아이디</option>
      </select>
      <div  id="searchInputWidth"><input type="text" id="searchInput"></div>
      <input type="button" value="검색"> -->
    </div>

    <div class="body">
      <div id ="mapBtnwap">
      	 <button type ="button" id="mapBtn">지도로보기</button>
      	<button type = "button" id = "boardBtn">게시글로보기</button>						
      </div>
      <span id = "recspan">추천 의뢰자 위치</span>
      <div id = "maparea"></div>
     <div id = "nonediv"> 
      <div class="more-Body" id ="moreBody">
        <div>추천 의뢰 게시물</div>
        <!-- <label for="count">목록 개수</label>
        <select id="listCount">
          <option value="10">10개</option>
          <option value="20">20개</option>
          <option value="30">30개</option>
          <option value="40">40개</option>
        </select>
        <input type="button" value="선택" id="listCountBtn">
        <a href="">
          더보기...
        </a> -->
      </div>
      
      <div class="bitem" id="bitemdiv">
      <c:forEach var = "rec" items = "${recommendlist1 }">
        <a href="<c:url value='/board/view/${pc.rc.reqPage}/${rec.bnum} '/>" class="itemDescription">
          <div class="hot"><c:if test = "${rec.bbcid eq '1'}">의뢰자 추천</c:if></div>
          <div class="image">
          	<c:choose>
          	 <c:when test = "${rec.job eq '청소' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/청소.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '요리' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/요리.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '기타' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/기타.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '배달' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/배달.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '수리' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/수리.png'/>"></c:when>
          	</c:choose>
          	
          </div>
          <div>${rec.bnickname }</div>
          <div>${rec.job }</div>
          <div class = "btitle">${rec.btitle }</div>
          <div class="catagory">
            <div>${rec.payment }원</div>
            <div class = "blocation">${rec.blocation }</div>
            <div>${rec.sdate }</div>
            <div>${rec.duration }분</div>
            <div class = "latitude"  style= "display:none;">${rec.latitude }</div>
            <div class = "longitude" style= "display:none;">${rec.longitude }</div>
          </div>
        </a>
          </c:forEach>
      </div>
     </div> 
     <div id ="mapBtnwap2">
      	 <button type ="button" id="mapBtn2">지도로보기</button>
      	<button type = "button" id = "boardBtn2">게시글로보기</button>						
      </div>
      <span id = "recspan2">추천 해결사 위치</span>
      <div id = "maparea2"></div>
     <div id = "nonediv2"> 
      <div class="more-Body" style="margin-top:20px;">
        <div>추천 해결사 게시물</div>
        <!-- <label for="count">목록 개수</label>
        <select id="listCount">
          <option value="10">10개</option>
          <option value="20">20개</option>
          <option value="30">30개</option>
          <option value="40">40개</option>
        </select>
        <input type="button" value="선택" id="listCountBtn">
        <a href="">
          더보기...
        </a> -->
      </div>
      
      <div class="bitem" >
      <c:forEach var = "rec" items = "${recommendlist2 }">
        <a href="<c:url value='/board/view/${pc.rc.reqPage}/${rec.bnum} '/>" class="itemDescription">
          <div class="hot"><c:if test = "${rec.bbcid eq '2'}">해결사 추천</c:if></div>
          <div class="image">
          	<c:choose>
          	 <c:when test = "${rec.job eq '청소' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/청소.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '요리' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/요리.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '기타' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/기타.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '배달' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/배달.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '수리' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/수리.png'/>"></c:when>
          	</c:choose>
          	
          </div>
          <div>${rec.bnickname }</div>
          <div>${rec.job }</div>
          <div class = "btitle">${rec.btitle }</div>
          <div class="catagory">
            <div>${rec.payment }원</div>
            <div  class = "blocation2">${rec.blocation }</div>
            <div>${rec.sdate }</div>
            <div>${rec.duration }분</div>
            <div class = "latitude2"  style= "display:none;">${rec.latitude }</div>
            <div class = "longitude2" style= "display:none;">${rec.longitude }</div>
          </div>
        </a>
          </c:forEach>       
      </div>
     </div>
     </div>
    
    <div class="board" >
      <div class="host">
        <div class="hostMenu">
          <div>고객센터</div>
        </div>
        
        <div class="hostBoard" id = "csboard">
          <div class="th" >
            <div style ="float:left; padding-top:7px; padding-bottom:7px; font-size:15px; text-align:center; width:100px;">글번호</div>
            <div style ="float:left; padding-top:7px; padding-bottom:7px; font-size:15px; text-align:center; width:790px;">제목</div>
            <div style ="float:left; padding-top:7px; padding-bottom:7px; font-size:15px; text-align:center; width:90px;">작성일자</div>
          </div>
           	
          <div class="tbody" >
         <c:forEach var ="rec" items = "${cslist }">
            <div class="tdata" >
              <div style ="float:left; padding-top:7px; padding-bottom:7px; font-size:15px; text-align:center; width:100px;"><a href = "${pageContext.request.contextPath}/csboard/view/${pc.rc.reqPage}/${rec.csbnum }">${rec.csbnum }</a></div>
              <div style ="white-space:nowrap; overflow:hidden;text-overflow:ellipsis;float:left; padding-top:7px; padding-bottom:7px; font-size:15px; width:790px;"><c:forEach begin="1" end="${rec.csbindent }">&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
      		<c:if test="${rec.csbindent > 0 }">
										<span style = "color:white; background-color:#5858FA; padding:5px;">답변</span>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test = "${rec.csbindent == 0 }">
				<span style = "color:white; background-color:#F79F81; padding:5px;">질문</span>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
      		<a href = "${pageContext.request.contextPath}/csboard/view/${pc.rc.reqPage}/${rec.csbnum }">${rec.csbtitle }</a></div>
              <div style ="padding-top:7px; padding-bottom:7px; float:left; font-size:15px; text-align:center; width:90px;"><fmt:formatDate value="${rec.csbcdate }" pattern="yyyy-MM-dd"/></div>
            </div>          
  			 </c:forEach>
          </div>
        </div>
	

      </div>
      <%-- <div class="guest" style ="width:510px;">
      	<img src = "<c:url value='/resources/img/하단이미지.png'/>"/>
       	
      </div> --%>
    </div>
    </c:if>
    <c:if test = "${member == null}">
    <div class="searchBar">
      <!-- <select>
        <option value="">시간</option>
        <option value="">장소</option>
        <option value="">금액</option>
        <option value="">아이디</option>
      </select>
      <div  id="searchInputWidth"><input type="text" id="searchInput"></div>
      <input type="button" value="검색"> -->
    </div>

    <div class="body">
      <div class="more-Body">
        <div>최근 의뢰자 게시물</div>
        <!-- <label for="count">목록 개수</label>
        <select id="listCount">
          <option value="10">10개</option>
          <option value="20">20개</option>
          <option value="30">30개</option>
          <option value="40">40개</option>
        </select>
        <input type="button" value="선택" id="listCountBtn">
        <a href="">
          더보기...
        </a> -->
      </div>
      
      <div class="bitem">
      <c:forEach var = "rec" items = "${list1 }">
        <a href="<c:url value='/board/view/${pc.rc.reqPage}/${rec.bnum} '/>" class="itemDescription">
          <div class="hot"><c:if test = "${rec.bbcid eq '1'}">의뢰</c:if></div>
          <div class="image">
          	<c:choose>
          	 <c:when test = "${rec.job eq '청소' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/청소.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '요리' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/요리.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '기타' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/기타.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '배달' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/배달.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '수리' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/수리.png'/>"></c:when>
          	</c:choose>
          	
          </div>
          <div>${rec.bnickname }</div>
          <div>${rec.job }</div>
          <div class = "btitle">${rec.btitle }</div>
          <div class="catagory">
            <div>${rec.payment }원</div>
            <div>${rec.blocation }</div>
            <div>${rec.sdate }</div>
            <div>${rec.duration }분</div>
          </div>
        </a>
          </c:forEach>
      </div>
      
      <div class="more-Body" style = "margin-top:20px;">
        <div>최근 해결사 게시물</div>
        <!-- <label for="count">목록 개수</label>
        <select id="listCount">
          <option value="10">10개</option>
          <option value="20">20개</option>
          <option value="30">30개</option>
          <option value="40">40개</option>
        </select>
        <input type="button" value="선택" id="listCountBtn">
        <a href="">
          더보기...
        </a> -->
      </div>
      
      <div class="bitem">
      <c:forEach var = "rec" items = "${list2 }">
        <a href="<c:url value='/board/view/${pc.rc.reqPage}/${rec.bnum} '/>" class="itemDescription">
          <div class="hot"><c:if test = "${rec.bbcid eq '2'}">해결가능</c:if></div>
          <div class="image">
          	<c:choose>
          	 <c:when test = "${rec.job eq '청소' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/청소.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '요리' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/요리.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '기타' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/기타.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '배달' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/배달.png'/>"></c:when>
          	 <c:when test = "${rec.job eq '수리' }"><img width="100%;" height = "100%;" src = "<c:url value='/resources/img/수리.png'/>"></c:when>
          	</c:choose>
          	
          </div>
          <div>${rec.bnickname }</div>
          <div>${rec.job }</div>
          <div class = "btitle">${rec.btitle }</div>
          <div class="catagory">
            <div>${rec.payment }원</div>
            <div>${rec.blocation }</div>
            <div>${rec.sdate }</div>
            <div>${rec.duration }분</div>
          </div>
        </a>
          </c:forEach>
      </div>
    
    </div>
    
    <div class="board">
      <div class="host">
        <div class="hostMenu">
          <div>고객센터</div>
        </div>
        
        <div class="hostBoard" id = "csboard">
          <div class="th" >
            <div style ="float:left; padding-top:7px; padding-bottom:7px; font-size:15px; text-align:center; width:100px;">글번호</div>
            <div style ="float:left; padding-top:7px; padding-bottom:7px; font-size:15px; text-align:center; width:790px;">제목</div>
            <div style ="float:left; padding-top:7px; padding-bottom:7px; font-size:15px; text-align:center; width:90px; ">작성일자</div>
          </div>
           	
          <div class="tbody" >
         <c:forEach var ="rec" items = "${cslist }">
            <div class="tdata" >
              <div style ="float:left; padding-top:7px; padding-bottom:7px; font-size:15px; text-align:center; width:100px;"><a href = "${pageContext.request.contextPath}/csboard/view/${pc.rc.reqPage}/${rec.csbnum }">${rec.csbnum }</a></div>
              <div style ="white-space:nowrap; overflow:hidden;text-overflow:ellipsis;float:left; padding-top:7px; padding-bottom:7px; font-size:15px; width:790px;"><c:forEach begin="1" end="${rec.csbindent }">&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
      		<c:if test="${rec.csbindent > 0 }">
										<span style = "color:white; background-color:#5858FA; padding:5px;">답변</span>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test = "${rec.csbindent == 0 }">
				<span style = "color:white; background-color:#F79F81; padding:5px;">질문</span>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
      		<a href = "${pageContext.request.contextPath}/csboard/view/${pc.rc.reqPage}/${rec.csbnum }">${rec.csbtitle }</a></div>
              <div style ="padding-top:7px; padding-bottom:7px; float:left; font-size:15px; text-align:center; width:90px;"><fmt:formatDate value="${rec.csbcdate }" pattern="yyyy-MM-dd"/></div>
            </div>          
  			 </c:forEach>
          </div>
        </div>
      </div>
    </div>
    </c:if>
  </div>
 
    <%@ include file="../main/footer.jsp"%>

</body>
</html>