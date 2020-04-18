<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="<c:url value='/resources/js/myPage/myPage.js'/>"></script>
<script src="<c:url value='/resources/js/main.js'/>"></script>

<link rel="stylesheet"  href="<c:url value='/resources/css/myPage/myPage.css'/>" >
</head>
<body>
<div class="container">
	<%@ include file="../main/header.jsp"%>
	<div class="body">
	<%@ include file="../myPage/myPageheader.jsp"%>

<div class="ih">
<main>
<div class="main">
<div class="lists">

<div class="select">
	<ul>
		<li><label for="client">의뢰자로서 글 보기</label></li>
		<li><label for="shooter">해결사로서 글 보기</label></li>
	</ul>
</div>
<input type="radio" name="tabmenu" id="client" class="tobehidden" checked>
<input type="radio" name="tabmenu" id="shooter" class="tobehidden">

<!-- CLIENT ------------------
---------------------------------------------->
<div class="client listbox">
	<!-- 지원후 승인 대기중 시작---------------------------------------------------------------->
	<div class="ratings wTable">
		<div class="tableTitle">
			<span>해결사 게시판에서 고용신청 후 승인 대기중</span>
			<!-- <a href="">더보기</a> -->
		</div>
		<table cellspacing="0">
			<thead>
				<tr>
					<th>의뢰제목</th>
					<th>업무</th>
					<th>의뢰날짜</th>
					<th>장소</th>
					<th>시작시간</th>
					<th>예상작업시간</th>
					<th>보수</th>
					<th>해결사</th>

				</tr>
			</thead>
			<tbody>
				 <c:forEach var = "rec" items="${queryList1 }"> 
				<tr>			
				    <td><a href="<c:url value='/board/view/${rec.bnum} '/>">${rec.btitle}</a></td>
				    <td>${rec.job}</td>
				    <td>${rec.sdate }</td>
				    <td>${rec.blocation }</td>
				    <td style ="text-align:center;">${rec.stime }</td>
				    <td style ="text-align:center;">${rec.duration }분</td>
				    <td style = "text-align:center;">${rec.payment}</td>
				    <td><a href = "${pageContext.request.contextPath }/ratings/rateList/${rec.bid }">${rec.bid}</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 지원후 승인 대기중 끝---------------------------------------------------------------->
	<!-- 지원후 승인 완료 시작---------------------------------------------------------------->
	<div class="ratings wTable">
		<div class="tableTitle">
			<span>해결사글에 고용신청 후 승인 완료</span>
			<!-- <a href="">더보기</a> -->
		</div>
		<table cellspacing="0">
			<thead>
				<tr>
					<th>의뢰제목</th>
					<th>업무</th>
					<th>의뢰날짜</th>
					<th>장소</th>
					<th>시작시간</th>
					<th>예상작업시간</th>
					<th>보수</th>
					<th>해결사</th>

				</tr>
			</thead>
			<tbody>
				 <c:forEach var = "rec" items="${queryList2 }"> 
				<tr>			
				    <td><a href="<c:url value='/board/view/${rec.bnum} '/>">${rec.btitle}</a></td>
				    <td>${rec.job}</td>
				    <td>${rec.sdate }</td>
				    <td>${rec.blocation }</td>
				    <td style ="text-align:center;">${rec.stime }</td>
				    <td style ="text-align:center;">${rec.duration }분</td>
				    <td style = "text-align:center;">${rec.payment}</td>
				    <td><a href = "${pageContext.request.contextPath }/ratings/rateList/${rec.bid }">${rec.bid}</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 지원후 승인 완료 끝---------------------------------------------------------------->
	
	<!-- 내가 의뢰한글 시작---------------------------------------------------------------->
	<div class="ratings wTable">
		<div class="tableTitle">
			<span>내가 의뢰한글</span>
			<!-- <a href="">더보기</a> -->
		</div>
		<table cellspacing="0">
			<thead>
				<tr>
					<th>의뢰제목</th>
					<th>업무</th>
					<th>의뢰날짜</th>
					<th>장소</th>
					<th>시작시간</th>
					<th>예상작업시간</th>
					<th>보수</th>

				</tr>
			</thead>
			<tbody>
				 <c:forEach var = "rec" items="${listNotMatched }"> 
				<tr>			
				    <td><a href="<c:url value='/board/view/${rec.bnum} '/>">${rec.btitle}</a></td>
				    <td>${rec.job}</td>
				    <td>${rec.sdate }</td>
				    <td>${rec.blocation }</td>
				    <td style ="text-align:center;">${rec.stime }</td>
				    <td style ="text-align:center;">${rec.duration }분</td>
				    <td style = "text-align:center;">${rec.payment}</td>

				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 내가 의뢰한글 끝---------------------------------------------------------------->
	
	
	<!-- 지원을 받은 의뢰글 시작---------------------------------------------------------------->
    <div class="accepteds wTable">
        <div class="tableTitle">
            <span>지원을 받은 의뢰글</span>
           <!--  <a href="">더보기</a> -->
        </div>
        <table cellspacing="0">
            <thead>
                <tr>
                    <th>의뢰제목</th>
                    <th>업무</th>
                    <th>의뢰날짜</th>
                    <th>장소</th>
                    <th>시작시간</th>
                    <th>예상작업시간</th>
                    <th>보수</th>
                    <th>해결사</th>
                    <th>승인여부</th>

                </tr>
            </thead>
            <tbody>
            <c:forEach var = "rec" items="${listApplied }"> 
				<tr>
				    <td><a href="<c:url value='/board/view/${rec.bnum}'/>">${rec.btitle}</a></td>
				    <td>${rec.job}</td>
				    <td>${rec.sdate }</td>
				    <td>${rec.blocation }</td>
				    <td style ="text-align:center;">${rec.stime }</td>
				    <td style ="text-align:center;">${rec.duration }분</td>
				    <td style = "text-align:center;">${rec.payment}</td>
				    <td><a href = "${pageContext.request.contextPath }/ratings/rateList/${rec.bapplication }">${rec.bapplication}</a></td>
				    <td>
				    	<button type = "button">
				    		<a href="${pageContext.request.contextPath }/contract/permission/${rec.bnum}">승낙</a>
				    	</button>
				    	<button type = "button">
				    		<a href="${pageContext.request.contextPath }/board/application/${rec.bnum}">거절</a>
				    	</button>
				    	<!-- <button type="button">거절</button> -->
				    </td>

				</tr>
				</c:forEach>
            </tbody>
        </table>
    </div>
   	<!-- 지원을 받은 의뢰글 끝---------------------------------------------------------------->
   	
   	<!-- 지원을 받은 의뢰글 끝---------------------------------------------------------------->
    <div class="waitings wTable">
        <div class="tableTitle">
            <span>지원을 승낙한 글(계약 진행중)</span>
            <!-- <a href="">더보기</a> -->
        </div>
        <table cellspacing="0">
            <thead>
                <tr>
                    <th>의뢰제목</th>
                    <th>업무</th>
                    <th>의뢰날짜</th>
                    <th>장소</th>
                    <th>시작시간</th>
                    <th>예상작업시간</th>
                    <th>보수</th>
                    <th>해결사</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach var = "rec" items="${listPermitted }"> 
				<tr>
				    <td><a href="<c:url value='/board/view/${rec.bnum}'/>">${rec.btitle}</a></td>
				    <td>${rec.job}</td>
				    <td>${rec.sdate }</td>
				    <td>${rec.blocation }</td>
				    <td style ="text-align:center;">${rec.stime }</td>
				    <td style ="text-align:center;">${rec.duration }분</td>
				    <td style = "text-align:center;">${rec.payment}</td>
				    <td><a href = "${pageContext.request.contextPath }/ratings/rateList/${rec.bapplication }">${rec.bapplication }</a></td>
				</tr>
				</c:forEach>
            </tbody>
        </table>
    </div>
	<!-- end .waitings ---------------------------- -->
    <div class="waitings wTable">
        <div class="tableTitle">
            <span>완료된 계약</span>
           <!--  <a href="">더보기</a> -->
        </div>
        <table cellspacing="0">
            <thead>
                <tr>
                    <th>계약번호</th>
                    <th>해결사</th>
                    <th>장소</th>
                    <th>시간</th>
                    <th>보수</th>
                    <th>평가여부</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var = "rec" items="${contractCompleteList }"> 
           		<tr>
				    <td><a href="<c:url value='/board/view/${rec.cbnum}'/>">${rec.cbnum}</a></td>
				    <td><a id = "shooterID" href = "${pageContext.request.contextPath }/ratings/rateList/${rec.shooterID }">${rec.shooterID}</a></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <td><a id = "shootera" href = "${pageContext.request.contextPath }/ratings/ratingForm/${rec.shooterID }">평가하기</a></td>
			    <tr>
    		</c:forEach>
			    
            </tbody>
        </table>
    </div>
    <!-- none ---------------------------- -->
