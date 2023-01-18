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
		<h1>모임 [ CLUB_OPEN ] / 모임 활동 등록폼 </h1>
		
		
		<button onclick="location.href='clubOpenAdmin.cl?clubNo=${ clubNo }'">뒤로가기</button>

	<!-- 
		액티비티번호	OPEN_NO	NUMBER
		모임번호		CLUB_NO	NUMBER
		액티비티명		OPEN_TITLE	VARCHAR2(1000 BYTE)
		액티비티장소	OPEN_LOCATION	VARCHAR2(500 BYTE)
		액티비티날짜	OPEN_DATE	VARCHAR2(1000 BYTE)
		액티비티시간	OPEN_TIME	VARCHAR2(1000 BYTE)
		액티비티정원	OPEN_LIMIT	NUMBER
		액티비티상태	OPEN_STATUS	VARCHAR2(1 BYTE)
	 -->
	 
		<form action="createOpen.cl" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userNo" value="${ loginUser.userNo }"/>
			<input type="hidden" name="clubNo" value="${ clubNo }" />
			<table border="1" align="center">
				<caption style="text-align:left;">*필수입력사항</caption>	
				<colgroup>
					<col style="width:200px;">
					<col style="width:800px;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">*활동 이름</th>
						<td><div><input type="text" name="openTitle" required></div></td>
					</tr>
					<!--  API 등록  -->
					<tr>
						<th scope="row">*활동 장소</th>
						<td>
							<input type="text" name="openLocation">
						</td>
					</tr>
					<tr>
						<th>*활동 일자</th>
						<td><div><input type="date" name="openDate"/></div></td>
					</tr>
					<tr>
						<th>*활동 시간</th>
						<td><input type="time"  name="openTime" /></td>
					</tr>
					<tr>
						<th>*모임 참여 인원</th>
						<td><div><input type="number" name="openLimit" required/></div></td>
					</tr>

				</tbody>
			</table>

			<div id="enroll-btn-area">
				<button type="submit">등록하기</button>
				<button type="reset">다시쓰기</button>
			</div>
		</form>
	</div> <!-- all-enrollFrom -->

	
	
	<!-- 
		* 달력에서 오늘 날짜 이전 선택 불가하게
		* 활동명 제한
		
	
	
	 -->
	<script>
	

		
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>