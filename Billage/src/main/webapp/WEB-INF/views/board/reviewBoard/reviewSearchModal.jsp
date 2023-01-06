<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<div id="store-report-area">
	    <div class="modal fade" id="mymodal2">
	        <div class="modal-dialog">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                <br>
	                <div class="modal-title"><h2>식당정보수정요청👏</h2></div>
	            </div>
	
	            <form action="" method="post">
	                <div class="modal-content">
	                    <br>
	                    <div id="st-text-area">
	                        <p>
				                            수정이 필요한 사항을 제보해 주시면 <br>
	                         	Freeeat팀이 검토 후 수정합니다. <br>
				                            감사합니다😃
	                        </p>
	                    </div>
	
	                    <h1 id="store-name-area">dd</h1>
	
	                    <br>
	                    <p>● 수정사항을 입력해주세요 </p>
	                    <div id="write-textarea">
	                        <textarea name="content" rows="500" style="width:500px; height:300px; resize:none;" placeholder="10자 이상 입력해주세요!"required></textarea>
	                    </div>          
	                </div> <!-- modal-content -->
	                
	                <div id="modal-footer">
	                    <input type="submit" value="요청하기" disabled/>
	                    <input type="reset" value="다시쓰기"/>
	                </div>
	            </form>
	        </div><!-- class="modal-dialog" -->
	    </div><!-- class="modal fade" id="mymodal1" -->
	</div> <!-- #store-report-area-->
	



<script>
	$(function(){
			$('#store-report a').click(function(){
		          $('#store-report-area').fadeIn();
	      });
				
			$('#store-report-area .close').click(function(){
			   		 $('#store-report-area').fadeOut();
				});
			})
			
	        $('textarea[name=content]').keyup(function(){
			if($(this).val().length >= 10){
            	$('#modal-footer > input[type=submit]').removeAttr('disabled');
			} else {
            	$('#modal-footer > input[type=submit]').attr('disabled', 'true');
			}                	
        })
	
</script>
 
 

</body>
</html>