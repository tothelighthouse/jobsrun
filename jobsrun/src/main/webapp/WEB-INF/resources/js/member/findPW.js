/*window.addEventListener("load", init, false);

function init(){
	  var findPWBtn = window.document.getElementById("findPWBtn");
	  
	  findPWBtn.addEventListener("click",function(e){
		  console.log('클릭됨');
	     if (checkFindID()){
	    	 document.getElementById("findPWForm").submit(); 
	     }
	  },false);
	}

	//전화번호, 생년월이 유효성 체크
	function checkFindID(){
	  //사용자가 입력한 전화번호 읽어오기	
	  var telTag = document.getElementById("telinput-input");
	  var telValue = telTag.value;
	  //사용자가 입력한 생년월일 읽어오기
	  var birthTag = document.getElementById("birthinput-input");
	  var birthValue = birthTag.value;
	  
	  var flag = true; //유효성 성공유뮤 플래그
	  
	  //1) 전화번호 체크
	  if(telValue.trim().length == 0){
		telMsgwrap.style.display = "block";
	    telMsg.innerHTML="전화번호를 입력하세요!";
	    telMsg.classList.add("errmsg");     
	    telTag.focus();
	    flag = false;
	    return flag;
	  }
	  //2) 생년월일체크
	  if(birthValue.trim().length == 0){
	    telMsg.innerHTML="";
	    telMsgwrap.style.display = "none";
	    birthMsgwrap.style.display = "block";
	    birthMsg.innerHTML="생년월일를 입력하세요!";
	    birthMsg.classList.add("errmsg");  
	    birthTag.focus();
	    flag = false;
	    return flag;
	  }
	  telMsg.innerHTML="";
	  birthMsg.innerHTML="";
	  return flag;
	}*/