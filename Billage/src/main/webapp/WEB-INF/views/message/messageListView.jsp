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
	<jsp:include page="../user/myPageBar.jsp" />
	<div class="outer">
		<ul class="nav justify-content-center table-bordered">
			<li class="nav-item">
				<a class="nav-link">받은 쪽지함</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="sendList.ms">보낸 쪽지함</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="sendForm.ms">쪽지 보내기</a>
			</li>
		</ul>
		
		
		
		<div class="container" style="width : 1000px;">
			<table class="table table-hover table-bordered table-sm">
				<thead class="thead-light">
					<tr>
						<th width="150px">보낸 사람</th>
						<th width="650px">내용</th>
						<th width="200px">확인여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ msgList }" var="m" >
						<tr>
							<td>${ m.nickname }</td>
							<td>${ m.messageContent }</td>
							<td>
								<c:choose>
									<c:when test="${ m.messageStatus eq 1 }">
										<button id="${ m.messageStatus }">읽음</button>
									</c:when>
									<c:otherwise>
										<button id="${ m.messageStatus }" onclick="msgRead();" >안읽음 </button>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	
	<script>
		function msgRead(){
			
			$.ajax({
				
				url : 'read.ms',
				
				
			});
			
		}
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>