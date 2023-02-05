<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 목록 조회</title>

<style>
    .reviewList-area{
       /*  border:1px solid red; */
        width:1200px;
        margin:auto;

    }
 
/*     
    .reviewOption{
        border:1px solid red;
    	width:1200px;
    	height:30px;
    }
    
 */ 
 
    #reviewOption2{
        /* border:1px solid red; */
    	width:1200px;
    	height:70px;
    }
    
    
    .list-outer{
   		width:1200px;
   		margin:auto;
   		display:flex; 
   		flex-wrap: wrap;
    }
    
    .one-content{
   		border:1px solid black; 
   		border-radius:1rem;
    	width:500px;
    	height:430px;
    	margin:25px;
    	padding:2px;
    }
    
    

    .one-content-detail1{
       /*  border:1px solid blue; */
		width:500px;
		height:50px;
        display:flex;
    }


  	.one-content-detail2{
  		/* border:1px solid red; */
  		width:500px;
		height:250px;
  		display:flex;
  		margin:auto;
  	}
  	
 
  	
	.book-detail1{
		/* border:1px solid pink; */
		width:200px; 
		height:220px;
		margin-top:10px;
		margin-left:10px;
	}

  	
	.book-detail2{
		/* border:1px solid pink; */
		width:300px;
		height:220px;
		margin-top:10px;
		margin-left:10px;
	}
	
	

	
	/* 이거 뭔데 div안에 안들어가냐??! 찜갯수 ㅠ */
	.one-content-detail3{
	/* 	border:1px solid black; */
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- modal bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
<!-- 옵션 부트스트랩 -->  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
</head>
<body>

	<!-- 메뉴바 -->
	<jsp:include page="../../common/header.jsp" />
    
    



	<h1>리뷰게시판</h1>
	
    <!-- 전체를 감싸는 div -->
    <div class="reviewList-area">

        <!-- 옵션div -->
		
		<!--       
        <div>
            <div class="reviewOption">
                <select name="" id="">
                    <option value="book" selected>책 제목순</option>
                    <option value="date">날짜 정렬 순</option>
                </select>
            </div>
        </div>
         -->
         
		<div class="align-side margin-bottom">
			<div class="dropdown" id="reviewOption2">
				<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
				정렬
				</button>
				<div class="dropdown-menu"> 
					<a class="dropdown-item" href="#">책 제목순</a>
					<a class="dropdown-item" href="#">최신 날짜 순</a>
				</div>
			</div>
		</div>	


		<div class="list-outer">
  			<c:forEach items="${ list }" var="b">
   	
        		<!-- 리뷰 하나를 감싸는 div -->
		        <div class="one-content">
		        <!-- <div class="one-content" onclick="reviewDetail()"> -->
		        
		        	<!-- 작성자/별 -->
		            <div class="one-content-detail1">
		            	<input type="hidden" value="${ b.bookAuthor }">
		            	<input type="hidden"  class ="fuserNo" value="${b.userNo }">
		            <%-- 	<input class="bno" type="hidden" value="${ b.reviewNo }"> --%>
		                <div>유저 닉네임: ${ b.nickname }</div>                                              
		                <div class="card-footer">
		                 	   별점 : ${ b.reviewStar }
		                </div>
		            </div>
					
					<!-- 책관련 디테일 div 책사진/제목/내용  -->
					<div class="one-content-detail2">
						<input class="bno" type="hidden" value="${ b.reviewNo }">
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
		            	<input class="bno" type="hidden" id="reviewlikeNo" value="${ b.reviewNo }">
		            	<br><br>
		            	<!-- <button id="reviewLikeBtn" onclick="reviewLikeIncrease();">♡ </button>
		            	<span>좋아요수</span> -->
	            		<div> 댓글(3) 조회수${ b.count }</div>
		            	<div>${ b.createDate }</div>
		            </div>
		        </div>
		        
			</c:forEach>
		</div>



                    
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
			<button class="btn btn-outline-primary" onclick="location.href='insert.re'">글작성</button>
		</div>
	</c:if>
	<!-- 페이지 처리 끝  -->
	
	
	
	
	
	
	<!-- follow modal 창 -->
	<div class="container mt-3">

	  <!-- The Modal -->
	  <div class="modal fade" id="myModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body" id="modalBodyBtn" align="center">
	        	
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	  
	</div>
	
	<button type="button" id="followbtn" style="display:none;" data-toggle="modal" data-target="#myModal"></button>
	
	<!-- follow modal창 끝 -->



	<!-- 게시글 상세보기 :되지만 나중에 페이징처리로 이동하기(기존) -->
<!-- 	
	<script>
		$(function(){
			$('.one-content').click(function(){
				location.href = 'detail.re?reviewNo=' + $(this).find('.bno').val();
				console.log($(this).find('.bno').val()); // http://localhost:8787/billage/detail.re?reviewNo=16
			})
			
		})
	</script>
 -->
 	
 	
 	
 	
 	<!-- 종아요부분  -->
 	<script>
 /* 	
 		$(function(){
			
 			$(document).on('click', '#reviewLikeBtn', function(){
 				//console.log($('#reviewlikeNo').val());
 				$.ajax({
 	 				url:'reviewLike.re',
 	 				data:{
 	 					reviewNo : $('#reviewlikeNo').val()
 	 				},
 	 				success:function(){
 	 					
 	 				},
 	 				error:function(){
 	 					
 	 				}
 				})
 			
 			})
 		})
 		 */
  		 function reviewLikeIncrease(){
  			//console.log($('#reviewlikeNo').val());
  			console.log('${loginUser.userNo}');
  			
 			$.ajax({
 				url:'insertReviewLike.re',
 				data:{
 					reviewNo : $('#reviewlikeNo').val(),
 					userNo : '${loginUser.userNo}'
 				},
 				success:function(result){
 					console.log(result)
 				},
 				error:function(){
 					
 				}
 			})
 		} 
 	</script>
 		
  
	
	<script>
		/* (유림)게시글 상세보기 :되지만 나중에 페이징처리로 이동하기 (변경) */
		$(function(){
			$('.one-content-detail2').click(function(){
				location.href = 'detail.re?reviewNo=' + $(this).find('.bno').val();
				console.log($(this).find('.bno').val()); // http://localhost:8787/billage/detail.re?reviewNo=16
		})

		
		
		// 휘수시작 =======================================================================================================	
			
		//유저 닉네임 클릭시 모달창 생성
			if(${ !empty loginUser && loginUser.userNo != b.userNo}){
				$('.one-content-detail1').click(function(){
					
					var userNo2 = $(this).find('.fuserNo').val();
					
					$.ajax({
						url:'checkFollow.fo',
						method:'post',
						data : {userNo1 : '${sessionScope.loginUser.userNo}',
									userNo2 : $(this).find('.fuserNo').val()},
						success : function(result){
							if(result > 0){  
								$('#modalBodyBtn').html('<button id="followingBtn" class="btn btn-primary">팔로잉</button>' + '<input type="hidden" class="userNo2" value="'+ userNo2+'"/>');
								$('#followbtn').click();
							}else{
								$('#modalBodyBtn').html('<button id="followBtn" class="btn btn-primary">팔로우</button>' + '<input type="hidden" class="userNo2" value="'+ userNo2+'"/>');
								$('#followbtn').click();
							}
						}			
						
					})	
				})
			}
			else{
				$('.one-content-detail1').click(function(){
					alert('로그인을 해주세요');
				})
			}
			//모달창 띄우기 끝
		});
		
		//팔로우 취소 
		$(function(){
			$(document).on('click', '#followingBtn', function(){
				
				if(confirm('팔로우를 취소하시겠습니까?')){
					
					$.ajax({
						url : 'delete.fo',
						method :'post',
						data: {userNo2 : $('.userNo2').val()},
						success : function(result){
							if(result>0){
								$('.close').click();
								alert('팔로우 취소가 완료되었습니다.');
							}
						}
						
					});
				
				}
			});
			
			$(document).on('click', '#followBtn', function(){
				if(confirm('팔로우 하시겠습니까?')){
					
						$.ajax({
							url : 'insert.fo',
							method : 'post',
							data : {userNo2 : $('.userNo2').val()},
							success : function(result){
								if(result > 0){
									$('.close').click();
									alert('팔로우가 완료되었습니다.');
								}
							}
						});
				}
			});
		})
		
	</script>

  </div>
  

	<!-- 푸터바 -->
	<jsp:include page="../../common/footer.jsp" />


	
</body>
</html>