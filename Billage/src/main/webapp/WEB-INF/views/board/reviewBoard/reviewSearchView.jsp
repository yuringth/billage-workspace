<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 누르면 상품 검색 페이지가 뜬다</title>

<style>
    .outer{
        width : 800px;
        margin : auto;
    }
    
    
    .text-div{
    	text-align:center;
    }
    
    .content-area{
    	display:flex;
    	margin:auto;
    	height:100px;
    	width:700px;
    }
    
    
    .content-area1{
    	border:1px solid black;
    	width:50px;
    }

    .content-area2{
    	border:1px solid black;
    	width:550px;
    	display:flex;
    }
    
    .content-photo{
    	border:1px solid red;
    	width:100px;
    }
    
    .content-detail{
    	border:1px solid blue;
    	width:450px;
    }
    
    .content-area3{
    	border:1px solid black;
    	width:100px;
    }    
    
    
    
    
    
    
</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>

	<jsp:include page="../../common/header.jsp"/>

    <div class="outer">
		<div class="text-div">
			<p>"검색이름"로 125개의 검색 결과가 있습니다.</p>
		</div>
		<hr>
		
		<div class="content-area">
			
			<div class="content-area1">
				<p>1</p>
			</div>
			
			<div class="content-area2">
				<div class="content-photo">
					<div>사진</div>
				</div>
				
				<div class="content-detail">
					<div>도서제목</div>
					<div>작가</div>
					<div>출판날자</div>
				</div>
			</div>
			
			<div  class="content-area3">
				<button>선택</button>
			</div>	
			
		</div>


    </div>

    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>