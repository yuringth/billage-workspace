<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세정보</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style>
.outer{
	width:1200px;
	margin: auto;
}

.api{
	display:flex;
}

.api-content{
	width:200px;
	height:200px;
}

.api-content2{
	width:400px;
	height:200px;
}



</style>
</head>
<body>


	 <!-- 메뉴바 -->
	<jsp:include page="../../common/header.jsp" />
    
 	
 	<div class="outer">

		<h1>리뷰작성</h1>

		<hr>

		<div class="api">
			<div class="api-content">
				<div id="image">사진</div>
			</div>
			<div class="api-content2">
				<div id="content">책내용</div>
				<div id="title">제목</div>
				<div id="wirter">저자</div>
				<div id="publisher">츨판사</div>
				<div id="date">발행일자</div>
			</div>
		</div>

		<hr>

		<div>별점 : ☆☆☆★ 
			<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
		</div>

		<br>

		<div id="content" rows="30" cols="100" style="resize:none" maxlength="1000">여기에 글 작성내용을 띄워주자</div>
		<br>
		<hr>

		<hr>
		
		<div>
			댓글 <input type="text" id="replyContent">
			<button>댓글</button>
		</div>
	                    
	                    
	                    
		<div>
			<a href="">삭제하기(로그인==유저정보일치할시)</a>
			<a href="">목록으로</a>
		</div>


 	</div>   
 
 
 
 
 
 	<!-- 푸터바 -->
	<jsp:include page="../../common/footer.jsp" />
 
 
 
 



</body>
</html>