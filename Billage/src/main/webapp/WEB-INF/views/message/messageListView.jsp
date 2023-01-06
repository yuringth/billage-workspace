<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>쪽지함</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="outer">
		<ul class="nav justify-content-center table-bordered">
			<li class="nav-item">
				<a class="nav-link" href="#">받은 쪽지함</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">보낸 쪽지함</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">쪽지 보내기</a>
			</li>
		</ul>
		
		
		
		<div class="container">
			<table class="table table-hover table-bordered table-sm">
				<thead class="thead-light">
					<tr>
						<th width="150px">보낸 사람</th>
						<th width="850px">내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>유림쿤</td>
						<td>私は韓国が嫌いです。</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>