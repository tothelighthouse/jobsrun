window.addEventListener("load",init, false);
var myEditor;
function init(){
	myEditor = CKEDITOR.replace( 'bcontent' );
	changeMode(false);

	let bcategory = document.getElementById("boardCategoryVO.bcid").value
	let modifyBtn = document.getElementById('modifyBtn');
	let deleteBtn = document.getElementById('deleteBtn');
		
  //수정
  if(modifyBtn != null) {
	modifyBtn.addEventListener("click",function(e){
	e.preventDefault();
	//console.log("수정");
		changeMode(true);
		
		myEditor.setReadOnly(false);
		mapdiv.style.display = 'none';
		filediv.style.display = 'none';
		
	},false);
  }
  //삭제
  if(deleteBtn != null){
	deleteBtn.addEventListener("click",function(e){
	e.preventDefault();
	//console.log("삭제"+e.target.getAttribute('data-del_bnum'));

	if (confirm("삭제하시겠습니까?")){
		let returnPage = e.target.getAttribute('data-returnPage');
		let bnum = e.target.getAttribute('data-bnum');
		location.href = getContextPath()+"/board/delete/"+bcategory+"/"+returnPage+"/"+bnum;
		} 
	},false);
  }

  	//취소(수정모드->읽기모드)
  	let cancelBtn = document.getElementById("cancelBtn")
	cancelBtn.addEventListener("click",function(e){
		e.preventDefault();
		console.log("취소");
			changeMode(false);
			mapdiv.style.display = 'block';
			filediv.style.display = 'block';
			myEditor.setReadOnly(true);
		},false);
  	//저장	
  	let saveBtn = document.getElementById("saveBtn")
	saveBtn.addEventListener("click",function(e){
		e.preventDefault();
		console.log("저장");
		//유효성 체크
		if(validate().length > 0){
			//입력하지 않은 요소 목록
			let unvalidList = validate().join(', ');
			alert(unvalidList + "를 입력하세요");
		}else{
			document.getElementById('boardVO').submit();
		}
	},false);      

  //목록
  	let listBtn = document.getElementById("listBtn")
	listBtn.addEventListener("click",function(e){
		e.preventDefault();
		e.stopPropagation()
		console.log("목록");
		let returnPage = e.target.getAttribute('data-returnPage');
		console.log("returnPage:", returnPage)
		location.href=getContextPath()+"/board/boardlistAll/" + bcategory + "/" + returnPage;
	},false);   

	//첨부파일 1건 삭제 : Ajax로 구현함.
	let fileList = document.getElementById('fileList');
	if(fileList != null ) {
		fileList.addEventListener("click",function(e){
			console.log(e.target); //이벤트가 발생된 요소
			console.log(e.currentTarget);//이벤트가 등록된 요소
			console.log(e.target.tagName);
			//선택된 요소가 첨부파일 삭제 아이콘일때만 삭제처리 수행
			if(e.target.tagName != 'I') return false;
			if(!confirm('삭제하시겠습니까?')) return false;
			//실제 이벤트가 발생한요소의 data-del_file속성값 읽어오기
			let fid = e.target.getAttribute('data-del_file');

		  //AJAX 사용
		  //1) XMLHttpRequest객체 생성	
		  var xhttp = new XMLHttpRequest();
		  
		  //2) 서버응답처리
		  xhttp.addEventListener("readystatechange",ajaxCall,false);
		  function ajaxCall(){
			  if (this.readyState == 4 && this.status == 200) {
				  console.log(this.responseText);
				  if(this.responseText == "success"){
				  	console.log('성공!!');
				  	//삭제대상 요소 찾기
				  	let delTag = e.target.parentElement.parentElement.parentElement;
				  	//부모요소에서 삭제대상 요소 제거
				  	fileList.removeChild(delTag); 
				  }else{
				  	console.log('실패!!');
				  }
			  }
		  }
		 	  			  
		  //post방식
		  xhttp.open("DELETE","http://localhost:9080/portfolio/board/file/"+fid,true);
		  xhttp.send();
		},false);  
	}
	//읽기 모드 , 수정모드
	function changeMode(flag){						
			let rmodes = document.getElementsByClassName("rmode");
			let umodes = document.getElementsByClassName("umode");
			
		//수정모드	
		if(flag){
			//제목변경 => 게시글 보기
//			document.getElementById("title").textContent = '게시글 수정';
			//제목 필드,내용 필드
			document.getElementById("btitle").removeAttribute("readOnly");			
			document.getElementById("bcontent").removeAttribute("readOnly");
			
			//라디오 버튼 활성화
			let radioBtns = document.querySelectorAll("input[type='radio']")
			Array.from(radioBtns).forEach(e=>e.removeAttribute("disabled"));
			
			//날짜 시간 필드 활성화
			document.querySelector("[type='date']").removeAttribute("disabled");
			document.querySelector("[type='time']").removeAttribute("disabled");
			
			//수정모드버튼 활성화
			Array.from(rmodes).forEach(e=>{e.style.display="none";});
			Array.from(umodes).forEach(e=>{e.style.display="block";});
		//읽기모드	
		}else{
			//제목변경 => 게시글 보기
//			document.getElementById("title").textContent = '게시글 보기';
			//제목 필드,내용 필드
			document.getElementById("btitle").setAttribute("readOnly",true);
			document.getElementById("bcontent").setAttribute("readOnly",true);	
			
			//라디오 버튼 활성화
			let radioBtns = document.querySelectorAll("input[type='radio']")
			Array.from(radioBtns).forEach(e=>e.setAttribute("disabled", "disabled"));
			
			//날짜 시간 필드 활성화
			document.querySelector("[type='date']").setAttribute("disabled", "disabled");
			document.querySelector("[type='time']").setAttribute("disabled", "disabled");

			
			//읽기모드버튼 활성화				
			Array.from(rmodes).forEach(e=>{e.style.display="block";});
			Array.from(umodes).forEach(e=>{e.style.display="none";});
		}			
	}
}

function validate(){
	let unvalidateItems = [];
	
	//필수 입력 요소 검색
	let btitle = document.getElementById("btitle");
//	let bcontent = document.getElementById("bcontent");
	let job = document.getElementsByName("job")
	let duration = document.getElementsByName("duration")
	let payment = document.getElementsByName("payment");
	let sdate = document.getElementById("sdate");
	let stime = document.getElementById("stime");
	let blocation = document.getElementById("blocation");
	
	//제목 입력 여부
	if(!btitle.value){
		unvalidateItems.push("제목");
	}
//	//내용 입력 여부
//	if(!bcontent.value){
//		unvalidateItems.push("내용");
//	}
	//일 종류 입력 여부
	let jobVal = Array.from(job).filter(e => e.checked)
	if(!jobVal.length){
		unvalidateItems.push("일 종류");
	}
	//기간 입력 여부
	let durationVal = Array.from(duration).filter(e => e.checked)
	if(!durationVal.length){
		unvalidateItems.push("기간");
	}
	//금액 입력 여부
	let paymentVal = Array.from(payment).filter(e => e.checked)
	if(!paymentVal.length){
		unvalidateItems.push("금액");
	}
	//시작 날짜 입력 여부
	if(!sdate.value){
		unvalidateItems.push("시작 날짜");
	}
	//시작 시간 입력 여부
	if(!stime.value){
		unvalidateItems.push("시작 시간");
	}
	
	//지역 입력 여부
	if(!blocation.value){
		unvalidateItems.push("지역");
	}
	
	
	//누락된 요소 리턴
	return unvalidateItems;
	
}









