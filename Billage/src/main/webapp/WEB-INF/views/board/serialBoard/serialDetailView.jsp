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
        <c:forEach items="${ list }" var="s">
            <h2>제목 : ${s.novelTitle}</h2>
            <h4>작가명 : ${s.nickName}</h4>
            <h6>설명 : ${s.novelDisplay }</h6>
        </c:forEach>
        </div>
            <br>
            <!-- 로그인 후 독자일 경우만 보여지는 버튼 -->
            <c:if test="${ loginUser eq null }">
            <a class="btn btn-secondary" style="float:right;" href="enrollForm.se">작품 추천</a>&nbsp;
            <a class="btn btn-secondary" style="float:right;" href="enrollForm.se">작품 후원</a>
            </c:if>
            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ serialTitle }</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>2022.12.25</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${ b.boardContent }</p></td>
                </tr>
            </table>
            <br>

			<c:if test="${ loginUser.userId eq b.boardWriter }">
            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
                <a class="btn btn-danger"  onclick="postFormSubmit(2);">삭제하기</a>
            </div>
            </c:if>
            
            <form action="" method="post" id="postForm">
            	<input type="hidden" name="bno" value="${b.boardNo}" />
            	<input type="hidden" name="filePath" value="${ b.changeName }" />
            </form>
            
            <script>
            	function postFormSubmit(num) {
            		if(num == 1){ // 수정하기 눌렀을 때
            			$('#postForm').attr('action', 'updateForm.bo').submit();
            		} else { // 삭제하기 눌렀을 때
            			$('#postForm').attr('action', 'delete.bo').submit();
            		}
            	}
            </script>
            
            
            <br><br>

            <!-- 댓글 기능 -->
            <table id="replyArea" class="table" align="center">
                <thead>
                	<c:choose>
                	<c:when test="${ empty loginUser }">
                    <tr>
                        <th colspan="2">
                            <textarea class="form-control" readonly cols="55" rows="2" style="resize:none; width:100%;">로그인해 이새끼야</textarea>
                        </th>
                        <th style="vertical-align:middle"><button class="btn btn-secondary disabled">등록하기</button></th>
                    </tr>
                    </c:when>
                    <c:otherwise>
                    <tr>
                        <th colspan="2">
                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                        </th>
                        <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
                    </tr>
                    </c:otherwise>
                    </c:choose>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">3</span>)</td>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <br><br>

    </div>
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
       
            <br><br>
        <br><br>

	<jsp:include page="../../common/footer.jsp"/>

</body>
</html>