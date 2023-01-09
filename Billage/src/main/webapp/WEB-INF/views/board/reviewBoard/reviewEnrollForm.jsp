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

#book_content, #book_title, #book_author, #book_publisher, #book_data{
	border:1px solid pink;
	height:40px;
}




.review-content-outer{
	text-align:center;
}




	/*모달관련 스타일*/
	
	#write-textarea{
        text-align: center;

	}
	
	#store-report-area{
        position: fixed;
        width: 600px;
        height:900px;
        background-color: rgb(253, 219, 219);
        border-radius: 20px;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        display: none;
        z-index: 1000;
    }

    #store-report-area .close{
        font-size: 40px;
        background-color:rgba(95, 152, 124, 0);
        border: 1px solid rgba(245, 245, 220, 0);
        cursor: pointer;
        color:rgb(0, 0, 0);
        padding-left: 560px;
    }
	
    #store-report-area{
        height:720px;
    }

    .modal-title>h2{
        font-size: 34px;
        text-align: center;
        font-weight: 900px;
        font-family: 'Happiness-Sans-Title';
    }

    #store-report-area p {
        font-weight: 900;
        padding: 5px 20px;
        font-size: 20px;
    }

    #st-text-area p {
        padding-left: 40px;
        font-weight: 400;
        font-size: 16px;
    }

    #store-name-area{
        margin: 5px 10px;
        padding-left: 50px;
        font-size: 30px;
        color:rgb(109, 104, 104);
        /* font-weight: 00; 
        font-family: 'Happiness-Sans-Title';
    }

    #tag-area {
        margin-left: 45px;
    }
    
    .tag-opt {
        font-size: 18px;
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
		
		<!-- api끌고오는건데 enctype으로 해야하는게 맞을까?? -->
		<!-- 페이지 포워딩 -->
		<form id="reviewEnrollForm" action="search.re" method="post" enctype="multipart/form-data">
		
		<!-- 작성자 식별자로 넘기기 -->
		<input type="hidden" neme="userNo" value="#">
		
			<div class="search-div">
				<input type="text" id="book_title" name="bookTitle">
				<button class="btn btn-link" type="submit">상품검색</button>
			</div>
		</form>
		
		
		<div class="book-detail-outer">
			<div class="book-detail-area">
				<div class="content-photo-detail">
					<!-- api에서 끌고 오는거니까 첨부파일로 안해도 되는게 맞겠지? <input type="file" name="upfile"> 이런식으로.. -->
					<div id="book_imag" name="bookImag">사진</div>
				</div>
				
				<!-- review 테이블 : book_content, book_publisher, book_date 컬럼 추가  -->
				<div class="content-book-detail">
					<div id="boo_content" name="bookContent">책내용</div>
					<div id="book_title" name="bookTitle">제목</div>
					<div id="book_author" name="bookAuthor">저자</div>
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


 
 
 
		<!-- api 모달창 => 전혀 이상한게 없는데 안뜬다!!ㅠㅠ -->
		<div id="store-report-area">
		    <div class="modal fade" id="mymodal2">
		        <div class="modal-dialog">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal">&times;</button>
		                <br>
		                <div class="modal-title"><h2>식당정보수정요청👏</h2></div>
		            </div>
		
		            <form action="" method="post">
		                <div class="modal-content">
		                    <br>
		                    <div id="st-text-area">
		                        <p>
					                            수정이 필요한 사항을 제보해 주시면 <br>
		                         	Freeeat팀이 검토 후 수정합니다. <br>
					                            감사합니다😃
		                        </p>
		                    </div>
		
		                    <h1 id="store-name-area">dd</h1>
		
		                    <br>
		                    <p>● 수정사항을 입력해주세요 </p>
		                    <div id="write-textarea">
		                        <textarea name="content" rows="500" style="width:500px; height:300px; resize:none;" placeholder="10자 이상 입력해주세요!"required></textarea>
		                    </div>          
		                </div> <!-- modal-content -->
		                
		                <div id="modal-footer">
		                    <input type="submit" value="요청하기" disabled/>
		                    <input type="reset" value="다시쓰기"/>
		                </div>
		            </form>
		        </div><!-- class="modal-dialog" -->
		    </div><!-- class="modal fade" id="mymodal1" -->
		</div> <!-- #store-report-area-->
	
		<div id="store-report"><a>신고하기</a></div>
		<!-- api 모달창 -->




	<!-- 전체 outer /div -->	
 	</div>   
 	
 	
 
	
 	<!-- api 모달창 -->
	<script>
	$(function(){
			$('#store-report a').click(function(){
		          $('#store-report-area').fadeIn();
	      });
				
			$('#store-report-area .close').click(function(){
			   		 $('#store-report-area').fadeOut();
				});
			})
			
	        $('textarea[name=content]').keyup(function(){
			if($(this).val().length >= 10){
            	$('#modal-footer > input[type=submit]').removeAttr('disabled');
			} else {
            	$('#modal-footer > input[type=submit]').attr('disabled', 'true');
			}                	
        })
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