<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  margin:auto;
   width:1200px;
}

.page-title {
  margin-bottom: 60px;
}

.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}
.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}
</style>
	
</style>
</head>
<body>
<body>
	<jsp:include page="../../common/header.jsp" />
   <section class="notice">
        <div class="page-title">
              <div class="container">
                  <h3>신고 게시판</h3>
              </div>
            
          </div>
         
        <!-- board list area -->
          <div id="board-list">
              <div class="container">
                  <table class="board-table">
                      <thead>
                      <tr>
                          <th scope="col" class="th-date">게시글 번호</th>
                          <th scope="col" class="th-title">신고 사유</th>
                          <th scope="col" class="th-date">제목</th>
                          <th scope="col" class="th-date">날짜</th>
                          <th scope="col" class="th-title">처리 결과</th>
                      </tr>
                      </thead>
                      <tbody>
               
               <c:forEach items="${ list }" var="r">
                      <tr class="boardList">
                          <td class="rno">${ r.reportNo }</td>
                          <td>${ r.reportCategory }</td>    
                          <td>${ r.reportTitle }</td>    
                          <td>${ r.reportDate }</td>
                          <td>${ r.reportStatus }</td>   
                      </tr>
               </c:forEach>

                      </tbody>
                  </table>
              </div>
          </div>
      
    </section>
   
   <jsp:include page="../../common/footer.jsp" />
	
	<script>
		$(function(){
			$('.boardList').click(function(){
				location.href='detail.ro?rno=' +$(this).children('.rno').text();
			})
		})
	</script>
</body>
</html>