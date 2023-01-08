<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록입니다.</title>
<style>
	.outer{
			width:1200px;
			margin:auto;
		}
		
		#boardHeader>div{
			background-color:rgb(228, 227, 227);
		}
		
		#boardList>div{
			border: 3px solid black; 
			hover: rgb(228, 227, 227);
		}
		
		.boardTitle {
			width:500px;
			
		}
		
		.boardNo{
			width:100px;
		}
		
		.boardCategory{
			width:100px;
		}
		
		.boardDate{
			width:100px;
		}
		
		.nickName{
			width:100px;
		}
		
		div {
			text-align:center;
		}
	
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
		
		<div class="outer">
			<div id="freeboard" style="display:flex; flex-direction: row; justify-content: space-between;">
				<div><h1>자유게시판</h1></div>
				<div><button>글쓰기</button></div>
			</div>
			<div id="boardHeader" style="display:flex; flex-direction: row; justify-content: space-evenly;">
				<div class="boardNo">게시글 번호</div>
				<div class="boardCategory">말머리</div>
				<div class="boardTitle">제목</div>
				<div class="boardDate">날짜</div>
				<div class="nickName">닉네임</div>
			</div>
			<div class="boardList" style="display:flex; flex-direction: row; justify-content: space-evenly;">
				<div class="boardNo">20</div>
				<div class="boardCategory">자유</div>
				<div class="boardTitle">제목</div>
				<div class="boardDate">22-01-06</div>
				<div class="nickName">사용자</div>
			</div>
		</div>
		<br><br><br>
		

			
	<jsp:include page="../../common/footer.jsp"/>
	
	<script>
		$(function(){
			$('.boardList').click(function(){
				location.href='detail.bo';
			})
		})
	</script>
	
</body>
</html>