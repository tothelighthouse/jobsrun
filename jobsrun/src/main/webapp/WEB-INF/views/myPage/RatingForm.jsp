<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
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
	
	
	
	<link rel="stylesheet" href="<c:url value='/resources/css/myPage/RatingForm.css'/>">
	<script src="<c:url value='/resources/js/myPage/RatingForm.js'/> "></script>
	
	<style>
		.tobehidden {
			display:none;
		}
	</style>
</head>
<body>
<div class="container">
<%@ include file="../main/header.jsp"%>
<div class="body">




<div class="ih">
    <div class="receiver">
        <div class="info">
             <img width="150px;" height = "100px;" style = "margin-top:20px;" src="${pageContext.request.contextPath }/member/file/${rateeVO.id}">
            <span> ${rateeVO.id }
            </span>
            <div class="intro">
                <span id ="telsp">연락처 : &nbsp;
               ${rateeVO.tel } </span>
               
            </div>
        </div>
        <div class="rates" style = "margin-top:30px;">
            <table style = "margin-left:50px; width:170px;">
                <tr>
                    <th>평점</th>
                    <td id = "tdrate">
                   <b id = "rateb">${rateeVO.rates }</b>
                    / 10</td>
                </tr>
            </table>
        </div>
    </div>
    <!----------- end .receiver ----------->
    <div class="thrower">
        <div class="inputs">
            <span>평가를 해주세요</span>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <form:form action="${pageContext.request.contextPath}/ratings/rating.do" 
            		   id="ratingForm" 
            		   method="post"
            		   modelAttribute="ratingVO">
            <div class="tobehidden">
            </div>
            <div style ="margin-top:20px;">
            	<div>평가자 ID
            		<form:input type="text" path="rater" value="${sessionScope.member.id }" readOnly="true" style ="color:#A9F5F2; border:none; margin-top:5px; width:100%;" /></div>
            	<div style="margin-top:10px;">평가 받는 사람 ID
            		<form:input type="text" path="ratee" value="${rateeVO.id }" readOnly="true" style ="color:#BCA9F5; width:100%; margin-top:5px; border:none;"/></div>
            	
            </div>    
                <table style = "margin-top: 30px;">
                    <tr>
                        <th><label for="rates">평점</label></th>
                        <td>
                            <form:select path="rates" id="rates" style= "height:50px;">
                                <option value="">===== 평점을 선택해주세요 =====</option>
                                <option value="2">
                                    <span>★</span>
                                </option>
                                <option value="4">
                                    <span>★★</span>
                                </option>
                                <option value="6">
                                    <span>★★★</span>
                                </option>
                                <option value="8">
                                    <span>★★★★</span>
                                </option>
                                <option value="10">
                                    <span>★★★★★</span>
                                </option>
                            </form:select>
                            <span id="pointErr"></span>
                        </td>
                    </tr>
                    <tr>
                        <th><form:label path = "detail">세부내용</form:label></th>
                        <td><form:textarea path="detail" id="detail" cols="30" rows="10"></form:textarea></td>
                    </tr>
                    <tr>
                        <th colspan="2"><form:button type="submit" id="submitBtn">등록하기</form:button></th>
                    </tr>
                </table>
            </form:form>
        </div>
    </div>
    <!----------- end .thrower ----------->





</div>
<!------------------------------------------------------------------------------------------------------------------------------------>












</div>
<!-- end .body -->


</div>
<%@ include file="../main/footer.jsp"%>
</body>
</html>