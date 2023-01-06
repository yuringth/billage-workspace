<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<form action="doJoin" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">
	                                                                                               
	      <h2>회원가입</h2>
	      
	      <div class="textForm">
	        <input name="userId" type="text" class="id" placeholder="아이디">
	        </input>
	      </div>
	      
	      <div class="textForm">
	        <input name="userPwd" type="password" class="pw" placeholder="비밀번호">
	      </div>
	      
	       <div class="textForm">
	        <input name="checkPwd" type="password" class="pw" placeholder="비밀번호 확인">
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
                    <input type="radio" id="Female" value="F" name="gender">
                    <label for="Female">여자</label> &nbsp;&nbsp;
	      </div>
	      
	      <div class="textForm">
	        <input name="address" type="text" class="name" id="address_kakao" placeholder="주소를 입력해주세요.">
	      </div>
	      
	       <div class="textForm">
	        <input name="detailAddress" type="text" class="name" placeholder="상세 주소를 입력해주세요.">
	      </div>
	      
	      <input type="submit" class="btn" value="J O I N"/> <button type="button" class="btn">홈으로 돌아가기</button>
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
</script>

</html>