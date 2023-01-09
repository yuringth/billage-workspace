<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
	<title>Insert title here</title>
	<style>
		div{ box-sizing: border-box; }
		a { text-decoration: none; color: black; }
		ul { list-style:none; margin:0px; } 
		body{ padding-top:280px;}
		
		#all-header{ 
			width:100%;
			position:fixed;
			top:0;
			left:0;
			right:0;
 			background: white;
			z-index:1000;
			border-bottom: 1px solid gray;
		} 
		
		#header-outer {
			width: 1200px;
			height: 230px;
			margin: auto;

		}
	
		#outer-top { margin-top: 20px; height: 120px; }
		
		#header-outer > #outer-top > .header {
			float: left;
			text-align: center;
			width:400px;
		}
		

		#header-outer > #outer-top > #logo-area {  }

		#header-outer > #outer-top > #search-area > input, button { 
			margin-top:30px; 
			font-size:20px;
			padding:0px;
			
		 }
		 
		#header-outer > #outer-top > #search-area > input { width:300px; height:30px; border-bottom : 1px solid black;}

		#header-outer > #outer-top #login-area {  }
		
		#header-outer > #outer-bottom{ height: 110px;}

		#header-outer > #outer-bottom{ width: 100%; display:block; }

		#outer-bottom > ul > li {
			float: left;
			text-align:center;
			width:120px;
			height:70px;
			margin-top:20px;
			border-radius: 20px;
		}

		#outer-bottom > ul>li>a {
			text-align: center;
			font-size: 25px;
		}
		
		#outer-bottom > ul>li>a:hover {
			cursor: pointer;
			font-size: 28px;
			font-weight: 900;
		}

		
		
	</style>

</head>

<body>

<%-- 로그인 성공시 / 로그인 실패 시 넣어야 함  

		<c:choose>
			<c:when test="${ empty loginUser }">
				<div>
					<a href="userEnrollForm.me">회원가입</a>
					<a href="#">로그인하기</a>
				</div>
			</c:when>
		 	<c:otherwise> 
				<div>
					${ loginUser.nickname } 님 환영합니다!! <br> 
					<a href="myPage.me">마이페이지</a>
				</div>			
			</c:otherwise>			
		</c:choose> 	


--%>

	<div id="all-header">
		<div id="header-outer">
			<div id="outer-top">
				<div class="header" id="logo-area">
					<a href="/billage"><img src="resources/images/logo.png" width="80%;" height="80%;"></a>
				</div>
	
				<div class="header" id="search-area">
					<input type="text" />
					<button type="submit" >검색</button>
				</div>
	
				<div class="header" id="login-area">
	
					<div>
						<a href="userEnrollForm.me">회원가입</a>
						<a href="loginUserForm.me">로그인하기</a>
					</div>
	
					<div>
						${ loginUser.nickname } 님 환영합니다!! <br> 
						<a href="mypage.me">마이페이지</a>
					</div>			
	
				</div>
			</div> <!-- outer-top끝  -->
			
			<div id="outer-bottom"> 
				<ul>
					<li><a href="list.gr">모임</a></li>
					<li><a href="list.nv">연재</a></li>
					<li><a href="#">대여</a></li>
					<li><a href="list.re">리뷰</a></li>
					<li><a href="list.dr">추첨</a></li>
					<li><a href="list.ac">경매</a></li>
					<li><a href="list.ud">중고</a></li>
					<li><a href="#">마을</a></li>
					<li><a href="admin.ad">임시<br>관리자</a></li>
				</ul>
			</div> <!-- outer-bottom 끝 -->
		</div> <!-- header-outer 끝 -->
	</div> <!-- all-header끝 -->

</body>

</html>