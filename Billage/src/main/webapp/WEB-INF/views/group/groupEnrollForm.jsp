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
	
	
	
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../user/myPageBar.jsp"/>
	

	<div id="all-enrollFrom" >
		<h1>모임 개설하기</h1>


		<!--모임 개설 : 모임이름, 모임요일, 모임 설명, 모임 지역, 모임 참여 인원 받아야 함 -->
		<form action="insert.gr" method="post" enctype="multipart/form-data">
			<table border="1" align="center">
				<caption>모임개설정보</caption>	
				<colgroup>
					<col style="width:200px;">
					<col style="width:800px;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">모임 이름</th>
						<td><div><input type="text" name="groupTitle" required></div></td>
					</tr>
					<tr>
						<th scope="row">모임 요일</th>
						<td>
							<select name="groupDay">
								<option name="groupDay">월</option>
								<option name="groupDay">화</option>
								<option name="groupDay">수</option>
								<option name="groupDay">목</option>
								<option name="groupDay">금</option>
								<option name="groupDay">토</option>
								<option name="groupDay">일</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>모임 설명</th>
						<td><div><textarea name="groupDescribe" row="50" style="width:800px; height:200px; resize: none;" 
											placeholder="10자 이상 입력해주세요"></textarea></div></td>
					</tr>
					<tr>
						<th>모임 지역</th>
						<td><input type="button" id="addr-btn" value="찾기" /><div><input type="text" name="groupLocation" required></div></td>
					</tr>
					<tr>
						<th>모임 참여 인원</th>
						<td><div><input type="number" name="groupNum" required/></div></td>
					</tr>
					<tr>
						<th>모임 대표 이미지</th>
						<td>
							 <span><img width="200" height="200" id="file-insert" src="resources/images/plus.png"></span>
							 <input type="file" name="groupImg" id="file">
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
				<input id="search" type="text" />			
			</div>
			<div id="result-area" style="width:480px; height:300px; border:1px solid black;">
			
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
	    $('textarea[name=groupDescribe]').keyup(function(){
			if($(this).val().length >= 10){
	        	$('#enroll-btn-area > button[type=submit]').removeAttr('disabled');
			} else {
	        	$('#enroll-btn-area > button[type=submit]').attr('disabled', 'true');
			}                	
	    })
		
	    // 검색을 위한 모달창 띄우기 
	    $(function(){
	    	$('#addr-btn').click(function(){
	    		$('#modal-serach-area').show();
	    	});
	    	
	    	
	    	$('#addr-close').click(function(){
	    		$('#modal-serach-area').hide();
	    		$('#search').val('');
	    	});
	    });
	    
		//
		
		$('#search-text input[type=text]').keyup(function(){
			
			$('#result-area').empty();
			
			$.ajax({
				url : "searchAddr.gr",
				data : { keyword:$('#search').val() },
				success: function(result){
					
					const itemsArr = result.response.result.items;
					
					let valueArr = [];
					let value = ''; 
					
					for(let i in itemsArr){
						let item  = itemsArr[i];
						
						let fullAdd = item.address.road;
						var splitAdd = fullAdd.split(" ");		
						valueArr.push(splitAdd[2] + " (" + splitAdd[0] + " " + splitAdd[1]+")");

						//console.log(valueArr);
												
						//let result2 = Array.from(new Set(value));
						//console.log(result2[i].name);

						//console.log(splitAdd[2] + " ( " + splitAdd[0] + " " + splitAdd[1] + ")");
					}
					
					
					const resultArr = valueArr.reduce((acc, v) => {
						console.log(acc);
						return acc.find(x => x.name === v.name) ? acc : [...acc, v];
					}, []);
					
					
					
					for(let i in resultArr){			
						value += resultArr[i] + '<br>';				
					}
					
					
					//console.log(value);
					$('#result-area').html(value);
					
					//console.log(result.response.result.items[0].address.road);
				},
				error : function(){
					console.log('비동기통신실패');
				}
			});
			
		});
		
		
		//const result = arr2.reduce((acc, v) => {
		//    return acc.find(x => x.name === v.name) ? acc : [...acc, v];
		//}, []);

		// [ {name: "레드"}, {name: "그린"}, {name: "블루"} ]
		
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>