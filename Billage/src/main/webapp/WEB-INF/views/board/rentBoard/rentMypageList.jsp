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
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../../user/myPageBar.jsp"/>
	<section class="notice">
        <div class="page-title">
              <div class="container">
                  <h3>나의 대여 목록</h3>
              </div>
            
          </div>
         
        <!-- board list area -->
          <div id="board-list">
              <div class="container">
                  <table class="board-table">
                      <thead>
                      
                      <tr>
                          <th scope="col" class="th-date">상대 닉네임</th>
                          <th scope="col" class="th-title">책 제목</th>
                          <th scope="col" class="th-date">대여일</th>
                          <th scope="col" class="th-date">반납일</th>
                          <th scope="col" class="th-title">반납 여부</th>
                      </tr>
                      
                      </thead>
                      <tbody>

                      <tr>
                      	  <td>닉네임</td>
                          <td>1</td>    
                          <td>대여일</td>    
                          <td>반납일</td>
                          <td>반납 여부</td>   
                      </tr>

                      </tbody>
                  </table>
              </div>
          </div>
      
    </section>
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>