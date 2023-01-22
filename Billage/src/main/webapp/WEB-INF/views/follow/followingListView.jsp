<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>followingListView</title>
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
			
			<c:choose>
				<c:when test="${ !empty sessionScope.loginUser }">
					<c:forEach items="${ followingList }" var="f">
						<c:choose>
							
							<c:when test="${ f.userNo != sessionScope.loginUser.userNo }">
								<div id="following${ f.userNo}" style="display:flex; flex-direction: row; justify-content: space-evenly;">
									<div id="profile${ f.userNo}">
										<img src="${f.profileImg }" width="100px;" height="100px;">
									</div>
									<div id="userDetail${ f.userNo}">
										<div id="userNickName"${ f.userNo} ><a href="selectUser.fo?uno=${f.userNo }">${ f.nickname }</a></div>
									</div>
									<input type="hidden" id="${f.userNo }" value="${ f.userNo }">
									
									<c:if test="${ f.followStatus == 1 }">
										<button id="followingBtn${ f.userNo}" class="1" style="width:100px; height:50px;" onclick="follow(this);">팔로잉</button>
									</c:if>
										
									<c:if test="${ f.followStatus == 0 }">
										<button id="followingBtn${ f.userNo}" class="0" style="width:100px; height:50px;" onclick="follow(this);">팔로우</button>
									</c:if>
								</div> 
								<br><br>
							</c:when>
							
							<c:otherwise>
								<div id="follower${f.userNo }" style="display:flex; flex-direction: row; justify-content: space-evenly;">
									<div id="profile${f.userNo }">
										<img src="${f.profileImg }" width="100px;" height="100px;">
									</div>
									<div id="userDetail${f.userNo }">
										<div id="userNickName${f.userNo }" >${f.nickname }</div>
									</div>
										<input type="hidden"  id="f2${f.userNo }" value="${ f.userNo }">
								</div>
							</c:otherwise>
							
						</c:choose>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<h1>로그인 해주세요</h1>
				</c:otherwise>
			</c:choose>
				
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
								$(e).attr('class' , '0');
							}
						},
						error : function() {
							console.log('에러');
						}
					})
				}
				else {
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
						error : function() {
							console.log('에러');
						}
					})
				}
			}
		
		
		</script>

	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>