window.addEventListener("load",init,false);

function init(){
  writeBtn.addEventListener("click",function(e){
  e.preventDefault(); //브라우저의 다른 행동을 막기위해  
  if(checkValid()){
      document.getElementById("csboardVO").submit();   
  }    
 },false);
}

function checkValid(){
	var flag = true; 
	var titleEle = document.getElementById('csbtitle');
	var contentEle = document.getElementById('csbcontent');

	if(titleEle.value == "") {
		alert('제목을 입력해주세요');
		flag = flag && false;
	}
	
	if(contentEle.value == ""){
		alert('내용을 입력하세요');
		flag = flag && false;
	}
  return flag;
}    

