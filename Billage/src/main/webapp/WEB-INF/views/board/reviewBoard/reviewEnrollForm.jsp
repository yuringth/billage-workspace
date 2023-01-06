<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 글 작성 폼</title>



<style>
.outer{
	width:1200px;
	margin: auto;
	
}

.btn2{ 
	display: flex; 
	justify-content: center;
	padding-bottom:10px;

}


.book-detail-outer{
	border : 1px solid blue;
	width:620px;
	height:200px;
	margin:auto;
}


.book-detail-area{
	border : 1px solid black;
	width:620px;
	height:200px; 
	display:flex;
}


/* 사진  */
.content-photo-detail{
	border:1px solid red;
	width:200px;
	height:200px;
	margin-right:20px;
}

/* 책 정보 */
.content-book-detail{
	border:1px solid pink;
	width:400px;
	height:200px;
}


.book-content-outer{
	text-align:center;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



</head>
<body>

	<jsp:include page="../../common/header.jsp" />
    
    
 	<!-- 전체를 감싸는 div  -->
 	<div class="outer">

		<h1 style="text-align:center;">리뷰작성</h1>

		<hr>
		
		<form action="search.re">
			<div class="btn2">
				<input type="text"><button class="btn btn-link" type="submit">상품검색</button>
			</div>
		</form>
		
		
		<div class="book-detail-outer">
			<div class="book-detail-area">
				<div class="content-photo-detail">
					<div>사진</div>
				</div>
				
				<div class="content-book-detail">
					<div id="content">책내용</div>
					<div id="title">제목</div>
					<div id="wirter">저자</div>
					<div id="publisher">츨판사</div>
					<div id="date">발행일자</div>
				</div>
			</div>
		</div>
		
		
		<hr>

		<div style="text-align:center;">별점 : ☆☆☆★ 
			<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
		</div>

		<br>

		<div class="book-content-outer">
			<form action="#">
				<textarea id="content" rows="30" cols="100" style="resize:none" maxlength="1000">여기에 글 작성하기</textarea>
				<br>
				<hr>
				<spank id="count">0</spank> / 1000
			</form>
		</div>


		<!-- 글입력 갯수 세기 -->
		<script>
        $(function(){
            $('.book-content-outer #content').keyup(function(){
                $('#count').text($(this).val().length);
                
            });
        });
    	</script>


		<hr>
		<p style="text-align:center;">
			포인트 지급 안내 <br>
			리뷰 작성 시 : 10point 지급
		</p>

		<div style="text-align:center;">
			<a href="">글작성</a>
			<a href="">목록으로</a>
		</div>


 	</div>   
 
 
 
	<jsp:include page="../../common/footer.jsp" />
 
 
 
 
 
</body>
</html>