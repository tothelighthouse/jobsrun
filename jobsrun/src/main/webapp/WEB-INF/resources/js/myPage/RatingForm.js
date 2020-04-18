window.addEventListener("load", function(){
    let submitBtn = document.getElementById("submitBtn");
    submitBtn.addEventListener("click", function(e){
        e.preventDefault();
        if(detailsChecker()){
            if(ratingChecker()) {
                if(confirm("평점을 입력합니다. 확인 버튼 누른 후에는 수정할 수 없습니다.")) {
                    document.getElementById("ratingForm").submit();
                }
            }
        }
    }, false);

}, false);

function ratingChecker() {
	let point = document.getElementById("rates");
	let flag = true;

if(point.value == "") {
    pointErr.innerHTML = "<br>평점을 입력해주세요";
    flag = false;
}
return flag;
}
function detailsChecker() {
let details = document.getElementById("detail");
let flag = true;

if(details.value.trim() == "") {
    if(confirm("내용을 입력하지 않았습니다. 그래도 제출할까요?")) {
        flag = true;
    } else {
        flag = false;
    }
}
console.log(flag);
return flag;
}