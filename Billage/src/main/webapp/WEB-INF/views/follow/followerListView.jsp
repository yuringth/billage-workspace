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
	a {
  		text-decoration: none;
	}
	
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	
	<!-- 
		나를 팔로우한 유저들을 볼 수 있다.
		팔로워 목록의 팔로우 버튼의 경우 팔로잉한 상대가 아니라면 팔로우 버튼으로 활성화 해준다.
		마찬가지로 유저의 닉네임을 누르면 해당 유저의 deatailView로 이동한다.
	 -->
	<div class="outer" >
		
		<div id="followerlist">
			
			<h1 align="center">팔로워</h1>
			
			
			<hr>
				
				<div style="display:flex; flex-direction: column; justify-content: space-evenly;">
					<c:forEach items="${ followerList1 }" var="f1">
					<div id="follower" style="display:flex; flex-direction: row; justify-content: space-evenly;">
						<div id="profile">
							<img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png" width="100px;" height="100px;">
						</div>
						<div id="userDetail">
							<div id="userNickName" ><a href="followDetail.fo=${f1.userNo}">${ f1.nickname }</a></div>
							<div id="reviewCount"><a href="reviewList.fo"></a>리뷰100</div>
						</div>
							<button id="followerBtn" width="50px;" height="20px;">팔로잉</button>
					</c:forEach>
					<c:forEach items="${ followerList2 }" var="f2">
						<div id="follower" style="display:flex; flex-direction: row; justify-content: space-evenly;">
						<div id="profile">
							<img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png" width="100px;" height="100px;">
						</div>
						<div id="userDetail">
							<div id="userNickName" ><a href="followDetail.fo=${f2.userNo}">${f2.nickname }</a></div>
							<div id="reviewCount"><a href="reviewList.fo"></a>리뷰100</div>
						</div>
							<button id="followerBtn" width="50px;" height="20px;">팔로우</button>
							</div>
					</c:forEach>
				</div>
								

							
						
				</div>

		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>