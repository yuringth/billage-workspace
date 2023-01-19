<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 나는 모임 디테일뷰야</title>

<style>
	body{ padding-bottom:300px; box-sizing:border-box;}
	#all-detail h1, h3 { display:inline-block;}
	#all-detail{ margin:auto; width:1200px;}
	#group-btn-area { width:100%;  height: 160px; position:fixed; bottom:0; left:0; right:0; background-color: gray;}
	#btn-zone{ width:1200px; height:200px; margin:auto; text-align: center;}
	#btn-zone button{ 
		display:inline-block; 
		margin:auto; 
		width:430px; 
		height:120px;
		font-size:60px;
		background-color: white;
		border-style:none;
		vertical-align:middle;
		margin-top:20px;
		margin-left:30px;
		margin-right:30px;
	}
	#btn-zone button:hover{ cursor:pointer; font-weight:900;}
	
	
	#new-group{
		position:absolute;
		border: 2px solid black;
		border-radius: 50px;
		margin-left: -50px;
		line-height: 35px;
		width:40px;
		display:none;
		z-index:900;
	}
	
	#group-title-area{ margin:auto; width: 1000px; height:100px; }
	#group-detail-area{ width:1200px; height:600px;}
	#detail-left, #detail-right{ width:600px; display:block; float:left;}
	
	#group-info-area{ display:block; width:1200px; height:500px;}
	
	#group-reply-area{ display:bolck; width:1200px; height:300px;}
	
	#participant-area{ border:1px solid black; width:100%; height:400px; overflow:scroll;}
	
	.members-area{ width: 100%; height:40px;  text-align:center; }
	.members-area>.members{width:33%; height:40px; display: inline-block; float:left; }
</style>

