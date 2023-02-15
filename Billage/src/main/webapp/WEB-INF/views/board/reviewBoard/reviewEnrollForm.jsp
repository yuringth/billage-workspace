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


/* 상품검색 버튼 */
.search-div{ 
	display: flex; 
	justify-content: center;
	padding-bottom:10px;
	height:50px;
}


.book-detail-outer{
	/* border : 1px solid blue;  */
	width:620px;
	height:200px;
	margin:auto;
}


.book-detail-area{
	/* border : 1px solid black; */
	width:620px;
	height:200px; 
	display:flex;
}


/* 사진  */
.content-photo-detail{
/* 	border:1px solid red; */
	width:200px;
	height:200px;
	margin-right:20px;
}

#book_src{
	width:200px;
	height:200px;
}

/* 책 정보 */
.content-book-detail{
	/* border:1px solid pink; */
	width:400px;
	height:200px;
}

#book_title, #book_author, #book_publisher, #book_data{
	/* border:1px solid pink; */
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
    	align:center;
    }
    
 
    .content-area1{
    /* 	border:1px solid black; */
    	width:600px;
    	display:flex; 
    }
    
    .content-detail1{
    	/* border:1px solid red; */
    	width:150px;
    	height:200px;
    }
    .content-detail2{
    	/* border:1px solid blue; */
    	width:450px;
    	height:200px;
    }
    
    #md_book_title, #md_book_author, #md_book_date, #md_book_publisher{
    	/* border: 1px solid red; */
    	height:50px;
    	margin:0px;
    }
    
    .content-area2{
    	/* border:1px solid black; */
    	width:100px;
    	height:200px;
    }    
    
    #md_img{
    	width:150px;
    	height:200px;
    }
    
 
 

