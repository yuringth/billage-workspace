<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세페이지</title>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
		
		<div class="outer">
			<div id="boardDetailTitle">
			<div><h2>자유게시판</h2></div>
			<div><button>자유게시판 목록</button></div>
			</div>
			<br>
			
			<div id="boardTitle"><h3>자유게시판 제목모곰곰고</h3></div>
			<div id="nickName">유저닉네임</div>
			<div id="boardAct">
				<div id="boardDate">2022-01-08</div>
				<div id="boarCount">조회수 30</div>
				<div class="replyCount">댓글수 3</div>
				<div id="boardUpdateBtn"><button>수정</button></div>
				<div id="boardDelteBtn"><button>X</button></div>
			</div>
			<br><br>
			
			<hr>
			
		
		
		
		
		</div>
		
		
		
		
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>