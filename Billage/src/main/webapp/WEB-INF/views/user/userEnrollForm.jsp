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
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image:#34495e;
}

.joinForm {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}


.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.cellphoneNo {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}


</style>

</head>
<body>
	
	<div align="center">
		<form action="insert.me" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">
	                                                                                               
	      <h2>회원가입</h2>
	      
	      <div class="textForm">
	        <input name="userId" type="text" class="id" id="userId" placeholder="아이디">
	        <div id="checkResult" style="font-size:0.7em; display:none;"></div>
	      </div>
	      
	      <div class="textForm">
	        <input name="userPwd" type="password" class="pw" placeholder="비밀번호" id="userPwd">
	      </div>
	      
	       <div class="textForm">
	        <input name="checkPwd" type="password" class="pw" placeholder="8~15자의 영문 대 소문자, 숫자, 특수문자로" id="checkPwd">
	      </div>
	      
	      <div class="textForm">
	        <input name="name" type="text" class="name" placeholder="이름">
	      </div>
	      
	       <div class="textForm">
	        <input name="email" type="text" class="email" placeholder="이메일">
	      </div>
	      
	      <div class="textForm">
	        <input name="nickname" type="text" class="nickname" placeholder="닉네임">
	      </div>
	      
	      <div class="textForm">
	        <input name="phone" type="text" class="cellphoneNo" placeholder="전화번호       - 없이 입력">
	      </div>
	      
	      <div class="textForm">
	        <input name="birthDate" type="text" class="cellphoneNo" placeholder="생년월일 6자를 입력">
	      </div>
	      
	      <div class="textForm">
	        		<label for=""> 성별 : </label> &nbsp;&nbsp;
                    <input type="radio" id="Male" value="M" name="gender" checked>
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    <input type="radio" id="Female" value="W" name="gender">
                    <label for="Female">여자</label> &nbsp;&nbsp;
	      </div>
	      
	      <div class="textForm">
	        <input name="address" type="text" class="name" id="address_kakao" placeholder="주소를 입력해주세요.">
	      </div>
	      
	       <div class="textForm">
	        <input name="detailAddress" type="text" class="name" placeholder="상세 주소를 입력해주세요.">
	      </div>
	      
	      <input type="submit" class="btn" value="J O I N"/> <button type="button" class="btn" onclick="history.back();">홈으로 돌아가기</button>
	    </form>
	    
	</div>
	
</body>

<!-- 주소란 입력 클릭 시 카카오 주소 찾기 api 나타나는 스크립트 -->
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
	
// id 중복 체크용 스크립트

	$(function(){
		
		const $idInput = $('.textForm #userId');
		
		$idInput.keyup(function(){
			// console.log($idInput.val());	일단 콘솔에 잘 찍혔음.
			
			if($idInput.val().length >= 5){
				
				$.ajax({
					url : 'idCheck.me',
					data : {checkId : $idInput.val()},
					success : function(result){
						//console.log(result);
						if(result == 'NNNNN'){	// 사용불가능
							$('#checkResult').show();
							$('#checkResult').css('color', 'red').text('중복된 아이디가 존재합니다.')
							$('input[type=submit]').attr('disabled', true);
						} 
						else{					// 사용가능
							$('#checkResult').show();
							$('#checkResult').css('color', 'green').text('사용 가능한 아이디 입니다.')
							$('input[type=submit]').removeAttr('disabled');
						}
					},
					error : function() {
						console.log('아이디 중복체크용 ajax 통신 실패')
					}
				})
			}
			else{
				$('#checkResult').hide();
				$('input[type=submit]').attr('disabled', true);	
			}
			
		});
		
	});
</script>

<script>
	//비밀번호 유효성 검사
	
	$('input[name=userPwd]').focusout(function(){
		var regExp = /^[a-zA-Z\d!@#$%^]{8,15}$/;
        var $userPwd = $('#userPwd').val();
        
        if($userPwd=="") {
           alert('필수입력사항입니다.');
           return false;
		}
        if(!regExp.test($('#userPwd').val())){ 
            alert('8~15자의 영문 대 소문자, 숫자, 특수문자로 입력해주세요.');
            return false;
        } 
	});
	
	$('input[name=checkPwd]').focusout(function(){
        var $userPwd = $('#userPwd').val();
        var $checkPwd = $('#checkPwd').val();

        if($userPwd=="") {
        	alert('필수입력사항입니다.');
        	return false;
        } 
        if(!($checkPwd==$userPwd)) {
            alert('비밀번호가 일치하지않습니다.')
            return false;
        } 
    });
	
</script>

</html>