<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추첨글 상세보기</title>
<style>
	p {
		margin: auto;
		margin-bottom: 0px;
	}
	.outer{
        width : 1200px;
        margin : auto;
    }
	.writerarea{
		width : 600px;
		margin: auto;
	}
	.imgarea{
		width: 600px;
		height : 600px;
		overflow: hidden;
		margin: auto;
		margin-bottom: 30px;
	}
	.time{
		text-align: center;
		font-size: 45px;
		font-weight: bold;
		margin-bottom: 20px;
	}
	.genre{
		text-align: center;
		font-size: 17px;
		margin-bottom: 0px;

	}
	.title{
		text-align: center;
		font-size: 30px;
		font-weight: bold;
		margin-bottom: 0px;

	}
	.bookWriter{
		text-align: center;
		font-size: 20px;
		margin-bottom: 40px;
		font-weight: bolder;
	}
	.content{
		margin: auto;
		font-size: 18px;
		margin-bottom: 30px;
	}
	.nowPrice,.instantlyPrice{
		text-align: center;
		font-size: 20px;
		font-weight: 600;
		margin-bottom: 8px;
	}
	.priceArea{
		width : 550px;
		margin: auto;
		justify-content: center;
		font-size: 20px;
		font-weight: 600;
		margin-bottom: 8px;
	}
	.btn1{
		width : 200px;
		margin-top: 30px;
		margin-left: 500px;
	}



</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	
	<div class="outer">

		<div class="writerarea">
			<p>작성자 : ${ b.nickname }</p>
		</div>
		<!--이미지 영역-->
		<div class="imgarea">
			<img style="width: 600px; height: 600px;"src="${ b.changeName }">
		</div>
		

		
		<p class="time">${b.remaindTime }</p>
		<p class="genre">${ b.genre }</p>
		<p class="title">"${ b.title }"</p>
		<p class="bookWriter">${ b.bookWriter }</p>
		<div class="content" style="width : 550px">
			<p>
				${ b.content }
			</p>
		</div>
		
		<c:choose>
			<c:when test="${ not empty loginUser }">
				<c:choose>
					<c:when test="${ loginUser.userNo == b.userNo }">
						<button class="btn1 btn btn-secondary" disabled">
							작성자입니다.
						</button>
					</c:when>
					<c:otherwise>
						<c:if test="${ loginUser.point < b.tryPoint }">
							<button class="btn1 btn btn-secondary" onclick="notEnoughtPoint();">
									${b.tryPoint}P 응모하기
							</button>
						</c:if>
						<c:if test="${ loginUser.point >= b.tryPoint }">
							<button class="btn1 btn btn-secondary" onclick="postFormSubmit(2);">
								${b.tryPoint}P 응모하기
							</button>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<button class="btn1 btn btn-secondary" onclick="notLogin();">
					${b.tryPoint}P 응모하기
				</button>
			</c:otherwise>
		</c:choose>
		
		<form action="" method="post" id="postForm">
			<input type="hidden" name="tryPoint" value="${b.tryPoint}">
			<input type="hidden" name="changeName" value="${b.changeName}">
			<input type="hidden" name="boardNo" value="${b.boardNo}">
			<!-- 로그인 한 유저번호 -->
			<input type="hidden" name="userNo" value="${loginUser.userNo}"> 
		</form>
		
		<c:if test="${ loginUser.userNo ==  b.userNo}">
			<button onclick="postFormSubmit(1);" >삭제하기</button>
		</c:if>
		
	</div>
	
	
	<script>
		$(function(){
			closeCount();
			setInterval(closeCount, 500);
			tryBtnChange();
		})
		
	
		function closeCount(){
			var end = new Date('${ b.closeDate }');
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
		    	$('.time').text(day +'일 ' + hour + ':' + min + ':' + sec);
		    } else {
		    	$('.time').text('응모 시간 종료');
		    	$('.btn1').attr('disabled', true).text('응모 시간 종료');
		    	//여기에서 당첨자 돌리는 함수  호출
		    }
		}
	
		function postFormSubmit(num){
			if(num == 1){
				if(confirm('삭제하시겠습니까?')){
					$('#postForm').attr('action','delete.dr').submit();
				}
			}
			if(num == 2){
				if(confirm("${b.tryPoint}P 로 응모하시겠습니까?")){
					$('#postForm').attr('action','draw.dr').submit();
				}
			}
		}
		
		function notLogin(){
			alert('로그인을 하셔야 이용 가능합니다.');
		}
		
		function notEnoughtPoint(){
			confirm('포인트가 부족합니다. 충전하시겠습니까?');
		}
		
		function tryBtnChange(){
			$.ajax({
				url : 'checkDraw.dr',
				data : {
					boardNo : ${b.boardNo},
					userNo : ${loginUser.userNo}
				},
				success : function(result){
					
				}
				
				
			});
		}
		
	</script>
	

	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>