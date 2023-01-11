<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}
    </style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	
	   <div class="content">
        <div class="innerOuter" style="padding:5% 10%;">
        <div class="novelCover" style="float:left;">
        <img src="https://comicthumb-phinf.pstatic.net/20210705_110/pocket_1625477242961kEPYS_JPEG/-__.jpg?type=m260">
        </div>
        <br><br><br>
        <div class="novelInfo" align="left">
        <c:forEach items="${ list }" var="s" begin="1" end="1">
            <h2>제목 : ${s.novelTitle}</h2>
            <h4>작가명 : ${s.nickName}</h4>
            <h6>설명 : ${s.novelDisplay }</h6>
        </c:forEach>
        <h1>${serial.novelTitle }</h1>
        </div>
            <br>
            <!-- 로그인 후 작가본인일 경우만 보여지는 글쓰기 버튼 -->
            <%-- <c:if test="${ loginUser eq null }"> --%>
            <c:forEach items="${ list }" var="s" begin="1" end="1">
            <form action="enrollForm.se" method="post">
            <input type="hidden" class="nno" name="novelNo" value="${ s.novelNo }">
            <input type="submit" class="btn btn-secondary" style="float:right;" value="연재하기">
            </form>
            </c:forEach>
            <%-- </c:if> --%>
            <!-- 로그인 후 독자일 경우만 보여지는 버튼 -->
            <%-- <c:if test="${ loginUser eq null }"> --%>
            <a class="btn btn-secondary" style="float:right;">작품 추천</a>
            <a class="btn btn-secondary" style="float:right;">작품 후원</a>
            <%-- </c:if> --%>
            <br><br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>별점</th>
                    </tr>
                </thead>
                <c:forEach items="${ list }" var="s">
                <tbody>
                		<tr>
                			<input type="hidden" class="nno" value="${ s.novelNo }">
                			<td class="sno">${ s.serialNo }</td>
                			<td>${ s.serialTitle }</td>
                			<td>${ s.count }</td>
                			<td>${ s.uploadDate }</td>
                			<td>${ s.starRating }</td>
                		</tr>
                </tbody>
                </c:forEach>
            </table>
            <br>
            
            <script>
            
            	$(function(){
            		$('#boardList>tbody>tr').click(function(){
            			/* location.href = 'detail.bo?bno=' + $(this).children('.bno').text(); */
            			location.href = 'detail.se?nno=' + $(this).children('.nno').val() + '&sno=' + $(this).children('.sno').text();
            		})
            	})
            	
/*             	$(function() {
            		$('#write').click(function() {
            			location.href =  'enrollForm.se?nno=' + $(this).children('.nno').val();
            		})
            	}) */
            
            </script>
       
            <br><br>
        </div>
        <br><br>

    </div>
	<jsp:include page="../../common/footer.jsp"/>

</body>
</html>