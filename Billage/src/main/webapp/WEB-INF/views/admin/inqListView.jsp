<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        list-style: none;
        text-decoration: none;
    }
    
    body {
        background-color: #f3f5f9;
    }
    
    .wrapper {
    	display: flex;
        position: relative;
    }
    
    .wrapper .sidebar {
        width: 300px;
        height: 100%;
        background: #4b4276;
        padding: 30px 0px;
        margin-left: 200px;
        /* position: fixed; */
    }
    .wrapper .sidebar h2 {
        color: #fff;
        text-transform: uppercase;
        text-align: center;
        margin-bottom: 30px;
    }
    .wrapper .sidebar ul li {
        padding: 15px;
        border-bottom: 1px solid #bdb8d7;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        border-top: 1px solid rgba(255, 255, 255, 0.05);
    }
    .wrapper .sidebar ul li a {
        color: #bdb8d7;
        display: block;
    }
    .wrapper .sidebar ul li a .fas {
        width: 25px;
    }
    .wrapper .sidebar ul li:hover {
        background-color: #594f8d;
    }
    .wrapper .sidebar ul li:hover a {
        color: #fff;
    }
    .wrapper .sidebar .social_media {
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
    }
    .wrapper .sidebar .social_media a {
        display: block;
        width: 40px;
        background: #594f8d;
        height: 40px;
        line-height: 45px;
        text-align: center;
        margin: 0 5px;
        color: #bdb8d7;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .wrapper .main_content {
        width: 100%;
        margin-left: 150px;
    }
    .wrapper .main_content .header {
        padding: 20px;
        background: #fff;
        color: #717171;
        border-bottom: 1px solid #e0e4e8;
    }
    .wrapper .main_content .info {
        margin: 20px;
        color: #717171;
        line-height: 25px;
    }

    .wrapper .main_content .info div {
        margin-bottom: 20px;
    }

    @media (max-height: 500px) {
        .social_media {
            display: none !important;
        }
    }
</style>
<body>
   <jsp:include page="../common/header.jsp"/>

   <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <div class="wrapper">
        <div class="sidebar">
            <h2>관리자 페이지</h2>
            <ul>
                <li><a href="selectUser.ad"><i class="fas fa-user"></i>회원 관리</a></li>
                <li><a href="selectGroup.ad"><i class="fas fa-home"></i>모임 관리</a></li>
                <li><a href="inquiryList.ad"><i class="fas fa-address-card"></i>1:1 문의</a></li>
                <li><a href="faqList.fa"><i class="fas fa-project-diagram"></i>FAQ 관리</a></li>
                <li><a href="noticeList.no"><i class="fas fa-blog"></i>공지사항</a></li>
                <li><a href="serialApply.ad"><i class="fas fa-address-book"></i>연재 요청</a></li>
            </ul>
        </div>
        <div class="main_content">
            <h2>hello, admin</h2>
        </div>
    </div>
    
    
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>