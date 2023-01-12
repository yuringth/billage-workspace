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
	<form id="enrollForm" method="post" action="insert.nv" enctype="multipart/form-data">
	  <header align="center">
	    <h2>작품 등록하기</h2>
	    <div>환영합니다 관리자님. 연재 승인된 작가님의 소중한 작품을 등록해주세요!</div>
	  </header>
	  <div>
	    <label for="charge">
	    	유료/무료
	    </label>
	    <div>
	    <select id="charge" name="chargeStatus" class="charge" tabindex="11"> 
	      <option value="유료">유료</option>
	      <option value="무료">무료</option>
	    </select>
	    </div>
	  </div>
	  <div>
	    <label for="userNo">
	      	회원번호
	    </label>
	    <div>
	      <input name="userNo" type="text" class="field text fn" size="8" tabindex="1" placeholder="작가의 회원번호를 입력하세요." requierd>
	    </div>
	  </div>
	  <div>
	    <label for="novelTitle">
	      	작품명
	    </label>
	    <div>
	      <input name="novelTitle" type="text" class="field text fn" value="" size="8" tabindex="1" placeholder="제목을 입력하세요." requierd>
	    </div>
	  </div>
	    <br>
	  <div>
	    <label for="novelDisplay">
	      	작품 설명
	    </label>
	    <div>
	      <textarea name="novelDisplay" spellcheck="true" rows="10" cols="50" tabindex="4" style="resize:none" placeholder="작품에 대한 간략한 설명" requierd></textarea>
	    </div>
	  </div>
	  <div>
		<label for="upfile">
			썸네일
		</label>
		<div>
	    	<input type="file" id="upfile" class="form-control-file border" name="upfile" required>
		</div><br>
	    <div align="left">
	  		<button type="submit" class="btn btn-primary">등록하기</button>
	        <button type="reset" class="btn btn-danger">취소하기</button>
	    </div>
	</div>
	</form>
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>