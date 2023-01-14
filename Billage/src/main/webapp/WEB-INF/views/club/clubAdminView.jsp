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
		<h1>${ loginUser.nickname }님의 모임 관리 페이지입니다. </h1>
		<%-- 모임에 대한 값이 있으면 list 없으면 참여중인 모임이 없습니다. core로 조건문 걸어서 생성하기   --%>
		
		<button onclick="location.href='enrollForm.cl';">모임 개설하기</button> <!-- 클릭시 모임 개설 페이지 이동  -->
		<br><br>
		
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
				<c:choose>
					<c:when test="${ !empty clubList }" >
						<tr>
							<td>1</td>
							<!--눌리면 해당모임 상세페이지로 넘어가기-->
							<td><a href="">풀벌레소리</a></td>
							<td>수</td>
							<td>모임장</td>
							<td><button>관리</button></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th colspan="4">
								<p> 📢 개설한 모임이 없습니다. </p>	
							</th>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>