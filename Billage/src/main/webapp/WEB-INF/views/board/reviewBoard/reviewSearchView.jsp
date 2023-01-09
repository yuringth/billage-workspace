<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 누르면 상품 검색 페이지가 뜬다</title>

<style>
    .outer{
        width : 800px;
        margin : auto;
    }
    
    
    .text-div{
    	text-align:center;
    }
    
    .book-outer{
    	display:flex;
    	margin:auto;
    	width:700px;
    	height:120px;
    }
    
    
    .content-area1{
    	border:1px solid black;
    	width:75px;
    }


    .content-area2{
    	border:1px solid black;
    	width:550px;
    	display:flex;
    }
    .content-detail1{
    	border:1px solid red;
    	width:100px;
    }
    .content-detail2{
    	border:1px solid blue;
    	width:450px;
    	height:120px;
    }
    #book_title, #book_author, #book_date, #book_publisher{
    	border: 1px solid black;
    	height:30px;
    	margin:0px;
    }
    
    
    .content-area3{
    	border:1px solid black;
    	width:75px;
    }    
    
    
    
    
    
    
</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>

	<jsp:include page="../../common/header.jsp"/>

    <div class="outer">
    
    
    	
    
    
    
    <!-- ========================================================================== -->
    
    
    
    
    
    
		<div class="text-div">
			<p>"검색이름"로 125개의 검색 결과가 있습니다.</p>
		</div>
		
		<hr>
		
		<!-- 책상품 하나의div  -->
		<div class="book-outer">
			<div class="content-area1">
				<p>1</p>
				<!-- 책 번호 식별값으로 hidden하기(?) 정보 끌어다쓸때 식별값 필요하니까 => 그럼 form태그 안에 감싸야하나??-->
				<input type="hidden" neme="bookNo" value="#">
			</div>
			<div class="content-area2">
				<div class="content-detail1">
					<div>사진</div>
				</div>
				<div class="content-detail2">
					<p id="book_title" name="bookTitle">도서제목</p>
					<p id="book_author" name="bookAuthor">작가</p>
					<p id="book_date" name="bookDate">발행일자</p>
					<p id="book_publisher" name="bookPublisher">출판사</p>
				</div>
			</div>
			<div  class="content-area3">
				<!-- 선택 버튼 누를 시 책 정보를 끌고옴 -->
				<button>선택</button>
			</div>	
		</div>
		
		
		
		
		<hr>
		
		
		
		<!-- 책상품 하나의div  -->
		<div class="book-outer">
			<div class="content-area1">
				<p>1</p>
				<!-- 책 번호 식별값으로 hidden하기(?) 정보 끌어다쓸때 식별값 필요하니까 => 그럼 form태그 안에 감싸야하나??-->
				<input type="hidden" neme="bookNo" value="#">
			</div>
			<div class="content-area2">
				<div class="content-detail1">
					<div>사진</div>
				</div>
				<div class="content-detail2">
					<p id="book_title" name="bookTitle">도서제목</p>
					<p id="book_author" name="bookAuthor">작가</p>
					<p id="book_date" name="bookDate">출판날자</p>
					<p id="book_publisher" name="bookPublisher">출판사</p>
				</div>
			</div>
			<div  class="content-area3">
				<!-- 선택 버튼 누를 시 책 정보를 끌고옴 -->
				<button>선택</button>
			</div>	
		</div>
		
		
		
		
		<hr>
		
		
		<!-- 책상품 하나의div  -->
		<div class="book-outer">
			<div class="content-area1">
				<p>1</p>
				<!-- 책 번호 식별값으로 hidden하기(?) 정보 끌어다쓸때 식별값 필요하니까 => 그럼 form태그 안에 감싸야하나??-->
				<input type="hidden" neme="bookNo" value="#">
			</div>
			<div class="content-area2">
				<div class="content-detail1">
					<div>사진</div>
				</div>
				<div class="content-detail2">
					<p id="book_title" name="bookTitle">도서제목</p>
					<p id="book_author" name="bookAuthor">작가</p>
					<p id="book_date" name="bookDate">출판날자</p>
					<p id="book_publisher" name="bookPublisher">출판사</p>
				</div>
			</div>
			<div  class="content-area3">
				<!-- 선택 버튼 누를 시 책 정보를 끌고옴 -->
				<button>선택</button>
			</div>	
		</div>
		
		
		<hr>


    </div>

    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>