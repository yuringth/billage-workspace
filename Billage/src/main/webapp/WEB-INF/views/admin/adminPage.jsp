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
	    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

    <div class="wrapper">
        <div class="sidebar">
            <h2>관리자 페이지</h2>
            <ul>
                <li><a href="#"><i class="fas fa-user"></i>회원 관리</a></li>
                <li><a href="#"><i class="fas fa-home"></i>모임 관리</a></li>
                <li><a href="#"><i class="fas fa-address-card"></i>1:1 문의</a></li>
                <li><a href="#"><i class="fas fa-project-diagram"></i>FAQ 관리</a></li>
                <li><a href="#"><i class="fas fa-blog"></i>공지사항</a></li>
                <li><a href="#"><i class="fas fa-address-book"></i>연재 요청</a></li>
            </ul>
        </div>
        <div class="main_content">
            
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>