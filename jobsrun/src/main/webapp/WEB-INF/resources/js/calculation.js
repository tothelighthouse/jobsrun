window.addEventListener("load", init, false);

function init(){
	//잔액이 표시될 요소
	let balancea = document.getElementById("balancea");
	let xhttps = new XMLHttpRequest();
	let nicka = document.getElementById('nicka');
	xhttps.addEventListener("readystatechange", function(){
		if(this.readyState == 4 && this.status == 200){
			console.log(this.responseText);
			//계산된 잔액 
			if(document.getElementById("myPoint")){
				document.getElementById("myPoint").innerHTML = this.responseText;
			}
			balancea.innerHTML = this.responseText;
			nicka.style.position = 'relative';
			nicka.style.top = '21.5px';
			
		}
	},false)
	
	
	xhttps.open("GET", "http://localhost:9080" + getContextPath() + "/DebitCredit/calculation");
	xhttps.send();
	
}