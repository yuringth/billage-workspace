<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .del-area {
        padding: 0px 0px 80px 0px;
    }
    .del-title {
        margin-top: 70px;
        margin-left: 80px;
        margin-bottom: 40px;
        font-size: 22px;
        font-weight: bold;
        color: rgb(47, 54, 82);
    }
    .del-content {
        /* margin-left: 120px; */
        font-size: 18px;
        font-family: 'Pretendard-Regular';
    }

    .del-area button {
        font-family: 'Pretendard-Regular';
        font-size: 18px;
        background-color: RGB(63,72,107);
        color: white;
        height: 40px;
        width: 150px;
        border-radius: 5px;
        border: none;
        margin: 5px;
    }
    #delete-btn {
        background-color: rgb(223, 223, 223);
        color: rgb(161, 161, 161);
     }
    #cancle-btn {
        cursor: pointer;
    }

</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="myPageBar.jsp" />
	
	<div class="outer">
	
		<div class="main-area" align="center">
			<div id="title"><h2>회원 탈퇴</h2></div>
				<div id="title-line"><hr></div>
				<div class="del-area">
	
					<div class="del-title">*** 회원 탈퇴 유의사항 ***</div>
	
						<pre class="del-content">
								1. 회원 탈퇴 시 삭제된 데이터에 대해 복구가 불가능하며, 개인정보가 필요한  모든 웹서비스 이용이 불가합니다.
							
	     2. 잔여 포인트, 회원 등급 등의 정보는 모두 삭제되며 환불되지 않습니다.
						</pre>
	
					<form action="delete.me" method="post">
						<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
							<div id="del-check">
							
								<div>비밀번호 : <input type="password" placeholder="비밀번호를 입력하세요"></div><br>
								<span>회원 탈퇴 유의사항을 숙지하였으며 회원 탈퇴를 진행하겠습니다.</span>
								<span><input type="checkbox" id="del-checkbox" onchange="abledBtn();"></span>
								
							</div>
							<div><button type="button" id="cancle-btn">취소하기</button><button type="submit" id="delete-btn" disabled>탈퇴하기</button></div>
						</form>
				</div>
		</div>
	</div>
        

    
    <jsp:include page="../common/footer.jsp" />
    <script>
      	$('#cancle-btn').click(function(){
	          location.href = "";
	      })
	
	      function abledBtn() {
	          if($('#del-checkbox').is(':checked') == true) {
	              $('#delete-btn').attr('disabled', false);
	              $('#delete-btn').css('cursor', 'pointer');
	              $('#delete-btn').css('color', 'black');
	          } else {
	              $('#delete-btn').attr('disabled', true);
	              $('#delete-btn').css('cursor', 'default');
	              $('#delete-btn').css('color', 'rgb(161, 161, 161)');
	          }
	      }
    </script>
</body>
</html>