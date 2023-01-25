<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    #book_title, #book_author, #book_date, #book_publisher{
    	border: 1px solid black;
    	height:50px;
    	margin:0px;
    }
    
    
    .content-area3{
    	border:1px solid black;
    	width:75px;
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
    
    
    	
    
    
    
    <!-- 이건 뭐지? 삭제해도되는데 일단 냅둠========================================================================== -->
    
    	
		<div class="text-div">
			<button onclick="search(1);">1페이지 이동</button>
    		<input type="text" id="title" placeholder="책이름을 작성해주세요">
    		<button onclick="search(2);">이동</button>
    		
		</div>


		<div class="text-div">
			<p>"검색이름"로 1개의 검색 결과가 있습니다.</p>
		</div>
		
		<hr>
				
        <!-- 책상품 하나의div  -->
        <div class="book-outer">
        	
        	<!--  ajax해서 가져온 책 정보를 뿌려줌  -->
        	
        </div>
		<hr>

    </div>

	
	<script>
	 function search(){
		 $.ajax({
			url:'search.bk',
			data:{ // 요청시 전달 값
				title : $('#title').val()
			},
			
			success : function(result){
				
				const item = result.item[0];
				
				let value ='';
					
				let thumb = item.cover;
				
				value += '<div class="content-area1">'
					  + '<p>' + 1 + '</p>'
					  + '</div>'
					  + '<div class="content-area2">'
					  + '<div class="content-detail1">'
					  + '<div><img src="' + thumb + '"></div>'
					  + '</div>'
					  + '<div class="content-detail2">'
					  + '<p id="book_title" name="bookTitle">' + item.title + '</p>'
					  + '<p id="book_author" name="bookAuthor">' + item.author + '</p>'
					  + '<p id="book_date" name="bookDate">' + item.pubDate + '</p>'
					  + '<p id="book_publisher" name="bookPublisher">' + item.publisher + '</p>'
					  + '</div>'
					  + '</div>'
					  + '<div  class="content-area3">'
					  + '<button onclick="copy();">선택</button>'
					  + '</div>';
					  
						  
				$('.book-outer').html(value);
				$('#title').val(title);
				
				$("#title").val('');
				
			},
			
			error: function(){
				console.log('실패');
			}
		 })
	 }
	</script>
	
	
	<script>
		function copy(){
			
			
		}
	
	</script>



    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>