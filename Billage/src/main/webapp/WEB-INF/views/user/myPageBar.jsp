<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메뉴바 만들고 싶다 정말 </title>
<style>
	div{ box-sizing : border-box;}
	
	#all-mypage{
		width:100%;
		position:fixed;
		top:288px;
		left:0;
		right:0;
	}
	
	#mypage-bar-area{
		width:400px;
		height:560px;
		background-color: white;
		border-right: 2px solid black;
	}
	
	.menubar-area > .menu { 
		font-size:27px; 
		height:50px; 
		border-bottom:1px solid gray;
		text-align:center;	
		line-height:50px;
		color:darkgray;
	}
	.menu:hover {
		font-weight:900;
	}
	

</style>
</head>
<body>
	<div id="all-mypage">
		<div id="mypage-bar-area">
			<ul class="menubar-area">
				<li class="menu"><a href="mypage.me">- MY PAGE🌿  -</a></li>
				<%-- 개인정보수정에 회원탈퇴 넣기 --%>
				<li class="menu"><a>개인정보수정</a></li>
				<li class="menu"><a>내 포인트 보기</a></li>
				<li class="menu"><a>팔로우관련</a></li>
				<li class="menu"><a href="list.ms">쪽지함보기</a></li>
				<li class="menu"><a>모임관련</a></li>
				<li class="menu"><a>내 리뷰목록보기</a></li>
				<li class="menu"><a href="">모임 관련</a></li>
				<li class="menu"><a>경매, 추첨 관련</a></li>
				<li class="menu"><a>책 대여 목록보기</a></li>
				<li class="menu"><a>중고 거래 목록보기</a></li>
			</ul>
		</div>	
	</div>

</body>
</html>