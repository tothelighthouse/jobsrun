<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/member/joinForm.css'/>">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" >
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" >
  <script src="<c:url value ='/resources/js/member/memberjoin.js'/>"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="<c:url value='/resources/js/common.js'/>"></script>

<!-- 아이디 중복체크 스크립트 외부 js에다가 할려했는데 jquery가 안먹어서 여기에다가 했습니다. --이두희-- -->

<script type="text/javascript">
var idx = false;
$(document).ready(function(e){
	console.log("idx = " + idx);
	$('#check').click(function(){
		$.ajax({	
			url: getContextPath() + "/member/idCheck",
			type: "GET",
			data:{
				"id":$('#id').val()
			},
			success: function(data){
				if(data == 0 && $.trim($('#id').val()) != '' ){
					idx=true;
					$('#id').empty();
					alert('중복된 아이디가 없습니다.');
				}
				else if(data == 0){
					alert('아이디를 입력하세요');
				}
				else{
					alert('중복된 아이디 입니다.');
					console.log(data);
				}
				console.log("idx = " + idx);
			},			
			error: function(){
				alert("서버에러");
			}
		});
		
	});    	
});
</script>
<!-- 아이디 중복체크 스크립트 끝 -->
</head>

<body>
  <div class="container">
  	
   	<%@ include file="../main/header.jsp"%>
  	
    <div class="body">
    	
      <div id ="title">회원가입</div>
      <form:form id = "memberjoinForm" enctype = "multipart/form-data"
                					 method = "post" modelAttribute="mvo" 
                					 action ="${pageContext.request.contextPath }/member/join" class="joinForm-dh">
      	<div id = "formtitle"><span id ="formtitlespan">회원정보 입력</span> <span style ="margin-left:550px; line-height:30px;"><b>*</b>표시된 항목은 필수입니다.</span></div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="id">아이디<b>*</b></form:label></div>
      		<div class ="condiv" id="iddiv"><form:input type="text" path="id" cssClass="inputtext"/></div>
      		<div class ="checkdiv"><button type="button" class="idcheckBtn" id="check">중복검사</button></div>
      		<div class ="message" id="id_errmsg">실제로 보유 하고 있는 이메일을 입력하세요.</div>	
      	</div>
      	
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="pw">비밀번호<b>*</b></form:label></div>
      		<div class ="condiv"><form:input type="password" path="pw" cssClass="inputtext" /></div> 
      		<div class ="message" id="pw_errmsg">비밀번호는 특수문자, 영문 숫자 포함 6~15 자리로 입력하세요.</div>	
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">비밀번호 확인<b>*</b></div>
      		<div class ="condiv"><input class="inputtext" name = "pwChk" id="pwChk" type="password"/></div>
      		<div class ="message" id="pwChk_errmsg"></div> 
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="tel">전화번호<b>*</b></form:label></div>
      		<div class ="condiv"><form:input type="text" path="tel" cssClass="inputtext" /></div> 
      		<div class ="message" id="tel_errmsg">-빼고 입력하세요</div>	
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="nickname">닉네임<b>*</b></form:label></div>
      		<div class ="condiv"><form:input type="text" path="nickname" cssClass="inputtext"/></div> 
      		<div class ="message" id="nickname_errmsg">한글 닉네임 2~10글자로 입력해주세요</div>	
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="birth">생년월일<b>*</b></form:label></div>
      		<div class ="condiv"><form:input type="date" path="birth" cssClass="inputtext" /></div>   
      		<div class ="message" id="birth_errmsg"></div>   		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv"><form:label path="gender">성별<b>*</b></form:label></div>
      		<div class ="condiv">
      			<form:radiobuttons path="gender" items="${gender }" itemValue="code" itemLabel="label"/>
      		</div>
      		<div class ="message" id="gender_errmsg"></div>      		
      	</div>
      	<div class = "regionwrapdiv">
      	<div class ="textdiv">주소<b>*</b></div>
      	<div class ="regioncondiv">
      		<input type="text" class = "api" id="sample6_postcode" placeholder="우편번호">
			<input type="button" class = "api" id="saple6_check" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" class = "api" id="sample6_address" placeholder="주소"><br>
			<input type="text" class = "api" id="sample6_extraAddress" placeholder="참고항목">			
			<form:input type = "text" cssClass = "regioncss" path = "region" style = "display:none; width:300px;"/> 
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
               /*  // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                
                document.getElementById("sample6_detailAddress").value = detailAddress; */

                //테이블에 컬럼이 region 컬럼 하나이기 때문에 한번에 담기 위해서 input.value의 값들을  region 이라는 input type에 담음
                /* document.getElementById("region").value = data.zonecode + " " + addr + " " + extraAddr */
                 document.getElementById("region").value = addr + extraAddr
            }
        }).open();
    }
</script>
<!-- 주소 API 스크립트 부분 끝-->		
      	</div>
      	<div class = "wrapdiv">
      		<div class ="textdiv">프로필 사진</div>
      		<div class ="condiv"><form:input type="file" path="file" cssClass="inputtext" /></div>      		
      	</div>
      	<%-- <div class = "wrapdiv">
      		<div class ="textdiv">고액 추천 여부</div>
      		<div class ="condiv">
      			<form:checkbox id="checkmoney" path="moneyrecommend" value = "1"/>
      			<form:checkbox id="checkmoney" path="moneyrecommend" value = "0" checked = "checked" style="display:none;"/>
      		</div>
      		 <div class ="message">높은 보수의 의뢰를 우선적으로 추천 받을지에 대해 체크합니다.</div>	        		 		
      	</div> --%>
      	<div id = "bottom">
      		<button type = "submit" id = "joinBtn">가입</button>
      		<button type = "button" id = "cancel">취소</button>
      	</div>
      	
      </form:form>
    </div>
    <!-- end body -->
    

  </div>
    <%@ include file="../main/footer.jsp"%>
