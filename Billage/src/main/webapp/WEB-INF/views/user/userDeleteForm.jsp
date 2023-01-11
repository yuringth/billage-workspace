<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="myPageBar.jsp" />
	
	<div class="delete-outer" align="center">
	
		<form action="delete.me" method="post">
			<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
			
			<div class="col-sm-3">
				<h3>회원 아이디</h3>
			</div>
			<div>
				<input type="text" value="John Doe">
			</div>
			
	
	
	
	
		</form>
	</div>
	
	
	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>