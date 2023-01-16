<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  padding: 20px 15%;
}
form header {
  margin: 0 0 20px 0; 
}
form header div {
  font-size: 90%;
  color: #999;
}
form header h2 {
  margin: 0 0 5px 0;
}
form > div {
  clear: both;
  overflow: hidden;
  padding: 1px;
  margin: 0 0 10px 0;
}
form > div > fieldset > div > div {
  margin: 0 0 5px 0;
}
form > div > label,
legend {
	width: 25%;
  float: left;
  padding-right: 10px;
}
form > div > div,
form > div > fieldset > div {
  width: 75%;
  float: right;
}
form > div > fieldset label {
	font-size: 90%;
}
fieldset {
	border: 0;
  padding: 0;
}

input[type=text],
textarea {
	width: 100%;
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;
  border-right: 1px solid #eee;
  border-bottom: 1px solid #eee;
}
input[type=text],
input[type=password] {
  width: 50%;
}
input[type=text]:focus,
input[type=password]:focus,
textarea:focus {
  outline: 0;
  border-color: #4697e4;
}

@media (max-width: 600px) {
  form > div {
    margin: 0 0 15px 0; 
  }
  form > div > label,
  legend {
	  width: 100%;
    float: none;
    margin: 0 0 5px 0;
  }
  form > div > div,
  form > div > fieldset > div {
    width: 100%;
    float: none;
  }
  input[type=text],
  input[type=email],
  input[type=url],
  input[type=password],
  textarea,
  select {
    width: 100%; 
  }
}
@media (min-width: 1200px) {
  form > div > label,
	legend {
  	text-align: right;
  }
}
textarea {
    min-height: 20rem;
    overflow-y: hidden;
    resize: none;
}
</style>
<body>
		<jsp:include page="../../common/header.jsp"/>
		<br><br>
	<form id="enrollForm" method="post" action="insert.se">
	<input type="hidden" name="novelNo" value="${ novelNo }">
	<input type="hidden" name="userNo" value="${ loginUser.userNo }">
	  <header align="center">
	    <h2>작품 연재</h2>
	    <div>작가님! 안녕하세요. 오늘도 좋은 연재 부탁드립니다!${ novelNo }</div>
	  </header>
	  <div>
	    <label for="serialtitle">
	      	제목
	    </label>
	    <div>
	      <input name="serialTitle" type="text" class="field text fn" size="8" tabindex="1" placeholder="이번 화의 제목을 입력하세요." required>
	    </div>
	  </div>
	    <br>
	  <div>
	    <label for="serialContent">
	      	본문 내용
	    </label>
	    <div>
	      <textarea name="serialContent" id="newTweetContent" onkeydown="resize(this)" onkeyup="resize(this)" spellcheck="true" rows="20" cols="52" tabindex="4" required></textarea>
	    </div>
	  </div>
	  <div>
	    <label for="authorComment">
	      	작가의 말
	    </label>
	    <div>
	      <textarea name="authorComment" id="newTweetContent" onkeydown="resize(this)" onkeyup="resize(this)" spellcheck="true" rows="20" cols="20" tabindex="4" placeholder="연재 소감, 다음화 공지 등을 남겨주세요!" required></textarea>
	    </div>
	  </div>
	  <div>
	    <div align="left">
	  		<button type="submit" class="btn btn-primary">등록하기</button>
	        <button type="reset" class="btn btn-danger">취소하기</button>
	    </div>
	</div>
	</form>
	
	<script>
	function resize(obj) {
	    obj.style.height = '1px';
	    obj.style.height = (12 + obj.scrollHeight) + 'px';
	}
	</script>
	
	<jsp:include page="../../common/footer.jsp"/>

</body>
</html>