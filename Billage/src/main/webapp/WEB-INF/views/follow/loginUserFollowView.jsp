<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

	<div class="outer">
		<div id="userProfile">
			<div id="profile"><img src="https://i.pinimg.com/originals/4c/f0/16/4cf0163a9db5f4b69499b9365be5fcda.png"></div>
			<div id="nickName">user01</div>
			<div class="detailList">
				<div id="review">평가 150</div>
				<div id="following">팔로워 5</div>
				<div id="follower">팔로잉 5</div>
			</div>
		</div>
		<br>	
		<hr>
		<br>
		<div><h4>취향분석</h4></div>
		<div id="star">
			<div id="0.5"></div>
			<div id="1"></div>
			<div id="1.5"></div>
			<div id="2"></div>
			<div id="2.5"></div>
			<div id="3"></div>
			<div id="3.5"></div>
			<div id="4"></div>
			<div id="4.5"></div>
			<div id="5"></div>
		</div>
	</div>


<jsp:include page="../common/footer.jsp"/>

</body>
</html>