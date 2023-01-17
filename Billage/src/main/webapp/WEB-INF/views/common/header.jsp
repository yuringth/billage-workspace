<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Insert title here</title>
	
	
	<!-- JavaScript -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	
	<style>
		div{ box-sizing: border-box; }
		a { text-decoration: none; color: black; }
		ul { list-style:none; margin:0px; } 
		body{ padding-top:10px;}
		
		#all-header{ 
			width:100%;
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
		
		#header-outer > #outer-bottom{ height: 100px;}

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
/*------------------------------------------------------------------------------------------------*/
		#modal-login-area{
			position: fixed;
	        width: 500px;
	        height:500px;
	        background-color: rgb(253, 219, 219);
	        border-radius: 20px;
	        transform: translate(-50%, -50%);
	        left: 50%;
	        top: 50%;
	        z-index: 1005;
	        text-align: center;
	        display: none;
		}
		
		#modal-login-area .close{
			font-size: 25px;
	        background-color:rgba(95, 152, 124, 0);
	        border: 1px solid rgba(245, 245, 220, 0);
	        cursor: pointer;
	        color:rgb(0, 0, 0);
	        padding-left: 455px;
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
	<!-- alert 메시지 -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert('안녕?', '${alertMsg}', function(){ alertify.success('확인'); });
		</script>
		<c:remove var="alertMsg" />
	</c:if>

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
					<c:choose>
						<c:when test="${ empty loginUser }">
							<div>
								<a href="userEnrollForm.me">회원가입</a>
								<a id="login-btn" >로그인하기</a>
							</div>
						</c:when>
						<c:when test="${ loginUser.userId eq 'test01' }">
							<div>
								${ loginUser.nickname } 님 환영합니다!! <br> 
								<a href="userList.ad">이장실</a>
								<a href="logout.me">로그아웃</a>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								${ loginUser.nickname } 님 환영합니다!! <br> 
								<a href="mypage.me">마이페이지</a>
								<a href="logout.me">로그아웃</a>
							</div>
						</c:otherwise>
					</c:choose>
	
				</div>
			</div> <!-- outer-top끝  -->
			
			<div id="outer-bottom"> 
				<ul>
					<li><a href="list.cl">모임</a></li>
					<li><a href="list.nv">연재</a></li>
					<li><a href="list.rt">대여</a></li>
					<li><a href="list.re">리뷰</a></li>
					<li><a href="list.dr">추첨</a></li>
					<li><a href="list.ac">경매</a></li>
					<li><a href="list.ud">중고</a></li><!-- 컨트롤러매핑값 -->
					<li><a href="#">마을</a></li>
					<li><a href="center.cs">주민센터</a></li>
				</ul>
			</div> <!-- outer-bottom 끝 -->
		</div> <!-- header-outer 끝 -->
	</div> <!-- all-header끝 -->
    <!-- --------------------------------------- -->
    
		<div id="modal-login-area">
			<div id="login-screen">
			 <button type="button" class="close">&times;</button>
				<h1>로그인</h1>
			    
				<form action="login.me" method="post">
					<div class="control-group">
						<input type="text" class="login-field" placeholder="아이디를 입력하세요." id="login-name" name="userId">
					</div>
					
					<div class="control-group">
						<input type="password" class="login-field" placeholder="비밀번호를 입력하세요." id="login-pass" name="userPwd"/>
					
						<button type="submit" class="">로그인하기</button>
						<button type="button" class="login-link" id="goEmailForm">비밀번호찾기</button>
					</div>
				</form>
			</div>
		
	</div> <!-- all-header끝 -->

	<script>
		$(function(){
			// 로그인 모달창 띄우고 지우는 이벤트 
	        $('#login-btn').click(function(){
	        	$('#modal-login-area').fadeIn();
	        });
	        
			$('.close').click(function(){
				$('#modal-login-area').fadeOut();
			});
			
			$('#goEmailForm').click(function(){
				location.href='writeEmailForm.me';
			});
		
		});
	
	</script>


</body>

</html>