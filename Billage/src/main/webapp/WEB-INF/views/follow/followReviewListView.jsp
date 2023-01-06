<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	
	<div class="outer">
		
		<div class="reviewBox">
			
			<div class="profile">
				<div id="profileImg"><img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png" width="100px;" height="100px;"></div>
				<div id="nickName">user02</div>
				<div id="star">☆3.5</div>
			</div>
			
			<div class="review">
				<div id="bookImg"></div>
				<div id="reviewContent">
					<div id="bookTitle">책 제목</div>
					<div id="reviewContent">리뷰 내용용용용용용용용용용용 많아요? 적어요 ? 몰라요 </div>
				</div>
			</div>
			
			<div class="likeReplyCount">
				<div id="likeCount">좋아요 갯수</div>
				<div id="replyCount">댓글 갯수</div>
			</div>
			
			<div class="likeReplyPlus">
				<div id="likeBtn">♡</div>
				<div id="replyBtn">댓글</div>
			</div>
		
		</div>
	
	</div>
	
<jsp:include page="../common/footer.jsp"/>
</body>
</html>