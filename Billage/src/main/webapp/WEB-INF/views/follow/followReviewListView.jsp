<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:1200px;
		margin:auto;
	}
	a {
  		text-decoration: none;
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	
	<div class="outer">
	
			
		<div class="reviewBox" style="width:70%; background-color: rgb(235, 235, 235); margin:auto;" >
			
			<div class="profile" style="display:flex; flex-direction: row; justify-content: flex-start; margin-left:30px;"">
				<div id="profileImg" style="margin-top:50px;"><img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png" width="50px;" height="50px;" ></div>
				<div id="userDetail" style="margin-top:50px; margin-left:30px;">
					<div id="nickName">user02</div>
					<div id="star">☆3.5</div>
				</div>
			</div>
			<br>
			
			<hr>
			
			<br>
			<div class="review" style="display:flex; flex-direction: row; justify-content: flex-start; margin-left:100px;		">
				<div id="bookImg"><img src="http://image.yes24.com/goods/105526047/XL" style="width:120px; height:200px; margin-right:100px;"></div>
				<div id="reviewContent">
					<div id="bookTitle"><h3>책 제목</h3></div><br>
					<div id="reviewContent">리뷰 내용용용용용용용용용용용 많아요? 적어요 ? 몰라요 </div>
				</div>
			</div>
			<br>
			<br>
			
			<div class="likeReplyCount"  style="display:flex; flex-direction: row; justify-content: flex-start;">
				<div id="likeCount">좋아요 갯수 &nbsp; 	</div>
				<div id="replyCount">댓글 갯수</div>
			</div>
			<br>
			
			<hr>
			
			<div class="likeReplyPlus" style="display:flex; flex-direction: row; justify-content: flex-start;">
				<div id="likeBtn">♡ &nbsp;</div>
				<div id="replyBtn">댓글</div>
			</div>
			<br>
		
		</div>
	
	</div>
	
<jsp:include page="../common/footer.jsp"/>
</body>
</html>