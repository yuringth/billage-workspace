<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕여긴 마이페이지</title>
</head>

<body>
	<jsp:include page="../common/header.jsp"/>

	<div id="myPage-area">
		<div id="menubar">
			<ul class="menubar-area">
				<li class="menu"><a>개인정보수정</a></li>
				<%-- 개인정보수정에 회원탈퇴 넣기 --%>
				<li class="menu"><a>내 포인트 보기</a></li>
				<li class="menu"><a>팔로우관련</a></li>
				<li class="menu"><a>쪽지함보기</a></li>
				<li class="menu"><a>모임관련</a></li>
				<li class="menu"><a>내 리뷰목록보기</a></li>
				<li class="menu"><a>모임 관련</a></li>
				<li class="menu"><a>경매, 추첨 관련</a></li>
				<li class="menu"><a>책 대여 목록보기</a></li>
				<li class="menu"><a>중고 거래 목록보기</a></li>
			</ul>
		
		
		
		</div>
		<div>
		
		
		
		</div>
	
	
	</div>
	
	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>