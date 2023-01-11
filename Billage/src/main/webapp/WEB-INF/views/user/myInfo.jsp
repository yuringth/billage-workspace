<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.info-outer{
  width: 1200px;
  margin:auto;
}


#input-area > input {
	border : none;
	border-bottom : 1px solid black;
}



</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="myPageBar.jsp" />
	
	<div class="info-outer">
		<div class="info-content" align="center">
			<form action="update.me" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
		  		<fieldset>
		    		<legend>개인 정보</legend>
		    		
		    		<div id="img-area">
		    			<c:choose>
							<c:when test="${ !empty loginUser.profileImg }">
								 <span><img width="200" height="200" id="file-insert" src="${ sessionScope.loginUser.profileImg }"></span>
								 <input type="file" name="upfile" id="file">
							</c:when>
							<c:otherwise>
								 <span><img width="200" height="200" id="file-insert" src="resources/images/plus.png"></span>
								 <input type="file" name="upfile" id="file">
							</c:otherwise>		    			
		    			</c:choose>
		    		</div>
		    		
		    		<div id="input-area">
		    			회원 이름<br>
		    			<input type="text" name="name" value="${ sessionScope.loginUser.name }" readonly ><br><br><br>
		    			
		    			회원 ID<br>
		    			<input type="text" name="userId" value="${ sessionScope.loginUser.userId }" readonly><br><br><br>
		    			
		    			닉네임<br>
		    			<input type="text" name="nickname" id="nickname" value="${ sessionScope.loginUser.nickname }"><div id="checkResult" style="font-size:0.7em; display:none;"></div><br><br><br>
		    			
		    			이메일<br>
		    			<input type="text" name="email" value="${ sessionScope.loginUser.email }"><br><br><br>
		    			
		    			전화번호<br>
		    			<input type="text" name="phone" value="${ sessionScope.loginUser.phone }"><br><br><br>
		    			
		    			주소<br>
		    			<input type="text" name="address" id="address_kakao" value="${ sessionScope.loginUser.address }"><br><br><br>
		    			
		    			상세주소<br>
		    			<input type="text" name="detailAddress" value="${ sessionScope.loginUser.detailAddress }"><br><br><br>
	    			</div>
		    			<br><br>
		    			
		    		<div id="update-btn">
		    			<button type="submit" id="modify-btn"> 수정하기 </button> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <button type="button"> 비밀번호 수정 </button> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <button type="button"> 탈퇴하기 </button>
	    			</div>
		  		</fieldset>
			</form>
		</div>
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>


<!-- 카카오 주소찾기 API 스크립트 영역 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function(){
		
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면 카카오 주소찾기 발생
	        
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
	                document.querySelector("input[name=detailAddress]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	
	// 프로필 이미지 수정하기 스크립트 영역
	
	//첨부파일 ------------------------------------------------------
	// 첨부파일 버튼 숨기고
	$('#file').hide();
	
	// 첨부파일 이미지 클릭시 첨부파일 버튼이 눌려지는 이벤트 걸고
	$('#file-insert').click(function(){
		$('#file').click();
	});

	// 첨부파일이 변경될 때 파일에 들어온 이미지로 사진 바꿔주고, 이미지 취소하면 다시 기본 이미지로 변경 
	$('#file').change(function(){
		var file = this;
		var $num = this.files.length;
		
		if($num == 1){
			var reader = new FileReader();
			reader.readAsDataURL(file.files[0]);
			reader.onload = function(e){
				$('#file-insert').attr('src', e.target.result);
			}
		} else {
			$('#file-insert').attr('src', 'resources/images/plus.png');
		}
	});
</script>
<script>
//닉네임 중복체크
$(function(){
	
	const $nicknameInput = $('#nickname');
	
	$nicknameInput.keyup(function(){
		 //console.log($nicknameInput.val());	
		
		if($nicknameInput.val().length >= 3){
			
			$.ajax({
				url : 'nicknameCheck.me',
				data : {checkNickname : $nicknameInput.val()},
				success : function(result){
					console.log(result);
					if(result == 'NNNNN'){	// 사용불가능
						$('#checkResult').show();
						$('#checkResult').css('color', 'red').text('중복된 닉네임이 존재합니다.')
						$('#modify-btn').attr('disabled', true);
					} 
					else{					// 사용가능
						$('#checkResult').show();
						$('#checkResult').css('color', 'green').text('사용 가능한 닉네임 입니다.')
						$('#modify-btn').removeAttr('disabled');
					}
				},
				error : function() {
					console.log('닉네임 중복체크용 ajax 통신 실패')
				}
			})
		}
		else{
			$('#checkResult').hide();
			$('#modify-btn').attr('disabled', true);		
		}
		
	});
	
});
</script>
</html>