</div>
<!-- end CLIENT ---------------------------------------------------------------->


<!-- SHOOTER ---------------------------------------------------------------->
    <div class="shooter listbox">
    <!-- 지원후 승인 대기중 시작---------------------------------------------------------------->
	<div class="ratings wTable">
		<div class="tableTitle">
			<span>의뢰자글에 지원후 승인 대기중</span>
			<!-- <a href="">더보기</a> -->
		</div>
		<table cellspacing="0">
			<thead>
				<tr>
					<th>의뢰제목</th>
					<th>업무</th>
					<th>의뢰날짜</th>
					<th>장소</th>
					<th>시작시간</th>
					<th>예상작업시간</th>
					<th>보수</th>
					<th>의뢰자</th>

				</tr>
			</thead>
			<tbody>
				 <c:forEach var = "rec" items="${queryList3 }"> 
				<tr>			
				    <td><a href="<c:url value='/board/view/${rec.bnum} '/>">${rec.btitle}</a></td>
				    <td>${rec.job}</td>
				    <td>${rec.sdate }</td>
				    <td>${rec.blocation }</td>
				    <td style ="text-align:center;">${rec.stime }</td>
				    <td style ="text-align:center;">${rec.duration }분</td>
				    <td style = "text-align:center;">${rec.payment}</td>
				    <td><a href = "${pageContext.request.contextPath }/ratings/rateList/${rec.bid }">${rec.bid}</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 지원후 승인 대기중 끝---------------------------------------------------------------->
	
	<!-- 지원후 승인 완료 시작 ---------------------------------------------------------------->
   	<div class="waitings wTable">
	     <div class="tableTitle">
	        <span>의뢰자글에 지원후 승인 완료(계약 진행중)</span>
	     </div>
	 	<table cellspacing="0">
	        <thead>
	            <tr>
	                <th>의뢰제목</th>
	                <th>업무</th>
	                <th>의뢰날짜</th>
	                <th>장소</th>
	                <th>시작시간</th>
	                <th>예상작업시간</th>
	                <th>보수</th>
	                <th>의뢰자</th>
	                <th>계약 완료</th>
	            </tr>
	        </thead>
	       	<tbody>
				<c:forEach var = "rec" items="${queryList4 }"> 
				<tr>
				    <td><a href="<c:url value='/board/view/${rec.bnum}'/>">${rec.btitle}</a></td>
				    <td>${rec.job}</td>
				    <td>${rec.sdate }</td>
				    <td>${rec.blocation }</td>
				    <td style ="text-align:center;">${rec.stime }</td>
				    <td style ="text-align:center;">${rec.duration }분</td>
				    <td style = "text-align:center;">${rec.payment}</td>
				    <td><a href = "${pageContext.request.contextPath }/ratings/rateList/${rec.bid }">${rec.bid}</a></td>
				    <td>
				    	<button>
				    		<a href="${pageContext.request.contextPath }/contract/contractCompletion/${rec.bnum}">계약 완료</a>
				    	</button>
					</td>
					</tr>
				</c:forEach>
	       	</tbody>
	   	</table>
	</div>
	<!-- 지원후 승인 완료 끝 ---------------------------------------------------------------->
    
    
		<!-- 내가 해결사로 의뢰한글 시작 ---------------------------------------------------------------->
       	<div class="ratings wTable">
			<div class="tableTitle">
				<span>내가 해결사로 신청한글</span>
				<!-- <a href="">더보기</a> -->
			</div>
			<table cellspacing="0">
				<thead>
					<tr>

						<th>의뢰제목</th>
						<th>업무</th>
						<th>의뢰날짜</th>
						<th>장소</th>
						<th>시작시간</th>
						<th>예상작업시간</th>
						<th>보수</th>
	
					</tr>
				</thead>
				<tbody>
					 <c:forEach var = "rec" items="${slistNotMatched }"> 
						<tr>			
						    <td><a href="<c:url value='/board/view/${rec.bnum} '/>">${rec.btitle}</a></td>
						    <td>${rec.job}</td>
						    <td>${rec.sdate }</td>
						    <td>${rec.blocation }</td>
						    <td style ="text-align:center;">${rec.stime }</td>
						    <td style ="text-align:center;">${rec.duration }분</td>
						    <td style = "text-align:center;">${rec.payment}</td>
		
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 내가 해결사로 의뢰한글 끝 ---------------------------------------------------------------->		
    	<div class="accepteds wTable">
	        <div class="tableTitle">
	            <span>고용 신청 받은 해결사글</span>
	           <!--  <a href="">더보기</a> -->
	        </div>
        	<table cellspacing="0">
	            <thead>
	                <tr>
	                    <th>의뢰제목</th>
	                    <th>업무</th>
	                    <th>의뢰날짜</th>
	                    <th>장소</th>
	                    <th>시작시간</th>
	                    <th>예상작업시간</th>
	                    <th>보수</th>
	                    <th>의뢰인 정보</th>
	                    <th>승인여부</th>
	
	                </tr>
	            </thead>
	            <tbody>
	            <c:forEach var = "rec" items="${slistApplied }"> 
					<tr>
					    <td><a href="<c:url value='/board/view/${rec.bnum}'/>">${rec.btitle}</a></td>
					    <td>${rec.job}</td>
					    <td>${rec.sdate }</td>
					    <td>${rec.blocation }</td>
					    <td style ="text-align:center;">${rec.stime }</td>
					    <td style ="text-align:center;">${rec.duration }분</td>
					    <td style = "text-align:center;">${rec.payment}</td>
		    			<td><a href = "${pageContext.request.contextPath }/ratings/rateList/${rec.bapplication }">${rec.bapplication}</a></td>
					    
					    <td>
					    	<button type = "button">
					    		<a href="${pageContext.request.contextPath }/contract/permission/${rec.bnum}">승낙</a>
					    	</button>
					    	<button type = "button">
					    		<a href="${pageContext.request.contextPath }/board/application/${rec.bnum}">거절</a>
					    	</button>
					    	<!-- <button type="button">거절</button> -->
					    </td>
	
					</tr>
				</c:forEach>
            </tbody>
        </table>
    	</div>
		<!-- end .accepteds ---------------------------- -->
        <div class="waitings wTable">
	        <div class="tableTitle">
	            <span>고용 신청 승낙한 해결사글(계약 진행중)</span>
	            <!-- <a href="">더보기</a> -->
	        </div>
        <table cellspacing="0">
            <thead>
                <tr>
                    <th>의뢰제목</th>
                    <th>업무</th>
                    <th>의뢰날짜</th>
                    <th>장소</th>
                    <th>시작시간</th>
                    <th>예상작업시간</th>
                    <th>보수</th>
                    <th>의뢰인</th>
                    <th>계약 완료</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach var = "rec" items="${slistPermitted }"> 
				<tr>
				    <td><a href="<c:url value='/board/view/${rec.bnum}'/>">${rec.btitle}</a></td>
				    <td>${rec.job}</td>
				    <td>${rec.sdate }</td>
				    <td>${rec.blocation }</td>
				    <td style ="text-align:center;">${rec.stime }</td>
				    <td style ="text-align:center;">${rec.duration }분</td>
				    <td style = "text-align:center;">${rec.payment}</td>
				    <td><a href = "${pageContext.request.contextPath }/ratings/rateList/${rec.bapplication }">${rec.bapplication }</a></td>
				    <td>
				    	<button>
				    		<a href="${pageContext.request.contextPath }/contract/contractCompletion/${rec.bnum}">계약 완료</a>
				    	</button>
					</td>
 				</tr>
				</c:forEach>
            </tbody>
        </table>
    </div>
		<!-- end .waitings ---------------------------- -->
        <div class="waitings wTable">
        <div class="tableTitle">
            <span>완료된 계약</span>
           <!--  <a href="">더보기</a> -->
        </div>
        <table cellspacing="0">
            <thead>
                <tr>
                    <th>계약번호</th>
                    <th>의뢰자</th>
                    <th>장소</th>
                    <th>시간</th>
                    <th>보수</th>
                    <th>평가여부</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var = "rec" items="${scontractCompleteList }"> 
           		<tr>
				    <td><a href="<c:url value='/board/view/${rec.cbnum}'/>">${rec.cbnum}</a></td>
				    <td><a id = "clientId" href = "${pageContext.request.contextPath }/ratings/rateList/${rec.clientID }">${rec.clientID}</a></td>
				    <td></td>
				    <td></td>
				    <td></td>
				    <!-- <td><button type = "button" id = "evalBtn">평가하기</button></td> -->
				    <td><a id = "clienta" href = "${pageContext.request.contextPath }/ratings/ratingForm/${rec.clientID }">평가하기</a></td>
			    <tr>
    		</c:forEach>
            </tbody>
        </table>
    </div>
        <!-- end .none ---------------------------- -->
    </div>
</div>


<!-- end shooter --------------------------------------------------------------------->

                <div class="dangerZone" style ="">
                    <span id = "danger">위험한 구역</span>
                    <ul style ="border:1px solid #ccc;">
                        
                        <li>
                            <a id = "out" href="<c:url value='memberoutForm'/>">회원탈퇴</a>
                        </li>
                    </ul>
                </div>
            </div>

        </main>
    </div>
</div>    
<!-- end .body -->


</div>
<%@ include file="../main/footer.jsp"%>
</body>
</html>