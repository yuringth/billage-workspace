<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메뉴바 </title>
<style>
	div{ box-sizing : border-box;}
	
	#all-mypage{
		width:200px;
		position:fixed;
		top:288px;
		left:0;
		right:0;
	}
	
	#mypage-bar-area{
		width:200px;
		height:560px;
		background-color: white;
		border-right: 2px solid black;
	}
	
	.menubar-area > .menu { 
		font-size:18px; 
		height:50px; 
		border-bottom:1px solid gray;
		text-align:center;	
		line-height:50px;
	}
	
	.menu > a {
		text-decoration: none;
		color:black;
		
	}
	
	.menu:hover {
		text-color: darkgray;
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
				<li class="menu"><a href="myInfo.me">개인정보수정</a></li>
				<li class="menu"><a href="">내 포인트 보기</a></li>
				<li class="menu"><a href="selectLoginUser.fo">팔로우관련</a></li>
				<li class="menu"><a href="list.ms">쪽지함보기</a></li>
				<li class="menu"><a href="">연재/구독목록</a></li>
				<li class="menu"><a href="">내 리뷰목록보기</a></li>
				<li class="menu"><a href="general.cl">모임 관련</a></li>
				<li class="menu"><a href="">경매, 추첨 관련</a></li>
				<li class="menu"><a href="rentMypageList.rt">책 대여 목록보기</a></li>
				<li class="menu"><a href="">중고 거래 목록보기</a></li>
			</ul>
		</div>	
	</div>

</body>
</html>