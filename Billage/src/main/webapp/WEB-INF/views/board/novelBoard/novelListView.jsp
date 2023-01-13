<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
// font stuff
/* @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,300,600,700,900); */

// colour stuff
@white: #ffffff;
@lightBG: #dce1df;
@salmon: #ff6666;

@teal: #0096a0;
@tealMid: #0ebac7;
@tealContrast: #33ffff;
@tealShade:	#007c85;

@darkGrey: #4f585e;

body {
  background: @lightBG;
  color: @darkGrey;
  font-family: 'Source Sans Pro', sans-serif;
  text-rendering: optimizeLegibility;
}

a.btn {
  background: @teal;
  border-radius: 4px;
	box-shadow: 0 2px 0px 0 rgba(0,0,0,0.25);
  color: @white;
  display: inline-block;
  padding: 6px 30px 8px;
  position: relative;
  text-decoration: none;
	transition: all 0.1s 0s ease-out;
}

.no-touch a.btn:hover {
  background: lighten(@teal,2.5);
  box-shadow: 0px 8px 2px 0 rgba(0, 0, 0, 0.075);
  transform: translateY(-2px);
  transition: all 0.25s 0s ease-out;
}

.no-touch a.btn:active,
a.btn:active {
  background: darken(@teal,2.5);
  box-shadow: 0 1px 0px 0 rgba(255,255,255,0.25);
  transform: translate3d(0,1px,0);
  transition: all 0.025s 0s ease-out;
}

div.cards {
  align: center;
  margin: 80px auto;
  max-width: 960px;
  text-align: center;
}

div.card {
  background: @white;
  display: inline-block;
  margin: 8px;
  max-width: 300px;
  perspective: 1000;
  position: relative;
  text-align: left;
  transition: all 0.3s 0s ease-in;
  width: 300px;
  z-index: 1;

  img {
    max-width: 300px;
  }
  
  .card__image-holder {
    background: rgba(0,0,0,0.1);
    height: 0;
    padding-bottom: 75%;
  }

  div.card-title {
    background: @white;
    padding: 6px 15px 10px;
    position: relative;
    z-index: 0;
    
    a.toggle-info {
      border-radius: 32px;
      height: 32px;
      padding: 0;
      position: absolute;
      right: 15px;
      top: 10px;
      width: 32px;
      
      span {
        background: @white;
        display: block;
        height: 2px;
        position: absolute;
        top: 16px;
        transition: all 0.15s 0s ease-out;
        width: 12px;
      }
      
      span.left {
        right: 14px;
        transform: rotate(45deg);
      }
      span.right {
        left: 14px;
        transform: rotate(-45deg);
      }
    }
    
    h2 {
      font-size: 24px;
      font-weight: 700;
      letter-spacing: -0.05em;
      margin: 0;
      padding: 0;
      
      small {
        display: block;
        font-size: 18px;
        font-weight: 600;
        letter-spacing: -0.025em;
      }
    }
  }
  
  div {
  	margin: auto;
  }

  div.card-description {
    padding: 0 15px 10px;
    position: relative;
    font-size: 14px;
  }

  div.card-actions {
  	box-shadow: 0 2px 0px 0 rgba(0,0,0,0.075);
    padding: 10px 15px 20px;
    text-align: center;
  }
  
  div.card-flap {
    background: darken(@white,15);
    position: absolute;
    width: 100%;
    transform-origin: top;
    transform: rotateX(-90deg);
  }
  div.flap1 {
    transition: all 0.3s 0.3s ease-out;
    z-index: -1;
  }
  div.flap2 {
    transition: all 0.3s 0s ease-out;
    z-index: -2;
  }
  
}

div.cards.showing {
  div.card {
    cursor: pointer;
    opacity: 0.6;
    transform: scale(0.88);
  }
}

.no-touch  div.cards.showing {
  div.card:hover {
    opacity: 0.94;
    transform: scale(0.92);
  }
}

div.card.show {
  opacity: 1 !important;
  transform: scale(1) !important;

  div.card-title {
    a.toggle-info {
      background: @salmon !important;
      span {
        top: 15px;
      }
      span.left {
        right: 10px;
      }
      span.right {
        left: 10px;
      }
    }
  }
  div.card-flap {
    background: @white;
    transform: rotateX(0deg);
  }
  div.flap1 {
    transition: all 0.3s 0s ease-out;
  }
  div.flap2 {
    transition: all 0.3s 0.2s ease-out;
  }
  
/*   .pagination { */
/*   	display: flex; */
/*   	padding-left: 0; */
/*   	list-style: none; */
/*   	border-radius: .25rem; */
/*   	align: center; */
/*   } */
}
</style>
</head>
<body>
		<jsp:include page="../../common/header.jsp"/>
		<br><br><br>
		<!-- 로그인 후 관리자일 경우만 보여지는 글쓰기 버튼 -->
        <c:if test="${ loginUser eq null }">
	        <div align="center">
	        	<a class="btn btn-secondary" href="enrollForm.nv">작품등록</a>
	        </div>
        </c:if>
		<div class="cards">
	        <c:forEach items="${ list }" var="n">
	        <div class="card">
	            <div class="card__image-holder">
	                <!-- <img class="card__image" src="https://source.unsplash.com/300x225/?wave" alt="wave" /> -->
	                <img class="card_image" src="${ n.changeName }" width="295" height="395">
	            </div>
	            <div class="card-title" title="${ n.novelTitle }">
	                <h2 style="display: block;
     								white-space: nowrap;
  								text-overflow: ellipsis;
  								overflow: hidden;">
	                    ${ n.novelTitle }
	                </h2>
	            </div>
	            <div class="card-flap flap1">
	                <div class="card-description">
	                    작가명 : ${ n.nickName }<br>최신화 : <br>추천수 : ${ n.heart }<br>별점 (평균): 
	                </div>
	                <div class="card-flap flap2">
	                    <div class="card-actions">
	                    <input type="hidden" class="nno" value="${ n.novelNo }">
	                        <a class="btn">읽으러가기</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	        </c:forEach>
	        
        	  <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="list.nv?cpage=${ pi.currentPage - 1 }">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <li class="page-item"><a class="page-link" href="list.nv?cpage=${p}">${ p }</a></li>
                </c:forEach>
                <c:choose>
                	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                	</c:when>
                	<c:otherwise>
	                    <li class="page-item"><a class="page-link" href="list.nv?cpage=${ pi.currentPage + 1 }">Next</a></li>
	                </c:otherwise>
	            </c:choose>
                </ul>
              </div>
              
		</div>
		
		<script>
	
		$(function () {
    	
        	$('.card-actions').click(function () {

        	    location.href = 'list.se?nno=' + $(this).children('.nno').val();
            		
    	    })
		})
	
		</script>
		
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>