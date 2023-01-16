<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#all-clubMem-admin{ width:1000px; margin:auto; }
	#club-member-area th,td{text-align : center;}


</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../user/myPageBar.jsp" />
	
	<div id="all-clubMem-admin">
		<h1> 모임 회원 관리 페이지 입니당 </h1>

		<br><br><br>
		<button onclick="location.href='admin.cl'">뒤로가기</button>
		<br><br><br>
		<a>전체선택 </a> |
		<a>쪽지보내기</a> |
		<a>강퇴하기</a>
		<br><br><br>

		<table id="#club-member-area" border="1">
			<thead>
				<tr>
					<th>선택</th>

					<th>회원 ID</th>

					<th>회원 NICK</th>

					<th>가입일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ memberList }" var="m">
					<tr>
						<input type="hidden" name="userNo" value="${m.userNo}"/>
						<td> <input type="checkbox" /> </td>
						<!-- userId 담아놓았음  -->
						<td> ${ m.clubDiscript }</td>
						<td> ${ m.nickname } </td>
						<td> ${ m.enrollDate } </td>
					</tr>
				</c:forEach>
			</tbody>
	
		</table>
		
	
	
	</div>
	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>