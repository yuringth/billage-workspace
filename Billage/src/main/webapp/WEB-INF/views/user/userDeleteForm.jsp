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
	
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="myPageBar.jsp" />
	
	<div class="delete-outer">
	
		<form action="delete.me" method="post">
			<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
			
			
	
	
	
	
		</form>
	</div>
	
	
	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>