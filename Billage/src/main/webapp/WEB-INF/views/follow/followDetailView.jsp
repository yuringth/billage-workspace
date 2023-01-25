<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

	<!-- 
		프로필을 누른 해당 유저의 프로필
		평가를 누르면 해당 유저가 평가한 도서 목록을 볼 수 있다.
		팔로잉/팔로워를 누르면 유저의 팔로우/팔로잉 목록으로 갈 수 있다.
		해당 유저의 취향을 볼 수 있다.
		해당 유저와의 취향을 볼 수 있다.
	 -->
	 
	
	<div class="outer">
		
		<div id="userProfile">
			<div id="profile"><img src="${user.profileImg }" width="100px;" height="100px;"></div>
			<div id="nickName"><a href="selectUser.fo?uno=${ user.userNo }">${ user.nickname }</a></div>
			<div class="detailList" style="display:flex; flex-direction: row;">
				<div id="review"><a href="selectReviewList.fo?uno=${ user.userNo }">리뷰${ user.reviewCount } &nbsp;</a></div>
				<div id="following" ><a href="selectFollowing.fo?uno=${ user.userNo }">팔로잉&nbsp;${ user.following }&nbsp;</a></div>
				<div id="follower" ><a href="selectFollower.fo?uno=${user.userNo }">팔로우&nbsp;${ user.follower }&nbsp;</a></div>
			</div>
		</div>
		<br>	
		<hr>
		<br>
		<div><h2>취향분석</h2></div>
		<!-- 
		<div class="star">
			<div id="0.5"><span></span></div>
			<div id="1"><span prfix="1"></span></div>
			<div id="1.5"><span></span></div>
			<div id="2"><span prfix="2"></span></div>
			<div id="2.5"><span></span></div>
			<div id="3"><span prfix="3"></span></div>
			<div id="3.5"><span></span></div>
			<div id="4"><span prfix="4"></span></div>
			<div id="4.5"><span></span></div>
			<div id="5"><span prfix="5"></span></div>
		</div>
		 -->
		 <div>
		  <canvas id="myChart"></canvas>
		</div>
		<br><br>
		
		<div class="starList" style="display:flex; flex-direction: row; justify-content: space-evenly;">
			<div id="starAverage"><h2>별점 평균 : ${user.avgStar }</h2></div>
			<div id="starCount"><h2>별점 갯수 : ${user.reviewCount }</h2></div>
			<div id="starMany"><h2>많이 준 별점 : ${user.maxStar }</h2></div>
		</div>
		<hr>
		<h2>둘 다 재미있게 본 책</h2>
		<div class="funBook" style="display:flex; flex-direction: row; justify-content: space-evenly;">
		<c:forEach items="${ goodReview }" var="g">
			<div class="book1">
				<div class="funbookimg"><img src="${ g.bookImag }" width="150px;" height="250px;"></div>
				<br>
				<div class="funBookTitle">${ g.bookTitle }</div>
			</div>
		</c:forEach>
		</div>
	
		<br><br><br>
	
		<h2>둘이 엇갈린 책</h2>
		<div class="badBook" >
			<div class="book2Box" style="width:70%; height: 400px; background-color: rgb(235, 235, 235); margin:auto; display:flex; flex-direction: row; justify-content: space-evenly;">
				<div class="book2" style="margin-top: 50px;">
					<div id="badbookimg"><img src="${badReview.bookImag }" width="150px;" height="250px;"></div>
					<br>
					<div id="badBookTitle">${badReview.bookTitle }</div>
				</div>	
			</div>
		</div>
	
	</div>
	<br><br><br>
	
	
	<script>
	  const ctx = document.getElementById('myChart');
	
	 var mychart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	      labels: [ '1', '2', '3','4','5'],
	      datasets: [{
	        label: '평점☆',
	        data: [${star.star1},${star.star2},${star.star3},${star.star4},${star.star5}],
	        borderWidth: 1,
	        borderColor: 'rgb(236, 219, 71,0.8)',
	        backgroundColor: 'rgb(236, 219, 71,0.8)'
	      }]
	    },
	    options: {
	      scales: {
	        y: {
	          beginAtZero: true
	        }
	      }
	    }
	  });
	 
	 

	  
	  $(function(){
			$('#following').click(function(){
				location.href='selectFollowing.fo?uno=' +${user.userNo};
			});
			
			$('#follower').click(function(){
				location.href='selectFollower.fo?uno=' +${user.userNo};
			});
			
			
		});
	</script>


<jsp:include page="../common/footer.jsp"/>

</body>
</html>