window.addEventListener("load",init,false); // true 이면 Capturing  ,false 이면 Bubling 방식으로 이벤트가 전달된다.


function init(){
  ok.addEventListener("click",function(e){
    e.preventDefault(); //브라우저의 다른 행동을 막기위해 

    if(checkValid()){
      // 유효성 통과하면 메인화면으로 이동
      document.getElementById("modifyForm").submit();
    }
  },false);
  
  
}

function checkValid(){
  var idEle = document.getElementById('id');
  var telEle = document.getElementById('tel');
  var birthEle = document.getElementById('birth');
  var nicknameEle = document.getElementById('nickname');
  var flag = true; /* 회원가입 유효성 체크 유무 */

  //4) 전화번호
    if(!isTel(telEle.value)) {
      tel_errmsg.innerHTML = "전화번호가 잘못되었습니다. -빼고 입력하세요";
      tel_errmsg.style.color = "red";
      flag = flag && false;
    }else{
      tel_errmsg.innerHTML = "";
    }    
  
    //7)닉네임
    if(!isNickname(nicknameEle.value)) {
        nickname_errmsg.innerHTML = "닉네임은 한글 2~10글자 입니다";
        nickname_errmsg.style.color = "red";
        flag = flag && false;
      }else{
        nickname_errmsg.innerHTML = "";
      }
    
    //생년월일
    if(!isBirth(birthEle.value)) {
    	birth_errmsg.innerHTML = "생년월일이 올바르지 않습니다.";
    	birth_errmsg.style.color = "red";
       flag = flag && false;
   }
   
   else{
   	birth_errmsg.innerHTML = "";
   }
   return flag;
    
    
}
// 이메일 체크 정규식
function isEmail(asValue) {
  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	
}

// 핸드폰 번호 체크 정규식
function isTel(asValue) {
  var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

//비밀번호 체크 정규식
function isPassword(asValue) {
    
  var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/; //  6 ~ 15자 특수문자, 영문, 숫자 조합
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

//닉네임 정규식
function isNickname(asValue){
    var reg = /^[가-힣]{2,10}$/;
    return reg.test(asValue);// 한글 이름 2~4자 이내
}

function isBirth(asValue){
	var regExp = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	return regExp.test(asValue);
}
