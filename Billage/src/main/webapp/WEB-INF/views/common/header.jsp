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
<title>Insert title here</title>
<style>
	#outer{
		width:1200px;
		height:300px;
		margin:auto;
	}
	
	#outer > .header{
		float:left;
		height:200px;
		
	}
	
	#logo-area{
		width:400px;
	}
	
	#search-area{
		width:400px;
	}
	
	#login-area{
		width:400px;
	}
	
	#nav-bar{
		width: 1200px;
		height:100px;
		margin:auto;
	}
	
	#nav-bar ul{
		list-style:none;
		display:block;
		
	}
	
	#nav-bar ul > li {
		float:left;
		margin-left: 30px;
	}
	
	#nav-bar ul > li > a {
		text-decoration:none;
		color : black;
		font-size:25px;
		
	}
</style>

</head>
<body>
	
	<div id="outer">
		<div class="header" id="logo-area">
			<a><img>로고넣자</a>
		</div>
	
        <div class="header" id="search-area">
	        <input type="text" />
	        <input type="button" value="검색"/>        
        </div>
	
        <div class="header" id="login-area">
           <div>
           		<a href="userEnrollForm.me">회원가입</a>
           		<a href="#">로그인하기</a>
           </div>
        </div>
        
        
	    <div id="nav-bar">
	         <ul>
	             <li><a href="list.gr">모임</a></li>
	             <li><a href="#">연재</a></li>
	             <li><a href="#">대여</a></li>
	             <li><a href="list.re">리뷰</a></li>
	             <li><a href="list.dr">추첨</a></li>
	             <li><a href="list.ac">경매</a></li>
	             <li><a href="#">중고</a></li>
	             <li><a href="#">마을</a></li>
	             <li><a href="#">임시관리자</a></li>
	         </ul>
	    </div>
        
        
	</div>
        

        


    
</body>
</html>