</head>
<body>


    <jsp:include page="../common/header.jsp" />
    

    <div id="all-detail">

    	<br><br><br>
    	<button>게시글 작성하러 가기 </button>
    	<br><br><br>
    	<script>
	    	ajaxClubMember();
	    	
	    	function ajaxClubMember(){
	    		var $clubNo =  ${ club.clubNo };
	    		
	    		$.ajax({
	    			url : 'ajaxMemList.cl',
	    			data : {
	    				clubNo : $clubNo
	    			},
	    			success : function(result){
	    				
	    					for(i in result){
			    				var str = '';
		
			    				str = '<div class="members members-area" id="'+ result[i].userNo +'">'
		    					    + '<div class="members"><img src="'+ result[i].clubImg +'" width="40px;" height="40px;"></div>'
									+ '<div class="members" >' + result[i].nickname +'(' + result[i].clubDiscript +')</div>'
						            + '<div class="members" >버튼?</div>' 
				            		+ '</div>';
		    				
			    				$(str).appendTo('#participant-area');
			    				
	    					}
	    					
	    					$('#member-size').text(result.length);
	    			
	    			},
	    			error : function(){
						console.log('비동기 통신 실패, 참가자 조회');    				
	    			}
	    			
	    		})
    		}
    	
    	
    	</script>
    	

    	<div id="group-title-area">
			<span id="new-group" value="${ club.newCount }">new</span>
			<h1>[ ${ club.clubName } ]</h1>
    	</div>
    	<div id="group-detail-area">
    		<div id="detail-left">
    			<img width="500px" height="500px" src="${ club.clubImg }">
    			<p><b id="like-count">${ club.likeCount }</b>명이 찜했어요!</p>
    		</div>
    		<div id="detail-right">
    			<div>중심지역 : ${ club.clubLocation }</div>
    			<h3>회원목록 ( <span id="member-size"></span>명 )</h3>
    			<div id="participant-area" ></div>
    		</div>
    	</div>
    	<div id="group-info-area">
    		<h3>모임소개말 : </h3>
    		<div id="info-top">
    			<pre>${ club.clubDiscript }</pre>
    		</div>
    		<div id="info-bottom">
    		
    		</div>
    	</div>
		
		<div id="open-activity-area">
			<table border="1">
				<thead>
					<tr>
						<th>활동이름</th>
						<th>활동장소</th>
						<th>만남일자</th>
						<th>만남시간</th>
						<th>정원</th>
						<th>신청상태</th>
						<th>신청버튼</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ clubOpenList }" var="c" >
						<tr>
							<td>${ c.openTitle }</td>
							<td>${ c.openLocation }</td>
							<td>${ c.openDate }</td>
							<td>${ c.openTime }</td>
							<td>${ c.openLimit }</td>
							<td>${ c.openStatus }</td>
							<td>
								<button>신청할랭?</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		
		
		
		<div id="group-reply-area">
			<div>댓글존</div>
		</div>
	</div>
		
		<div id="group-btn-area">
				<c:choose>
					<c:when test="${ loginUser.userNo eq club.userNo }">
						<div id="btn-zone">
							<button type="button" class="like-btn" id="${ club.likeUser }"></button>
							<button type="button" onclick="location.href='admin.cl'">관리하기</button>
						</div>
					</c:when>
					<c:otherwise>
						<div id="btn-zone">
							<button type="button" class="like-btn" id="${ club.likeUser }"></button>
							<button type="button" class="parti-btn" id="${ club.memUser }"></button>
						</div>
					</c:otherwise>
				</c:choose>
		</div>
	
    
    <c:choose>
	    <c:when test="${ !empty loginUser }">
	    	<script>
				//찜하기 / 찜취소  ||  클럽신청	 / 신청취소 버튼 구분하기 
				const userNo  = ${ loginUser.userNo };  
				const clubNo = ${ club.clubNo };
				
				//------------찜하기 /찜취소
				$('#btn-zone .like-btn').click(function(){
					
					var $likeStatus = $(this).attr('id');

					$.ajax({
						url : 'clubLike.cl',
						data : {
							likeStatus : $likeStatus,
							userNo : userNo,
							clubNo : clubNo
						},
						success : function( result ){
							console.log(result[0]);
							if(result[0] > 0){
								$('#btn-zone .like-btn').empty();
								$('#like-count').empty();
								$('#like-count').text(result[1]);
								$('.like-btn').attr('id', userNo);
					    		$($('.like-btn').text('찜취소')).prependTo($('#btn-zone'));
					    	} else if (result[0] == 0) {
					    		$('#btn-zone .like-btn').empty();
					    		$('#like-count').empty();
								$('#like-count').text(result[1]);
					    		$('.like-btn').attr('id', 0);
					    		$($('.like-btn').text('찜하기')).prependTo($('#btn-zone'));
					    	} else{
					    		alert('잠시 후 다시 시도해주세요 ');
					    	}
						},
						error : function(){
							console.log('찜하기 비동기 실패');
						}
						
					}) // like ajax
				}); //like 버튼 클릭 
			  
				//-------------신청하기 / 신청취소 
				$('#btn-zone .parti-btn').click(function(){
					
					let $partiStatus = $(this).attr('id');
					let ans;
					
					if($partiStatus > 0){
						ans = confirm("정말 탈퇴하시겠습니까?");
					} else {
						ans = confirm("가입하시겠습니까?");
					}
					
					if(ans == true){
						
						$.ajax({
							url : 'clubMember.cl',
							data : {
								partiStatus : $partiStatus,
								userNo : userNo,
								clubNo : clubNo
							},
							success : function(result){
								console.log(result);
								// 신청 완 
								if( result > 0 ){
									$('#btn-zone .parti-btn').empty();
									$('.parti-btn').attr('id', userNo);
									$($('.parti-btn').text('탈퇴')).appendTo($('#btn-zone'));
									
									ajaxClubMember();
									
						    	} else if ( result == 0 ){
						    		$('#btn-zone .parti-btn').empty();
						    		$('.parti-btn').attr('id', 0);
						    		$($('.parti-btn').text('가입')).appendTo($('#btn-zone'));
						    		
									$('.members-area').each(function(){
										if($(this).attr('id') == ${ loginUser.userNo }){
											$(this).remove();
										}
									})
						    		
						    		ajaxClubMember();
						    		
						    	} else {
						    		alert('잠시 후 다시 시도해주세요');
						    		
						    	}
							},
							error : function(){
								console.log('신청하기 비동기 실패');
							}
						}) // parti ajax
						
						
					} // confirm이 true일때 
					else {
						console.log('버튼 활성화 노노');
					} // confirm false일 때 
				}); //parti 버튼 클릭 
	    	</script>
	    </c:when>
	    <c:otherwise>
	    	<script>
	    		$('#btn-zone button[type=button]').click(function(){
					alert("로그인유저만 가능합니다.");
	    		})
	    	</script>
	    </c:otherwise>
    </c:choose>
    
    <script>
    	

    
    
    	$(function(){
  
	    	//new 상태 표시 ----------------------------------------------------------
			$('#new-group').each(function(){
				if($(this).attr('value') == 1){
					$(this).show();
				}					
			});    
			
			
	    	// 문서 로딩될 때 버튼 상태 -----------------------------------------------------
	    	if($('#btn-zone .like-btn').attr('id') > 0){
	    		$('#btn-zone .like-btn').text('찜취소');
	    	} else {
	    		$('#btn-zone .like-btn').text('찜하기');
	    	}
	    	
	    	if($('#btn-zone .parti-btn').attr('id') > 0){
	    		$('#btn-zone .parti-btn').text('탈퇴');
	    		count++;
	    	} else {
	    		$('#btn-zone .parti-btn').text('가입');
	    	}
	    	
	    	// 문서 로딩될 때 버튼 상태2 ---------------------------------------------------
	    	// 클럽제한수가 클럽멤버 총 수 보다 크면 가입버튼 비활성화 !! 
	    	if(${ club.clubLimit > club.memCount } || $('#btn-zone .parti-btn').attr('id') > 0){
	    		$('#btn-zone .parti-btn').attr('disabled', false);
	    	} else {
	    		$('#btn-zone .parti-btn').attr('disabled', true);
	    	}
	    	
	    	
    	}); //$(function()) 닫음
    	
    	
    	
    	

    
    </script>
    

    <jsp:include page="../common/footer.jsp" />
</body>
</html>