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
	.star>span {
		background-color : yellow;
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
				<div id="review">평가 150 </div>
				<div id="following">팔로워 5 </div>
				<div id="follower">팔로잉 5 </div>
			</div>
		</div>
		<br>	
		<hr>
		<br>
		<div><h2>취향분석</h2></div>
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
	</div>


<jsp:include page="../common/footer.jsp"/>

</body>
</html>