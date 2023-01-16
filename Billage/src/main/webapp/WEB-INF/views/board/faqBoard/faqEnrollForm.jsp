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
		<jsp:include page="../../common/header.jsp"/>
		<br><br>
	<form id="enrollForm" method="post" action="insert.fa">
	  <header align="center">
	    <h2>FAQ 작성하기</h2>
	    <div>FAQ 유형 및 질문과 그에 대한 답변을 입력해주세요.</div>
	  </header>
	  <div>
	    <label for="title">
	    	FAQ 유형
	    </label>
	    <div>
	    <select id="faqType" name="faqType" class="faqType" tabindex="20"> 
	      <option value="모임">모임</option>
	      <option value="연재/공모전">연재/공모전</option>
	      <option value="대여/중고">대여/중고</option>
	      <option value="추첨/경매">추첨/경매</option>
	      <option value="사이트이용">사이트이용</option>
	      <option value="리뷰/기타">리뷰/기타</option>
	    </select>
	    </div>
	  </div>
	  <div>
	  	<label for="question">
	      	질문
	    </label>
	    <div>
	      <input name="faqTitle" id="title" type="text" class="field text fn" size="8" tabindex="1" placeholder="질문을 입력하세요." required>
	      <input name="userNo" type="hidden" id="writer" value="${ loginUser.userNo }">
	    </div>
	  </div>
	    <br>
	  <div>
	    <label for="answer">
	      	답변
	    </label>
	    <div>
	      <textarea name="faqAnswer" id="answer" spellcheck="true" rows="10" cols="50" tabindex="4" style="resize:none" placeholder="답변을 입력해주세요." required></textarea>
	    </div>
	  </div>
	  <div>
	    <div align="left">
	  		<button type="submit" class="btn btn-primary">등록하기</button>
	        <button type="reset" class="btn btn-danger">취소하기</button>
	    </div>
	  </div>
	</form>
	<jsp:include page="../../common/footer.jsp"/>

</body>
</html>