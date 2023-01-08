<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 등록하기</title>
<style>
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
						<td><div><input type="text" name="groupLocation" required><button>검색</button></div>api쓰고 싶어여...</td>
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
		
	
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>