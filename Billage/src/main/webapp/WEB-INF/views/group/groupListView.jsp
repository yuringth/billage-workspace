<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>여기는 모임 리스트 </title>
<style>
	p { padding:0px; margin:0px; }
	
	#thum-text-area, #thum-like-area { text-align:left; }
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
	
	#thum-area{
		position:
	}

	#new-group{
		position: absolute;
		border: 2px solid black;
		border-radius: 50px;
		margin-top: 10px;
		margin-left: 10px;
		line-height: 35px;
		width:40px;
		display:none;
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
	
	
		<div id="list-area">
		<div id="thum-area" class="thumbnail" align="center">
			<div id="new-group" value="0">new</div>
			<img src="#" alt="">
			<h3>모임 이름</h3> 
			<div id="thum-text-area">
				<span>모일 진행일 독서모임</span></br>
				<span>성동구 | 모집인원 4/8</span></br>
			</div>
			<div id="thum-like-area">
				<span>찜하기<img src=""></span>
				<span>(명)</span>
			</div>
		</div>
	
		<!-- ㅇㅕ기서부터 더미데이터  -->
			<div id="thum-area" class="thumbnail" align="center">
				<div id="new-group" value="1">new</div>
				
				<img src="#" alt="">
				<h3>모임 이름</h3> 
				<div id="thum-text-area">
					<span>모일 진행일 독서모임</span></br>
					<span>성동구 | 모집인원 4/8</span></br>
				</div>
				<div id="thum-like-area">
					<span>찜하기<img src=""></span>
					<span>(명)</span>
				</div>
			</div>
	
		<!-- 더미 데이터 끝 -->
		</div> <!-- list-area끝  -->
	</div> <!-- outer-area 끝 -->
	
	
		<script>
			$(function(){
				/* 이거 구현할 때 모임생성날짜 계산해서 1이랑 0이랑 구분할 수 있게 값을 들고오고 싶은데 어떻게 하징? 
						DB에서 조건문 걸어서 가지고 와야 하나?
								어떠카지!!!!!!!!? ㅠㅠ */
				$('#list-area #new-group').each(function(){
					if($(this).attr('value') == 1){
						$(this).show();
					}					
				});
				
				
				$('#list-area > .thumbnail').click(function(){
					location.href = "detail.gr";
					//글번호 들고 가야 돼
				});
			});

		</script>
		
	<jsp:include page="../common/footer.jsp" />
</body>
</html>