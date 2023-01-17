<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개별 클럽 활동 보기</title>

<style>
	#all-clubOpen-admin{ width:1200px; margin:auto; }
	#admin-area th,td{text-align : center;}



</style>

</head>
<body>

		
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../user/myPageBar.jsp" />
	
	<div id="all-clubOpen-admin">
		<h1>${ loginUser.nickname }님의 모임 관리 페이지입니다. </h1>
		<%-- 모임에 대한 값이 있으면 list 없으면 참여중인 모임이 없습니다. core로 조건문 걸어서 생성하기   --%>
		 <h1>개설 된 클럽 리스트 조회 화면</h1>
		
		<button onclick="location.href='general.cl'">뒤로가기</button>
		<button onclick="clubEnroll.cl">클럽 등록 폼 버튼</button> 
		
		<br><br>
		
		<table id="admin-area" border="1">
			<thead>
				<tr>
					<th>순번</th>
					<th>클럽 이름</th>
					<th>개설한 활동명</th>
					<th>활동 위치</th>
					<th>활동일</th>
					<th>활동시간</th>
					<th>활동 회원 수(제한)</th>
					<th>총 활동 멤버 수</th>
					<th>활동상태 </th>
					<th>할동삭제</th>
				</tr>
				<!--  활동관리 : 활동을 'D'로 두면 삭제  'N'이면 활동 종료 'Y'활동중-->
			</thead>
								<!--눌리면 해당모임 상세페이지로 넘어가기-->
			<tbody id="clubOpen-list-area">
				<c:choose>
					<c:when test="${ !empty clubOpenList }" >
						
						<c:forEach items="${ clubOpenList }" var="co" varStatus="status">
							<input type="hidden" name="clubNo" value="${ co.clubNo }" />
							<input type="hidden" name="userNo" value="${ co.userNo }" />
							<input type="hidden" name="openNo" value="${ co.openNo }" />
							<tr>
								<td>${ status.index + 1 }</td>
								<td><a>${ co.clubName }</a></td>
								<td>${ co.openTitle }</td>
								<td>${ co.openLocation }</td>
								<td>${ co.openDate }</td>
								<td>${ co.openTime }</td>
								<td>${ co.openLimit }</td>
								<td>${ co.openMemCount }</td>
								<c:if test="${ openStatus eq 'Y' }">
									<td>활동중</td>
								</c:if>
								<c:if test="${ openStatus eq 'D' }">
									<td>활동종료</td>
								</c:if>
								<td>
									<button></button> |
									<button >회원보기</button> |
									<button ><button> |
									<button></button> |  
									<button>clubOpen 삭제</button> 
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<th colspan="10">
								<p> 📢 개설한 활동이 없습니다. </p>	
							</th>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	

	<script>
		
	

	</script>
	
	
	
	<jsp:include page="../common/footer.jsp" />	


</body>
</html>