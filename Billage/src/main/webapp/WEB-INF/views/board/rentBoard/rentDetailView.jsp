<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.panel {
    border: none;
    box-shadow: none;
}

.pro-title {
    color: #5A5A5A;
    display: inline-block;
    margin-top: 20px;
    font-size: 16px;
}

.product-list .price {
    color:#fc5959 ;
    font-size: 15px;
}

.pro-img-details {
    margin-left: -15px;
}
.pro-d-title {
    font-size: 16px;
    margin-top: 0;
}
.product_meta {
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;
    padding: 10px 0;
    margin: 15px 0;
}

.product_meta span {
    display: block;
    margin-bottom: 10px;
}
.product_meta .pro-price{
    color:#fc5959 ;
}

.pro-price, .amount-old {
    font-size: 18px;
    padding: 0 10px;
}

.amount-old {
    text-decoration: line-through;
}

.quantity {
    width: 120px;
}

.pro-d-head {
    font-size: 18px;
    font-weight: 300;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.w-btn-brown:hover {
    background-color: #ce6d39;
    color: #ffeee4;
    cursor : pointer;
}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<div class="container bootdey">
	<div class="col-md-12">
	<section class="panel">
		<form action="apply.rt" method="post">
		<input type="hidden" name="rentNo" value="${ rb.rentNo }">
		<input type="hidden" name="userNo" value="${ rb.userNo }">
		<input type="hidden" name="rentPoint" value="${ rb.rentPoint }">
		
		<div class="panel-body" style="display:flex; flex-direction:row; justify-content:space-evenly;">
		
			<div class="col-md-6">
				<div class="pro-img-details">
					<img src="${rb.changeName}" width="450px" height="450px" alt="">
				</div>
	
			</div>
			<div class="col-md-6">
			<h4 class="pro-d-title">
				<br><span class="posted_in"> <strong>책 제목:</strong> ${rb.rentBookTitle}</span><br>
			</h4>
			<p>
				<span class="tagged_as"><strong>작성자 닉네임: ${rb.nickname}</strong> </span>
			</p>
			<div class="product_meta">
				<span>${rb.rentTitle}</span>
				<span>${rb.rentContent}</span>
			</div>
			
			<!-- input date 시간 나오는 부분 처리 대여일 -->
			<fmt:parseDate pattern="yyyy-MM-dd" var="sdfsdf" value="${rb.rentDate }"/> <br/>
			<fmt:formatDate  var="date2" value="${sdfsdf}" type="DATE" pattern="yyyy-MM-dd"/>
			<!-- input date 시간 나오는 부분 처리 반납일 -->
			<fmt:parseDate pattern="yyyy-MM-dd" var="sdfsdf2" value="${rb.dueDate }"/> <br/>
			<fmt:formatDate  var="date3" value="${sdfsdf2}" type="DATE" pattern="yyyy-MM-dd"/>
			
			<div class="m-bot15"> <strong>Point : </strong> <span class="pro-price"> ${rb.rentPoint}</span></div><br>
			<div class="m-bot15"> <strong>대여 시작일 : </strong> <span class="pro-price"> ${date2}</span></div><br>
			<div class="m-bot15"> <strong>반납일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </strong> <span class="pro-price"> ${date3}</span></div>
			<br>
			<p>
				<button type="button" class="w-btn" onclick="history.back()"> 뒤로가기 </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${ rb.rentStatus == 'Y' || empty loginUser || loginUser.userNo  == rb.userNo}">
					<button class="w-btn w-btn-brown" disabled> 대여불가 </button>
				</c:if>
				<c:if test="${ rb.rentStatus == 'N' && not empty loginUser && loginUser.userNo != rb.userNo }">
					<button class="w-btn w-btn-brown"> 대여신청하기 </button>
				</c:if>
				
			</p>
			</div>
		</div>
		</form>
	</section>
	</div>
	</div>
	
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>