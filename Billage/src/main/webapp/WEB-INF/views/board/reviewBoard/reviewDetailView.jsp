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

#book_content, #book_title, #book_author, #book_publisher, #book_data{
	border:1px solid pink;
	height:50px;
}




.review-content-outer{
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

		<h1 style="text-align:center;">리뷰 상세페이지</h1>
		
		<!-- 리뷰넘버 식별자로 넘기기 -->
		<input type="hidden" neme="reviewNo" value="${ b.reviewNo }">

		<hr>
		
				<!-- 	<div id="book_imag" name="bookImag">${ b.bookImag }</div> -->
		<!-- api 책정보 끌어오기 -->
		<div class="book-detail-outer">
			<div class="book-detail-area">
				<div class="content-photo-detail">
					<!-- api에서 끌고 오는거니까 첨부파일로 안해도 되는게 맞겠지? <input type="file" name="upfile"> 이런식으로.. -->
					<img id="book_imag" class="card-img-top" src="${ b.bookImag }" alt="책사진" style= "width:200px; height:200px;">
					
				</div>
				
				<!-- review 테이블 : book_content, book_publisher, book_date 컬럼 추가  -->
				<div class="content-book-detail">
					<div id="book_title" name="bookTitle">${ b.bookTitle }</div>
					<div id="book_author" name="bookAuthor">${ b.bookAuthor }</div>
					<div id="book_publisher" name="bookPublisher">${ b.bookPublisher }</div>
					<div id="book_date" name="bookDate">${ b.createDate }</div>
				</div>
			</div>
		</div>
		
		
		<hr>

		<!-- 매란언니한테 알려달라하기 -->
		<div style="text-align:center;">별점 : ${ b.reviewStar } ☆☆☆★ 
			<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
		</div>

		<br>

		<div class="review-content-outer">
			<textarea id="review_content" name="reviewContent" rows="20" cols="100" style="resize:none" maxlength="1000" required>${ b.reviewContent }</textarea>
			
			<hr>
			
			<!-- 좋아요기능 -->
			<button>♡</button>
			
			<!-- 작성자한테만 보이게 하기 -->	
			<div style="text-align:center;">
				<button onclick="postFormSubmit()">글수정</button>
				<button onclick="location.href='delete.re?reviewNo=${ b.reviewNo }'">글삭제</button>
				<button>뒤로가기</button>
			</div>
			
			<form action="" method="post" id="postForm">
				<input type="hidden" name="reviewNo" value="${ b.reviewNo }" />
				<input type="hidden" name="bookTitle" value="${ b.bookTitle }" />
				<input type="hidden" name="bookAuthor" value="${ b.bookAuthor }" />
				<input type="hidden" name="bookPublisher" value="${ b.bookPublisher }" />
				<input type="hidden" name="createDate" value="${ b.createDate }" />
				<input type="hidden" name="bookImag" value="${ b.bookImag }" />
				<input type="hidden" name="reviewStar" value="${ b.reviewStar }" />
				<input type="hidden" name="reviewContent" value="${ b.reviewContent }" />
			</form>

			<script>
				function postFormSubmit(){
					$('#postForm').attr('action', 'enrollForm.re').submit();
					console.log('버튼눌럿음');
				}
			</script>
		
		</div>



	<!-- 댓글 div  -->
	<br>
    <table id="replyArea" class="table" align="center">
       <thead>
           <tr>
               <th colspan="2">
                   <textarea class="form-control" name="" id="reply_content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
               </th>
               <th style="vertical-align:middle"><button class="btn btn-secondary">등록하기</button></th>
           </tr>
           <tr>
           		<!-- 총 댓글수 나타내는건 안할 수 있음!!! 일단 쌤꺼 복사한 것 뿐 -->
               <td colspan="3">댓글(<span id="reply_count">3</span>)</td>
           </tr>
       </thead>
       <tbody>
           <tr>
               <th>user02</th>
               <td>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ꿀잼</td>
               <td>2020-03-12</td>
           </tr>
           <tr>
               <th>user01</th>
               <td>재밌어요</td>
               <td>2020-03-11</td>
           </tr>
           <tr>
               <th>admin</th>
               <td>댓글입니다!!</td>
               <td>2020-03-10</td>
           </tr>
     	</tbody>
    </table>
	
                    
     

	<!-- 전체 outer /div -->	
 	</div>   
 	
 	
 
   	
 
   	
   
	<jsp:include page="../../common/footer.jsp" />
 
 
 
 
 
</body>
</html>