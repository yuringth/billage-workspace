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

	<div class="outer">
		<div class="userProfile">
			<div id="profile"><img src="${user.profileImg }" width="100px;" height="100px;"></div>
			<div id="nickName"><a href="selectLoginUser.fo">${ user.nickname }</a></div>
			<div class="detailList" style="display:flex; flex-direction: row;">
				<div id="review"><a href="selectReviewList.fo?uno=${ user.userNo }">리뷰${ user.reviewCount } &nbsp;</a></div>
				<div id="following" >팔로잉 &nbsp;${ user.following } &nbsp;</div>
				<div id="follower"> 팔로워 &nbsp;${ user.follower } &nbsp;</a></div>
			</div>
		</div>
		<br>	
		<hr>
		<br>
		<div><h2>취향분석</h2></div>
		
		 <div>
		  <canvas id="myChart"></canvas>
		</div>
		<br><br>
		
		<div class="starList" style="display:flex; flex-direction: row; justify-content: space-evenly;">
			<div id="starAverage"><h2>별점 평균 : ${user.avgStar }</h2></div>
			<div id="starCount"><h2>별점 갯수 : ${user.reviewCount }</h2></div>
			<div id="starMany"><h2>많이 준 별점 : ${user.maxStar }</h2></div>
		</div>
	</div>
	<br><br><br>
	
	<script>
	  const ctx = document.getElementById('myChart');
	
	  new Chart(ctx, {
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