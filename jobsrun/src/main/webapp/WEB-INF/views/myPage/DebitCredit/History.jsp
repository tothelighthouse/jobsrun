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
	
<style>
	.ih nav {
		margin: 30px;
	}
    .ih table {
        width: 100%;
        outline: 1px solid black;
    }
    .ih table thead * {
        border-bottom: 2px solid black;
    }
    .ih table tr th:first-child, th:nth-child(2),
    .ih table tr td:first-child, td:nth-child(2) {
        width: 200px;
        text-align: center;
        border-right: 1px solid black;
    }
    .ih table tr td:nth-child(3) {
    	text-align: right;
    }
    .ih table tbody tr {
        height: 30px;
    }
    .ih table tbody tr:nth-child(odd) {
        background-color: skyblue;
    }
    .ih table tbody tr:hover {
        background-color: grey;
    }
    
    .ih .red {
    	color: red;
    }
</style>
</head>
<body>
<div class="container">
<%@ include file="../../main/header.jsp"%>
<div class="body">
<%@ include file="../myPageheader.jsp"%>










<div class="ih">
	<div class="nav">
		<ul>
			<li><a href="<c:url value='/DebitCredit/CreditForm'/>">포인트 <b style = "color:red;">충전</b>하기</a></li>
			<li style ="margin-top:10px;"><a href="<c:url value='/DebitCredit/DebitForm'/>">포인트 <b style = "color:red;">지급</b>받기</a></li>			
		</ul>
	</div>
    <div class="history">
        <table cellspacing="0">
            <thead>
                <tr>
                    <th>거래일자</th>
                    <th>거래수단</th>
                    <th>거래금액</th>
                </tr>
            </thead>
            <tbody>

<c:forEach var="one" items="${history }">
	<tr>
		<td>${one.tdate }</td>
		<td>${one.via }</td>
		<c:choose>
			<c:when test="${one.amount < 0 }">
				<td class="red">${one.amount } &nbsp;&nbsp;
				</td>
			</c:when>
			<c:otherwise>
				<td class="">${one.amount } &nbsp;&nbsp;
				</td>
			</c:otherwise>
		</c:choose>
	</tr>
</c:forEach>

            </tbody>




        </table>
    </div>
</div>
<!---------------------------------------------------------------------------------------------------->








</div>
<!-- end .body -->
</div>
<%@ include file="../../main/footer.jsp"%>
</body>
</html>