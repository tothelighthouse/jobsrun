window.addEventListener("load", function(){
    let submitBtn = document.getElementById("submitBtn");
    submitBtn.addEventListener("click", function(e){
        e.preventDefault();
        
        if(checkDebit()){
            let amount = document.getElementById("amount").value.trim();
            if(confirm(amount + " 포인트가 차감됩니다. 맞습니까?")){
                document.getElementById("debitForm").submit();
            }    
        }
    }, false);
}, false);
// end window events---------------------------------------------------------------------

function checkDebit() {
    let amount = document.getElementById("amount").value.trim();
    let bank = document.getElementById("bank").value;
    let acctNum = document.getElementById("acctNum").value.trim();
    let agree = document.getElementById("agree").checked;
    let myPoint = document.getElementById("myPoint").innerHTML.trim();
    let flag = true;

    if (!agree) {
        alert('동의해야지 출금 가능합니다');
        flag = flag && false;
        return flag;
    }

    if(amount > myPoint) {
        amountErr.innerHTML = '보유포인트보다 큰 값을 받을 수 없습니다.';
        flag = flag && false;
        return flag;
    } else {
        amountErr.innerHTML = '';
    }

    if (amount %10000 != 0 || amount == 0) {
        amountErr.innerHTML = '10,000원 단위로 입력해주세요';
        flag = flag && false;
    } else {
        amountErr.innerHTML = '';
    }

    if (bank == '') {
        bankErr.innerHTML = '은행을 선택해주세요';
        flag = flag && false;
    } else {
        bankErr.innerHTML = '';
    }

    if (acctNum == '') {
        acctNumErr.innerHTML = '계좌번호를 입력해주세요';
        flag = flag && false;
    } else {
        acctNumErr.innerHTML = '';
    }

    return flag;
}
// end checkDebit() -------------------------------------------------------------------------