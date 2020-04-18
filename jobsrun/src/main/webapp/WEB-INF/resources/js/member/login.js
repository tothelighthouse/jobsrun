window.addEventListener("load", init, false);
function init() {
    
    loginBtn.addEventListener("click", function (e) {
        e.preventDefault();
        var result = checkLogin();        
        if(result){
        	document.getElementById("loginForm").submit();
        }  
    }, false);
}
function checkLogin() {
    var idTag = document.getElementById("id");
    var idValue = idTag.value;
    var pwTag = document.getElementById("pw");
    var pwValue = pwTag.value;
    var flag = true;

    //로그인 유효성 체크
    //1) 아이디, 비밀번호 빈문자열 체크
    if (idValue.trim().length == 0) {
        document.getElementById("idMsg");
        idMsg.innerHTML = "아이디를 입력하세요!";
        idMsg.style.color = "red";      
        idMsg.style.fontSize = '0.7rem';
        idMsg.style.fontWeight = 'bold';

        
        flag = false;
        return flag;
    }

    if (pwValue.trim().length == 0) {
        idMsg.innerHTML = "";
        document.getElementById("pwMsg");
        pwMsg.innerHTML = "비밀번호를 입력하세요!";
        pwMsg.style.color = "red";
        pwMsg.style.fontSize = '0.7rem';
        pwMsg.style.fontWeight = 'bold';

        
        flag = false;
        return flag;
    }
    return flag;

}