<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 글 작성 폼</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style>
.outer{
	width:1200px;
	margin: auto;
}

.api{
	display:flex;
}

.api-content{
	width:200px;
	height:200px;
}

.api-content2{
	width:400px;
	height:200px;
}




/* sytle:float; 알아서 글이 오른쪽으로 넘어간다 */
</style>

</head>
<body>
 리뷰게시판 폼
 
 	<!-- 메뉴바 -->
	<jsp:include page="../../common/header.jsp" />
    
 	
 	<div class="outer">

		<h1>리뷰작성</h1>

		<hr>

		<div class="api">
			<div class="api-content">
				<div id="image">사진</div>
			</div>
			<div class="api-content2">
				<div id="content">책내용</div>
				<div id="title">제목</div>
				<div id="wirter">저자</div>
				<div id="publisher">츨판사</div>
				<div id="date">발행일자</div>
			</div>
		</div>

		<hr>

		<div>별점 : ☆☆☆★ </div>

		<br>

		<form action="#">
			<textarea id="content" rows="30" cols="100" style="resize:none" maxlength="1000">여기에 글 작성하기</textarea>
			<br>
			<hr>
			<spank id="count">0</spank> / 1000
		</form>


		<!-- 글입력 갯수 세기 -->
		<script>
        $(function(){
            $('#content').keyup(function(){
                $('#count').text($(this).val().length);
                
            });
        });
    	</script>


		<hr>
		<p>
			포인트 지급 안내 <br>
			리뷰 작성 시 : 10point 지급
		</p>

		<div>
			<a href="">글작성</a>
			<a href="">목록으로</a>
		</div>


 	</div>   
 
 
 
 
 
 	<!-- 푸터바 -->
	<jsp:include page="../../common/footer.jsp" />
 
 
 
 
 
</body>
</html>