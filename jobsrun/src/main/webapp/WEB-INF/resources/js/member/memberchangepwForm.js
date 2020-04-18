window.addEventListener("load",init,false); // true 이면 Capturing  ,false 이면 Bubling 방식으로 이벤트가 전달된다.

function init(){
	changepwBtn.addEventListener("click",function(e){
    e.preventDefault(); //브라우저의 다른 행동을 막기위해 

    if(checkValid()){
      document.getElementById("changepwForm").submit();
    }
  },false);
}

function checkValid(){
  var presentpwEle = document.getElementById('presentpw');
  var ppw = document.getElementById('ppw').innerHTML;
  var errmsg = document.getElementById('errmsg');
  
  var pwEle = document.getElementById('pw');
  var pwChkEle = document.getElementById('pwChk');
  var flag = true; /* 회원가입 유효성 체크 유무 */
  console.log(ppw);
  
  if(presentpwEle.value != ppw){
	  errmsg.innerHTML = "비밀번호가 일치하지 않습니다.!";
	  errmsg.style.position = "relative";
	  errmsg.style.top = "5px";
	  errmsg.style.color = "red";
	  errmsg.style.marginLeft = "40px";
	  flag = flag && false;
  }
  else{
	  errmsg.innerHTML = "";
	  errmsg.style.marginLeft = "0px";
  }
  
  //2) 비밀번호 체크
  if(!isPassword(pwEle.value)) {
    pw_errmsg.innerHTML = "비밀번호는 (6~15)자리 영문,숫자 특수문자 포함";
    pw_errmsg.style.color="red";
    pw_errmsg.style.position = "relative";
    pw_errmsg.style.top = "5px";
    pw_errmsg.style.marginLeft = "40px";
    flag = flag && false;    
 }else{
   pw_errmsg.style.marginLeft = "0px";
   pw_errmsg.innerHTML = "";
  }

  //3-2)비밀번호 일치 체크
  if(pwEle.value != pwChkEle.value ) {
    pwChk_errmsg.style.color="red";
    pwChk_errmsg.style.position = "relative";
    pwChk_errmsg.style.top = "5px";
    pwChk_errmsg.innerHTML = "비밀번호가 일치하지 않습니다.";
    pwChk_errmsg.style.marginLeft = "40px";
    flag = flag && false;
  }else {
    pwChk_errmsg.innerHTML = "";
  }
   return flag;  
}

//비밀번호 체크 정규식
function isPassword(asValue) {
  var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/; //  6 ~ 15자 특수문자, 영문, 숫자 조합
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

