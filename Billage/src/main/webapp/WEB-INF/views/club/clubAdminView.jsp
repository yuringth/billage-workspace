<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 여긴 모임관리페이지</title>
<style>
	#all-group-admin{ width:1200px; margin:auto; }
	#admin-area th,td{text-align : center;}



</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../user/myPageBar.jsp" />
	
	<div id="all-group-admin">
		<h1>${ loginUser.nickname }님의 모임 관리 페이지입니다. </h1>
		<%-- 모임에 대한 값이 있으면 list 없으면 참여중인 모임이 없습니다. core로 조건문 걸어서 생성하기   --%>
		
		<button onclick="location.href='general.cl'">뒤로가기</button>
		|
		<button onclick="location.href='enrollForm.cl';">모임 개설하기</button> <!-- 클릭시 모임 개설 페이지 이동  -->
		
		<br><br>
		
		<table id="admin-area" border="1">
			<thead>
				<tr>
					<th>순번</th>
					<th>모임이미지</th>
					<th>개설모임명</th>
					<th>모임최대정원</th>
					<th>모임개설일</th>
					<th>중심지역</th>
					<th>모임조회수</th>
					<th>총 회원 수</th>
					<th>모임 좋아요 총 갯수</th>
					<th>모임열린횟수</th>
					<th>모임관리</th>
				</tr>
			</thead>
								<!--눌리면 해당모임 상세페이지로 넘어가기-->
			<tbody id="admin-list-area">
				<c:choose>
					<c:when test="${ !empty clubList }" >
						<c:forEach items="${ clubList }" var="c" varStatus="status">
							<tr>
								<input type="hidden" name="clubNo" value="${c.clubNo }"/>
								<td>${ status.index + 1 }</td>
								<c:choose>
									<c:when test="${ !empty c.clubImg  }">
										<td><img width="150px" height="150px" src="${ c.clubImg }"></td>
									</c:when>
									<c:otherwise>
										<td><img width="150px" height="150px" src="resources/images/plus.png"></td>
									</c:otherwise>
								</c:choose>
								<td><a onclick="goDetail();">${ c.clubName }</a></td>
								<td>${ c.clubLimit }</td>
								<td id="createDate">${ c.clubCreatedate }</td>
								<td>${ c.clubLocation }</td>
								<td>${ c.clubCount }</td>
								<td>${ c.memCount }</td>
								<td>${ c.likeCount }</td>
								<td>${ c.openCount }</td>
								<td>
									<button>club수정</button> |
									<button onclick="location.href='clubMemAdmin.cl?clubNo=${c.clubNo}'">회원보기</button> |
									<button onclick="location.href='clubOpenAdmin.cl?clubNo=${c.clubNo}'">활동</button> |
									<button>게시글</button> |  
									<button>club삭제</button> 
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<th colspan="10">
								<p> 📢 개설한 모임이 없습니다. </p>	
							</th>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	

	<script>
		
	
		function goDetail(){
			
			var clubNo = $('#admin-list-area input[type=hidden]').val();
			var createDate = $('#createDate').text();
			var cdArr = createDate.split('/');
			
			//등록일로부터 한달 후 계산한 날짜
			let cd = new Date(cdArr[0], cdArr[1], cdArr[2]);
			let today = new Date(); 
			
			var newCount = 0;
		
			//(등록일 + 한달 ) > today 보다 크다면 한달이 안넘은 것이므로 new태그 활성화 시켜줌  
			if(cd >= today){
				newCount = 1;
			} else {
				newCount = 0;
			}

			location.href = 'detail.cl?clubNo=' + clubNo + '&newCount=' + newCount ;
		}
	
	</script>
	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>