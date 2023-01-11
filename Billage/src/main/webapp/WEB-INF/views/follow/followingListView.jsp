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
	
	#following{
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
	
	<!-- 팔로잉한 페이지 목록의 팔로우 버튼은 모두 팔로잉 상태여야 한다.
			팔로잉한 상대방의 닉네임을 누르면 해당 유저의 detailView로 이동한다.
	 -->
	<div class="outer" >
		
		<div id="followinglist">
			
			<h1 align="center">팔로잉</h1>
			
			<hr>
			
			<c:forEach items="${ followingList }" var="f">
					<div id="following" style="display:flex; flex-direction: row; justify-content: space-evenly;">
						<div id="profile">
							<img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png" width="100px;" height="100px;">
						</div>
						<div id="userDetail">
							<div id="userNickName" ><a href="followDetail.fo?uno=${f.userNo }">${ f.nickname }</a></div>
							<div id="reviewCount">리뷰100</div>
						</div>
						<button id="followingBtn" style="width:100px; height:50px;">팔로잉</button>
						</div>
						<br><br>
					</c:forEach>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		 $(function(){
				$('#${ f.nickname }').click(function(){
					location.href='followDetail.fo?uno=' +
				})
			});
	</script>

</body>
</html>