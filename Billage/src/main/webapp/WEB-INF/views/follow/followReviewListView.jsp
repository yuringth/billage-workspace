<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	width: 1200px;
	margin: auto;
}

a {
	text-decoration: none;
}

 #pagingArea {width:fit-content; margin:auto;}
 
</style>
</head>
 <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="outer">


		<c:choose>
			<c:when test="${ ! empty sessionScope.loginUser }">
				<c:choose>
					<c:when test="${ !empty list }">
						<c:forEach items="${list}" var="list">
							<div class="reviewBox" style="width: 70%; background-color: rgb(235, 235, 235); margin: auto;">
								<div class="profile" style="display: flex; flex-direction: row; justify-content: flex-start; margin-left: 30px;"">
									<div id="profileImg${ list.reviewNo }" style="margin-top: 50px;">
										<img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png"width="50px;" height="50px;">
									</div>
									<div id="userDetail${ list.reviewNo }" style="margin-top: 50px; margin-left: 30px;">
										<c:choose>
											<c:when test="${ sessionScope.loginUser.userNo eq list.userNo }">
												<div id="nickName${ list.reviewNo }">
													<a href="selectLoginUser.fo">${ list.nickname }</a>
												</div>
											</c:when>
											<c:otherwise>
												<div id="nickName${ list.reviewNo }">
													<a href="selectUser.fo?uno=${ list.userNo }">${ list.nickname }</a>
												</div>
											</c:otherwise>
										</c:choose>
										<div id="star${ list.reviewNo }">☆${ list.reviewStar}</div>
									</div>
								</div>
								<br>

								<hr>

								<br>
								<div class="review" style="display: flex; flex-direction: row; justify-content: flex-start; margin-left: 100px;">
									<div id="bookImg${ list.reviewNo }">
										<img src="${ list.bookImag}" style="width: 120px; height: 200px; margin-right: 100px;">
									</div>
									<div id="reviewContent${ list.reviewNo }">
										<div id="bookTitle${ list.reviewNo }">
											<h3>${ list.reviewTitle }</h3>
										</div>
										<br>
										<div id="reviewContent${ list.reviewNo }">${ list.reviewContent }</div>
									</div>
								</div>
								<br> <br>

								<div class="likeReplyCount" style="display: flex; flex-direction: row; justify-content: flex-start;">
									<div id="likeCount">좋아요 갯수 &nbsp;</div>
									<div id="replyCount">댓글 갯수</div>
								</div>
								<br>

								<hr>

								<div class="likeReplyPlus" style="display: flex; flex-direction: row; justify-content: flex-start;">
									<div id="likeBtn">♡ &nbsp;</div>
									<div id="replyBtn">댓글</div>
								</div>
								<br>

							</div>

						</c:forEach>
					</c:when>
					
					<c:otherwise>
						<h1>조회된 리뷰가 없습니다.</h1>
					</c:otherwise>

				</c:choose>
			</c:when>
			
			<c:otherwise>
				<h1>로그인 해주세요</h1>
			</c:otherwise>
		
		</c:choose>
	</div>
	
	<div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1}">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item "><a class="page-link" href="selectReviewList.fo?cpage=${ pi.currentPage-1 }&uno=${list.get(0).userNo}">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                   	<c:forEach begin="${pi.startPage }" end="${ pi.endPage }" var="p">
                    <li class="page-item"><a class="page-link" href="selectReviewList.fo?cpage=${p}&uno=${list.get(0).userNo}">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">                    
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="selectReviewList.fo?=${ pi.currentPage + 1 }&uno=${list.get(0).userNo}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>