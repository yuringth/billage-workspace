<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Draw</title>
<style>
    p {
        margin-bottom : 0px;
        padding : 0px;
    }
    .outer{
        width : 1200px;
        margin : auto;
        
    }
    .margin-bottom{
    	margin-bottom : 20px;
    }
    .align-side{
    	display : flex;
    	justify-content: space-between;
    }
    .align-left{
        flex: auto;
    }
    .align-left-outer{
        display: flex;
        flex-wrap: wrap;
    }
    .one-content{
        width : 400px;
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
    }
    .countnum{
        display: flex;
        flex-direction: row-reverse;
        font-size: 12px;
    }
    .textsize {
        font-size: 17px;
        margin : 0px;
    }
    .title-text{
		font-size: 25px;
        margin : 0px;
    }

</style>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <jsp:include page="../../common/header.jsp"/>
    <!-- 전체를 감싸는 div -->
    <div class="outer">
		<div class="align-side margin-bottom">
			<div class="dropdown">
				<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
				정렬
				</button>
				<div class="dropdown-menu"> 
					<a class="dropdown-item" href="#">무료응모만 보기</a>
					<a class="dropdown-item" href="#">응모중만 보기</a>
					<a class="dropdown-item" href="#">응모가격 순</a>
					<a class="dropdown-item" href="#">남은시간 순</a>
				</div>
			</div>
			<c:if test="${ not empty loginUser }">
				<div><button type="button" class="btn btn-info" onclick="location.href='enrollForm.dr'">글쓰기</button></div>
			</c:if>
		</div>






		<div class="align-left-outer" id="contentArea">
	        <c:forEach items="${ list }" var="b">
		        <div class="one-content">
		        	<input type="hidden" value="${ b.boardNo }" class="boardNo">
		        	<input type="hidden" value="${ b.closeDate }" class="closeDate">
		            <div class="img-area">
		                <img src="${ b.changeName }">
		            </div>
		            <div class="text-area">
		            	<!-- <p class="genre">${ b.genre }</p> -->
		                <p class="title-text">${ b.title }</p>
		                <p class="textsize">응모 가격 : ${ b.tryPoint }P</p>
		                <p class="textsize time">남은 시간 : ${b.remaindTime }</p>
		                <p class="countnum">조회 : ${ b.count }</p>
		            </div>
		        </div>
		        
		        
		        
			</c:forEach>
		</div>

    </div>	

    <jsp:include page="../../common/footer.jsp"/>
    
    <script>
    
    	$(function(){
    		$('.one-content').click(function(){
    			location.href='detail.dr?bno='+ $('.boardNo').val();
    		})	
    		closeCount();
			setInterval(closeCount, 500);
    	})
    	
    	
    	function closeCount(){
    		
    		$('.time')
    		
    		
    	}
    	
    	
    </script>
    
     <script>
    	
		function closeCount(){
    				
			var end = new Date("$('.closeDate').val()");
			var now = new Date(); 
			
			var remaindTime = end - now;
			
			var day = Math.floor(remaindTime / (1000*60*60*24));
		    var hour = Math.floor((remaindTime / (1000*60*60)) % 24);
		    var min = Math.floor((remaindTime / (1000*60)) % 60);
		    var sec = Math.floor(remaindTime / 1000 % 60);
			
		    if(sec < 10){
		    	sec = sec + '0';
		    }
		    if(min < 10){
		    	min = min + '0';
		    }
		    if(hour < 10){
		    	hour = hour + '0';
		    }
		    if(remaindTime >= 0){
		    	$('.time').text('남은 시간 : ' + day +'일 ' + hour + ':' + min + ':' + sec + ':');
		    } else {
		    	$('.time').text('응모 시간 종료');
		    }
		    
		}
    </script>


   

</body>
</html>