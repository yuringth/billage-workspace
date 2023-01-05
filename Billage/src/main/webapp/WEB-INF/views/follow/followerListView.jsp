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
	
	#follower{
		display:flex;
		flex-direction: row;
		justify-content: space-evenly;
	}
	
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	
	<div class="outer" >
		
		<div id="followerlist">
			
			<h1 align="center">팔로잉</h1>
			
			<hr>

			<div id="follower">
				<div id="profile">
					<img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png" width="100px;" height="100px;">
				</div>
				<div id="userDetail">
					<div id="userNickName">test</div>
					<div id="reviewCount">리뷰100</div>
				</div>
				<button id="followerBtn" width="50px;" height="20px;">팔로잉</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>