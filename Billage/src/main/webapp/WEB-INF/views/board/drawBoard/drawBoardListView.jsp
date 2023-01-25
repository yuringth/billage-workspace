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
			
			<!-- 로그인이 되어 있을 경우에만 글쓰기 -->
			<c:if test="${ not empty loginUser }">
				<div><button type="button" class="btn btn-info" onclick="location.href='enrollForm.dr'">글쓰기</button></div>
			</c:if>
		</div>


		<!-- 무한 스크롤을 하기 위한 페이지 번호 -->
		<input type="hidden" value="${ pi.currentPage }" id="currentPage">

		<div class="align-left-outer" id="contentArea">
	        <c:forEach items="${ list }" var="b">
		        <div class="one-content" value="b">
	        		<input type="hidden" value="${ b.boardNo }" class="boardNo">
		        	<input type="hidden" value="${ b.closeDate }" class="closeDate">
		            <div class="img-area">
		                <img src="${ b.changeName }">
		            </div>
		            <div class="text-area">
		            	<!-- <p class="genre">${ b.genre }</p> -->
		                <p class="title-text">${ b.title }</p>
		                <p class="textsize">응모 가격 : ${ b.tryPoint }P</p>
		                <p class="textsize time"></p>
		                <p class="countnum">조회 : ${ b.count }</p>
		            </div>
		        </div>
			</c:forEach>
		</div>
		
		<!-- 스크롤이 하단에 도착했을 경우 새로 가져온 목록을 담을 div -->
		<div class=outOutter></div>

    </div>	

    <jsp:include page="../../common/footer.jsp"/>
    
    <script>
    
    	$(function(){
    		$(document).on('click', '.one-content', function(){
    			location.href='detail.ac?bno='+ $(this).find('.boardNo').val();
    		})
    		
    		closeCount();
			setInterval(closeCount, 500);
    	})
    	
    	function closeCount(){
    		$('.one-content').each(function(){
    			
    			var endTime = $(this).find('.closeDate').val();
    			var end = new Date(endTime);
				var now = new Date(); 
				
				var remaindTime = end - now;
				
				var day = Math.floor(remaindTime / (1000*60*60*24));
			    var hour = Math.floor((remaindTime / (1000*60*60)) % 24);
			    var min = Math.floor((remaindTime / (1000*60)) % 60);
			    var sec = Math.floor(remaindTime / 1000 % 60);
				
			    if(sec < 10){
			    	sec = '0' + sec;
			    }
			    if(min < 10){
			    	min = '0' + min;
			    }
			    if(hour < 10){
			    	hour = '0' + hour;
			    }
			    if(remaindTime >= 0){
			    	$(this).find('.time').text('남은 시간 : ' + day +'일 ' + hour + ':' + min + ':' + sec);
			    } else {
			    	$(this).find('.time').text('응모 시간 종료');
			    }
    			
    		});
    	}
    	
    </script>
    
    <script>
	    //전역변수 선언 / cNo가 -1이면 정지
    	var cNo = '';
    	if(cNo != -1){
		    $(function(){
		    	$(window).scroll(function() {
	    			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
						newlist();
	    		   	}
	   			});
		    })
    	}
	    function newlist(){
	    	
	        cNo = $("#currentPage").val();
	        
	        $.ajax({
	            url:"newlist.dr?cPage=" + (Number(cNo) + 1),
	            success: function(list){
	                
	                value = '<div class="align-left-outer">';
	                for(var i in list){
	                	value += '<div class="one-content">'
			    		       +	'<input type="hidden" value="' + list[i].boardNo + '" class="boardNo">'
			    		       + 	'<input type="hidden" value="' + list[i].closeDate + '" class="closeDate">'
			    		       +     '<div class="img-area">'
			    		       +         '<img src="' + list[i].changeName + '">'
			    		       +     '</div>'
			    		       +     '<div class="text-area">'
			    		       +         '<p class="title-text">' +  list[i].title + '</p>'
			    		       +         '<p class="textsize">현재 가격 : ' + list[i].tryPoint + 'P</p>'
			    		       +         '<p class="textsize time"></p>'
			    		       +         '<p class="countnum">조회 : ' + list[i].count + '</p>'
			    		       +     '</div>'
			    		       + '</div>'
	                }
	                value += '</div>';
	                
					$('#currentPage').val(Number(cNo) + 1);
	                
	                //리스트 크기가 6보다 작으면 cNo의 값을 -1로 변경(정지)
               		if(list.length < 6){
	                	cNo = -1;
	                }
	    		   	$('.outOutter').html($('.outOutter').html() + value);
	            }
        	});
    	}

    </script>   
    
    

   

</body>
</html>