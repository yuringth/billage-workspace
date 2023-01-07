<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 나는 모임 디테일뷰야</title>

<style>
	body{ padding-bottom:160px;}
	#all-detail{ margin:auto; width:1200px;}
	#group-btn-area { width:100%;  height: 160px; position:fixed; bottom:0; left:0; right:0; background-color: gray;}
	#btn-zone{ width:1200px; height:200px; margin:auto; text-align: center;}
	#btn-zone button{ 
		display:inline-block; 
		margin:auto; 
		width:430px; 
		height:120px;
		font-size:60px;
		background-color: white;
		border-style:none;
		vertical-align:middle;
		margin-top:20px;
		margin-left:30px;
		margin-right:30px;
	}
	#btn-zone button:hover{ cursor:pointer; font-weight:900;}
</style>

</head>
<body>

    <jsp:include page="../common/header.jsp" />
    
    <div id="all-detail">
    	<div id="group-title-area">
			<p>태그</p>
			<h1>여긴 모임명 자리</h1>
    	</div>
    	<div id="group-detail-area">
    		<div id="detail-left">
    			<img src="">사진
    			<span>0명이 찜했어요!</span>
    		</div>
    		<div id="detail-right">
    			여기엔 내용
    		</div>
    	</div>
    	<div id="group-info-area">
    		<h3>모임소개 : </h3>
    		<div>
    			<pre>여긴 모임 소개가 들어갈 공간입니다.</pre>
    		</div>
    		<div style="height:400px;">
    		</div>
    	</div>
		
		
		<div id="group-reply-area">
			<div>댓글존</div>
		</div>
		
		
		<div id="group-btn-area">
			<div id="btn-zone">
				<button>찜하기</button>
				<button>신청하기</button>
			</div>
		</div>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>