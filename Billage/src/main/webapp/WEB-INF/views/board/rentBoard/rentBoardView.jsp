<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.rt-title {
	font-size: 20px;
	font-weight: bold;
}

.rt-outer{
	width: 1200px;
	margin: 0 auto;
}

.hot {
	display: flex;
	margin-bottom: 50px;
	flex-wrap: wrap;
}

.productbox {
	border: 1px solid rgb(154, 154, 154);
	height: 330px;
	width: 255px;
	margin-top: 10px;
	margin-right: 30px;
}

.productbox p {
	margin: 0px 10px;
}
</style>
</head>
<body>
	
	<jsp:include page="../../common/header.jsp" />
	<!-- 가로로 4개 세로로 2개  => 한 화면에 8개 -->
	<div class="rt-outer">
		<h2>대여게시판</h2>
		<div style="display: flex; justify-content: end;"><button onclick="location.href='enrollForm.rt'">글 올리기</button></div>
		<hr>
		<div class="rt-box">

			<%--<c:forEach items="" var="">--%>
			<div class="rt-contentbox">
				<input type="hidden" name="" value=""> <img src=""
					width="255" height="200">
				<p>
					<span class="rt-title">글제목</span><br> 글쓴이<br> 포인트입력 <br> 대여시작일 : 2023-01-15
				</p>
			</div>
			<%--</c:forEach> --%>
		</div>
	</div>
	
	
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>