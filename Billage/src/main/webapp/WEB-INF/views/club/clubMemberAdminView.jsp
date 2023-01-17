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

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../user/myPageBar.jsp" />
	
	
	
	<div id="all-clubMem-admin">
		<h1> 모임 회원 관리 페이지 입니당 </h1>
			
		
		<script>

		
		
		// 전체선택 or 취소 ----------------------------------------------------------------------
			$(document).on('change','#all-select' , function(){
				var $all = $('#all-select').prop('checked');
				
				if($all){
					$('.checked-btn').prop('checked', true); 
				} else {
					$('.checked-btn').prop('checked', false);
				}
			});
		
			//MESSAGE_NO
			//USER_NO
			//USER_NO2
			//MESSAGE_CONTENT
			//MESSAGE_DATE
			//MESSAGE_STATUS
			
			//private int messageNo;
			//private int userNo; //보낸 사람
			//private int userNo2; //받는 사람
			//private String messageContent;
			//private String Date;
			//private int messageStatus; //읽음확인여부
					

			// 쪽지 보내기----------------------------------------------------------------------
				function sendMsg(){
					
					// console.log($('.checked-btn').filter(':checked'));
					// .checked-btn 객체들 중에서 checked된 객체들만 선택해준다. 
					
					var $hidden = $('.checked-btn').filter(':checked');
					
					var $clubNo = $('#getClubNo').val();
					
					var str = '<input type="hidden" name="clubNo" value="' + $clubNo + '"/>';
					
					$hidden.each(function(i, el){
						
						var userNo2 = $(el).next().val();
						
						 str += '<input type="hidden" name="userNo2" value=" '+ userNo2 + '"/>';
						 str += '<span>' + userNo2 + '</span> <br>'; 
						
					}); 
					
					console.log(str);
					
					// 해당 스트링을 #receiveUser div에 넣어준다. 
					$(str).insertAfter('#receiveUser');
				
				}// 쪽지보내기 메소드 끝 
				
				
			// 강퇴하기 ----------------------------------------------------------------------
				function outMember(){
					
				}

		

		</script>
		

		<br><br><br>
		<button onclick="location.href='admin.cl'">뒤로가기</button>
		<br><br><br>
		<a><input type="checkbox" id="all-select"/>전체선택 </a> |
		<a onclick="sendMsg(this);">쪽지보내기</a> |
		<a onclick="outMember();">강퇴하기</a>
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
						<td><input type="checkbox" class="checked-btn"/><input class="abc"type="hidden"name="userNo" value="${m.userNo}"/> </td>
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
			<div id="message-area">
				<h3> 🧡 메시지 보내기🧡 </h3> 
				<div class="send-area">
					<h4> &lt; 보내는 사람 &gt; </h4>
					<div id="sendUser">
						${ loginUser.userId }
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
				
				<button type="submit">전송하기</button>
				<button type="reset">다시쓰기</button>
			</div>
		</form> <!-- message보내기 form태그  -->
	
	
	</div>
	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>