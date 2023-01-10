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


/* 상품검색 버튼 고쳐야함 */
.search-div{ 
	display: flex; 
	justify-content: center;
	padding-bottom:10px;
	height:50px;
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

#book_title, #book_author, #book_publisher, #book_data{
	border:1px solid pink;
	height:50px;
}




.review-content-outer{
	text-align:center;
}




/*모달관련 스타일*/
   #modal-book-search{
      position: fixed;
        width: 1000px;
        height:800px;
        background-color: rgb(253, 219, 219);
        border-radius: 20px;
        transform: translate(-50%, -50%);
        left: 50%;
        top: 50%;
        z-index: 1005;
        text-align: center;
        display: none;
   }
   
   #modal-close-btn {
      font-size: 25px;
        background-color:rgba(95, 152, 124, 0);
        border: 1px solid rgba(245, 245, 220, 0);
        cursor: pointer;
        color:rgb(0, 0, 0);
        padding-left: 955px;
   }   
   
   #result-area{
      margin : auto;
      width : 980px;
      height : 700px;
   }
   
   #enter-addr-in{
      width : 980px;
      height : 700px;
      overflow : scroll;      
   }


/* 모달 content 스타일  */

    .text-div{
    	text-align:center;
    }
    
    .book-outer{
    	display:flex;
    	margin:auto;
    	width:700px;
    	height:200px;
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
    #md_book_title, #md_book_author, #md_book_date, #md_book_publisher{
    	border: 1px solid black;
    	height:50px;
    	margin:0px;
    }
    
    
    .content-area3{
    	border:1px solid black;
    	width:75px;
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
		
		<div><button class="modal-up-btn">상품모달검색</button></div>
		<!-- api끌고오는건데 enctype으로 해야하는게 맞을까?? -->
		<!-- 페이지 포워딩 -->
		<form id="reviewEnrollForm" action="search.re" method="post" enctype="multipart/form-data">
		
		<!-- 작성자 식별자로 넘기기 -->
		<input type="hidden" neme="userNo" value="#">
		
			
			<div class="search-div">
				<input type="text" id="book_title2" name="bookTitle">
				<button class="btn btn-link" type="submit">상품검색</button>
			</div>
		</form>
		
		
		
		<div class="book-detail-outer">
			<div class="book-detail-area">
				<div class="content-photo-detail">
					<!-- api에서 끌고 오는거니까 첨부파일로 안해도 되는게 맞겠지? <input type="file" name="upfile"> 이런식으로.. -->
					<div id="book_imag" name="bookImag"><img src="" id="book_scr">사진</div>
				</div>
				
				<!-- review 테이블 : book_content, book_publisher, book_date 컬럼 추가  -->
				<div class="content-book-detail">
					<div id="book_title" name="bookTitle">제목</div>
					<div id="book_author" name="bookAuthor">작가</div>
					<div id="book_publisher" name="bookPublisher">츨판사</div>
					<div id="book_date" name="bookDate">발행일자</div>
				</div>
			</div>
		</div>
		
		
		<hr>

		<!-- 매란언니한테 알려달라하기 -->
		<div style="text-align:center;">별점 : ☆☆☆★ 
			<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
		</div>

		<br>

		<div class="review-content-outer">
			<form action="#">
				<textarea id="review_content" name="reviewContent" placeholder="리뷰 작성 해주세요" rows="20" cols="100" style="resize:none" maxlength="1000" required></textarea>
				
				<hr>
				
				<spank id="count">0</spank> / 1000

				<hr>
	
				<p style="text-align:center;">
					포인트 지급 안내 <br>
					리뷰 작성 시 : 10point 지급
				</p>
	
				<hr>
					
				<div style="text-align:center;">
					<button>글작성</button>
					<button>취소</button>
				</div>

			</form>
		</div>


 
 
 
		<!-- api 모달창 -->
		<div id="modal-book-search">
			<button type="button" id="modal-close-btn">&times;</button>
			
			<div id="search-area">
				<div id="search-text"> 
					<div class="text-div">
						<button onclick="search(1);">1페이지 이동</button>
			    		<input type="text" id="title" placeholder="책이름을 작성해주세요">
			    		<button onclick="search(2);">이동</button>
					</div>   
				</div>
				<div id="result-area">
			   		<div class="text-div">
						<p>"검색이름"로 1개의 검색 결과가 있습니다.</p>
					</div>
					
					<hr>
							
			        <!-- 책상품 하나의div  -->
			        <div class="book-outer">
			        	
			        	<!--  ajax해서 가져온 책 정보를 뿌려줌  -->
			        	
			        </div>
				</div>
			</div>
		</div>
		<!-- api 모달창 -->


	<!-- 전체 outer /div -->	
 	</div>   
 	
 	
 
	
 	<!-- api 모달창 -->
	<script>
	    $(function(){
	        $('.modal-up-btn').click(function(){
	           //$('input[name=groupLocation]').val('');
	           $('#modal-book-search').show();
	        });
	        
	        
	        $('#modal-close-btn').click(function(){
	           $('#modal-book-search').hide();
	          // $('#search').val('');
	          // $('#enter-addr-in').empty();
	           
	        });
	     });
	    
	    
		 function search(){
			 $.ajax({
				url:'search.bk',
				data:{ // 요청시 전달 값
					title : $('#title').val()
				},
				
				success : function(result){
					
					const item = result.item[0];
					
					console.log(item);
					
					let value ='';
						
					let thumb = item.cover;
					
					value += '<div class="content-area1">'
						  + '<p>' + 1 + '</p>'
						  + '</div>'
						  + '<div class="content-area2">'
						  + '<div class="content-detail1">'
						  + '<div><img id="md_img" src="' + thumb + '"></div>'
						  + '</div>'
						  + '<div class="content-detail2">'
						  + '<p id="md_book_title" name="bookTitle">' + item.title + '</p>'
						  + '<p id="md_book_author" name="bookAuthor">' + item.author + '</p>'
						  + '<p id="md_book_date" name="bookDate">' + item.pubDate + '</p>'
						  + '<p id="md_book_publisher" name="bookPublisher">' + item.publisher + '</p>'
						  + '</div>'
						  + '</div>'
						  + '<div  class="content-area3">'
						  + '<button id="modal-result-btn">선택</button>'
						  + '</div>';
						  
							  
					$('.book-outer').html(value);
					$('#title').val(title);
					
					$("#title").val('');
					
					
				},
				
				error: function(){
					console.log('실패');
				}
			 })
		 };
	    
		 $(function(){
			 $(document).on('click', '#modal-result-btn', function(){
				 
				 
				 console.log($('#md_book_title').text());
				 console.log($('#md_book_author').text());
				 console.log($('#md_book_date').text());
				 console.log($('#md_book_publisher').text());
				 console.log($('#md_img').attr('src'));
				 
				 
				 $('#book_title').html($('#md_book_title').text());
				 $('#book_author').html($('#md_book_author').text());
				 $('#book_publisher').html($('#md_book_publisher').text());
				 $('#book_date').html($('#md_book_date').text());
				 
				// $('#book_imag').html($('#md_img').attr('src', "$('#md_img').attr('src')"));
				 
				 //$('#book_scr').attr('scr', '$('#md_img').attr('src')');
				 
				 
				 
				 $('#modal-book-search').hide();
			 })
		 });
	</script>

	 
	 
 
 
 
	<!-- 글입력 갯수 세기 스크립트-->
	<script>
       $(function(){
           $('.review-content-outer #review_content').keyup(function(){
               $('#count').text($(this).val().length);
               
           });
       });
   	</script>
   	
 
   	
   	
   	
   	
   	
   	
   
	<jsp:include page="../../common/footer.jsp" />
 
 
 
 
 
</body>
</html>