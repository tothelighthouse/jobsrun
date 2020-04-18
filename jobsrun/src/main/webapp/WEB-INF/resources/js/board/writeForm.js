window.addEventListener("load", init, false);
let boardImage = [];
var myEditor;

function init(){
	myEditor = CKEDITOR.replace( 'bcontent' );
	//리턴 페이지 값
	let listBtn = document.querySelector("[data-returnPage]");
	let returnPage = listBtn.getAttribute("data-returnPage")
	
	//카테고리
	let bcategory = document.getElementById("boardCategoryVO.bcid").value;
	
	listBtn.addEventListener("click", function(e){
		e.preventDefault();
		location.href = getContextPath() + "/board/list/" + bcategory + "/" + returnPage;
	}, false)

	
	writeBtn.addEventListener("click", function(e){
		e.preventDefault();
		//유효성 체크
		if(validate().length > 0){
			//입력하지 않은 요소 목록 
			let unvalidList = validate().join(', ');
			alert(unvalidList + "를 입력하세요");
		}else{
			document.getElementsByClassName("writeForm")[0].submit();
		}
	}, false)
	
  let picContainer =document.getElementsByClassName("picContainer")[0];
  picContainer.addEventListener("dragover", function(e){
	  e.stopPropagation();
	  e.preventDefault();

	  dragOver(e);
  }, false);
  
  picContainer.addEventListener("dragleave", function(e){
	  e.stopPropagation();
	  e.preventDefault();

	 dragOver(e);
  }, false);
  
  picContainer.addEventListener("drop", function(e){
	  e.stopPropagation();
	  e.preventDefault();

	  if(e.currentTarget.children.length > 5){
		  e.preventDefault();
		  e.stopPropagation();
		  alert("사진은 최대 5장 등록 가능합니다");
		  e.currentTarget.style.backgroundColor = "white";
		  e.currentTarget.style.outlineOffeset = "-10px"
		  return;
	  }
	  return uploadFiles(e);
  }, false);
  
  function dragOver(e){
	  e.stopPropagation();
	  e.preventDefault();
	  if(e.type == "dragover"){
		  e.currentTarget.style.backgroundColor = "gray";
		  e.currentTarget.style.outlineOffeset = "-20px"
	  }
	  else{
		  e.currentTarget.style.backgroundColor = "white";
		  e.currentTarget.style.outlineOffeset = "-10px"
	  }
  }
  
  function uploadFiles(e){
	  e.stopPropagation();
	  e.preventDefault();
	  dragOver(e);
	  console.log(e.target);
	  let files = e.target.files || e.dataTransfer.files;
	  console.log("files:" , files)
	  
	  if(files.length > 5){
		  console.log(files.length);
		  alert("사진은 최대 5장 등록 가능합니다");
		  return;
	  }
	  
	  if(Array.from(files).some(file => file.size > 1024 * 300)){
		  alert('300kb 미만의 이미지만 첨부 가능합니다.')
		  return;
	  }
	  
	  let reg = /image\/\/*/;
	  if(!Array.from(files).some(file => file.type.match(reg))){
		  alert('이미지가 아닙니다.')
		  return;
	  }
	  
	  Array.from(files).forEach((file, index)=>{
		let pic = document.getElementById("pic");
		let div = pic.cloneNode(true)
		div.style.display = "grid"
		div.children[0].addEventListener("click", function(){
			div.remove();
		})
		div.children[1].style.backgroundImage = "url(" + window.URL.createObjectURL(file) + ")";
		div.children[1].style.backgroundSize = "100% 100%";
		div.children[2].innerHTML = file.name
	    e.currentTarget.appendChild(div);
/*	    boardImage.push(file);
	    console.log("boardImage 첨부파일 내역" , boardImage)*/
	    
	    
	  });
	  document.getElementById("bfiles").files = files;
	  console.log("bfiles :" , document.getElementsByClassName("writeForm")[0].bfiles.files)
	  
  }
	
  var search2 = document.getElementById('search2');
  var map_wrap = document.getElementById('map_wrap');

  search2.addEventListener("click",function(e){
      console.log('클릭됨');
      //버킷항목 입력값 읽어오기
          map_wrap.style.visibility = "visible";
 },false);

   mapBtn.addEventListener("click", function(e){
 		e.preventDefault();
 		console.log('클릭됨mapBtn');
 		//유효성 체크
 		//게시글 작성 전송
 		searchPlaces(); return false; 
 	},false);  
}



//modifyBtn.addEventListener("click",function(e){
//    e.preventDefault();
//
//    if(checkValid()){
//      // 유효성 통과하면 메인화면으로 이동
//      //location.href="main.html";
//    	
//      //document.getElementById("joinFrm").submit();
//    	
//      let request = new XMLHttpRequest();
//      let formData = new FormData(document.getElementById("joinFrm"));
//      formData.append("file",profileImage);
//      request.open("POST", getContextPath()+"/member/modify");
//      request.send(formData);      
//    }
//  },false);
//  
//  //사진 드래그 앤 드롭
//  let pic =document.getElementsByClassName("pic")[0];
//  pic.addEventListener("dragover",function(e){ 
//    return dragOver(e);
//  },false);
//  pic.addEventListener("dragleave",function(e){
//    return dragOver(e);
//  },false);  
//  pic.addEventListener("drop",function(e){
//    return uploadFiles(e);
//  },false); 
////사진 드래그이벤트
//function dragOver(e) {
//  e.stopPropagation();
//  e.preventDefault();
//  if (e.type == "dragover") {
//      e.target.style.backgroundColor = "black";
//      e.target.style.outlineOffset = "-20px";
//  } else {
//      e.target.style.backgroundColor = "gray";
//      e.target.style.outlineOffset = "-10px";      
//  }
//}
////사진 드롭이벤트발생시 이미지 첨부
//function uploadFiles(e) {
//  e.stopPropagation();
//  e.preventDefault();
//  dragOver(e); //1
//  console.log(e.target);
// // e.dataTransfer = e.originalEvent.dataTransfer; //2
//  let files = e.target.files || e.dataTransfer.files;
//
//  if (files.length > 1) {
//      alert('이미지는 하나만 첨부하세요');
//      return;
//  }
//  //100kb미만의 이미지만 첨부
//  if(files[0].size > 1024*100){
//  	alert('100kb 미만의 이미지만 첨부 가능합니다');
//  	return;
//  }
//
//  let reg = /image\/\/*/;
//  if (files[0].type.match(reg)) {
//    e.target.style.backgroundImage = "url(" + window.URL.createObjectURL(files[0]) + ")";
//    e.target.style.outline = "none";
//    e.target.style.backgroundSize = "100% 100%";
//    profileImage = files[0];
//  }else{
//    alert('이미지가 아닙니다.');
//    return;
//  } 
//}  

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


















