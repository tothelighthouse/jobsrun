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
  <link rel="stylesheet" href="<c:url value='/resources/css/member/modifyForm.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
	<script src="<c:url value ='/resources/js/member/modifyForm.js'/>"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.addEventListener("load",init2,false); 

function init2(){
	//첨부파일 1건 삭제 : Ajax로 구현함.
	let fileList = document.getElementById('fileList');
	if(fileList != null ){
		fileList.addEventListener("click",function(e){
			console.log("타겟" + e.target); //이벤트가 발생된 요소
			console.log(e.currentTarget);//이벤트가 등록된 요소
			console.log(e.target.tagName);//선택된 요소가
			if(e.target.tagName != 'I') return false;			
			if(!confirm('삭제하시겠습니까?')) return false;
			//실제 이벤트가 발생한요소의 data-del_file속성값 읽어오기
			let id = e.target.getAttribute('data-del_file');
			console.log(id);
		  //AJAX 사용
		  //1) XMLHttpRequest객체 생성	
		  var xhttp = new XMLHttpRequest();
		  
		  //2) 서버응답처리
		  xhttp.addEventListener("readystatechange",ajaxCall,false);
		  function ajaxCall(){
			  if (this.readyState == 4 && this.status == 200) {
				  console.log(this.responseText);
				  if(this.responseText == "success"){
				  	console.log('성공!!');
				  	//삭제대상 요소 찾기
					  	let delTag = e.target.parentElement.nextElementSibling;
					  	//부모요소에서 삭제대상 요소 제거
				  	fileList.removeChild(delTag); 
				  	
				  }else{
				  	console.log('실패!!');
				  }
			  }
		  }
		 	  			  
		  //post방식
		  xhttp.open("DELETE","http://localhost:9080/run/member/file/"+id ,true);
		  xhttp.send();
		},false);  
	}
    } 
</script>
</head>
<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
  	
    <div class="body">
      <div id ="title">회원정보 수정</div>
      <form:form id ="modifyForm" class="joinForm-dh"
                enctype = "multipart/form-data"
                method = "post" modelAttribute="mvo" 
                action ="${pageContext.request.contextPath }/member/modify">
                
      	<div id = "formtitle"><span id ="formtitlespan">회원정보 입력</span> </div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="id">아이디</form:label></div>
      		<div class ="condiv" id="iddiv"><form:input type="text" path="id" readonly ="true" style = "border:none;" cssClass="inputtext"/></div>  		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="pw">비밀번호</form:label></div>
      		<div class ="condiv">
      		<form:input type="password" path="pw" cssClass="inputtext" placeholder="계정의 비밀번호를 입력하세요"/></div> 
      		<div class ="message" id="pw_errmsg" style= "color:red;">
      			${svr_msg }
      		</div>
      	</div>

      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="tel">전화번호</form:label></div>
      		<div class ="condiv"><form:input type="text" path="tel" cssClass="inputtext" /></div>
      		<div class ="message" id="tel_errmsg"></div> 	
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="nickname">닉네임</form:label></div>
      		<div class ="condiv"><form:input type="text" path="nickname" cssClass="inputtext"/></div> 
      		<div class ="message" id="nickname_errmsg"></div>	
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="birth">생년월일</form:label></div>
      		<div class ="condiv"><form:input type="date" path="birth" cssClass="inputtext" /></div>   
      		<div class ="message" id="birth_errmsg"></div>   		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="gender">성별</form:label></div>
      		<div class ="condiv">
      			<form:radiobuttons path="gender" items="${gender }" itemValue="code" itemLabel="label"/>
      		</div>
      		<div class ="message" id="gender_errmsg"></div>      		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="region">주소</form:label></div>
      		<div class ="condiv">
      			<form:input type = "text" cssClass = "regioncss" path = "region" style = "width:300px; border:none;"/>
      		</div>      		
      	</div>
      	
      	<div class = "regionwrapdiv">
      	<div class ="textdiv">주소 변경</div>
      	<div class ="regioncondiv">
      		<input type="text" class = "api" id="sample6_postcode" placeholder="우편번호">
			<input type="button" class = "api" id="saple6_check" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" class = "api" id="sample6_address" placeholder="주소"><br>
			<input type="text" class = "api" id="sample6_extraAddress" placeholder="참고항목">			
		</div>
		<div class ="message" id="region_errmsg" style = "position:relative; top:80px; right:320px;"></div>
<!-- 주소 API 스크립트 부분 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>	
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.         
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
					console.log("addr = " + addr);
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                    console.log("addr = " + addr);
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("region").value = addr + " " + extraAddr
            }
        }).open();
    }
</script>
<!-- 주소 API 스크립트 부분 끝-->		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">프로필 사진</div>
      		<div class ="condiv" id ="fileList">${mvo.fname } 
      		<c:if test="${mvo.fname != null }"><i class="fas fa-times" data-del_file="${mvo.id }" style = "position:relative; left:10px;"></i></c:if>
      		</div>      		     		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">프로필 사진 변경</div>
      		<div class ="condiv"><form:input type="file" path="file" cssClass="inputtext" /></div>      		
      		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">고액 추천 여부</div>
      		<div class ="condiv">
      			<form:checkbox id="checkmoney" path="moneyrecommend" value = "1"/>
      			<form:checkbox id="checkmoney" path="moneyrecommend" value = "0" checked = "checked" style="display:none;"/>
      		</div>
      		 <div class ="message">높은 보수의 의뢰를 우선적으로 추천 받을지에 대해 체크합니다.</div>	   
      				
      	</div>
      	<div id = "bottom">
      		<button type = "submit" id = "ok">수정하기</button>

      	</div>
      	
      </form:form>
    </div>
    <!-- end body -->
  </div>
 <%@ include file="../main/footer.jsp"%>
</body></html>