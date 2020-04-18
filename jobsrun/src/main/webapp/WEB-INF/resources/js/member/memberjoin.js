
window.addEventListener("load",init,false); 
function init(){
  joinBtn.addEventListener("click",function(e){
  e.preventDefault(); //브라우저의 다른 행동을 막기위해  
  if(checkValid() && idx==true){
      document.getElementById("memberjoinForm").submit(); 
      /*alert('가입이 완료되었습니다. 로그인해주세요!');*/
  }
  else if(idx==false){
	  alert('아이디 중복검사를 해주세요!');
	  return;
  }
	    
 },false);
}

function checkValid(){
	var flag = true; 
	var idEle = document.getElementById('id');
	var pwEle = document.getElementById('pw');
	var pwChkEle = document.getElementById('pwChk');
	var telEle = document.getElementById('tel');
	var nicknameEle = document.getElementById('nickname');
	var birthEle = document.getElementById('birth');
	var genderEle = document.getElementsByName('gender');
	var regionEle = document.getElementById('region');
	
	//1) 이메일 주소 체크
	   if(!isEmail(idEle.value)) {
	      id_errmsg.innerHTML = "이메일을 올바르게 입력하세요";
	      id_errmsg.style.color="red";
	      flag = flag && false;
	    }else{
	     id_errmsg.innerHTML = "";
	    }
	   
	 //2) 비밀번호 체크
	    if(!isPassword(pwEle.value)) {
	      pw_errmsg.innerHTML = "비밀번호가 잘못되었습니다. (6~15)자리 영문,숫자 특수문자 포함";
	      pw_errmsg.style.color="red";
	      flag = flag && false;    
	   }else{
	     pw_errmsg.innerHTML = "";
	    }
	  //3) 비밀번호 재확인
	    //3-1)비밀번호 패턴 체크
	    if(!isPassword(pwChkEle.value)) {
	      pwChk_errmsg.innerHTML = "비밀번호가 잘못되었습니다. (6~15)자리 특수문자, 영문, 숫자 조합";
	      pwChk_errmsg.style.color="red";
	      flag = flag && false;
	    }else{
	      pwChk_errmsg.innerHTML = "";
	    }
	    //3-2)비밀번호 일치 체크
	    if(pwEle.value != pwChkEle.value ) {
	      pwChk_errmsg.style.color="red";
	      pwChk_errmsg.innerHTML = "비밀번호가 일치하지 않습니다.";
	      flag = flag && false;
	    }else {
	      pwChk_errmsg.innerHTML = "";
	    }
	    
	  //4) 전화번호
	    if(!isTel(telEle.value)) {
	      tel_errmsg.innerHTML = "전화번호가 잘못되었습니다. -빼고 입력하세요";
	      tel_errmsg.style.color="red";
	      flag = flag && false;
	    }else{
	    tel_errmsg.innerHTML = "";
	    }  
	    		
	    //7)닉네임
	    if(!isNickname(nicknameEle.value)) {
	        nickname_errmsg.innerHTML = "닉네임은 2~10글자로 지정해주세요!";
	        nickname_errmsg.style.color="red";
	        flag = flag && false;
	    }else{
	        nickname_errmsg.innerHTML = "";
	    } 
	    
	    if(!isBirth(birthEle.value)) {
	    	birth_errmsg.innerHTML = "생년월일이 올바르지 않습니다.";
	    	birth_errmsg.style.color="red";
	       flag = flag && false;
	   } 
	   else{
	   	birth_errmsg.innerHTML = "";
	   }
	    
	    //6) 성별
	    var status = false;
	    for(var gender of genderEle) {
	      if(gender.checked) {
	        status = true;
	        break;
	      }
	    }
	    if(!status) {
	     gender_errmsg.innerHTML = "성별을 선택해주세요!";
	     gender_errmsg.style.color="red";
	      flag = flag && false;
	    }else{
	      gender_errmsg.innerHTML = "";
	    }
	    
	    if(regionEle.value == ""){
	    	region_errmsg.innerHTML = "주소를 입력하세요!";
	    	region_errmsg.style.color="red";
	    	 flag = flag && false;
	    }else{
	      region_errmsg.innerHTML = "";
	    }	
	 
  return flag;
}    
 //이메일 체크 정규식
function isEmail(asValue) {
  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	
}

//비밀번호 체크 정규식
function isPassword(asValue) {
  var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/; //  6 ~ 15자 특수문자, 영문, 숫자 조합
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

//핸드폰 번호 체크 정규식
function isTel(asValue) {
  var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}
//닉네임 정규식
function isNickname(asValue){
    var reg = /^[가-힣]{2,10}$/;
    return reg.test(asValue);// 한글 이름 2~10자 이내
}
//생년월일
function isBirth(asValue){
	var regExp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	return regExp.test(asValue);
}


