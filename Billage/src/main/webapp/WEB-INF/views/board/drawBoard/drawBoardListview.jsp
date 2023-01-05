<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Draw</title>
<style>
    * {
        margin : 0px;
        padding : 0px;
    }
    .outer{
        width : 1200px;
        margin : auto;
        
    }
    .align-left{
        flex: auto;
    }
    .align-left-outer{
        display: flex;
        flex-wrap: wrap;
    }
    .one-content{
        width : 384px;
        height: 534px;
        padding-left: 8px;
        padding-right: 8px;
        padding-bottom: 16px;
    }
    .img-area{
        width : 100%;
        height : 414px;
        overflow: hidden;
    }
    .text-area{
        width: 344px;
        height: 100px;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 30px;
        padding-right: 10px;
    }
    .countnum{
        display: flex;
        flex-direction: row-reverse;
        font-size: 15px;
    }
    .textsize {
        font-size: 20px;
    }

</style>
</head>
<body>
    <jsp:include page="../../common/header.jsp"/>
	
    <!-- 전체를 감싸는 div -->
    <div class="outer align-left-outer">

        <div class="one-content">
            <div class="img-area">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20151001_94%2Fbyitself_1443657275235dwe4K_JPEG%2F20150919_114529.jpg&type=sc960_832">
            </div>
            <div class="text-area">
                <h1>책 제목</h1>
                <p class="textsize">응모 가격 : 150P</p>
                <p class="textsize">남은 시간 : 00:00:00</p>
                <p class="countnum">조회 : 10</p>
            </div>

        </div>
		
		 <div class="one-content">
            <div class="img-area">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20151001_94%2Fbyitself_1443657275235dwe4K_JPEG%2F20150919_114529.jpg&type=sc960_832">
            </div>
            <div class="text-area">
                <h1>책 제목</h1>
                <p class="textsize">응모 가격 : 200P</p>
                <p class="textsize">남은 시간 : 00:00:00</p>
                <p class="countnum">조회 : 10</p>
            </div>

        </div>
		
		 <div class="one-content">
            <div class="img-area">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20151001_94%2Fbyitself_1443657275235dwe4K_JPEG%2F20150919_114529.jpg&type=sc960_832">
            </div>
            <div class="text-area">
                <h1>책 제목</h1>
                <p class="textsize">응모 가격 : 100P</p>
                <p class="textsize">남은 시간 : 00:00:00</p>
                <p class="countnum">조회 : 10</p>
            </div>

        </div>
		
    </div>	

    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>