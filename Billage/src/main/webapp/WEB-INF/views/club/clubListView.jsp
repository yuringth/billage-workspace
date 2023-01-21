<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>여기는 모임 리스트 </title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style>
	p { padding:0px; margin:0px; }
	
	#thum-text-area, #thum-like-area { text-align:center; font-weight:600; color:gray; }
	#outer-area{
		width : 1200px;
		margin: auto;
		/*background-color: rgba(136, 180, 164, 0.435);*/
	}
	
	.list-area{
		/*text-align: center;*/
		border: 1px solid gray;
		display:block;
	}
	
	.thumbnail {
		width:320px;
		height:450px;

	}
	
	.thumbnail > img {
		width: 300px;
		height: 300px;
		padding: 10px;
	}

	.thumbnail{
		border: 1px solid rgb(243, 231, 231);
		width: 350px;
		display: inline-block;
		margin: 15px;
		background-color: rgba(211, 201, 180, 0.30);
	}

	.thumbnail:hover{
		cursor: pointer;
		opacity: 0.7;
	}
	
	#thum-area h3{
		color : black;
	}

	#new-club{
		position: absolute;
		color: white;
		background-color:red;
		border: 2px solid red;
		border-radius: 50px;
		margin-top: 10px;
		margin-left: 10px;
		line-height: 35px;
		width:40px;
		display:none;
		z-index:900;
		font-weight:600;
	}
	

	
	
        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
            
	<div id="outer-area">
		<div>
			<a href="list.cl?condition=recently">최신순</a>
			<a href="list.cl?condition=popularity">인기순</a>
		</div>
		
		
		<div align="center">
			<form action="search.cl" method="get">
				<input type="hidden" name="cpage" value="1" />
				<select name="condition">
					<option value="clubName">모임명</option>			
					<option value="location">지역</option>			
					<option value="createMem">닉네임</option>			
				</select>
				<input id="keyword" type="text" name="keyword"/>		
				<button type="submit" >검색</button>
			</form>
		</div>
		
		<br><br><br>
		
		<div id="list-area">
			<c:forEach items="${ clubList }" var="c" varStatus="status" >
			<div id="thum-area" class="thumbnail" align="center">
				<input type="hidden" name="clubNo" value="${ c.clubNo }" />
				<div id="new-club" value="${ c.newCount }">new</div>
				<c:choose>
					<c:when test="${ !empty c.clubImg }">
						<img src="${ c.clubImg }" alt="">
					</c:when>
					<c:otherwise>
						<img src="resources/images/no_image.jpg" alt="">
					</c:otherwise>				
				</c:choose>
				<h3>${ c.clubName }</h3> 
				<div id="thum-text-area">
					<span>중심지역 : ${ c.clubLocation }</span><br>
					<span>멤버수  : ${ c.memCount } / ${ c.clubLimit }</span><br>
					<span>조회수 : ${ c.clubCount }</span>
				</div>
				<div id="thum-like-area">
						<span>좋아요 : ${ c.likeCount }명</span>
				</div>
			</div>
			</c:forEach>
		</div> <!-- list-area끝  -->
		
		
		<%-- 
		<c:forEach items="${ likeList }" var="l">
			<script>

			</script>
			
		</c:forEach>		
		*/
		--%>
		
		
		
         <div id="pagingArea">
               <ul class="pagination">
               	<c:choose>
               		<c:when  test="${ pi.currentPage eq 1 }">
                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
               		</c:when>
               		<c:otherwise>
                    	<li class="page-item"><a class="page-link" href="list.cl?cpage=${ pi.currentPage -1 }">Previous</a></li>
               		</c:otherwise>
				</c:choose>
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                   	<li class="page-item"><a class="page-link" href="list.cl?cpage=${ p }">${ p }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
                   		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="list.cl?cpage=${ pi.currentPage + 1 }">Next</a></li>
					</c:otherwise>
				</c:choose>
               </ul>
           </div>
		
	</div> <!-- outer-area 끝 -->
	
	
		<script>
			$(function(){
				
				/* 이거 구현할 때 모임생성날짜 계산해서 1이랑 0이랑 구분할 수 있게 값을 들고오고 싶은데 어떻게 하징? 
						DB에서 조건문 걸어서 가지고 와야 하나?
								어떠카지!!!!!!!!? ㅠㅠ */
				$('#list-area #new-club').each(function(){
					if($(this).attr('value') == 1){
						$(this).show();
					}					
				});
				
				
				$('#list-area > #thum-area').on('click', function(){
					location.href = "detail.cl?clubNo=" + $(this).children().eq(0).val()
											 +"&newCount=" + $(this).find('#new-club').attr('value');
					//글번호 들고 가야 돼
				});
			});
	
			

				
				
				

	
		</script>
		
	<jsp:include page="../common/footer.jsp" />
</body>
</html>