/* 모달관련스타일2 */
   #modal-book-search2{
      position: fixed;
        width: 1000px;
        height:800px;
        background-color: skyblue;
        border-radius: 20px;
        transform: translate(-50%, -50%);
        left: 50%;
        top: 50%;
        z-index: 1005;
        text-align: center;
        display: none;
   }
   
   #modal-close-btn2 {
      font-size: 25px;
        background-color:skyblue;
        border: 1px solid rgba(245, 245, 220, 0);
        cursor: pointer;
        color:rgb(0, 0, 0);
        padding-left: 955px;
   }   

   
   #result-area2{
      margin : auto;
      width : 980px;
      height : 700px;
   }
   
   #enter-addr-in2{
      width : 980px;
      height : 700px;
      overflow : scroll;      
   }
   
    /* 모달 content 스타일2 */
    .text-div{
    	text-align:center;
    }
    
    .book-outer2{
    	display:flex;
    	margin:auto;
    	width:700px;
    	height:200px;
    	align:center;
    }

    .content-area-1{
    	/* border:1px solid pink; */
    	width:600px;
    	display:flex;
    }
    
    .content-detail-1{
  /*   	border:1px solid pink; */
    	width:150px;
    	height:200px;
    }
    
    .content-detail-2{
    	/* border:1px solid pink; */
    	width:450px;
    	height:200px;
    }
    
    #md_book_title, #md_book_author, #md_book_date, #md_book_publisher{
    /* 	border: 1px solid pink; */
    	height:50px;
    	margin:0px;
    }
    
    .content-area-2{
    	/* border:1px solid black; */
    	width:100px;
    	height:200px;
    }    
    
    
    /* 별관련 스타일 */
    #star-area img{
        margin: 0 25px;
    }

    #star-area label{
        display: inline-block;
    }

    #star-area input[name=reviewStar] {
        display: none;
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
		
		<div>
			<!-- 책 제목으로 검색 모달창 -->
			<button class="modal-up-btn btn btn-primary">
    			<span class="spinner-border spinner-border-sm"></span>
    			제목검색
  			</button>
  					
  			<!-- 책 ISBN으로 검색 모달창  -->
			<button class="modal-up-btn2 btn btn-primary">
    			<span class="spinner-border spinner-border-sm"></span>
    			ISBN검색
  			</button>
		</div>
		
		<!-- 글작성 form 태그 -->
		<form id="reviewEnrollForm" action="insertBoard.re" method="post" enctype="multipart/form-data">
		
			<!-- 작성자 식별자로 넘기기 -->
			<input type="hidden" name="userNo" value="${ loginUser.userNo }">
			
			<!-- API에서 선택해서 가져온 책 정보 (이미지, 제목, 작가, 출판사, 발행일자) 넘기기 -->
			<div class="book-detail-outer">
				<div class="book-detail-area">
					<div class="content-photo-detail">
						<div id="book_imag">
							<input src="resources/images/no_image.jpg" type="image" id="book_src"  required value="사진"> 
							<input type="hidden" id="bookImag" name="bookImag"> 
						</div>
					</div>
					
					<div class="content-book-detail">
						<div><input type="text" id="book_title" name="bookTitle"  required></div>
						<div><input type="text" id="book_author" name="bookAuthor" required></div>
						<div><input type="text" id="book_publisher" name="bookPublisher" required></div>
						<div><input type="text" id="book_date" name="bookDate" required></div>
					</div>
				</div>
			</div>
			
			<hr>
	
			<!-- 별점관련 부분 -->
			<div id="star-area" align="center" >
               <label for="rate1">
                   <input type="radio" name="reviewStar" value="1" id="rate1" checked>
                   <img src="resources/images/star1.png" width="50" height="50">
               </label>

               <label for="rate2">
                   <input type="radio" name="reviewStar" value="2" id="rate2">
                   <img src="resources/images/star2.png" width="50" height="50">
               </label>

               <label for="rate3">
                   <input type="radio" name="reviewStar" value="3" id="rate3">
                   <img src="resources/images/star2.png" width="50" height="50">
               </label>

               <label for="rate4">
                   <input type="radio" name="reviewStar" value="4" id="rate4">
                   <img src="resources/images/star2.png" width="50" height="50">
               </label>
               
               <label for="rate5">
                   <input type="radio" name="reviewStar" value="5" id="rate5">
                   <img src="resources/images/star2.png" width="50" height="50">
               </label>
            </div>

			<br>
	
			<!-- 리뷰 작성 부분 -->
			<div class="review-content-outer">
				<textarea id="review_content" name="reviewContent" placeholder="리뷰 작성 해주세요" rows="20" cols="100" style="resize:none" maxlength="1000" required></textarea>
				<hr>
				<span id="count">0</span> / 1000
				<hr>
				<p style="text-align:center;">
					포인트 지급 안내 <br>
					리뷰 작성 시 : 10point 지급
				</p>
				<hr>
				<div style="text-align:center;">
					<button type="submit" class="btn btn-outline-primary">글작성</button>
					<button type="reset" class="btn btn-outline-secondary">취소</button>
				</div>
			</div>
		</form>
 
 
 
		<!-- API 모달창(책이름 검색) -->
		<div id="modal-book-search">
			<button type="button" id="modal-close-btn">&times;</button>
			
			<div id="search-area">
				<div id="search-text"> 
					<div class="text-div">
			    		<input type="text" id="title" placeholder="책이름을 작성해주세요">
			    		<button onclick="search();">이동</button>
					</div>   
				</div>
				<div id="result-area">
					<hr>
			        <div class="book-outer">
			        	
			        	<!--  ajax로 가져온 책 정보를 띄워주는 영역  -->
			        	
			        </div>
				</div>
			</div>
		</div>
		<!-- API 모달창(책이름 검색) 끝 -->
		
		
		
		<!-- API 모달창(ISBN 검색) -->
		<div id="modal-book-search2">
			<button type="button" id="modal-close-btn2">&times;</button>
			
			<div id="search-area">
				<div id="search-text"> 
					<div class="text-div">
			    		<input type="text" id="keyword" placeholder="도서 ISBN을 작성해주세요">
			    		<button onclick="search2();">이동</button>
					</div>   
				</div>
				<div id="result-area2">
					<hr>
			        <div class="book-outer2">
			        	
			        	<!--  ajax로 가져온 책 정보를 띄워주는 영역  -->
			        	
			        </div>
				</div>
			</div>
		</div>
		<!-- API 모달창(ISBN 검색) 끝 -->

	<!-- 전체 outer -->	
 	</div>   
 	


 	<!-- API(책이름 검색) script -->
	<script>
	    $(function(){
	    	/* 모달 버튼 클릭 시, 모달창 띄워줌 */
	        $('.modal-up-btn').click(function(){
	           $('#modal-book-search').show();
	        });
	        
	        /* 모달 취소 버튼 클릭 시, 모달창 숨겨줌 */
	        $('#modal-close-btn').click(function(){
	           $('#modal-book-search').hide();
	        });
	     });
	    
	    
		 function search(){
			 
			/* console.log("잘들어옴?" + $('#title').val()); */
			
			$.ajax({
				url:'search.bk',
				data:{ 
					title : $('#title').val()
					// 요청시 전달 값 => 책 제목
				},
				
				success : function(result){
					
					// console.log(result);
					
					const item = result.item[0];
					//const count = Object.keys(result).size; 
					
					console.log(item);
					//console.log(count);
					
					let value ='';
						
					let thumb = item.cover;
					
					value += '<div class="content-area1">'
						  + '<div class="content-detail1">'
						  + '<div><img id="md_img" src="' + thumb + '"></div>'
						  + '</div>'
						  + '<div class="content-detail2">'
						  + '<p id="md_book_title" name="mdbookTitle">' + item.title + '</p>'
						  + '<p id="md_book_author" name="mdbookAuthor">' + item.author + '</p>'
						  + '<p id="md_book_date" name="mdbookDate">' + item.pubDate + '</p>'
						  + '<p id="md_book_publisher" name="bookPublisher">' + item.publisher + '</p>'
						  + '</div>'
						  + '</div>'
						  + '<div  class="content-area2">'
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
			 /*  API에서 가져온 책 정보를 선택 할 시, 데이터의 값을 가져오고 모달창 숨겨짐 */
			 $(document).on('click', '#modal-result-btn', function(){
				 
				 $('#book_title').val($('#md_book_title').text());
				 $('#book_author').val($('#md_book_author').text());
				 $('#book_publisher').val($('#md_book_publisher').text());
				 $('#book_date').val($('#md_book_date').text());
				 $('#book_src').attr('src', $('#md_img').attr('src')); 
				 $('#bookImag').val($('#md_img').attr('src'));  
				 
				 $('#modal-book-search').hide();
			 })
		 });
	</script>



 	<!-- API(ISBN 검색) script -->
	<script>
	    $(function(){
	    	/* 모달 버튼 클릭 시, 모달창 띄워줌 */
	        $('.modal-up-btn2').click(function(){
	           $('#modal-book-search2').show();
	        });
	        
	        /* 모달 취소 버튼 클릭 시, 모달창 숨겨줌 */
	        $('#modal-close-btn2').click(function(){
	           $('#modal-book-search2').hide();
	        });
	     });
	    
	    
		 function search2(){
			// console.log("잘들어옴?" + $('#keyword').val());
			 $.ajax({
				url:'searchBook.bk',
				data:{ 
					keyword : $('#keyword').val()
					// 요청 시 전달 값 => ISBN
				},
				success : function(result){
					console.log(result);
					
					const item = result.item[0];
					//const count = Object.keys(result).size; => 어케 구하냐
					
					console.log(item);
					//console.log(count);
					
					let value ='';
						
					let thumb = item.cover;
					
					value += '<div class="content-area-1">'
						  + 	'<div class="content-detail-1">'
						  + 		'<div><img id="md_img" src="' + thumb + '"></div>'
						  +		'</div>'
						  + 	'<div class="content-detail-2">'
						  + 		'<p id="md_book_title" name="mdbookTitle">' + item.title + '</p>'
						  + 		'<p id="md_book_author" name="mdbookAuthor">' + item.author + '</p>'
						  + 		'<p id="md_book_date" name="mdbookDate">' + item.pubDate + '</p>'
						  + 		'<p id="md_book_publisher" name="bookPublisher">' + item.publisher + '</p>'
						  + 	'</div>'
						  + '</div>'
						  + '<div  class="content-area-2">'
						  + 	'<button id="modal-result-btn2">선택</button>'
						  + '</div>';
					$('.book-outer2').html(value);
					$('#keyword').val(keyword);
					
					$("#keyword").val('');
						
				},
				error: function(){
					console.log('실패');
				}
			 });
		 };
	    
		 $(function(){
			 $(document).on('click', '#modal-result-btn2', function(){
				 
				 $('#book_title').val($('#md_book_title').text());
				 $('#book_author').val($('#md_book_author').text());
				 $('#book_publisher').val($('#md_book_publisher').text());
				 $('#book_date').val($('#md_book_date').text());
				 $('#book_src').attr('src', $('#md_img').attr('src')); //https://image.aladin.co.kr/product/7608/30/coversum/8994492038_1.jpg
				 $('#bookImag').val($('#md_img').attr('src')); //https://image.aladin.co.kr/product/7608/30/coversum/8994492038_1.jpg
				 
				 
				 $('#modal-book-search2').hide();
			 })
		 });
	</script>

 
 
	<!-- 글입력 갯수 세는 script -->
	<script>
       $(function(){
           $('.review-content-outer #review_content').keyup(function(){
               $('#count').text($(this).val().length);
           });
       });
   	</script>
   	
   	
   	
   	
   	<!-- 평점 관련 script  -->
   	<script>
    $('input[name=reviewStar]').click(function(){

        var $num = $(this).val();

        $('input[name=reviewStar]').each(function(){

            if($(this).val() <= $num){
                $(this).next().attr('src','resources/images/star1.png');
            } else {
                $(this).next().attr('src','resources/images/star2.png');
            }
        })
    });
   	</script>
 
   	
	<jsp:include page="../../common/footer.jsp" />
 
 
</body>
</html>