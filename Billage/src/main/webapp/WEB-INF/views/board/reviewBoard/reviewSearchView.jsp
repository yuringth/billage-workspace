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
    }
    
    
    
    .longdiv {
        width : 800px;
    }
    .shortdiv {
        width : 400px;
    }
    .inputdiv{
        width : 310px;
    }
    .textdiv{
        width : 80px;
    }
    .align-side{
        display: flex;
        justify-content: space-evenly;
    }    
    .align-left{
        display: flex;
    }
    .titlediv {
        width : 710px;
    }
    .btntitle {
        margin-top: 8px;
        margin-bottom: 8px;
        margin-left: 0px;
    }
    .btnleft {
        width : 384px;
        margin-right : 10px;
        margin-top : 8px;
    }
    .btnright {
        width : 384px;
        margin-left : 10px;
        margin-top : 8px;
    }
    .textdiv>p{
        font-size: 13px;
        padding-top: 10px;
    }
</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>
ssppdspdsjgi
	<jsp:include page="../../common/header.jsp"/>

    <div class="outer">
		<div class="text-div">
			<p>"검색이름"로 125개의 검색 결과가 있습니다.</p>
		</div>
		<hr>
		
		<div class="content-area">
			<div>
				<div>1</div>
			</div>
			
			<div>
				<div>사진</div>
				<div>도서제목</div>
				<div>작가</div>
				<div>출판날자</div>
			</div>
			
			<div>
				<button>선택</button>
			</div>	
			
		</div>
		
		
		
		
		
        <form action="insert.ac">

            <div class="longdiv align-left">
                <div class="textdiv">
                    <p>제목:</p>
                </div>
                <div class="titlediv">
                    <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title" required>
                </div>
            </div>


            <div class="longdiv align-left">
                <div class="shortdiv align-left">
                    <div class="textdiv">
                        <p>작가:</p>
                    </div>
                    <div class="inputdiv">
                        <input type="text" class="form-control" id="bookWriter" placeholder="작가 명" name="bookWriter">
                    </div>
                </div>
                <div class="shortdiv align-left">
                    <div class="textdiv">
                        <p>장르:</p>
                    </div>
                    <div class="inputdiv">
                        <input type="text" class="form-control" id="genre" placeholder="장르" name="genre">
                    </div>
                </div>
            </div>

            <div class="longdiv align-left">
                <div class="shortdiv align-left">
                    <div class="textdiv">
                        <p>마감일:</p>
                    </div>
                    <div class="inputdiv">
                        <input type="date" class="form-control" id="closeDate" placeholder="날짜 입력" name="closeDate">
                    </div>
                </div>
                <div class="shortdiv align-left">
                    <div class="textdiv">
                        <p>응모포인트:</p>
                    </div>
                    <div class="inputdiv">
                        <input type="number" class="form-control" id="tryPoint" value="50P" name="tryPoint">
                    </div>
                </div>
            </div>


            <div style="width : 790px;">
                <textarea class="form-control" rows="15" id="content" style="resize: none;" name="content" placeholder="내용을 입력하세요"></textarea>
            </div>

            <div class="longdiv align-left">
                <button class="btnleft btn btn-dark">
                    <p class="btntitle">등록</p>
                </button>
                <button class="btnright btn btn-secondary">
                    <p class="btntitle ">취소</p>
                </button>
            </div>
        </form> 
    </div>

    </div>

    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>