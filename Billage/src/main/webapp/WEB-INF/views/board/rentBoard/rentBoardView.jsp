<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.rt-title {
	font-size: 20px;
	font-weight: bold;
}

.rt-outer{
	width: 1200px;
	margin: 0 auto;
}

.hot {
	display: flex;
	margin-bottom: 50px;
	flex-wrap: wrap;
}

.productbox {
	border: 1px solid rgb(154, 154, 154);
	height: 330px;
	width: 255px;
	margin-top: 10px;
	margin-right: 30px;
}

.productbox p {
	margin: 0px 10px;
}
#pagingArea {width:fit-content; margin:auto;}
</style>
</head>
<body>
	
	<jsp:include page="../../common/header.jsp" />
	<!-- 가로로 4개 세로로 2개  => 한 화면에 8개 -->
	<div class="rt-outer">
		<h2>대여게시판</h2>
		
		<!-- 로그인 유저만 보이게 -->
		<c:if test="${ not empty sessionScope.loginUser }">
		<div style="display: flex; justify-content: end;"><button onclick="location.href='enrollForm.rt'">글 올리기</button></div>
		</c:if>
		
		<hr>
		<div class="rt-box" style="display:flex; flex-wrap : wrap;">

			<c:forEach items="${list}" var="rt">
			<div class="rt-contentbox" style="padding:20px;">
				<input type="hidden" name="rentNo" value="${ rt.rentNo }"> <img src="${ rt.changeName }"
					width="255" height="200">
				<p>
					<span class="rt-title">제목 : ${ rt.rentTitle } </span><br> 대여자 닉네임 : ${ rt.nickname } <br> 포인트 : ${ rt.rentPoint }  <br> 대여시작일 : ${ rt.rentDate }
				</p>
				
			</div>
			</c:forEach>
			
		</div>
		
		<div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.rt?cpage=${ pi.currentPage -1 }">Previous</a></li>
                    	</c:otherwise>
					</c:choose>
					
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<li class="page-item"><a class="page-link" href="list.rt?cpage=${ p }">${ p }</a></li>
					</c:forEach>
					
					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.rt?cpage=${ pi.currentPage + 1 }">Next</a></li>
                    	</c:otherwise>
                    	
                    </c:choose>
                    
                </ul>
            </div>
		
		
	</div>
	
	<script>
		$(function(){
			$('.rt-contentbox').click(function(){
				location.href = 'detail.rt?rentNo=' + $(this).children().eq(0).val();
			})
		});
	</script>
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>