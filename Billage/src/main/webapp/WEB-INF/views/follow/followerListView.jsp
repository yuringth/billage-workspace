<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>followerListView2</title>
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
								<c:choose>
									
									<c:when test="${ f1.userNo != sessionScope.loginUser.userNo }">
										<div id="followeing${f1.userNo }" style="display:flex; flex-direction: row; justify-content: space-evenly;">
											<div id="profile${f1.userNo }">
												<img src="${f1.profileImg }" width="100px;" height="100px;">
											</div>
											<div id="userDetail${f1.userNo }">
												<div id="userNickName${f1.userNo }" ><a href="selectUser.fo?uno=${f1.userNo}">${ f1.nickname }</a></div>
											</div>
												<input type="hidden"  id="f1${f1.userNo }" value="${ f1.userNo }">
													
											<c:if test="${ f1.followStatus == 1 }">
												<button id="followingBtn${ f.userNo}" class="1" style="width:100px; height:50px;" onclick="follow(this);">팔로잉</button>
											</c:if>
												
											<c:if test="${ f1.followStatus == 0 }">
												<button id="followingBtn${ f.userNo}" class="0" style="width:100px; height:50px;" onclick="follow(this);">팔로우</button>
											</c:if>
										
										</div>
									</c:when>
									
									<c:otherwise>
										<div id="followeing${f1.userNo }" style="display:flex; flex-direction: row; justify-content: space-evenly;">
											<div id="profile${f1.userNo }">
												<img src="${f1.profileImg }" width="100px;" height="100px;">
											</div>
											<div id="userDetail${f1.userNo }">
												<div id="userNickName${f1.userNo }" >${ f1.nickname }</div>
											</div>
												<input type="hidden"  id="f1${f1.userNo }" value="${ f1.userNo }">
										</div>
									</c:otherwise>
								
								</c:choose>
							</c:forEach>
							
							<c:forEach items="${ followerList2 }" var="f2">
								<c:choose>
									<c:when test="${ f2.userNo != sessionScope.loginUser.userNo }">
										<div id="follower${f2.userNo }" style="display:flex; flex-direction: row; justify-content: space-evenly;">
											<div id="profile${f2.userNo }">
												<img src="${ f2.profileImg }" width="100px;" height="100px;">
											</div>
											<div id="userDetail${f2.userNo }">
												<div id="userNickName${f2.userNo }" ><a href="selectUser.fo?uno=${f2.userNo}">${f2.nickname }</a></div>
											</div>
												<input type="hidden"  id="f2${f2.userNo }" value="${ f2.userNo }">
												
											<c:if test="${ f2.followStatus == 1 }">
												<button id="followingBtn${ f2.userNo}" class="1" style="width:100px; height:50px;" onclick="follow(this);">팔로잉</button>
											</c:if>
												
											<c:if test="${ f2.followStatus == 0 }">
												<button id="followingBtn${ f2.userNo}" class="0" style="width:100px; height:50px;" onclick="follow(this);">팔로우</button>
											</c:if>
										</div>
									</c:when>
									
										<c:otherwise>
											<div id="follower${f2.userNo }" style="display:flex; flex-direction: row; justify-content: space-evenly;">
												<div id="profile${f2.userNo }">
													<img src="${f2.profileImg }" width="100px;" height="100px;">
												</div>
												<div id="userDetail${f2.userNo }">
													<div id="userNickName${f2.userNo }" >${f2.nickname }</div>
												</div>
													<input type="hidden"  id="f2${f2.userNo }" value="${ f2.userNo }">
											</div>
										</c:otherwise>
								
								</c:choose>
							</c:forEach>
						</div>
					</c:when>
						<c:otherwise>
							<h1>로그인 하세용 </h1>
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