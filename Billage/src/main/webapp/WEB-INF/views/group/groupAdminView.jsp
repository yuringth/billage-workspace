<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 여긴 모임관리페이지</title>
<style>
	#all-group-admin{ width:1200px; margin:auto; }




</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../user/myPageBar.jsp" />
	
	<div id="all-group-admin">
		<h1>${ loginUser.nickname }의 모임 리스트입니다. </h1>
		<%-- 모임에 대한 값이 있으면 list 없으면 참여중인 모임이 없습니다. core로 조건문 걸어서 생성하기   --%>
		
		<button onclick="location.href='enrollForm.gr';">모임 개설하기</button> <!-- 클릭시 모임 개설 페이지 이동  -->
		
		<table border="1">
			<thead>
				<tr>
					<th>순번</th>
					<th>참여모임명</th>
					<th>진행요일</th>
					<th colspan="2">권한</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<!--눌리면 해당모임 상세페이지로 넘어가기-->
					<td><a href="">풀벌레소리</a></td>
					<td>수</td>
					<td>모임장</td>
					<td><button>관리</button></td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="">받다를 볼 수 있을까</a></td>
					<td>토</td>
					<td>회원</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		
	</div>
	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>