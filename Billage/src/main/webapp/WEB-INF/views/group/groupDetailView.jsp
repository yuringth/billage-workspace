<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 나는 모임 디테일뷰야</title>

<style>
	body{ padding-bottom:160px; box-sizing:border-box;}
	#all-detail h1, h3 { display:inline-block;}
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
	
	
	#new-group{
		position:absolute;
		border: 2px solid black;
		border-radius: 50px;
		margin-left: -50px;
		line-height: 35px;
		width:40px;
		display:none;
		z-index:900;
	}
	
	#group-title-area{ margin:auto; width: 1000px; height:100px; }
	#group-detail-area{ width:1200px; height:600px;}
	#detail-left, #detail-right{ width:600px; display:block; float:left;}
	
	#group-info-area{ display:block; width:1200px; height:500px;}
	
	#group-reply-area{ display:bolck; width:1200px; height:300px;}
</style>

</head>
<body>

    <jsp:include page="../common/header.jsp" />
    
    <div id="all-detail">
    	<div id="group-title-area">
			<span id="new-group" value="${ group.newCount }">new</span>
			<h1>${ group.groupTitle }</h1>
    	</div>
    	<div id="group-detail-area">
    		<div id="detail-left">
    			<img width="500px" height="500px" src="${ group.groupImg }">
    			<p>${ group.likeCount }명이 찜했어요!</p>
    		</div>
    		<div id="detail-right">
    			<p>(${ group.groupDay }) 독서 모임 </p>
    			<div id="participant-area">참여자
    			</div>
    		</div>
    	</div>
    	<div id="group-info-area">
    		<h3>모임소개 : </h3>
    		<div id="info-top">
    			<pre>${ group.groupDescribe }</pre>
    		</div>
    		<div id="info-bottom">
    		
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
    
    
    <script>
    	
    	participant();
    	
    	function participant(){
    		$.ajax({
    			url : "",
    			data : {},
    			success : function(){
    				
    			},
    			error : function(){
    				
    			}
    			
    		})
    	}
    
    
    
    	//new 상태 표시 ----------------------------------------------------------
    	$(function(){
			$('#new-group').each(function(){
				if($(this).attr('value') == 1){
					$(this).show();
				}					
			});    
    	});
    	
    	
    
    
    </script>
    

    <jsp:include page="../common/footer.jsp" />
</body>
</html>