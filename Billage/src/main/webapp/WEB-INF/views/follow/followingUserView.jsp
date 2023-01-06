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
	.star>span {
		background-color : rgb(236, 219, 71);
	}
	
	#book2{
		width: 70%;
		color : rgb(234, 234, 234);
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

	<div class="outer">
		<div id="userProfile">
			<div id="profile"><img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png" width="100px;" height="100px;"></div>
			<div id="nickName">user01</div>
			<div class="detailList" style="display:flex; flex-direction: row;">
				<div id="review">평가 150 &nbsp;</div>
				<div id="following">팔로워 5 &nbsp;</div>
				<div id="follower">팔로잉 5 &nbsp;</div>
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
			<div id="starAverage"><h2>별점 평균 : ?</h2></div>
			<div id="starCount"><h2>별점 갯수 : ?</h2></div>
			<div id="starMany"><h2>많이 준 별점 : ?</h2></div>
		</div>
		<hr>
		<h2>둘 다 재미있게 본 책</h2>
		<div class="funBook" style="display:flex; flex-direction: row; justify-content: space-evenly;">
			<div class="book1">
				<div id="funbookimg"><img src="" width="150px;" height="250px;"></div>
				<br>
				<div id="funBookTitle">책 제목</div>
			</div>
		</div>
	
		<br><br><br>
	
		<h2>둘이 엇갈린 책</h2>
		<div class="badBook" style="display:flex; flex-direction: row; justify-content: space-evenly;">
			<div class="book2">
				<div id="badbookimg"><img src="" width="150px;" height="250px;"></div>
				<br>
				<div id="badBookTitle">책 제목</div>
			</div>	
		</div>
	</div>
	<br><br><br>
	
	
	<script>
	  const ctx = document.getElementById('myChart');
	
	  new Chart(ctx, {
	    type: 'bar',
	    data: {
	      labels: ['', '1', '', '2', '', '3', '','4','','5'],
	      datasets: [{
	        label: '평점☆',
	        data: [12, 30, 3, 5, 2, 3, 10, 11, 12,3],
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
	</script>


<jsp:include page="../common/footer.jsp"/>

</body>
</html>