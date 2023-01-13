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
				
				<c:choose>
					<c:when test="${ !empty sessionScope.loginUser}">
						<div>
							<c:forEach items="${ followerList1 }" var="f1">
							<div id="followeing${f1.userNo }" style="display:flex; flex-direction: row; justify-content: space-evenly;">
								<div id="profile${f1.userNo }">
									<img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png" width="100px;" height="100px;">
								</div>
								<div id="userDetail${f1.userNo }">
									<div id="userNickName${f1.userNo }" ><a href="selectUser.fo?uno=${f1.userNo}">${ f1.nickname }</a></div>
									<div id="reviewCount${f1.userNo }"><a href="selectReviewList.fo?uno=${f1.userNo}"></a>리뷰100</div>
								</div>
									<input type="hidden"  id="f1${f1.userNo }" value="${ f1.userNo }">
									<button id="followingBtn${f1.userNo }" class="1" width="50px;" height="20px;" onclick="follow(this);">팔로잉</button>
							</div>
							</c:forEach>
							
							<c:forEach items="${ followerList2 }" var="f2">
								<div id="follower${f2.userNo }" style="display:flex; flex-direction: row; justify-content: space-evenly;">
								<div id="profile${f2.userNo }">
									<img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png" width="100px;" height="100px;">
								</div>
								<div id="userDetail${f2.userNo }">
									<div id="userNickName${f2.userNo }" ><a href="followDetail.fo?uno=${f2.userNo}">${f2.nickname }</a></div>
									<div id="reviewCount${f2.userNo }"><a href="selectReviewList.fo?uno=${f2.userNo }"></a>리뷰100</div>
								</div>
									<input type="hidden"  id="f2${f2.userNo }" value="${ f2.userNo }">
									<button id="followerBtn${f2.userNo }" class="0" width="50px;" height="20px;" onclick="follow(this);">팔로우</button>
									</div>
							</c:forEach>
						</div>
					</c:when>
						<c:otherwise>
							<h1>로그인 하세용 </h1>
						</c:otherwise>
				</c:choose>
				</div>

		</div>
	</div>
	
	
	
	<script>
		
		function follow(e){
			var num = $(e).attr('class');
			var userNo2 = $(e).prev().val();
			
			
			if(num > 0){
				$.ajax({
					url : 'delete.fo',
					method : 'post',
					data : {
						userNo2 : userNo2
					},
					success : function(result){
						if(result > 0){
							$(e).text('팔로우');
							$(e).attr('class','0');
						}
					},
					error : function(){
						console.log('에러');
					}
				})
			}
			else{
				$.ajax({
					url : 'insert.fo',
					method : 'post',
					data : {
						userNo2 : userNo2
					},
					success : function(result){
						if(result > 0){
							$(e).text('팔로잉');
							$(e).attr('class','1');
						}
					},
					error: function(){
						console.log('에러');
					}
				})
			}
		}	
	
			
	</script>
	
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>