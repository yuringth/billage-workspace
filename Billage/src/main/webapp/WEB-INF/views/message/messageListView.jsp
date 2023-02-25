<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>쪽지함</title>
<style>

	#blind-area{
		display:none;
	}
	
	
	#click-area, #click-area * { background-color:darkgray; color:white; } 

</style>


</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../user/myPageBar.jsp" />
	<div class="outer">
		<ul class="nav justify-content-center table-bordered">
			<li class="nav-item">
				<a class="nav-link">받은 쪽지함</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="sendList.ms">보낸 쪽지함</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="sendForm.ms">쪽지 보내기</a>
			</li>
		</ul>
		
		
		
		<div class="container" style="width : 1000px;">
			<table class="table table-hover table-bordered table-sm">
				<thead class="thead-light">
					<tr>
						<th width="150px">보낸 사람</th>
						<th width="650px">제목</th>
						<th width="200px">확인여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ msgList }" var="m" >
						<tr id="click-area">
							<td>${ m.nickname }</td>
							<td class="click-title">${ m.title }</td>
							<td>
								<input type="hidden" name="userNo" value="${ m.userNo }"/>
								<input type="hidden" name="messageNo" value="${ m.messageNo }" />
								<c:choose>
									<c:when test="${ m.messageStatus eq 1 }">
										<a class="msgStatus-btn1" id="${ m.messageStatus }">읽음</a>
									</c:when>
									<c:otherwise>
										<a class="msgStatus-btn2" id="${ m.messageStatus }" ><span id="read-che">안읽음</span></a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr id="blind-area">
							<td>상세내용</td>
							<td class="click-msgCon">
								${ m.messageContent }
							</td>
							<td class="click-msgDate">
								${ m.messageDate }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	
	
	<div>
	
	
	
	</div>
	
	
	<script>

			
		$(document).on('click', '.click-title', function(){
			
			// slide 설정 선택자
			var $slide = $(this).parents('#click-area').next();
			var $msgStatus = $(this).next().children().eq(2).attr('id');
			// 읽음표시 ajax호출 시 필요한 변수 세팅 
			var $selectedMsg = $(this).next().children().eq(1);
			let $userNo = $(this).next().children('input[name="userNo"]').val();
			let userNo2 = ${loginUser.userNo};
			let $messageNo = $(this).next().children('input[name="messageNo"]').val();
			
			if($slide.css('display') == 'none'){
				$slide.siblings('#blind-area').slideUp(100);
				$slide.slideDown(500);
				
			} else {
				$slide.slideUp(100);
			}
			
			if($msgStatus == 0){
				$.ajax({
					url : 'read.ms',
					data : {
						userNo : $userNo ,
						userNo2 : userNo2,
						messageNo : $messageNo
					},
					success : function(result){

						if( result > 0 ){
							
							$selectedMsg.each(function(){
								if($(this).val() == $messageNo){
									$(this).siblings('.msgStatus-btn2').attr('id', '1');
									$(this).siblings('.msgStatus-btn2').children().text('읽음');
								}
							})
						} //if문(비동기요청성공시조건) 종료
					},
					error : function(){
						console.log('읽음처리 비동기 오류');
					}
				});
			} //if문(ajax실행 조건) 종료
			
		}) 	

	
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>