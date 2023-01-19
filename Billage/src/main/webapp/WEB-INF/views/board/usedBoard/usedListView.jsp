<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래게시판 목록 조회</title>

<style>
    p {
        margin-bottom : 0px;
        padding : 0px;
    }
    .outer{
        width : 1200px;
        margin : auto;
        
    }
    .margin-bottom{
    	margin-bottom : 20px;
    }
    .align-side{
    	display : flex;
    	justify-content: space-between;
    }
    .align-left{
        flex: auto;
    }
    
    .align-left-outer{
        display: flex;
        flex-wrap: wrap;
    }
    
    .one-content{
        width : 400px;
      /*   height: 534px; */
        height: 650px;
        padding-left: 8px;
        padding-right: 8px;
        padding-bottom: 16px;
    }
    
    
    .img-area{
        width : 100%; 
        /* width: 400px; */
        height : 414px;
        overflow: hidden;
    }
    
    #img-area2{
      	width: 400px;
        height : 414px;
    }
    
    .text-area{
        width: 344px;
        height: 100px;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 30px;
    }
    .countnum{
        display: flex;
        flex-direction: row-reverse;
        font-size: 12px;
    }
    .textsize {
        font-size: 17px;
        margin : 0px;
    }
    .title-text{
		font-size: 25px;
        margin : 0px;
    }

</style>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
</head>
<body>


    <jsp:include page="../../common/header.jsp"/>


    <!-- 전체를 감싸는 div -->
    <div class="outer">
    
		<div class="align-side margin-bottom">
			<div class="dropdown">
				<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
				정렬
				</button>
				<div class="dropdown-menu"> 
					<a class="dropdown-item" href="#">판매중 상품만 보기</a>
					<a class="dropdown-item" href="#">최신 날짜 순</a>
				</div>
			</div>
			<c:if test="${ not empty loginUser }">
				<div>
					<button type="button" class="btn btn-info" onclick="location.href='insert.ud'">글쓰기</button>
				</div>   
			</c:if>
		</div>		
				
				
		
		<div class="search-area">
			<form id="searchForm" action="searchForm.ud" method="get" align="center">
				<input type="hidden" name="currentPage" value="1">
			    <div class="select">
			        <select class="custom-select" name="condition">
			            <option value="nickname">작성자</option>
			            <option value="bookTitle">책제목</option>
			            <option value="usedContent">내용</option>
			        </select>
			    </div>
			    <div class="text">
			        <input type="text" class="form-control" name="keyword" value="${ keyword }">
			    </div>
			    <button type="submit" class="searchBtn btn btn-secondary">검색</button>
			</form>
		</div>
		
		<c:if test="${ not empty condition }">
			<script>
				$(function(){
					$('.search-area option[value=${ condition }]').attr('selected', true);
					
				})
				
			</script>
		</c:if>


			<!-- 상품 크게 감싸는 div -->
			<div class="align-left-outer">
			  
			  	<c:forEach items="${ list }" var="b">
			  	<!-- 상품 하나를 감싸는 div  -->
		        <div class="one-content">
		        	
		        	<div class="stock-status">
						<c:if test="${ b.stockStatus == 'N'}">
							<p>판매중</p>
						</c:if>		        		
							<c:if test="${ b.stockStatus == 'Y'}">
							<p>판매완료</p>
						</c:if>		
					</div>
					
					<div class="usedNo-area">
						<input class="bno" type="hidden" value="${ b.usedNo }">
						
			            <div class="img-area">
			                
			                <img id="img-area2" src="${ b.changeName }">
			                ${b.changeName }
			            	<!--  onclick="location.href='detail.ud?usedNo='" + b.getUsedNo() -->
			            	
			            </div>
			            <div class="text-area">
			                <p class="title-text">책제목 : ${ b.bookTitle }</p>
			                <p class="textsize">판매 금액 : ${ b.point }</p>
			            </div>
					</div>
			            <div class="text-area">
			                <p class="textsize">♡</p>
			                <p class="countnum">조회 : ${ b.count }</p>
			            </div>
					
	     	    </div>
		        </c:forEach>
			</div>
			
		<!-- 더보기 누를 시 상품 6개가 뜨게 되는 div -->
		<div><button type="button" class="btn btn-info" style="width:1200px; height:80px;">더보기</button></div>  
	
                    
	    <!-- 페이지처리하는 영역-->
	    <div class="pagingArea">
	        <ul class="pagination">
	            <c:choose>
	            	<c:when test="${ pi.currentPage eq 1 }">
		            	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		            </c:when>
					<c:otherwise>	            
		            	<li class="page-item"><a class="page-link" href="list.ud?cPage=${ pi.currentPage - 1 }">Previous</a></li>
	            	</c:otherwise>
	            </c:choose>
	            
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p" step="1">
					<c:choose>
						<c:when test="${ empty condition }">            
		            		<li class="page-item"><a class="page-link" href="list.ud?cPage=${ p }">${ p }</a></li>
						</c:when>
						<c:otherwise>
			            	<li class="page-item"><a class="page-link" href="searchForm.ud?currentPage=${ p }&condition=${ condition }&keyword=${ keyword }">${ p }</a></li>
						</c:otherwise>	
					</c:choose>
	            </c:forEach>
	
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">            
	       	    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	        		</c:when>
	 				<c:otherwise>
	       	    		<li class="page-item"><a class="page-link" href="list.ud?cPage=${ pi.currentPage + 1 }">Next</a></li>
	        		</c:otherwise>
	        	</c:choose>
	        
	        </ul>
	    </div>
	    
    
    </div>	



	<!-- 게시글 눌렀을 시 상세보기로 이동 -->	
	<script>
		$(function(){
			// $('.one-content').click(function()) // 정적으로 만들어진 요소에 대한 이벤트
			$(document).on('click','.usedNo-area', function(){ // 동적으로 만들어진 요소에 대한 이벤트 => 동적이란 forEach문으로 생성이 계속 되기때문에 
			
				location.href='detail.ud?usedNo=' + $(this).children().val(); // val()에 아무것도 안넣으면 get 해서 가져온다
				//val('안녕') val()에 무엇을 넣으면 set해서 넣어주는 느낌
				console.log($(this).children().val()); // http://localhost:8787/billage/detail.re?reviewNo=16
			})
		})
	</script>



	<script>
		$(function(){
			//$('.stock-status p').text();
			//console.log($('.stock-status p').text());
			
		})
	
	
	</script>

    <jsp:include page="../../common/footer.jsp"/>
    
</body>
</html>