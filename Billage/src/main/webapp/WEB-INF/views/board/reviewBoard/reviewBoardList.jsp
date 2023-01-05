<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 목록 조회</title>

<style>

    .reviewList-area{
        border:1px solid blue;
        width:1200px;

    }






* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background-image: url("https://images.pexels.com/photos/2088170/pexels-photo-2088170.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
  background-repeat: no-repeat;
  background-size: cover;
}

h1, p {
  text-align: center;
  margin-bottom: 20px;
  font-family: 'Rochester', cursive;
}

h1 {
  margin-top: 40px;
  font-size: 50px;
}

p {
  margin-bottom: 50px;
  font-size: 20px;
}

.row {
  margin-bottom: 60px;
}

img {
  display: inline;
  height: 300px;
  width: 30%;
  object-fit: cover;
  margin-left: 2.5%;
}



</style>


</head>
<body>

	<!-- 메뉴바 -->
	<jsp:include page="../../common/header.jsp" />
    
    



	<h1>리뷰게시판</h1>
	
	<div class="row red">
	  <img src="https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260">
	</div>
	
	<div class="row orange">
	  <img src="https://images.pexels.com/photos/69498/pexels-photo-69498.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260">
	</div>
	
	<div class="row yellow">
	  <img src="https://images.pexels.com/photos/1021906/pexels-photo-1021906.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260">
	</div>
	
	<div class="row blue">
	  <img src="https://images.pexels.com/photos/985266/pexels-photo-985266.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260">
	</div>
	
	    
    
    
    
    
    <!-- 일단 해봤지만 어렵다  -->
    <div class="reviewList-area">

        <div id="reviewList">
            <input type="text" value="">
        </div>
        
        <div id="reviewLike">
            찜갯수()
        </div>
        <div id="reviewReply">
            댓글()
        </div>
        <div id="reviewCount">
            리뷰 등록 수()
        </div>



    </div>


	<!-- 푸터바 -->
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>