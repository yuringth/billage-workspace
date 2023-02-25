<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 등록하기</title>
<style>
	#all-enrollFrom button{
		margin:0px;
		padding:0px;
	}
	
	#all-enrollFrom {
		margin:auto;
		width:1200px;
	}

	#enroll-btn-area{
		text-align: center;
	}

	#enroll-btn-area > button {
		display:inline-block; 
		margin:auto; 
		margin-top:30px;
	}
	
	#file-insert:hover{ cursor:pointer; }
	
	<!-- -->
	#modal-serach-area{
		position: fixed;
        width: 500px;
        height:500px;
        background-color: rgb(253, 219, 219);
        border-radius: 20px;
        transform: translate(-50%, -50%);
        left: 50%;
        top: 50%;
        z-index: 1005;
        text-align: center;
        display: none;
	}
	
	#addr-close {
		font-size: 25px;
        background-color:rgba(95, 152, 124, 0);
        border: 1px solid rgba(245, 245, 220, 0);
        cursor: pointer;
        color:rgb(0, 0, 0);
        padding-left: 455px;
	}	
	
	#result-area{
		margin : auto;
		width : 480px;
		height : 400px;
	}
	
	#enter-addr-in{
		width : 480px;
		height : 400px;
		overflow : scroll;		
	}
	
	
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../user/myPageBar.jsp"/>
	

	<div id="all-enrollFrom" >
		<h1>모임 개설하기</h1>

		<!--모임 개설 : 모임이름, 모임요일, 모임 설명, 모임 지역, 모임 참여 인원 받아야 함 -->
		
		<br><br>
		<button onclick="location.href='general.cl'">뒤로가기</button>
		<br><br>
		<form action="create.cl" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userNo" value="${ loginUser.userNo }"/>
			<table border="1" align="center">
				<caption style="text-align:left;">*필수입력사항</caption>	
				<colgroup>
					<col style="width:200px;">
					<col style="width:800px;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">*모임명</th>
						<td><div><input type="text" name="clubName" required></div></td>
					</tr>
					<tr>
						<th>*모임 설명</th>
						<td><div><textarea name="clubDiscript" row="50" style="width:800px; height:200px; resize: none;" 
											placeholder="10자 이상 입력해주세요"></textarea></div></td>
					</tr>
					<tr>
						<th>*모임 중심 지역</th>
						<td>
						<input type="button" id="addr-btn" value="찾기" />
							<div><input type="text" name="clubLocation" required readonly></div>
						</td>
					</tr>
					<tr>
						<th>*모임 정원</th>
						<td>
							<div><input type="number" name="clubLimit" max="300" required/></div>
							*최대 300명까지 
						</td>
					</tr>
					<tr>
						<th>모임 대표 이미지</th>
						<td>
							 <span><img width="200" height="200" id="file-insert" src="resources/images/plus.png"></span>
							 <input type="file" name="upfile" id="file">
						</td>
					</tr>
				</tbody>
			</table>

			<div id="enroll-btn-area">
				<button type="submit" disabled>등록하기</button>
				<button type="reset">다시쓰기</button>
			</div>
		</form>
	</div> <!-- all-enrollFrom -->
	
	<!-- --------------- 모임 지역 찾기 모달창 구현 ----------------- -->
	<div id="modal-serach-area">
		<button type="button" id="addr-close">&times;</button>
		
		<div id="search-area">
			<div id="search-text"> 
				<input id="search" type="text" placeholder="읍/면/동을 입력해주세요." />			
			</div>
			<div id="result-area">
			
			</div>
		</div>
	</div>
	
	
	
	
	<script>
		//첨부파일 ------------------------------------------------------
		// 첨부파일 버튼 숨기고
		$('#file').hide();
		
		// 첨부파일 이미지 클릭시 첨부파일 버튼이 눌려지는 이벤트 걸고
		$('#file-insert').click(function(){
			$('#file').click();
		});
	
		// 첨부파일이 변경될 때 파일에 들어온 이미지로 사진 바꿔주고, 이미지 취소하면 다시 기본 이미지로 변경 
		$('#file').change(function(){
			var file = this;
			var $num = this.files.length;
			
			if($num == 1){
				var reader = new FileReader();
				reader.readAsDataURL(file.files[0]);
				reader.onload = function(e){
					$('#file-insert').attr('src', e.target.result);
				}
			} else {
				$('#file-insert').attr('src', 'resources/images/plus.png');
			}
		});
		
		// 버튼 비활성화 기능 ---------------------------------------------------------------------------------
	    $('textarea[name=clubDiscript]').keyup(function(){
			if($(this).val().length >= 10){
	        	$('#enroll-btn-area > button[type=submit]').removeAttr('disabled');
			} else {
	        	$('#enroll-btn-area > button[type=submit]').attr('disabled', 'true');
			}                	
	    })
		
	    // 검색을 위한 모달창 띄우기 
	    $(function(){
	    	$('#addr-btn').click(function(){
	    		$('input[name=clubLocation]').val('');
	    		$('#modal-serach-area').show();
	    	});
	    	
	    	
	    	$('#addr-close').click(function(){
	    		$('#modal-serach-area').hide();
	    		$('#search').val('');
	    		$('#enter-addr-in').empty();
	    		
	    	});
	    });
	    
		//
		
		$('#search-text input[type=text]').keyup(function(){
			
			$('#result-area').empty();
			
			var $text = $('#search').val();
			
			if($text.replace(/\s/gi, "").length != 0){
			
			$.ajax({
				url : "searchAddr.cl",
				data : { keyword:$('#search').val() },
				success: function(result){
					
					// 변수에 API로 가져온 주소 items[] 객체 배열을 담는다. 
					const itemsArr = result.response.result.items;
					console.log(itemsArr);
					// 객체배열 요소 하나를 출력해서 필요한 값으로 가공한 문자열을 담는다.
					const valueArr = [];
					// 중복없는 배열 요소만 담을 객체 생성
					const uniqueObj = {};
					// 출력할 요소에 대한 문자열을 담을 변수 선언 
					let value = ''; 
					
					for(var i in itemsArr){
						let item  = itemsArr[i];
						
						let fullAdd = item.address.road;
						let splitAdd = fullAdd.split(" ");		
						
						valueArr.push(splitAdd[2] + " (" + splitAdd[0] + " " + splitAdd[1]+")");

					}
					
					// valueArr에 담긴 주소문자열 배열을 
					valueArr.forEach(function(el) {
						uniqueObj[el] = true; // { 동(시 구) : true, 동 (시 구) : true, ... } 해당 형태로 uniqueObj 객체에 담음  (중복제거 됨) 
					});
					
					// 객체 키만 모아서 배열로 반환 
					const uniqueArr = Object.keys(uniqueObj);
					
					// 반환된 배열 uniqueArr 요소 하나씩 돌면서 result에 문자열 형태로 담는다.
					value += '<div id="enter-addr-in">';
					for(var i in uniqueArr.reverse()){			
						value += '<p class="enter-addr">' + uniqueArr[i] + '</p>';				
					}
					value += '</div>';
					$('#result-area').html(value);
					
				},
				error : function(){
					console.log('비동기통신실패');
				} 	
			});
			} else {
				$('#result-area').html('<p> 해당하는 지역이 없습니다. </p>');
			}
		});
		
		
		
		$(function(){
			$(document).on('click', '.enter-addr', function(){
				var $addr = $(this).text().split(/[" ",)]/);
				console.log($addr[2]);
				$('input[name=clubLocation]').val($addr[2]);
				$('#modal-serach-area').hide();
				$('#search').val('');
				$('#enter-addr-in').empty();
			});
			
		});
		
		
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>