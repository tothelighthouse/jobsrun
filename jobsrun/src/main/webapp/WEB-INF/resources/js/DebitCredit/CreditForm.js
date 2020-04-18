window.addEventListener("load", function(){
    let submitBtn = document.getElementById("submitBtn");
    submitBtn.addEventListener("click", function(e) {
        e.preventDefault();
        
        if(creditCheck()) {
            let amount = document.getElementById("amount").value;
            if(confirm(amount + " 원을 충전합니다. 맞습니까?")) {
                document.getElementById("creditForm").submit();
            }
        }
    }, false);
}, false);
// end window events---------------------------------------------------------------------

function creditCheck() {

    let amount = document.getElementById("amount").value.trim();
    let cards = cardChecked();
    let card = document.getElementById("card").value.trim();
    let cvc = document.getElementById("cvc").value.trim();
    let agree = document.getElementById("agree").checked;

    let flag = true;

    if (!agree) {
        alert('동의해야지 출금 가능합니다');
        flag = flag && false;
        return flag;
    }

    if(amount %1000 != 0 || amount == 0) {
        amountErr.innerHTML = '1,000원 단위로 입력하세요';
        flag = flag && false;
    } else {
        amountErr.innerHTML = '';
    }

    if(cards == '') {
        cardsErr.innerHTML = '카드를 선택해주세요.';
        flag = flag && false;
    } else {
        cardsErr.innerHTML = '';
    }

    if(card == '') {
        cardErr.innerHTML = '카드번호를 입력해주세요';
        // if(isCard(card)) {
        //     cardErr.innerHTML = '올바른 카드번호를 입력해주세요';
        // }
        flag = flag && false;
    } else {
        cardErr.innerHTML = '';
    }

    if(cvc < 100 || cvc > 1000) {
        cvcErr.innerHTML = 'cvc번호를 입력해주세요';
        flag = flag && false;
    } else {
        cvcErr.innerHTML = '';
    }

    return flag;
}
// end creditCheck() -------------------------------------------------------------------------------------------

function cardChecked() {
    let cards = document.getElementsByName("cards");
    let cardsVal = '';
    for (let card = 0; card < cards.length; card++) {
        if(cards[card].checked){
            cardsVal = cards[card].value;
        }
    }
    return cardsVal;
}
// end cardChecked() -------------------------------------------------------------------------------------------

function isCard(card) {
    //console.log("카드사" + cards);
}
