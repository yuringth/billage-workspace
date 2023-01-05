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

	.image-area{
		border:1px solid red;
		width:100px;
		height:100px;
	}
	
	.text-area{
	 	border:1px solid red;
		width:100px;
		height:50px;
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
	
  <div class="container">

        <div class="row">

            <div class="col-lg-3">

            <div class="list-group">
                <a href="#" class="list-group-item">모두</a>
                <a href="#" class="list-group-item">농산물</a>
                <a href="#" class="list-group-item">수산물</a>
                <a href="#" class="list-group-item">축산물</a>
            </div>

            </div>
            <!-- /.col-lg-3 -->

            <div class="col-lg-9">
                
                <button>글쓰기</button>

                <select name="" id="">
                    <option value="">최신순</option>
                    <option value="">인기순</option>
                    <option value="">높은가격순</option>
                    <option value="">낮은가격순</option>
                </select>

                <div class="row">

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h4 class="card-title">
                            <a href="#"><img src=""></a>
                        </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                        </div>
                        <div class="card-footer">
                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h4 class="card-title">
                            <a href="#">Item Two</a>
                        </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
                        </div>
                        <div class="card-footer">
                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h4 class="card-title">
                            <a href="#">Item Three</a>
                        </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                        </div>
                        <div class="card-footer">
                        <small class="text-muted"></small>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h4 class="card-title">
                            <a href="#">Item Four</a>
                        </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                        </div>
                        <div class="card-footer">
                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h4 class="card-title">
                            <a href="#">Item Five</a>
                        </h4>
                        <h5>$24.99</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
                        </div>
                        <div class="card-footer">
                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                        <h5 class="card-title">
                            <a href="#">금산 딸기 1Kg</a><img src="">
                        </h5>
                        <h5>29,900원</h5>
                        </div>
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

                </div>
                <!-- /.row -->

            </div>
            <!-- /.col-lg-9 -->
            
        </div>
        <!-- /.row -->

        </div>
        <!-- /.container -->
	    
    
    
    
    
    <!-- 전체를 감싸는 div  -->
    <div class="reviewList-area">

		<!-- 옵션태그 -->
        <div id="reviewOption">
        	<select>
        		<option value="book" selected>책 제목순</option>
        		<option value="date">날짜 정렬 순</option>
        	</select>
        </div>


		<!-- 리뷰를 감싸는 div -->        
        <div class="one-content">
			
			<div class="image-area">
				<img src="https://image.yes24.com/goods/24259565/XL">
			</div>
			
			<div class="text-area">
				<p>여긴 책 정보가 들어있습니다.</p>
			</div>
			
			<div><button>♡</button>찜갯수(5) 댓글(3) 리뷰등록수(3)</div>
			
			        
        </div>



    </div>


	<!-- 푸터바 -->
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>