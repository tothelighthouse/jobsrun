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
	
	
	
	<link rel="stylesheet" href="<c:url value='/resources/css/myPage/Ratings.css'/>">
	
	
</head>
<body>
<div class="container">
<%@ include file="../main/header.jsp"%>
<div class="body">
<%@ include file="myPageheader.jsp"%>








<div class="ih">
    <div class="receiver">
	
        <div class="info">
        	<c:if test = "${member.pic == null }">
        		<img width="150px;" height = "100px;" src = "<c:url value='/resources/img/익명.png'/>">
        	</c:if>
        	<c:if test = "${member.pic != null }">
           <img width="150px;" height = "100px;" style = "margin-top:20px;" src="${pageContext.request.contextPath }/member/file/${member.id}">
            </c:if>
            <span>${member.id }</span>
            <div class="intro" style = "margin-top:30px; font-size:20px; font-weight:bold;">
                <%-- <pre>here, GOOD
                    ${sessionScope.member.nickname } 의 소개글
                </pre> --%>
                연락처 : ${member.tel }
            </div>
        </div>
        <div class="rates" style = "margin-top:30px;">
            <table style = "margin-left:50px; width:170px;">
                <tr>
                    <th>평균평점</th>
                    <td>
                    <span style ="color:red;">${member.rates}</span> 
                    / 10</td>
                </tr>
            </table>
        </div>

    </div>
    <!----------- end .receiver ----------->
    <div class="thrower" style ="border:1px solid #ccc;">
        <div class="pasts">

            <!-- end .past ------------------------>
			 
          <!--   <div class="past">
                <img src="psa.jpg" alt="지난 평가자 사진">
                <div>
                    <div>
                        <span>닉네임</span>
                        <span>평점 2/10</span>
                        <span>20.5.5</span>
                    </div>
                    <div>
                        <p>
                            평가 지난 평가2 Lorem ipsum dolor sit amet consectetur adipisicing elit. Non ipsa, labore veniam, consectetur porro necessitatibus vel aliquam sequi aut voluptatibus incidunt doloribus cum ad, minima autem facere ratione laboriosam aspernatur!
                        </p>
                    </div>
                </div>
            </div>	 -->								
            <!-- end .past ------------------------>
     	<c:if test = "${member.rates == null}">
     		<span style ="font-size:20px;">평가 받은 내역이 없습니다.</span>
     	</c:if>
     	<c:if test = "${member.rates != null}">
     		<span style ="position:relative; font-weight:bold; left:200px; font-size:20px;">평가 내역</span>
     	</c:if>
		<c:forEach var="list" items="${rateLists }">
		 	
            <div class="past" style= "margin-top:20px;"> 
            	<c:if test = "${list.pic == null }">
            		<img  src = "<c:url value='/resources/img/익명.png'/>">
            	</c:if>
            	<c:if test = "${list.pic != null }">
                <img src="${pageContext.request.contextPath }/member/file/${list.rater}">
                </c:if>
                <div>
                    <div>
                        <span style = "display:inline-block; width:200px;">${list.rater }</span>
                        <span>평점: ${list.rates }</span>
                        <span>${list.rdate }</span>
                    </div>
                    <div>
                        <p style="margin-left:20px;">
                            ${list.detail }
                        </p>
                    </div>
                </div>
            </div>		
		
		
		</c:forEach>


        </div> 
        <!-- end .pasts ----------------------------------->


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