<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#all-clubMem-admin{ width:1000px; margin:auto; }
	#club-member-area th,td{text-align : center;}
	#message-area{ width:500px; border:1px solid black; text-align : center;}
	#cancel-btn:hover{ cursor:pointer;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../user/myPageBar.jsp" />
	
	<div id="all-clubMem-admin">
		<h1> 모임 회원 관리 페이지 입니당 </h1>
		
		<script>

			$(function(){
			
				// 전체선택 or 취소 ----------------------------------------------------------------------
				$(document).on('click','#all-select' , function(){
					
					var $all = $('#all-select').prop('checked');
					
					if(!$all){
						$('.checked-btn').prop('checked', false);
					} 
					
					$('.checked-btn').each(function(){
						if($(this).attr('disabled') === 'disabled'){
							$(this).prop('checked', false);
						} else {
							$(this).prop('checked', true);
						}
					})
					
				});
				
			}); //$(function(){})끝 
			
			
			
			
			/* 한번 해보고 싶었던 부분 (나중에 해보기)

			// console.log($('.checked-btn').filter(':checked'));
			// .checked-btn 객체들 중에서 checked된 객체들만 선택해준다. 
			var userCheck = new Set();
			var $checkedMem;
			//var usercheck = {};
			
			//------------------------------------------------------------
			var flag = 1;
			$(document).on('click', '#send-btn', function(){
				var $clubNo = $('#getClubNo').val();
				// console.log($('.checked-btn').filter(':checked'));
				// .checked-btn 객체들 중에서 checked된 객체들만 선택해준다. 
				
				$checkedMem = $('.checked-btn').filter(':checked');
				
				var str = '';
					 str = '<input type="hidden" name="clubNo" value="' + $clubNo + '"/>';
					str += '<div id="crean-area">';
				
				if(flag == 1){
					$checkedMem.each(function(i, el){
						var userNo2 = $(el).next().val();
						var userId = $(el).parent().next().children().text();
						var nickname = $(el).parent().next().next().children().text();
						
						 str += '<p><input type="hidden" name="userNo2" value=" '+ userNo2 + '"/>';
						 str +=  nickname + ' ( ' + userId + ' ) <a id="cancel-btn"> x </a></p>'; 
						
						 userCheck.add(userNo2);

					}); 
					flag = 2;
					console.log('if' + flag);	 
				} else {
					console.log('else' + flag);
					var flag1 = 0;
					
					
					$checkedMem.each(function(i, el){
						var equalsMem =  $(el).next().val();
						
						var userNo2 = $(el).next().val();
						var userId = $(el).parent().next().children().text();
						var nickname = $(el).parent().next().next().children().text();
						
							    for (var i = 0; i < userCheck.length; i++) {
							    	if(userCheck.has(equalsMem)){
										alert(equalsMem +'번에 대한 중복값이 있음');
							    	}else {
										
										
										 str += '<p><input type="hidden" name="userNo2" value=" '+ userNo2 + '"/>';
										 str +=  nickname + ' ( ' + userId + ' ) <a id="cancel-btn"> x </a></p>'; 
										
										 userCheck.add(userNo2);
									
										console.log('equals : ' + equalsMem);

								}
							    	break;
							} 
							
					})
				}
			str += '</div>';
			$(str).insertAfter('#receiveUser');
			
				
			
			console.log(userCheck);
			console.log($checkedMem);
			
			// 해당 스트링을 #receiveUser div에 넣어준다. 
			
			$('.checked-btn').prop('checked', false);
			$('#all-select').prop('checked', false);
				
				
			});
			*/
				 
					
			// 쪽지 보내기----------------------------------------------------------------------
				function sendMsg(){
					
					var $checkedMem = $('.checked-btn').filter(':checked');
					
					var $clubNo = $('#getClubNo').val();
					
					var str = '<input type="hidden" name="clubNo" value="' + $clubNo + '"/>'
						    + '<div id="crean-area">';
						
					$checkedMem.each(function(i, el){
						// 메시지 한 번 보낼 때 한 아이디에 중복 메시지 보내지 못하도록 설정
						$(this).attr('disabled', true);
						var userNo2 = $(el).next().val();
						var userId = $(el).parent().next().children().text();
						var nickname = $(el).parent().next().next().children().text();
						
						 str += '<p>'
						     + '<input type="hidden" name="userNo2" value="'+ userNo2 + '"/>'
						     +  nickname + ' ( ' + userId + ' ) '
						     + '<a id="cancel-btn"> x </a>'
						     + '</p>'; 
						 
					}); 
						str += '</div>';
						
					// 해당 스트링을 #receiveUser div에 넣어준다. 
					$(str).insertAfter('#receiveUser');
					
					$('.checked-btn').prop('checked', false);
					$('#all-select').prop('checked', false);
					
				}// 쪽지보내기 메소드 끝 
			
		// 메시지 수신자 삭제 관련 기능 ---------------------------------------------------------------------------------
			var recoverArr = new Array();
				
			$(document).on('click', '#cancel-btn', function(){
			
				recoverArr.push($(this).prev('input[type=hidden]').val());
				
				chechedFree(recoverArr);
				
				$(this).parent().remove();
			});	
				
			
			function reWrite(){
				
				var ans = confirm('다시 쓰시겠습니깡?');
		
				if(ans == true){
					
					$('#crean-area input[type=hidden]').each(function(){
						recoverArr.push($(this).val());
					})
					
					chechedFree(recoverArr);
					
					$('#crean-area').remove();
				}
			};
			
			
			function chechedFree(e){
				
				$('.checked-btn').each(function(k, v){
					var num = $(v);						
					
					for(var i = 0; i < e.length; i++){
						if(e[i] == num.next().val()){
							num.attr('disabled', false);
						}
					}
				})
				
				recoverArr = [];
			};
				
				
			// 강퇴하기 ----------------------------------------------------------------------
			$(function(){
				
				$(document).on('click', '#delete-btn', function(){
					if( !$('.checked-btn').is(':checked')){
						alert('회원선택 없음 ');
						
					} else {
						
						var $checkedMem = $('.checked-btn').filter(':checked');
						var want = confirm('정말 강퇴하시겠습니까?');
						
						if(want == true) {
							
							var arrUserNo = [];
							var $clubNo = $('#getClubNo').val();
							
							$checkedMem.each(function(){
								var $userNo = $(this).next().val();
								
								arrUserNo.push($userNo);
							})
							
							$.ajax({
								url : 'ajaxDeleteClubs.cl',
								type : 'post',
								data : {
									clubNo : $clubNo,
									userNo : arrUserNo.toString()
								},
								success : function(result){
									alert("회원 강퇴에 성공하였습니다.");
									location.reload();
									
								},
								error : function(){
									console.log('비동기 통신 실패 : member 다수 강퇴 실패');
								}
								
							})//ajax통신 끝 
							
						} else {
						 	$('#all-select').prop('checked', false);
						 	
							$checkedMem.each(function(){
								$(this).prop('checked', false);
							})
							
						} // confilm true / false if문 끝 				
					} // checked true / false if문 끝 
				}); //on click메소드 끝 
			}); //$(function(){}) 끝
			
		</script>
		
		<br><br><br>
		<button onclick="location.href='admin.cl'">뒤로가기</button>
		<br><br><br>
		<a><input type="checkbox" id="all-select"/>전체선택 </a> |
		<a id="send-btn" onclick="sendMsg();">쪽지보내기</a> |
		<a id="delete-btn">강퇴하기</a>
		<br><br><br>

		<table id="#club-member-area" border="1">	
			<thead>
				<tr>
					<th>선택</th>
					<th>회원 ID</th>
					<th>회원 NICK</th>
					<th>가입일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ memberList }" var="m">
					<tr>
						<input id="getClubNo" type="hidden" name="clubNo" value="${ m.clubNo }" />
						<td>
							<c:choose>
								<c:when test="${ m.userNo ne loginUser.userNo }">
									<input type="checkbox" class="checked-btn"/>
								</c:when>
								<c:otherwise>
									<input type="checkbox" class="checked-btn-disabled" disabled/>
								</c:otherwise>
							</c:choose>
							<input class="abc"type="hidden"name="userNo" value="${m.userNo}"/>
						</td>
						<!-- userId 담아놓았음  -->
						<td><div class="userId"> ${ m.clubDiscript }</div></td>
						<td><div class="nickName">${ m.nickname } </div> </td>
						<td> ${ m.enrollDate } </td>
					</tr>
				</c:forEach>
			</tbody>
	
		</table>
		
		<br><br><br>
		
		<form action="message.cl" method="post">
			<%--<input type="hidden" name="clubNo" value="${ clubNo }" /> --%>
			<div id="message-area">
				<h3> 🧡 메시지 보내기🧡 </h3> 
				<div class="send-area">
					<h4> &lt; 보내는 사람  &gt; </h4>
					<div id="sendUser">
						${ loginUser.nickname }(${ loginUser.userId })
						<input type="hidden" name="userNo" value="${ loginUser.userNo }" />
					</div>			
				</div>
				<div class="receive-area">
					<h4> &lt; 받는 사람  &gt; </h4>
					<div id="receiveUser"></div>				
				</div>
				<div class="message-area">
					<textarea name="messageContent" style="width:400px; height:240px; resize:none;"></textarea>
				</div>
				
				<button type="submit" id="submit-btn" >전송하기</button>
				<button type="reset" onclick="reWrite();">다시쓰기</button>
			</div>
		</form> <!-- message보내기 form태그  -->
	
	
	</div>
	
	<script>
		
		$(document).on('click', '#submit-btn', function(){

			if($('textarea[name=messageContent]').val() == ''){
				alert('텍스트가 작성되지 않았습니다.');
				$('textarea[name=messageContent]').focus();
				return false;
			}
			
			let $userNum;
			let count = 0;
			
			$userNum = $(this).siblings('.receive-area').find('input[name="userNo2"]');
			
			$userNum.each(function(){
				count++;
			})
			
			if(count == 0){	
				alert('수신자가 지정되지 않았습니다.');
				return false;
			} else {
				return true;
			}
			
		});
		
	</script>
	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>