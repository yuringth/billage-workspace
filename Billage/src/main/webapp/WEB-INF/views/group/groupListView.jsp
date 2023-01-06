<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>여기는 모임 리스트 </title>
<style>

	#outer-area{
		width : 1200px;
		margin: auto;
		background-color: rgba(136, 180, 164, 0.435);
	}
	
	.list-area{
		/*text-align: center;*/
		border: 1px solid gray;
		display:block;
	}
	
	.thumbnail {
		width:320px;
		height:450px;

	}
	
	.thumbnail > img {
		width: 300px;
		height: 300px;
		padding: 10px;
	}

	.thumbnail{
		border: 1px solid rgb(243, 231, 231);
		width: 350px;
		display: inline-block;
		margin: 15px;
		background-color: rgba(211, 201, 180, 0.83);
	}

	.thumbnail:hover{
		cursor: pointer;
		opacity: 0.7;
	}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	
	<div id="outer-area">
		<div>
			<a>최신순</a>
			<a>인기순</a>
		</div>
		
		<div align="center">
			<form action="" method="">
				<select name="search">
					<option name="search">모임명</option>			
					<option name="search">요일</option>			
					<option name="search">??</option>			
				</select>
				<input id="" type="text" name=""/>		
				<button name="" >검색</button>
			</form>
			
		</div>
	
	
	
		<div class="list-area">
			<div class="thumbnail" align="center">
				<img src="#" alt="">
				<p>
					No. dd<br>
					조회수 dd <br>
				</p>              
			</div>
		
		
		<script>
			$(function(){
				$('.list-area > .thumbnail').click(function(){
					location.href = "detail.gr";
					//글번호 들고 가야 돼
				})
				
			})
		
		</script>
		<!-- ㅇㅕ기서부터 더미데이터  -->
			<div class="thumbnail" align="center">
				<img src="#" alt="">
				<p>
					No. dd<br>
					조회수 dd <br>
				</p>              
			</div>
	
			<div class="thumbnail" align="center">
				<img src="#" alt="">
				<p>
					No. dd<br>
					조회수 dd <br>
	
				</p>              
			</div>
			
			<div class="thumbnail" align="center">
				<img src="#" alt="">
				<p>
					No. dd<br>
					조회수 dd <br>
	
				</p>              
			</div>
	
						
			<div class="thumbnail" align="center">
				<img src="#" alt="">
				<p>
					No. dd<br>
					조회수 dd <br>
	
				</p>              
			</div>				
			
			<div class="thumbnail" align="center">
				<img src="#" alt="">
				<p>
					No. dd<br>
					조회수 dd <br>
	
				</p>              
			</div>				
			
			<div class="thumbnail" align="center">
				<img src="#" alt="">
				<p>
					No. dd<br>
					조회수 dd <br>
	
				</p>              
			</div>				
			
			<div class="thumbnail" align="center">
				<img src="#" alt="">
				<p>
					No. dd<br>
					조회수 dd <br>
	
				</p>              
			</div>		
			<div class="thumbnail" align="center">
				<img src="#" alt="">
				<p>
					No. dd<br>
					조회수 dd <br>
	
				</p>              
			</div>
			<!-- 더미 데이터 끝 -->
		</div> <!-- list-area끝  -->
	</div> <!-- outer-area 끝 -->
		
	<jsp:include page="../common/footer.jsp" />
</body>
</html>