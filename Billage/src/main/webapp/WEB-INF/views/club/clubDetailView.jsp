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
	
	#group-reply-area{ display:block; width:1200px; height:300px;}
	#group-chat-area{display:block; width:1200px; height:300px; border:1px solid black; overflow:scroll;}
	#group-chat-area > .chat-zone{}
	#participant-area{ border:1px solid black; width:100%; height:400px; overflow:scroll;}
	
	.members-area{ width: 100%; height:40px;  text-align:center; }
	.members-area>.members{width:33%; height:40px; display: inline-block; float:left; }
</style>

</head>
<body>


    <jsp:include page="../common/header.jsp" />
    

    <div id="all-detail">

    	<br><br><br>

		<button id="${ club.memUser }" onclick="insertBoard(this);">게시글 작성하러 가기 </button>

    	<br><br><br>

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
						<th>신청자 수</th>
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
							<td id="open-mem-limit">${ c.openLimit }</td>
							<td id="open-mem-count">${ c.openMemCount }</td>
							<td>${ c.openStatus }</td>
							<td>
								<button id="clubOpen-btn">신청할랭?</button>
								<input type="hidden" name="openNo" value="${ c.openNo }" />
							</td>      
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div id="group-reply-area">
			<div>댓글존</div>
		</div>
		
		<c:choose>
			<c:when test="${ !empty loginUser }" >
				<button onclick="chatIn();"> chat입장 </button>
				<button onclick="chatOut();"> chat퇴장 </button>
			</c:when>
			<c:otherwise>
				<button onclick="chatIn(1);"> chat입장 </button>
				<button onclick="chatOut(1);"> chat퇴장 </button>
			</c:otherwise>
		</c:choose>
		<div id="group-chat-area" class="chat chat-area">
			<div id="chat-zone" class="chat">

			</div>
			<div id="chat-text-area" class="chat">
					
			</div>
		</div>
		<div id="chat-input-area" class="chat">
			<input id="text-input" type="text" style="width:500px; height:40px;"/>
			<button onclick="chatSend();">전송</button>
		</div>		
	</div> <!-- all-detail 끝 -->
		
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
	<!-- -----------------  modal  -------------------- -->
	<div class="mem-modal-area">
		<div >
			<div>
			
			</div>
		
		</div>
	</div>
	
    
    <!-- ------------------------ 찜하기 / 가입하기 버튼 구현 ------------------------------- -->
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
    	// insertBoard() --------------------------------------------------
		function insertBoard(memUser){
    		console.log($(memUser).attr('id'));
    		
    		var $memUser = $(memUser).attr('id');
    		
    		if(  ${loginUser.userNo * 1} != $memUser ){
    			alert('Club 회원만 이용이 가능합니다.');
    		} else if ( $memUser == 0){
    			alert('Billage 회원만 이용이 가능합니다.');
    		} else {
    			location.href = 'board.cl?clubNo=' + ${club.clubNo};
    		}
    		
    		
    	}
    
  		// clubMember list 뿌리기 --------------------------------------- 
   		ajaxClubMember();
   		
   		function ajaxClubMember(){
   			
   			$('.members').remove();
   			
   			var $clubNo =  ${ club.clubNo };
   			
   			$.ajax({
   				url : 'ajaxMemList.cl',
   				data : {
   					clubNo : $clubNo
   				},
   				success : function(result){
   					var img = '';
   					
   						for(i in result){
   							
   							if( result[i].clubImg == null ){
   								img = 'resources/images/no_image.jpg';
   							} else {
   								img = result[i].clubImg;
   							}
   							
   		    				str = '<div class="members members-area" id="'+ result[i].userNo +'">'
   	    					    + '<div class="members"><img src="'+ img +'" width="40px;" height="40px;"></div>'
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
   		} // clubMember()메소드 끝 
   		
   		
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
	    	} else if(${ club.clubLimit == club.memCount }){
	    		$('#btn-zone .parti-btn').text('모집완료')
	    	}
	    	else {
	    		$('#btn-zone .parti-btn').text('가입');
	    	}
	    	
	    	
	    	// 문서 로딩될 때 버튼 상태2 ---------------------------------------------------
	    	// 클럽제한수가 클럽멤버 총 수 보다 크면 가입버튼 비활성화 !! 
	    	if(${ club.clubLimit > club.memCount } ||
	    	   $('#btn-zone .parti-btn').attr('id') > 0 ){
	    		$('#btn-zone .parti-btn').attr('disabled', false);
	    	} else {
	    		$('#btn-zone .parti-btn').attr('disabled', true);
	    	}
	    	
	    	
    	}); //$(function()) 닫음
    	
    	
    	// 채팅하기 구현( Web Socket ) ---------------------------------------------------------------------
    	let socket;

		function chatIn(memCheck){

			if(memCheck === 1){
				alert('로그인 유저만 이용 가능합니다. ');
			} else {
				
				
				var uri = 'ws://localhost:8787/billage/clubChat'
				socket = new WebSocket(uri); 
				// 생성자 함수 
				
				socket.onopen = function(){
					console.log('서버랑 연결됐님?');
					$('#chat-text-area').text('${loginUser.nickname}!! 이 몸 등장 ㅋ');
				}
				
				socket.onmessage = function(e){
					console.log('onmessage');
					console.log('e : ' + e);
					console.log('메시지가 도착했씁니다');
					
					if(e.data.substr(0,4) == '----'){
						console.log('여긴 이프문이얌');
						console.log('if e:' + e.data);
						$('#chat-text-area').html(e.data);
						
					} else {
						var str = $('<p></p>');
						
						console.log('else : ' +  e);
						str.text(e.data);
						$('#chat-text-area').append(str);
						
					}
					
				}
				
			}
			
		}
		
		
		function chatSend(){
			
			var text = $('#text-input').val();
			
			if(!text){
				return;
			}
			
			socket.send(text);
			
			$('#text-input').val('');
		}
	
		
		function chatOut(e){
			
			if(e === 1){
				alert('로그인 유저만 이용 가능합니다. ');	
				
			} else{
				socket.close();
				$('#chat-text-area').text('${loginUser.userId}!! 퇴장하셨씁니다');
			}
		}
	
    	
    </script>
    

	<c:if test="${ !empty loginUser.userNo }">
		<script>
		
    		// clubOpen 신청버튼
    		$(document).on('click', '#clubOpen-btn', function(){
    		var $openNo = $(this).siblings('input[name=openNo]').val();
    			
	    		$.ajax({
	    			url : 'ajaxOpenInsert.cl',
	    			data : {
	    				openNo : $openNo,
	    				userNo : ${ loginUser.userNo },
	    				clubNo : ${ club.clubNo }
	    			},
	    			success : function(result){
	    				console.log(result);
	    				$('#open-mem-count').text(result);
	    				
	    			},
	    			error : function(){
	    				console.log('비동기 통신 실패 : clubOpen Insert fail');
	    			}
	    		});
    		
    		});
		
		</script>
	</c:if>


    <jsp:include page="../common/footer.jsp" />
</body>
</html>