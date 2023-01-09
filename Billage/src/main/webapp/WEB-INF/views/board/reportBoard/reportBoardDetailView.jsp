<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
				width:1200px;
				margin:auto;
			}
			
	#boardUpdateBtn>button{
		border : 0; 
		outline : 0; 
		background-color:transparent;
	}		
	#boardDeleteBtn>button{
		border : 0; 
		outline : 0; 
		background-color:transparent; 
		color:red;
	}
	#replyBtn{
		border : 1px solid black; 
		outline : 0; 
		background-color:transparent; 
	}		
</style>	
</head>
<body>

<jsp:include page="../../common/header.jsp"/>

<div class="outer">
			<div id="boardDetailTitle" style="display:flex; flex-direction: row; justify-content: space-between;">
			<div><h2>자유게시판</h2></div>
			<div><button>자유게시판 목록</button></div>
			</div>
			<br>
			
			<div id="boardTitle"><h3>${r.reportTitle}</h3></div>
			<div id="nickName">${r.nickName }</div>
			<div id="boardAct" style="display:flex; flex-direction: row; justify-content: flex-start; ">
				<div id="boardDate">${r.reportDate}&nbsp;</div>
				<div id="boardUpdateBtn" style="margin-right:10px;"><button>수정</button></div>
				<div id="boardDeleteBtn"><button>X</button></div>
			</div>
			<br>
			
			<hr>
			<div id="boardContent">
				<pre>${r.reportContent}</pre>
			</div>
			<br>
			
			<hr>
			<br>
			
		
		
		</div>
		
		<jsp:include page="../../common/footer.jsp"/>
		

</body>
</html>