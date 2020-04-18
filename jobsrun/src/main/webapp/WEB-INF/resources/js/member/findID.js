window.addEventListener("load",init,false);

function init(){
  var findIDBtn = window.document.getElementById("findIDBtn");
  findIDBtn.addEventListener("click",function(e){
	  console.log('클릭됨');
    var result = checkFindID();

    if(result){    
     var xhttp = new XMLHttpRequest();
     
     xhttp.addEventListener("readystatechange",ajaxCall,false);
     function ajaxCall(){
		   if (this.readyState == 4 && this.status == 200) {
			  console.log(this.responseText);
			  idfind.style.display = "block";
			//json포맷 문자열  => 자바스크립트 obj
			  var jsonObj = JSON.parse(this.responseText)
			  //console.log(jsonObj.id);
			  if(jsonObj.success){
					document.getElementById("id").value = jsonObj.id;
					document.getElementById("joindate").value = jsonObj.cdate;
					document.getElementById("joindate").style.textAlign = "center";
					document.getElementById("joindate").style.color = "red";
					document.getElementById("id").style.textAlign = "center";
					document.getElementById("birthMsg").innerHTML = "";
					document.getElementById("telMsgwrap").display = "none";
			  }else{
					document.getElementById("id").value = "";
					document.getElementById("joindate").value = "";
					document.getElementById("telMsgwrap").style.display = "none";
					document.getElementById("joindatewrap").style.display = "none";					
					document.getElementById("idfind").innerHTML = jsonObj.msg;
					document.getElementById("idfind").style.color = "red";
					document.getElementById("idfind").style.textAlign = "center";
					document.getElementById("idfind").style.lineHeight= "120px";
			  }
		   }
     }
     
		 //3) 서비스 요청
     var sendData = {};
     sendData.tel   = document.getElementById("telinput-input").value;
     sendData.birth = document.getElementById("birthinput-input").value;
     //자바스크립트 obj => json포맷 문자열 변환
     var result = JSON.stringify(sendData);
     console.log(result);
     
     //post방식
     xhttp.open("POST","http://localhost:9080/run/member/id",true);
     xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
     xhttp.send(result);
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
}