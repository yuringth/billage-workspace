<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 여긴 메인</title>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	너가가진포인트 : ${ loginUser.point }<br>
	
	
	<jsp:include page="common/footer.jsp"/>
	
</body>
</html>