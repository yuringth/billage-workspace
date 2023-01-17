<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.outer{
	border:1px solid black;
	width:1000px;
	margin:auto;
}

.photo-area{
	border:1px solid red;
	height:400px;
    width:100%;
   	text-align:center;
}


/* 이것도 왜 버튼 flex잘 안되냐고~~~!  */
.user-area{
	border:1px solid pink;
	height:100px;
	display:flex;
}
.user-div{
	width:1000px;
	height:100px;
	display:flex;
}
#user_no{
	width:500px;
	text-align:center;
}


.writer-area{
	border:1px solid blue;
	height:550px;
	margin:0px;
}
#used_title, #used_genre, #used_price, #count{
	border:1px solid skyblue;
	height: 50px;
	margin:0px;
	text-align:center;
}
#used_content{
	border:1px solid skyblue;
	height: 300px;
	margin:0px;
	text-align:center;
}



/* topn분석 스타일 */
.topn-text{
	width:1000px;
	margin:auto;
	font-size:50px;
}
.topn-outer{
	border:1px solid black;
	width:1000px;
	margin:auto;
	display: flex;
	flex-wrap: wrap;	
}

  .align-left-outer{
      display: flex;
      flex-wrap: wrap;
      width : 400px;
      height: 534px;
  }
  .one-content{
      width : 400px;
      height: 534px;
      padding-left: 8px;
      padding-right: 8px;
      padding-bottom: 16px;
  }
  .img-area{
      width : 100%;
      height : 414px;
      overflow: hidden;
  }
  .text-area{
      width: 344px;
      height: 100px;
      padding-top: 10px;
      padding-bottom: 10px;
      padding-left: 30px;
  }
  .countnum{
      display: flex;
      flex-direction: row-reverse;
      font-size: 12px;
  }
  .textsize {
      font-size: 17px;
      margin : 0px;
  }
  .title-text{
font-size: 25px;
      margin : 0px;
  }


</style>

</head>
<body>

	<jsp:include page="../../common/header.jsp"/>

	<div class="outer">
		<div class="photo-area">
			<img src="${ b.changeName }" onclick="location.href='detail.ud'" style="height:400px; width:1000px;">
		</div>
		
		<div class="user-area">
			<div class="user-div">
				<p id="user_no" name="userNo">${ b.nickname }</p>
				<button>채팅하기</button>
			</div>
		</div>
		
		<hr>
		
		<!-- USED_BOARD 테이블에 used_genre, used_pric, used_content, used_chat(?) 컬럼 추가 -->
		<div class="writer-area">
			<p id="used_title" name="usedTitle">게시글 제목 : ${ b.usedTitle }</p>
			<p id="used_genre" name="usedGenre">책 장르 : ${ b.bookGenre }</p>
			<p id="used_price" name="usedPrice">판매 가격 : ${ b.point }</p>
			<p id="used_content" name="usedContent">게시글 내용 : ${ b.usedContent }</p>
			
			<p id="count" name="count">관심 채팅 조회</p>
		</div>
		
		
		
		<form action="" method="post" id="postForm">
			<input type="hidden" name="usedNo" value="${b.usedNo}" />
			<input type="hidden" name="usedTitle" value="${b.usedTitle }" />
			<input type="hidden" name="bookAuthor" value="${b.bookAuthor }" />
			<input type="hidden" name="bookGenre" value="${b.bookGenre}" />
			<input type="hidden" name="point" value="${b.point}" />
			<input type="hidden" name="bookTitle" value="${b.bookTitle}" />
			<input type="hidden" name="usedContent" value="${b.usedContent}" />
			<input type="hidden" name="filePath" value="${b.changeName }" />
			<input type="hidden" name="originName" value="${b.originName }" />
		</form>
		
		<div style="text-align:center;">
			<c:choose>
				<c:when test="${ loginUser.userNo == b.userNo }">
					<button onclick="postFormSubmit();">글수정</button>
					<button onclick="location.href='delete.ud?usedNo=${ b.usedNo }'">글삭제</button>
					<button onclick="location.href='list.ud'">목록가기</button>
				</c:when>
				<c:otherwise>
					<button onclick="location.href='list.ud'">목록가기</button>
				</c:otherwise>
			</c:choose>
		</div>
	
	<!-- 전체를 감싸는 div  -->		
	</div>
	
	
	
	<!-- 글 수정 누를 수 key값을 가지고 글수정 페이지로 이동 -->
	<script>
		function postFormSubmit(){
			$('#postForm').attr('action', 'enrollUsedForm.ud').submit();
		}
	</script>


		<!-- 인기 topN분석 -->
		<h1 class="topn-text">Billage의 인기중고</h1>
	
		<div class="topn-outer">
		
			<!-- 상품 하나를 감싸는 div -->
<!-- 		
			<div class="align-left-outer">
		        <div class="one-content">
		            <div class="img-area">
		            	<input type="hidden" name="usedNo" value="${b.usedNo }"/>
		                <img src="https://img.sbs.co.kr/newimg/news/20160122/200906797_700.jpg">
		            </div>
		            <div class="text-area">
		                <p class="title-text">${b.bookTitle }</p>
		                <p class="textsize">${b.point }</p>
		                <p class="textsize">♡</p>
		                <p class="countnum">조회 : ${b.count }</p>
		            </div>
		        </div>
			</div>
			
			 -->
		</div>


   	
   	
   	
   	<!-- topn분석 -->
   	<script>
   		$(function(){
   			topUsedList();
   			
   			// ***** 동적으로 만들어진 요소에 이벤트 부여방법 *****
			$(document).on('click', '.topn-outer>#imgClick', function(){
				location.href='detail.ud?usedNo=' + $(this).text();
				console.log($(this).text());
			})
			// setInterval(topBoardList, 10000000); // 몇초당 나오게 하는 것
   			
   		})
   	
	   	function topUsedList(){
	   		$.ajax({
	   			url:'topList.ud',
	   			success:function(data){
	   				console.log(data);
	   				
	   				let value = '';
	   				for(let i in data){
	   					value += '<div class="align-left-outer">'
	   						  + '<div class="one-content">'
	   						  + '<div class="img-area">'
	   						  + '<input type="hidden" name="usedNo" value="${b.usedNo }"/>'
	   						  + '<img src="${ b.changeName }">'
	   						  + '</div>'
	   						  + '<div class="text-area">'
	   						  + '<p class="title-text">' + data[i].bookTitle + '</p>'
	   						  + '<p class="textsize">' + data[i].point + '</p>'
	   						  + '<p class="textsize">' + '♡'  + '</p>'
	   						  + '<p class="countnum">' + '조회 :' + data[i].count + '</p>'
	   						  + '</div>'
	   						  + '</div>'
	   						  + '</div>';
	   				}
	   				$('.topn-outer').html(value);
	   				
	   				
	   			},
	   			error:function(){
	   				console.log('실패');
	   			}
	   		})
	   	}
   	
   	
   	</script>
 
   	
   	
   	
	
	
	
    <jsp:include page="../../common/footer.jsp"/>	
	

</body>
</html>