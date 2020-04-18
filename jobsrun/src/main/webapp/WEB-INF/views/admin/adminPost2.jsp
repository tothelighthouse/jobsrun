  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="<c:url value='/resources/css/admin/posttable.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/admin/adminButton.css'/>">
</head>

<body>
	<%@ include file="../main/header.jsp"%>
	<h3>해결사게시물 관리</h3>
	<div>
		<button class="button button2">
			<a style = "width:100%; height:100%;" href="<c:url value='/admin/adminmember'/>">회원관리</a>
		</button>
		<button class="button button3">
			<a style = "width:100%; height:100%;" href="<c:url value='/admin/adminpost/1'/>">의뢰자게시물</a>
		</button>
		<button class="button button5">
			<a style = "width:100%; height:100%;" href="<c:url value='/admin/adminpost2/2'/>">해결사게시물</a>
		</button>
	</div>

	<div style="margin-top:50px;">
		<!-- <div class="searchright">
			<div class="search">
				<input type="text" placeholder="아이디를 입력해주세요.">

				<button>검색</button>

			</div>

		</div> -->
	</div>


	<div id="table">
		<div class="row">
			<span class="cell col1">글번호</span>
			<span class="cell col2">제목</span> 
			<span class="cell col3">보수</span> 
			<span class="cell col4">예상시간(분)</span>
			<span class="cell col5">업무</span>
			<span class="cell col6">지역</span>
		</div>
			
		<div class="row">
			<c:forEach var ="rec" items ="${list }">
			<span class="cell col1"><a href = "<c:url value='/board/view/${pc.rc.reqPage}/${rec.bnum} '/>">${rec.bnum}</a></span>
			<span class="cell col2" style="">${rec.btitle}</span>
			<span class="cell col3">${rec.payment}</span>
			<span class="cell col4">${rec.duration}</span>
			<span class="cell col5">${rec.job}</span>
			<span class="cell col6">${rec.blocation}</span>
			</c:forEach>
		</div>
		<div style= "height:500px;"></div>
	</div>
	<%@ include file="../main/footer.jsp"%>
</body>
</html>