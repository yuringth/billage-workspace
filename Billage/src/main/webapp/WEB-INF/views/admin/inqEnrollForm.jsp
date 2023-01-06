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
</style>
<body>
	<jsp:include page="../common/header.jsp"/>
<form action="#">

  <header align="center">
    <h2>1:1 문의</h2>
    <div>불편사항에 대한 문의는 최대한 빠르게 답변 드립니다.연재관련 문의는 연재신청란을 통해서 하셔야 합니다.</div>
  </header>
  <div>
    <label class="desc">
    	문의 유형
    </label>
    <div>
    <select id="inqType" name="inqType" class="inqType" tabindex="11"> 
      <option value="First Choice">First Choice</option>
      <option value="Second Choice">Second Choice</option>
      <option value="Third Choice">Third Choice</option>
    </select>
    </div>
  </div>
  <div>
    <div>
      <input name="Field1" type="text" class="field text fn" value="" size="8" tabindex="1" placeholder="제목을 입력하세요.">
    </div>
  </div>
    <br>
  <div>
    <label class="desc">
      	문의 내용
    </label>
    <div>
      <textarea name="Field2" spellcheck="true" rows="10" cols="50" tabindex="4" style="resize:none"></textarea>
    </div>
  </div>
  <div>
	<div>
  		<input id="saveForm" name="saveForm" type="submit" value="등록" class="">
    </div>
</div>
  
</form>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>