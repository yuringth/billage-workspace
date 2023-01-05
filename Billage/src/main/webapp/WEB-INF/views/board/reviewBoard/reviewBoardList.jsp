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
        border:1px solid red;
        width:1200px;

    }
    
    .reviewOption{
        border:1px solid red;
    	width:1200px;
    	height:30px;
    }
    
    .one-content{
   		border:1px solid red;
    	width:450px;
    	height:400px;
    }

    .wirter{
        border:1px solid red;
		width:450px;
		height:100px;
        display:flex;
    }

    .star{
        border:1px solid red;
		width:100px;
		height:100px;

    }

    .image{
        border:1px solid red;
		width:100px;
		height:100px;
    }
    .title{
        border:1px solid red;
		width:100px;
		height:100px;
    }
    .content{
        border:1px solid red;
		width:100px;
		height:100px;
    }



* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
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
     
        <!-- 리뷰 하나를 감싸는 div -->
        <div class="one-content">
            <div class="wirter">
                <div>작성자                                   </div>                                              
                <div class="card-footer">
                    별점 : <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                </div>
            </div>

            <div class="image">사진</div>
            <div class="title">책 제목</div>
            <div class="content">책 내용</div>

            <div><button>♡</button>찜갯수(5) 댓글(3) 리뷰등록수(3)</div>

        </div>


        <!-- 리뷰를 감싸는 div -->
        <div>
            <div class="card h-100">
                <a href="#"><img class="card-img-top" src="https://image.yes24.com/goods/24259565/XL" alt=""></a>
              
                <div class="one-content">
                    <h4 class="one-image">
                        <a href="#"><img src=""></a>
                    </h4>
                    <h5>작성자</h5>
                    <p class="card-text">여긴 책 내용을 넣읍시다!!!!!!!!!!!</p>
                </div>
                
                <div class="card-footer">
                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                </div>
            </div>

            <div>
                <div><button>♡</button>찜갯수(5) 댓글(3) 리뷰등록수(3)</div>
            </div>


        </div>

        

                    
    <!-- 페이지처리하는 영역-->
    <div id="market_page" class="">
        <ul class="pagination">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>    
    </div>    

  

	<!-- 푸터바 -->
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>