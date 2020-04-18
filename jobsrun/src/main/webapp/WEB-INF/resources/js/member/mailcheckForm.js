window.addEventListener("load",init,false); // true 이면 Capturing  ,false 이면 Bubling 방식으로 이벤트가 전달된다.

function init(){
	ok2.addEventListener("click",function(e){
	console.log('클릭됨');
    e.preventDefault(); //브라우저의 다른 행동을 막기위해 
    console.log(memberid.innerHTML);
    if(checkValid()){
      document.getElementById("mailcheckForm").submit();
    }
  },false);
}

function checkValid(){
  var memberid = document.getElementById('memberid').innerHTML;
  var id = document.getElementById('id').value;
  var flag = true; 
  
  if(id != memberid){
	  errmsg.style.display="block";
	  errmsg.innerHTML = "이메일이 일치하지 않습니다.!";
	  flag = flag && false;
  }
  else{
	  errmsg.innerHTML = "";
  }
  return flag;
	
}