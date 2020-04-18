<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
	<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<script src="<c:url value='/resources/js/main.js'/>"></script>
	
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css">
	<link rel="stylesheet" href="<c:url value='/resources/css/DebitCredit/CreditForm.css'/>">
	<script src="<c:url value='/resources/js/DebitCredit/CreditForm.js'/>"></script>
		
</head>
<body>
<div class="container">
<%@ include file="../../main/header.jsp"%>

<div class="body">





<div class="ih">
    <h1>포인트 충전</h1>
    <form action="${pageContext.request.contextPath}/DebitCredit/Credit.do" id="creditForm" method="POST">
        <ul>
        	<li class="tobehidden"><input type="text" name="id" value="${sessionScope.member.id }" readOnly="true"></li>
            <li class="idx"><span>충전금액(1000원 단위)</span></li>
            <li><input type="number" min="1000" step="1000" value="1000" id="amount" name="amount"></li>
            <li><span class="errMsg" id="amountErr"></span></li>
    
            <li class="idx"><span>카드사<i class="far fa-credit-card"></i></span></li>
            <li>
                <table>
                    <tr>
                            <td><input type="radio" class="radio tobehidden" name="cards" value="BC" id="BC"><label for="BC">BC</label></td>
                            <td><input type="radio" class="radio tobehidden" name="cards" value="SINHAN" id="SINHAN"><label for="SINHAN">SINHAN</label></td>
                            <td><input type="radio" class="radio tobehidden" name="cards" value="LOTTE" id="LOTTE"><label for="LOTTE">LOTTE</label></td>
                            <td><input type="radio" class="radio tobehidden" name="cards" value="HYUNDAI" id="HYUNDAI"><label for="HYUNDAI">HYUNDAI</label></td>
                            <td><input type="radio" class="radio tobehidden" name="cards" value="SAMSUNG" id="SAMSUNG"><label for="SAMSUNG">SAMSUNG</label></td>
                    </tr>
                    <tr>
                            <td><input type="radio" class="radio tobehidden" name="cards" value="VISA" id="VISA"><label for="VISA"><i class="fab fa-cc-visa"></i></label></td>
                            <td><input type="radio" class="radio tobehidden" name="cards" value="AMEX" id="AMEX"><label for="AMEX"><i class="fab fa-cc-amex"></i></label></td>
                            <td><input type="radio" class="radio tobehidden" name="cards" value="Matercard" id="Matercard"><label for="Matercard"><i class="fab fa-cc-mastercard"></i></label></td>
                            <td><input type="radio" class="radio tobehidden" name="cards" value="Discover" id="Discover"><label for="Discover"><i class="fab fa-cc-discover"></i></label></td>
                            <td><input type="radio" class="radio tobehidden" name="cards" value="JCB" id="JCB"><label for="JCB"><i class="fab fa-cc-jcb"></i></label></td>
                    </tr>
                </table>
            </li>
            <li><span class="errMsg" id="cardsErr"></span></li>

            <li class="idx"><span>카드번호("-" 제외)</span></li>
            <li><input type="number" max="9999999999999999" id="card" name="card"></li>
            <li><span class="errMsg" id="cardErr"></span></li>

            <li class="idx"><span>CVC 번호</span><i class="far fa-question-circle" title="카드 뒤에 3자리"></i></li>
            <li><input type="number" max="999" id="cvc" name="cvc"></li>
            <li><span class="errMsg" id="cvcErr"></span></li>

            <li class="idx right"><input type="checkbox" id="agree"><label for="agree">상기 결제에 동의합니다</label></li>

        </ul>
        <div class="btns">
            <button type="submit" id="submitBtn"> 포인트충전 </button>
            <button type="reset" id="cancelBtn"> 취소 </button>
        </div>
    </form>





</div>
<!--------------------------------------------------------------------------------------------------------------->









</div>
<!-- end .body -->


</div>
<%@ include file="../../main/footer.jsp"%>
</body>
</html>