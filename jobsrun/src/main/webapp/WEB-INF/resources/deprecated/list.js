window.addEventListener("load", init, false);
function init() {
	
	//의뢰맡기 버튼 리스트
	let btns = document.querySelectorAll("[data-bnum]")
	for(let btn of btns){
	//각버튼에 이벤트 리스너 설정	
	btn.addEventListener("click", function(e){
	//클릭한 글번호
	let bnum = e.target.getAttribute("data-bnum")
	
	var xhttp = new XMLHttpRequest();
	
	
	var sendData = {};
	sendData.bnum   = bnum;
	sendData.bstatus   = 1;
	//자바스크립트 obj => json포맷 문자열 변환
	var result = JSON.stringify(sendData);
	console.log(result);
	
	xhttp.addEventListener("readystatechange",ajaxCall,false);
	function ajaxCall(){
		if (this.readyState == 4 && this.status == 200) {
			console.log(this.responseText);
			//json포맷 문자열  => 자바스크립트 obj
//			var jsonObj = JSON.parse(this.responseText)
			if(this.responseText == 'success'){
				console.log('지원 성공!!');
				location.href=getContextPath() + "/member/myPage";
			}else{
				console.log('지원 실패!!');
				location.href=getContextPath() + "/member/myPage";

			}
		}
	}
	
	xhttp.open("POST","http://localhost:9080"+getContextPath()+"/board/application",true);
//	xhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
	xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8");
	xhttp.send(result);
//	xhttp.send("result="+result);
	}, false)
	}
}