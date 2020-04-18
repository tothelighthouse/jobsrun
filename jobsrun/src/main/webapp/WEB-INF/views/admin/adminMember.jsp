<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">
<link rel="stylesheet" href="<c:url value='/resources/css/admin/table.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/admin/adminButton.css'/>">
<script src="<c:url value='/resources/js/common.js'/>"></script>	
 <script src="<c:url value='/resources/js/admin/adminMember.js'/>"></script>	
</head>


<body>

	<%@ include file="../main/header.jsp"%>
	<!-- 페이지 이동 버튼 -->
	<div class="body">
		<h3>회원관리</h3>
		<div>
			<button class="button button2"><a style = "" href="<c:url value='/admin/adminmember'/>">회원관리</a></button>
			<button class="button button3"><a style = "" href="<c:url value='/admin/adminpost/1'/>">의뢰자게시물</a></button>
			<button class="button button5"><a style = "" href="<c:url value='/admin/adminpost2/2'/>">해결사게시물</a></button>
			
		</div>
		 <div style="margin-top:50px;">
		<!-- 검색
			<div class="searchright">
				<div class="search" >
				
				<select  name="searchType" id="searchselect">
				<option value = "nickname">닉네임</option>
				</select>

					<input type="text" placeholder="닉네임를 입력해주세요." id="keyword">
					
					<button>검색</button>

				</div>

			</div> -->
		</div> 

<!-- 회원테이블 -->
			
	
			<div class="row">
			
				 <span class="cell col1">아이디</span>
				<span class="cell col2">닉네임</span>
				 <span class="cell col3">평점</span>
				<!-- <span class="cell col4">포인트 보유내역</span>  -->
				<span class="cell col5">가입일자</span>
				<span class="cell col6">주소</span>
				<span class="cell col7">비고</span>
			</div>
				<c:forEach var ="rec" items ="${memberList }">	
			<div class="row">
				<span class="cell col1">${rec.id }</span>
				<span class="cell col2">${rec.nickname }</span>
				<span class="cell col3" ><a class = "rates" href="<c:url value='/ratings/rateList/${rec.id }'/> ">${rec.rates }</a></span>
				<%-- <span class="cell col4">${rec.balance }</span> --%>
				<span class="cell col5">${rec.cdate}</span>
				<span class="cell col6">${rec.region}</span>  
				<span class="cell col7">  
				<c:if test = "${rec.rates != null }">
				 <a id = "deletea" href="<c:url value='/admin/delete/${rec.id }/${rec.rates }'/>" class="deleteBtn">삭제</a> 
				 <!-- <button type = "button" id ="deleteBtn">삭제</button> -->
				</c:if>
				</span>
				
			</div>
			
				</c:forEach>
			<div style= "height:500px;"></div>
		
			<!-- end .body -->
		
			<%@ include file="../main/footer.jsp"%>
		</body>
</html>