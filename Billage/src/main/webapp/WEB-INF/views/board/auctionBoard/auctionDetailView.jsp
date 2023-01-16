<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매글 상세보기</title>
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
		margin: 30px;
	}
	.btnArea{
		display: flex;
		width : 520px;
		margin: auto;
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

		
		<p class="time"></p>
		<p class="genre">${ b.genre }</p>
		<p class="title">"${ b.title }"</p>
		<p class="bookWriter">${ b.bookWriter }</p>
		<div class="content" style="width : 550px">
			<p>
				${ b.content }
			</p>
		</div>
		<p class="nowPrice" id="nowPrice">현재가격 : ${ b.nowPrice }P</p>
		<c:choose>
			<c:when test="${ not empty b.instantlyPrice }">
				<p class="instantlyPrice">즉시구매가 : ${ b.instantlyPrice }P</p>
			</c:when>
			<c:otherwise>
				<p class="instantlyPrice">즉시구매 불가</p>
			</c:otherwise>
		</c:choose>
	
		<div style="display :flex;" class="priceArea" >
			<div>
				<p>시작가 : ${ b.startPrice }P 입찰가격 : </p>
			</div>
			<div style="width:100px">
			
					<input type="number" id="bidPrice" value="${ b.nowPrice }" width="100px" step="${ b.bidPrice }">
				
			</div>
		</div>
		
		
		<div class="btnArea">
		
			<c:choose>
			<c:when test="${ not empty loginUser }">
				<c:choose>
				<c:when test="${ loginUser.userNo != b.userNo }">
					<c:if test="${ loginUser.point >= b.bidPrice && not empty b.instantlyPrice }">
						
						<button class="btn1 btn btn-dark" onclick="buy();">
							즉시구매
						</button>
						<button class="btn1 btn btn-secondary" onclick="bid();">
							입찰
						</button>
						
					</c:if>
					<c:if test="${ loginUser.point >= b.bidPrice && empty b.instantlyPrice }">
						
						<button class="btn1 btn btn-secondary" onclick="bid();">
							입찰
						</button>
						
					</c:if>
					<c:if test="${ loginUser.point < b.bidPrice && not empty b.instantlyPrice }">
						
						<button class="btn1 btn btn-dark" onclick="notEnoughtPoint();">
							즉시구매
						</button>
						<button class="btn1 btn btn-secondary" onclick="notEnoughtPoint();">
							입찰
						</button>
						
					</c:if>
					<c:if test="${ loginUser.point < b.bidPrice && empty b.instantlyPrice }">
						
						<button class="btn1 btn btn-secondary" onclick="notEnoughtPoint();">
							입찰
						</button>
						
					</c:if>
				</c:when>
				<c:otherwise>
				
					<button class="btn1 btn btn-secondary" disabled>
						작성자입니다.
					</button>
					
				</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
			
					<button class="btn1 btn btn-secondary" disabled>
						로그인을 해주세요
					</button>
				
			</c:otherwise>
			</c:choose>
			
		</div>
		
		
		<input type="hidden" id="prizeUserNo" value="${prizeUserNo}">
		
		
		
		<c:if test="${ loginUser.userNo ==  b.userNo}">
			<button onclick="postFormSubmit();" >삭제하기</button>
		</c:if>
		
		<form action="" method="post" id="postForm">
			<input type="hidden" name="tryPoint" value="${b.tryPoint}">
			<input type="hidden" name="changeName" value="${b.changeName}">
			<input type="hidden" name="boardNo" value="${b.boardNo}">
		</form>
		
		
	</div>
	
	
	<script>
		//전역변수 선언
		var interval;
		
		
		$(function(){
			interval = setInterval(closeCount, 500);
			
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
		    	
		    	clearInterval(interval); //인터벌 종료
		    	
		    	$('.time').text('시간 종료');
		    	$('.btn1').attr('disabled', true).text('시간 종료');
		    	if(${ empty b.prizeUser }){
			    	selectPrizeUser();
		    	}
		    	
		    }
		}
		
		
		function bid(){
			
			if(${not empty loginUser}){
				 
				$.ajax({
					 url : bid.ac,
					 data : {
						 boardNo : ${b.boardNo},
						 userNo : ${loginUser.userNo},
						 bidPrice : $('#bidPrice').val(),
						 prizeUserNo : $('#prizeUserNo').val(),
						 nowPrice : $('#nowPrice').text()
					 },
					 success : function(result){
						$('#nowPrice').text(result.nowPrice);
						$('#prizeUserNo').val(result.prizeUserNo);
						$('#bidPrice').val(result.nowPrice);
						//여기에 최소값 어쩌구 설정하기						 
					 },
					 error : function(){
						 console.log('error');
					 }
				 })
				 
			}
			
		}
		
		
		function buy(){
			
			if(${not empty loginUser}){
				 
				$.ajax({
					 url : buy.ac,
					 data : {
						 boardNo : ${b.boardNo},
						 userNo : ${loginUser.userNo},
						 bidPrice : $('#bidPrice').val(),
						 prizeUserNo : $('#prizeUserNo').val(),
						 instantlyPrice : ${ b.instantlyPrice }
					 },
					 success : function(result){
						$('#nowPrice').text(result.nowPrice);
						$('#prizeUserNo').val(result.prizeUserNo);
						$('#bidPrice').val(result.nowPrice);
						//여기에 최소값 어쩌구 설정하기						 
					 },
					 error : function(){
						 console.log('error');
					 }
				 })
				 
			}
			
		}
		
		
		function postFormSubmit(){
			if(confirm('삭제하시겠습니까?')){
				$('#postForm').attr('action','delete.ac').submit();
			}
		}
		
		//당첨자 선정하는 함수
		function selectPrizeUser(){
			
			$.ajax({
				url : 'prize.ac',
				data : {
					boardNo : ${b.boardNo},
					userNo : ${b.userNo},
					title : '${b.title}',
					tryPoint : ${b.tryPoint}
				},
				success : function(result){
					if(result.prizeUser != null){
						$('#prizeUser').text('낙찰자 : ' + result.prizeUser)
					} else {
						$('#prizeUser').text('입찰자가 없어서 낙찰자가 없습니다.')
					}
				},error : function(){
					console.log('오류');
				}
			});
		}
		
		function notEnoughtPoint(){
			confirm('포인트가 부족합니다. 충전하시겠습니까?');
		}
		
	</script>
	
	

	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>