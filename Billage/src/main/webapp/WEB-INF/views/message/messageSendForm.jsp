<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<style>
	.outer{
		width : 800px;
		margin : auto;
		margin-top : 20px;
	}
	.displayFlex{
		display: flex;
		margin-bottom : 8px;
	}
	p {
		margin : 0px;
		margin-bottom : 8px;
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	
	<div class="outer">
		<form action="">
			<div class="displayFlex">
				<div style="width : 90px; padding-top : 3px;">
					받는 사람 :
				</div>
				<input type="text" class="form-control" name="userNo2" style="width:100%;">
			</div>
			<div style="width : 800px;">
				 <textarea class="form-control" rows="15" cols="111" id="comment" style="resize : none;"></textarea>
			</div>
			<div style="display :flex;">
				<button type="button" class="btn btn-dark" style="margin : 10px; width :380px">전송</button>
				<button type="button" class="btn btn-secondary" style="margin : 10px; width :380px">취소</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>