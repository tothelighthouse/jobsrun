window.addEventListener("load",init, false);

	function init(){
		joinBtn1.addEventListener("click",function(e){
		  e.preventDefault(); //브라우저의 다른 행동을 막기위해 		  
		  if(checkValid()){
		      location.href = getContextPath() + "/member/joinForm";
		  }
		 },false);
		}

	function checkValid(){
		var check1Ele = document.getElementsByName('check1');
		var check2Ele = document.getElementsByName('check2');
		var flag = true;  
		var status = false;
		var status2 = false;
		
	    for(var check1 of check1Ele) {
	      if(check1.checked) {
	        status = true;
	        break;
	      }
	    }

	    if(!status) {
	       	 alert('이용약관에 동의해주세요!');
	         flag = flag && false;
	    } 

	    for(var check2 of check2Ele) {
		      if(check2.checked) {
		        status2 = true;
		        break;
		      }
		}
	    
	    if(!status2) {
	       	 alert('개인정보 수집 및 이용에 동의해주세요!');
	         flag = flag && false;
	    }   

		 return flag;
	    
		}