<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 목록 조회</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>

    .reviewList-area{
        border:1px solid red;
        width:1200px;
        margin:auto;

    }
    
    .reviewOption{
        border:1px solid red;
    	width:1200px;
    	height:30px;
    }
    
    .one-content{
   		border:1px solid forestgreen;
    	width:500px;
    	height:400px;
    	margin:25px;
    }
    
    
    .list-outer{
   		display:flex;
   		width:1100px;
   		margin:auto;
    }
    
    

    .one-content-detail1{
        border:1px solid blue;
		width:500px;
		height:50px;
        display:flex;
    }


  	.one-content-detail2{
  		border:1px solid red;
  		width:500px;
		height:250px;
  		display:flex;
  		margin:auto;
  	}
  	
 
  	
	.book-detail1{
		border:1px solid pink;
		width:200px; 
		height:220px;
		margin-top:10px;
		margin-left:10px;
	}

  	
	.book-detail2{
		border:1px solid pink;
		width:300px;
		height:220px;
		margin-top:10px;
		margin-left:10px;
	}
	
	

	
	/* 이거 뭔데 div안에 안들어가냐??! 찜갯수 ㅠ */
	.one-content-detail3{
		border:1px solid black;
		width:500px;
		height:100px;
	}


	* {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	}

	.pagingArea{
		display : flex;
		justify-content: center;
	}
	
</style>


</head>
<body>

	<!-- 메뉴바 -->
	<jsp:include page="../../common/header.jsp" />
    
    



	<h1>리뷰게시판</h1>
	
    <!-- 전체를 감싸는 div -->
    <div class="reviewList-area">

        <!-- 옵션div -->
        <div>
            <div class="reviewOption">
                <select name="" id="">
                    <option value="book" selected>책 제목순</option>
                    <option value="date">날짜 정렬 순</option>
                </select>
            </div>
        </div>



   	<c:forEach items="${ list }" var="b">
		<div class="list-outer">
	        <!-- 리뷰 하나를 감싸는 div -->
		        <div class="one-content">
		        <!-- <div class="one-content" onclick="reviewDetail()"> -->
		        
		        	<!-- 작성자/별 -->
		            <div class="one-content-detail1">
		            	<input type="hidden" value="${ b.bookAuthor }">
		            	<input class="bno" type="hidden" value="${ b.reviewNo }">
		                <div>유저 닉네임: ${ b.nickname }</div>                                              
		                <div class="card-footer">
		                 	   별점 : ${ b.reviewStar }
		                </div>
		            </div>
					
					<!-- 책관련 디테일 div 책사진/제목/내용  -->
					<div class="one-content-detail2">
					
						<div class="book-detail1">
				            <div>
				            	<img class="card-img-top" src="${ b.bookImag }" alt="책사진" style= "width:200px; height:220px;">
				            </div>
						</div>
						
						<div class="book-detail2">	            
				            <div>
				            	<div style="height:80px; font-weight:bold;" >${ b.bookTitle }</div>
				            </div>
			    	        <div>
			  	  	       		<div style="height:140px;">${ b.reviewContent }</div>
			    	        </div>
						</div>
					
						<br>
					</div>
		
		            <div class="one-content-detail3">
		            	<button>♡</button>찜갯수(5)
	            		<div> 댓글(3) 리뷰등록수(3) 조회수${ b.count }</div>
		            	<div>${ b.createDate }</div>
		            </div>
		        </div>
		</div>
	</c:forEach>






                    
    <!-- 페이지처리하는 영역-->
    <div class="pagingArea">
        <ul class="pagination">
            <c:choose>
            	<c:when test="${ pi.currentPage eq 1 }">
	            	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	            </c:when>
				<c:otherwise>	            
	            	<li class="page-item"><a class="page-link" href="list.re?cPage=${ pi.currentPage - 1 }">Previous</a></li>
            	</c:otherwise>
            </c:choose>
            
            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
            	<li class="page-item"><a class="page-link" href="list.re?cPage=${ p }">${ p }</a></li>
            </c:forEach>

			<c:choose>
				<c:when test="${ pi.currentPage eq pi.maxPage }">            
       	    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
        		</c:when>
 				<c:otherwise>
       	    		<li class="page-item"><a class="page-link" href="list.re?cPage=${ pi.currentPage + 1 }">Next</a></li>
        		</c:otherwise>
        	</c:choose>
        
        </ul>
    </div>


	<!-- 로그인 한 유저만 버튼 보임 -->
	<c:if test="${ not empty loginUser }">
		<div class="pagingArea">
			<button class="btn btn-secondary" onclick="location.href='insert.re'">글작성</button>
		</div>
	</c:if>
	<!-- 페이지 처리 끝  -->



	<!-- 게시글 상세보기 :되지만 나중에 페이징처리로 이동하기 -->
	<script>
		$(function(){
			$('.one-content').click(function(){
				location.href = 'detail.re?reviewNo=' + $(this).find('.bno').val();
				console.log($(this).find('.bno').val()); // http://localhost:8787/billage/detail.re?reviewNo=16
			})
			
		})
		
		
	</script>


  </div>
  

	<!-- 푸터바 -->
	<jsp:include page="../../common/footer.jsp" />


	
</body>
</html>