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
        width : 1200px;
        margin : auto;
    }
    .align-left{
        flex: auto;
    }
    .one-content{
        width : 400px;
        height: 550px;
        padding-left: 8px;
        padding-right: 8px;
        padding-bottom: 16px;
    }
    .img-area{
        width : 100%;
        height : 80%;
        
    }
    .text-area{
        width:100%;
        height:20%;
        padding-top: 25px;
        padding-bottom: 25px;
    }
    .text-area p{
        display: flex;
        flex-direction: row-reverse;
    }

</style>
</head>
<body>
    <!-- 전체를 감싸는 div -->
    <div class="outer">

        <div class="one-content">
            <div class="img-area">
                <img src="">
            </div>
            <div class="text-area">
                <h3>책 제목</h3>
                <h5>응모 가격 : </h5>
                <h5>남은 시간 : 00:00:00</h5>
                <p>조회 : 10</p>
            </div>

        </div>

    </div>	
</body>
</html>