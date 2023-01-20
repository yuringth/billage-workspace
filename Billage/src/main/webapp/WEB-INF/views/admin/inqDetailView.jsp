<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        list-style: none;
        text-decoration: none;
    }
    
    .wrapper {
    	display: flex;
        position: relative;
    }
    
    .wrapper .sidebar {
        width: 300px;
        height: 100%;
        background: #4b4276;
        padding: 30px 0px;
        margin-left: 50px;
        /* position: fixed; */
    }
    .wrapper .sidebar h2 {
        color: #fff;
        text-transform: uppercase;
        text-align: center;
        margin-bottom: 30px;
    }
    .wrapper .sidebar ul li {
        padding: 15px;
        border-bottom: 1px solid #bdb8d7;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        border-top: 1px solid rgba(255, 255, 255, 0.05);
    }
    .wrapper .sidebar ul li a {
        color: #bdb8d7;
        display: block;
    }
    .wrapper .sidebar ul li a .fas {
        width: 25px;
    }
    .wrapper .sidebar ul li:hover {
        background-color: #594f8d;
    }
    .wrapper .sidebar ul li:hover a {
        color: #fff;
    }
    .wrapper .sidebar .social_media {
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
    }
    .wrapper .sidebar .social_media a {
        display: block;
        width: 40px;
        background: #594f8d;
        height: 40px;
        line-height: 45px;
        text-align: center;
        margin: 0 5px;
        color: #bdb8d7;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .wrapper .main_content {
        width: 100%;
        margin-left: 50px;
    }
    .wrapper .main_content .header {
        padding: 20px;
        background: #fff;
        color: #717171;
        border-bottom: 1px solid #e0e4e8;
    }
    @media (max-height: 500px) {
        .social_media {
            display: none !important;
        }
    }
    /*-----------------------------------*/
    @import url("https://fonts.googleapis.com/css?family=IBM Plex Sans:400,400i,700");

	*, :before, :after {
		box-sizing: border-box;
	}
	.title {
		display: flex;
		justify-content: center;
		align-items: center;
		text-align: center;
	}
	.tr {
		display: grid;
		grid-template-columns: 15% 15% 20% 20% 15% 15%;
	}
	.header {
		border-bottom: solid 1px #aaa;
	}
	.body {
		border-bottom: solid 1px #aaa;
	}
	
	#boardList {text-align:center;}
    #boardList>tbody>tr:hover {cursor:pointer;}
</style>
<body>
   <jsp:include page="../common/header.jsp"/>
	<br>
   <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <div class="wrapper">
        <div class="sidebar">
            <h2>관리자 페이지</h2>
            <ul>
                <li><a href="userList.ad"><i class="fas fa-user"></i>회원 관리</a></li>
                <li><a href="groupList.ad"><i class="fas fa-home"></i>모임 관리</a></li>
                <li><a href="novelList.ad"><i class="fa fa-book"></i>&nbsp;&nbsp;&nbsp;작품 관리</a></li>
                <li><a href="inqList.ad"><i class="fas fa-address-card"></i>1:1 문의</a></li>
                <li><a href="faqList.ad"><i class="fas fa-project-diagram"></i>FAQ 관리</a></li>
                <li><a href="noticeList.ad"><i class="fas fa-blog"></i>공지사항</a></li>
                <li><a href="list.sr"><i class="fas fa-address-book"></i>연재 요청</a></li>
                <li><a href="list.ro"><i class="fas fa-address-book"></i>신고 관리</a></li>
            </ul>
        </div>
        <div class="main_content">
            <div class="title">
				<h1 class="title-text">1:1 문의 조회 및 관리</h1>
			</div><br>
			<table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ iq.inqTitle }</td>
                </tr>
                <tr>
                    <th width="100">작성자</th>
                    <td colspan="3">${ iq.nickname }</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${ iq.inqDate }</td>
                </tr>
                <tr>
                    <th>문의유형</th>
                    <td colspan="3">${ iq.inqType }</td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${ iq.inqContent }</p></td>
                </tr>
            </table>
            <div>
            <h2>답변 : ${ iq.answer }</h2>
            </div>
            <div>
            <c:if test="${ iq.answer eq '아직 답변이 등록되지 않았습니다'}">
            <form action="" method="get" id="updateForm">
            	<input type="hidden" name="ino" value="${ iq.inqNo }">
            	<textarea name="answer" id="answer" spellcheck="true" style="resize:none" rows="5" cols="140" tabindex="4" placeholder="문의에 대한 답변을 남겨주세요" required></textarea>
            	<br><a class="btn btn-primary" onclick="answerInq();">답변하기</a>
            </form>
            </c:if>
            </div>
            <br>
        </div>
      </div>
      <script>
      	function answerInq() {
      		$('#updateForm').attr('action', 'update.iq').submit();
      	}
      </script>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>