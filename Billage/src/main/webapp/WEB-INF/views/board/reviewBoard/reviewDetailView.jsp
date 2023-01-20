<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<input type="hidden" name="reviewNo" value="${ b.reviewNo }" id="review-no">
		${ b.reviewNo }
		<input type="hidden" name="userNo" value="${ b.userNo }">
		${ b.userNo }
		
		
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
		<div style="text-align:center;">
			별점 : ${ b.reviewStar } 
		</div>

		<br>

		<div class="review-content-outer">
			<textarea id="review_content" name="reviewContent" rows="20" cols="100" style="resize:none" maxlength="1000" required readonly>${ b.reviewContent }</textarea>
			
			<hr>
			
			<!-- 좋아요기능 -->
			<div><button>♡</button></div>
			
			<!-- 유저넘버 == 글작성자한테 보이게 하기 -->	
			<div style="text-align:center;">
				<c:choose>
					<c:when test="${loginUser.userNo eq b.userNo}">
						<button onclick="postFormSubmit()">글수정</button>
						<button onclick="location.href='delete.re?reviewNo=${ b.reviewNo }&userNo=${ b.userNo }'">글삭제</button>
						<button>뒤로가기</button>
					</c:when>
					<c:otherwise>	
						<button>뒤로가기</button>
					</c:otherwise>
				</c:choose>
			</div>
			
			
			
			<!-- 책정보가 같이 넘어가야한다  -->
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
				}
			</script>
		
		</div>



	<!-- 댓글 div  -->
	<br>
    <table id="replyArea" class="table" align="center">
       <thead>
           <tr>
				<c:choose>
					<c:when test="${ empty loginUser }">
		               <th colspan="2">
		                   <textarea class="form-control" name="" id="reply_content" cols="55" rows="2" style="resize:none; width:100%;">로그인 후 이용가능한 서비스입니다.</textarea>
		               </th>
		               <th style="vertical-align:middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
		           	</c:when>
		           	
		           	<c:otherwise>
		               <th colspan="2">
		                   <textarea class="form-control" name="reply_content2" id="reply_content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		               </th>
		               <th style="vertical-align:middle"><button type="submit" class="btn btn-secondary" onclick="insertReply();">등록하기</button></th>
           			</c:otherwise>	
           		</c:choose>
           </tr>
           <tr>
           		<!-- 총 댓글수 나타내는건 안할 수 있음!!! 일단 쌤꺼 복사한 것 뿐 -->
               <td colspan="3">댓글(<span id="reply_count">3</span>)</td>
           </tr>
       </thead>
       <tbody>
           <tr>
               
           </tr>
           
     	</tbody>
    </table>
	
                    
     

	<!-- 전체 outer /div -->	
 	</div>   
 	
 	
 		
	<!-- 댓글 Ajax -->
	<script>
		/* 실행되면 => 우선적으로 댓글 목록 띄우기 */
		$(function(){
			
			selectReviewReplyList();			
		});
	
		/* 댓글 목록 띄워주기 */
		function selectReviewReplyList(){
			
				
			$.ajax({
				url:'rlist.re',
				data:{
					reviewNo : ${ b.reviewNo }
				},
				success:function(list){
					
					console.log(list);
					
					var result = '';
					
					for(var i in list){
						// 1. 비회원 == 댓글작성자가 아닌 경우 => 삭제 / 수정 버튼 안보임
						// 2. 로그인 유저 == 댓글작성자인 경우 => 삭제 / 수정 버튼 보임
						// 3. 로그인 유저 != 댓글작성자가 아닌경우 => 삭제 / 수정 버튼 안보임
						
						if(${empty loginUser}){
							
							result += '<tr>'
							 	   + '<th>' + list[i].userId + '</th>'
							 	   + '<td>' + list[i].replyContent + '</td>'
							 	   + '<td>' + list[i].createDate + '</td>'
							 	   + '</tr>'
							 	   
							
						} else if(list[i].userNo == '${loginUser.userNo}' ){
							
							var btn = '<button class="btn btn-secondary" onclick="deleteReply(' + list[i].replyNo +','+ list[i].reviewNo + ')">댓글삭제</button>';
							var btn2 = '<button class="btn btn-secondary" onclick="ReviewReplyForm(this)">댓글수정</button>';
							
							result += '<tr>'
							 	   + '<th>' + list[i].userId + '</th>'
							 	   + '<td>' + list[i].replyContent + '</td>'
							 	   + '<td>' + list[i].createDate + '</td>'
	   							   + '<td>' + btn + '</td>'
	   							   + '<td>' + btn2 + '</td>'
							 	   + '</tr>'
						} else if(list[i].userNo != '${loginUser.userNo}' ){
							
							result += '<tr>'
							 	   + '<th>' + list[i].userId + '</th>'
							 	   + '<td>' + list[i].replyContent + '</td>'
							 	   + '<td>' + list[i].createDate + '</td>'
							 	   + '</tr>'
						}
						
					}
					$('#replyArea tbody').html(result);
					
				},
				error:function(){
					console.log('실패');
				}
		
				
			})
		};
		
		
		
		/* 댓글 삭제 함수 */
		function deleteReply(num1, num2){
			
			var result = confirm("댓글을 삭제하시겠습니까?");
			
			if(result == true){
				location.href='rdelete.re?replyNo=' + num1 + '&reviewNo=' + num2;
				alert("삭제되었습니다.");
			} else{
				alert("취소하였습니다.");
			}
		};
		
	
		
		
		
		// 댓글 수정 폼화면
		function ReviewReplyForm(e){
			
			// console.log($(e).parents().eq(1).children().eq(1).text()); // 댓글 뽑아옴
			var content = $(e).parents().eq(1).children().eq(1).text();
			$(e).parents().eq(1).children().eq(1).text('');
			$(e).parents().eq(1).children().eq(1).append('<textarea></textarea><button>수정</button>');
			$(e).parents().eq(1).children().eq(1).children().val(content); // 댓글창에 기존 댓글이 들어감
		};
		
		
		
		
		
		/* 댓글 작성 */
		function insertReply(){
			console.log($('#reply_content').val());
			
			$.ajax({
				url:'rInsert.re',
				data:{
					reviewNo : ${b.reviewNo},
					replyContent : $('#reply_content').val()
				},
				success:function(){
					
				},
				
				error:function(){
					console.log('실패');
				}
			})
			
		}
		</script>
	
	
	
	
	
 	
   
	<jsp:include page="../../common/footer.jsp" />
 
 
 
 
 
</body>
</html>