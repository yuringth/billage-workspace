<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록입니다.</title>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
		
		<div class="outer">
			<div id="freeboard">
				<div><h1>자유게시판</h1></div>
				<div><button>글쓰기</button></div>
			</div>
			<div id="boardHeader">
				<div>게시글 번호</div>
				<div>말머리</div>
				<div>제목</div>
				<div>날짜</div>
				<div>닉네임</div>
			</div>
			<div class="boardList">
				<div id="boardNo">20</div>
				<div id="boardCategory">자유</div>
				<div id="boardTitle">제목</div>
				<div id="boardDate">22-01-06</div>
				<div id="nickName">사용자</div>
			</div>
		</div>
		
		
		
			
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>